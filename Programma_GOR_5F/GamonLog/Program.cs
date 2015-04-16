
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using Gor.Devices;
using System.IO;
using Gor;

namespace gamonLog
{
    /// <summary>
    /// GamonLog main program
    /// </summary>
    class Program
    {
        private static bool sensorsSimulation = false;  // true = program simulates sensors

        private const int samplePeriod = 1;             // [minutes]

        private const string progamPath = "/home/pi/gor/"; // path of program in Raspi 
        private static Logger logger;
        private const string dataLogFile = "datalog.tsv"; 

        // ADC channel of sensors
        private const int RELATIVE_HUMIDITY_CHANNEL = 0;
        private const int PHOTO_RESISTOR_CHANNEL = 1;
        private const int TERRAIN_HUMIDITY_CHANNEL = 2;

        // sensori con stelo gamon
        private const string idT1 = "28-00042c643aff";
        private const string idT2 = "28-00042e0c59ff";
        private const string idT3 = "28-00042e0c65ff";
        private const string idT4 = "28-00042c5e80ff";
        //private const string idT1= "28-0000062196f0"; // gor1 172.16.13.101 per test
        
        private const int DHT22_IO_PIN = 11;

        private static List<Sensor> Sensors;    // list of all sensors used by this program 

        static Adc_MCP3208 converter;

        //static Humidity_Air_HIH4000 relativeHumidity;
        static Humidity_Temperature_Air_DHT22 airHumidityAndTemperature;
        static Light_PhotoResistor light;
        static Humidity_Terrain_YL69YL38 terrainHumidity;
        static Temperature_DS1822 T1;
        static Temperature_DS1822 T2;
        static Temperature_DS1822 T3;
        static Temperature_DS1822 T4;

        //const int RTC_ADDRESS = 0x51; // realtime clock (not working)
        ////Rtc_PCF8563 rtc = new Rtc_PCF8563(RTC_ADDRESS, i2cDriver);
        //Rtc_PCF8563 rtc = new Rtc_PCF8563(RTC_ADDRESS);

        static void Main(string[] args)
        {
            logger = new Logger(progamPath, "events.txt", "errors.txt", "debug.txt", "prompts.txt", dataLogFile);
            logger.LoggingPrompts = false;
            logger.ShowingErrors = true;
            logger.ShowingDebug = false;

            Sensors = new List<Sensor>();

            logger.Prompt ("GamonLog");
            logger.Prompt("Programma di acquisizione dati");
            logger.Prompt("");
            logger.Prompt("Sample period: " + samplePeriod);
            logger.Prompt("Sensor simulation: " + sensorsSimulation);

            logger.Debug("Main_00");

            try
            {
                Initialize(sensorsSimulation); // viene passata la modalità di simulazione
                while (!exitProgram())
                {
                    Acquire();
                    Save();
                    Wait();
                }
            }
            catch (Exception e)
            {
                logger.Error(e.Message);
            }
        }

        /// <summary>
        /// Legge se nel file "close.txt" c'è un numero diverso da "0"
        /// Se c'è un numero diverso da "0" torna con un vero, altrimenti falso
        /// ATTENZIONE: file il close.txt deve avere diritti di scrittura non solo per root
        ///             impostarli così: 
        ///             sudo chmod 666 close.txt
        /// </summary>
        /// <returns></returns>
        private static bool exitProgram()
        {
            // Neri Luca 5F
            try
            {
                using (StreamReader sr = new StreamReader(progamPath + "close.txt"))
                {
                    int c = sr.Read();

                    logger.Debug("close.txt = " + c.ToString());

                    if (c == 49) // codice ASCII di 1 
                    {
                        return true;
                    }
                    else
                        return false;
                }
            }
            catch (Exception ex)
            {
                logger.Error(ex.Message);
                return true;
            }
        }

        private static void Initialize(bool inSimulation)
        {
            logger.Debug("Initialize_01");

            if (inSimulation)
            {
                // inizializzazioni per la parte di simulazione
                // convertitore
                converter = null;
            }
            else
            {
                // inizializzazioni per la parte di acquisizione reale 
                // convertitore
                converter = new Adc_MCP3208();
            }

            // istanziazione dei sensori 
            //relativeHumidity = new Humidity_Air_HIH4000(inSimulation, converter, RELATIVE_HUMIDITY_CHANNEL);
            airHumidityAndTemperature = new Humidity_Temperature_Air_DHT22("Umidità%", inSimulation, DHT22_IO_PIN, logger);
            //log.Test(airHumidityAndTemperature.AlarmMax.ToString());
            //Sensors.Add(airHumidityAndTemperature);

            logger.Debug("Initialize_10");

            light = new Light_PhotoResistor("Luce", inSimulation, converter,
                PHOTO_RESISTOR_CHANNEL, logger);
            logger.Debug(light.Measure().ToString());
            Sensors.Add(light);

            logger.Debug("Initialize_20");

            try {
                T1 = new Temperature_DS1822("T1", inSimulation, idT1, logger);
                Sensors.Add(T1);
            }
            catch (Exception ex)
            {
                logger.Error("Initialize_T1" + ex.Message); 
            }
            try
            {
                T2 = new Temperature_DS1822("T2", inSimulation, idT2, logger);
                Sensors.Add(T2);
            }
            catch (Exception ex)
            {
                logger.Error("Initialize_T2" + ex.Message);
            }
            try
            {
                T3 = new Temperature_DS1822("T3", inSimulation, idT3, logger);
                Sensors.Add(T3);
            }
            catch (Exception ex)
            {
                logger.Error("Initialize_T3" + ex.Message);
            }
            try
            {
                T4 = new Temperature_DS1822("T4", inSimulation, idT4, logger);
                Sensors.Add(T4);
            }
            catch (Exception ex)
            {
                logger.Error("Initialize_T4" + ex.Message);
            }
            
            //terrainHumidity = new Humidity_Terrain_YL69YL38(inSimulation, converter, TERRAIN_HUMIDITY_CHANNEL);


            //TODO legge la lista Sensori: le linee precedenti  devono essere sostituite
            // Sensori = 
            ////////////dbWriter = new GorDbWriter(Sensori); 

            // appende nel file .tsv l'intestazione
            string intestazione = "Istante\tUmidita'\tTemper. aria\tTemper. sonda 1\t" +
            "Temper. sonda 2\tTemper. sonda 3\tTemper. sonda 4\tPunti ADC sens. illum.\t" +
            "Punti ADC sens. umid.\n"; // #+ socket.gethostname() +"\n"
            logger.DataLog(intestazione);

            //using (StreamWriter sw = File.AppendText(progamPath + dataLogFile))
            //{
            //    string intestazione = "Istante\tUmidita'\tTemper. aria\tTemper. sonda 1\t" +
            //    "Temper. sonda 2\tTemper. sonda 3\tTemper. sonda 4\tPunti ADC sens. illum.\t" +
            //    "Punti ADC sens. umid.\n"; // #+ socket.gethostname() +"\n"
            //    sw.WriteLine(intestazione);
            //}

            //Rtc_PCF8563 rtc = new Rtc_PCF8563(RTC_ADDRESS);

            // mette zero nel file che stabilisce se il programma deve fermarsi
            zeroInClose();

            logger.Debug("Initialize_99");

            return;
        }

