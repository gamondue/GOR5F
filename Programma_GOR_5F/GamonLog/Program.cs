using Gor;
using Gor.Devices;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;

namespace gamonLog
{
    class Program
    {
        static bool sensorsSimulation = false;  // true = program simulates sensors

        const int samplePeriod = 1;             // [minutes]

        private static string progamPath = "/home/pi/gamon/"; // path of program in Raspi 
        private static string dataLogFile = "datalog.tsv";
        // ADC channel of sensors
        private const int RELATIVE_HUMIDITY_CHANNEL = 0;
        private const int PHOTO_RESISTOR_CHANNEL = 1;
        private const int TERRAIN_HUMIDITY_CHANNEL = 2;

        // sensori con stelo gamon
        private const string idT1 = "28-00042c643aff";
        private const string idT2 = "28-00042e0c59ff";
        private const string idT3 = "28-00042e0c65ff";
        private const string idT4 = "28-00042c5e80ff";
        
        private const int DHT22_IO_PIN = 11;

        static List<Sensor> Sensors;    // list of all sensors used by this program 
        //static GorDbWriter dbWriter;  // dbms writing class

        static Adc_MCP3208 converter;

        //static Humidity_Air_HIH4000 relativeHumidity;
        static Humidity_Air_DHT22 airHumidityAndTemperature;
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
            Console.WriteLine("GorAcquire");
            Console.WriteLine("Garden Of Raspberries");
            Console.WriteLine("Programma di acquisizione dati");
            Console.WriteLine();
            Console.WriteLine("Sample period: " + samplePeriod);
            Console.WriteLine("Sensor simulation: " + sensorsSimulation);

            Logger.Test("Main_00");

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
                Logger.Err(e.Message);
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

                    Logger.Test("close.txt = " + c.ToString());

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
                Logger.Err(ex.Message);
                return true;
            }
        }

        private static void Initialize(bool inSimulation)
        {
            Logger.Test("Initialize_01");

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
            airHumidityAndTemperature = new Humidity_Air_DHT22(inSimulation, DHT22_IO_PIN);
            //Logger.Test(airHumidityAndTemperature.AlarmMax.ToString());
            //Sensors.Add(airHumidityAndTemperature);

            light = new Light_PhotoResistor(inSimulation, converter, PHOTO_RESISTOR_CHANNEL);
            Logger.Test(light.Measure().ToString());
            Sensors.Add(light);

            T1 = new Temperature_DS1822(inSimulation, idT1);
            Sensors.Add(T1);
            T2 = new Temperature_DS1822(inSimulation, idT2);
            Sensors.Add(T2);
            T3 = new Temperature_DS1822(inSimulation, idT3);
            Sensors.Add(T3);            
            T4 = new Temperature_DS1822(inSimulation, idT4);
            Sensors.Add(T4);
            
            Logger.Test(T1.Read().ToString());
            //terrainHumidity = new Humidity_Terrain_YL69YL38(inSimulation, converter, TERRAIN_HUMIDITY_CHANNEL);

            //TODO legge la lista Sensori: le linee precedenti  devono essere sostituite
            // Sensori = 
            ////////////dbWriter = new GorDbWriter(Sensori); 

            // appende nel file .tsv l'intestazione
            using (StreamWriter sw = File.CreateText(progamPath + dataLogFile))
            {
                string intestazione = "Istante\tUmidita'\tTemper. aria\tTemper. sonda 1\t" +
                "Temper. sonda 2\tTemper. sonda 3\tTemper. sonda 4\tPunti ADC sens. illum.\t" +
                "Punti ADC sens. umid.\n"; // #+ socket.gethostname() +"\n"
                sw.WriteLine(intestazione);
                //sw.Close();
            }

            //Rtc_PCF8563 rtc = new Rtc_PCF8563(RTC_ADDRESS);

            // mette zero nel file che stabilisce se il programma deve fermarsi
            zeroInClose();

            Logger.Test("Initialize_99");

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
            foreach (Sensor sens in Sensors)
            {
                sens.Measure();
                //sens.ToString();
            }

            // test di tutti i canali: 
            //Console.Write(temperature.Measure());
            //for (int i = 0; i < 8; i++)
            //    Console.Write(i + " " + converter.Read(i) + " ");

            Console.WriteLine();
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
            Logger.Test("Wait: nextMinute: " + nextMinute.ToString());

            // build next sample time
            DateTime nextSampleTime = new DateTime(next.Year, next.Month, next.Day,
                next.Hour, nextMinute, 0);
            Console.WriteLine("Waiting next sample time: " + nextSampleTime.ToString("yyyy-MM-dd HH:mm:ss"));

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