        /// <summary>
        /// Mette la stringa "0" nel file "close.txt"
        /// ATTENZIONE: file il close.txt deve avere diritti di scrittura non solo per root
        ///             impostarli così: 
        ///             sudo chmod 666 close.txt
        /// </summary>
        private static void zeroInClose()
        {
            // scrittura di uno zero nel file close.txt
            using (StreamWriter sw = File.CreateText(progamPath + "close.txt"))
            {
                sw.WriteLine("0");
                //sw.Close();
            }
            return;
        }

        private static void Acquire()
        {
            logger.Debug("Acquire_00");
            T1.Measure();
            logger.Prompt(T1.LastMeasurement.ToString());
            logger.Debug("Acquire_10");

            foreach (Sensor sens in Sensors)
            {
                if (sens != null)
                {
                    try
                    {
                        sens.Measure();
                    }
                    catch (Exception ex)
                    {
                        logger.Error("Acquire " + sens.ToString() + ex.Message);
                    }
                    logger.Prompt(sens.Name + " " + sens.LastMeasurement.ToString());
                }
            }

            // test di tutti i canali: 
            //Console.Write(temperature.Measure());
            //for (int i = 0; i < 8; i++)
            //    Console.Write(i + " " + converter.Read(i) + " ");

            logger.Prompt("");
            return;
        }
        private static void Save()
        {
            // salvataggio delle misurazioni su file locale ASCII "datalog.tsv" (tab separated values)
            // una riga, un campionamento
            // prima riga: i nomi delle colonne, separati da tab (già fatto in Initialize())
            // "questa" riga Sensori[i].Value+ "\t"
            using (StreamWriter sw = File.AppendText(progamPath + dataLogFile))
            {
                ////////string rigaDati = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "\t" + 
                ////////Sensors[0].LastMeasurement.ToString() + "\t" + tempAria + "\t" +
                ////////str(tempSonda1) + "\t" + str(tempSonda2) + "\t" + 
                ////////str(tempSonda3) + "\t" + str(tempSonda4) + "\t" + 
                ////////str(puntiLuce) + "\t" + str(puntiAnalogHumid) + "\t" + 
                ////////"\n").replace(".", ","))
                //sw.Close();
            }

            //TODO finire e provare la seguente
            //////dbWriter.SaveAll(Sensors); 
            return;
        }

        /// <summary>
        /// Returns when next sample time is reached
        /// </summary>
        private static void Wait()
        {
            // remade by Monti: 2015-03-05
            // set next sample instant
            DateTime now = DateTime.Now;
            // time difference to go to the next sample time, NOT truncated
            TimeSpan span = new TimeSpan(0, samplePeriod, 0); // hh, mm, ss
            // find out next "raw" time: variable next (not truncated to the next sharp minute)
            DateTime next = now.Add(span);

            // find the minute BEFORE next "raw" minute that is sharp: variable nextMinute
            int nextMinute = (next.Minute / samplePeriod) * samplePeriod;
            logger.Debug("Wait: nextMinute: " + nextMinute.ToString());

            // build next sample time
            DateTime nextSampleTime = new DateTime(next.Year, next.Month, next.Day,
                next.Hour, nextMinute, 0);
            logger.Prompt("Waiting next sample time: " + nextSampleTime.ToString("yyyy-MM-dd HH:mm:ss"));

            // passive sleep with some awakenings, until 15 seconds before NextSampleTime
            DateTime littleEarlier = nextSampleTime.AddSeconds(-15);
            while (DateTime.Now < littleEarlier)
            {
                Thread.Sleep(5000);
                // when awake: check if I have to make a sample 
                //TODO sampleIfRequested(); 
                // when awake: check if I have to stop program
                if (exitProgram())
                    return; // if I have to stop, exit method; main program will stop
            }
            // active sleep, to catch sharp sample time instant
            while (DateTime.Now < nextSampleTime) ;

            return;
        }
    }
}
