using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;
using Gor.Devices;
using System.IO;

namespace Gor.Acquisition.Daemon
{
    /// <summary>
    /// GorAcquire main program
    /// </summary>
    class Program
    {
        private static bool sensorsSimulation = false;  // true = program simulates sensors
        
        private const int samplePeriod = 1;             // [minutes]

        private static Logger logger; 

        // ADC channel of sensors
        private const int RELATIVE_HUMIDITY_CHANNEL = 0;
        private const int PHOTO_RESISTOR_CHANNEL = 1;
        private const int TERRAIN_HUMIDITY_CHANNEL = 2;

        // sensori con stelo ITT
        //const string idTermometro = "28-000006707ae6"; // gor3 172.16.13.103
        //const string idTermometro = "28-0000066e578f"; // gor2 172.16.13.102
        //const string idTermometro = "28-0000066e88a3"; // gor0 172.16.13.200
        //const string idTermometro = "28-0000066f1902"; // gor0 172.16.13.200

        // sensori in circuito ITT 
        //const string idTermometro = "22-0000003c0ff9"; // gor2 172.16.13.102
        const string idTermometro = "28-0000062196f0"; // gor0 172.16.13.200

        // sensori con stelo gamon
        //const string idTermometro = "28-00042c5e80ff";
        //const string idTermometro = "28-00042e0c65ff";
        //const string idTermometro = "28-00042c643aff"; 
        //const string idTermometro = "28-00042e0c59ff"; 

        static List<Sensor> Sensors;    // list of all sensors used by this program 
        static GorDbWriter dbWriter;    // dbms writing class

        static Adc_MCP3208 converter;

        static Humidity_Air_HIH4000 relativeHumidity;
        //static Humidity_Temperature_Air_DHT22 airHumidityAndTemperature;
        static Light_PhotoResistor light;
        static Humidity_Terrain_YL69YL38 terrainHumidity;
        static Temperature_DS1822 temperature;

        //const int RTC_ADDRESS = 0x51; // realtime clock (not working)
        ////Rtc_PCF8563 rtc = new Rtc_PCF8563(RTC_ADDRESS, i2cDriver);
        //Rtc_PCF8563 rtc = new Rtc_PCF8563(RTC_ADDRESS);

        static void Main(string[] args)
        {
            logger = new Logger(Common.LogsPath, "events.txt", "errors.txt", "debug.txt", "prompts.txt", "data.tsv");
            logger.LoggingPrompts = false;
            logger.ShowingDebug = false;
            logger.ShowingErrors = false;
            logger.ShowingEvents = false;

            logger.Prompt("GorAcquire");
            logger.Prompt("Garden Of Raspberries");
            logger.Prompt("Programma di acquisizione dati");
            logger.Prompt(""); 
            logger.Prompt("Sample period: " + samplePeriod);
            logger.Prompt("Sensor simulation: " + sensorsSimulation);

            logger.Debug("Main_00");

            Sensors = new List<Sensor>();

            try
            {
                Initialize(sensorsSimulation); // viene passata la modalità di simulazione
                while (!exitProgram())
                {
                    Acquire();
                    SaveLog();
                    Wait();
                }
            }
            catch (Exception e)
            {
                logger.Error(e.Message);
            }
            logger.Debug("Stopping"); 
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
                int c = readControlFile(Common.CloseCommandFile);
                logger.Debug(Common.CloseCommandFile + " = " + c.ToString());

                if (c == 49) // codice ASCII di 1 
                {
                    return true;
                }
                else
                    return false;
            }
            catch (Exception ex)
            {
                logger.Error("exitProgram " + ex.Message);
                return false; // non esce se sbagli a leggere 
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

            try { 
                // istanziazione dei sensori 
                relativeHumidity = new Humidity_Air_HIH4000("RH%_HIH4000", inSimulation, converter, RELATIVE_HUMIDITY_CHANNEL, logger);
                Sensors.Add(relativeHumidity);
                logger.Debug("Istanziazione: " + relativeHumidity.Measure().ToString());
            }
            catch
            {
                logger.Error("Istanziazione: Humidity_Air_HIH4000");
            }

            try {
                light = new Light_PhotoResistor("Light", inSimulation, converter, PHOTO_RESISTOR_CHANNEL, logger);
                Sensors.Add(light);
                logger.Debug("Istanziazione: " + light.Measure().ToString());
            }
            catch
            {
                logger.Error("Istanziazione: Light_PhotoResistor");
            }

            try
            {
                temperature = new Temperature_DS1822("Tair_DS1822", inSimulation, idTermometro, logger);
                Sensors.Add(temperature);
                logger.Debug("Istanziazione: " + temperature.Measure().ToString());
            }
            catch
            {
                logger.Error("Istanziazione: Temperature_DS1822");
            }
            
            //terrainHumidity = new Humidity_Terrain_YL69YL38(inSimulation, converter, TERRAIN_HUMIDITY_CHANNEL);
            
            //TODO legge la lista Sensori: le linee precedenti  devono essere sostituite
            // Sensori = 
            ////////////dbWriter = new GorDbWriter(Sensori); 
            
            //TODO appende nel file .tsv l'intestazione

            //Rtc_PCF8563 rtc = new Rtc_PCF8563(RTC_ADDRESS);

            // mette zero nel file che stabilisce se il programma deve fermarsi
            putZeroInControlFile(Common.CloseCommandFile);
            putZeroInControlFile(Common.AcquireCommandFile);

            logger.Debug("Initialize_99"); 

            return;
        }

        /// <summary>
        /// Mette la stringa "0" nel file "close.txt"
        /// ATTENZIONE: file il close.txt deve avere diritti di scrittura non solo per root
        ///             impostarli così: 
        ///             sudo chmod 666 close.txt
        /// </summary>
        private static void putZeroInControlFile(string File)
        {
            try
            {
                // scrittura di uno zero nel file di controllo 
                using (StreamWriter sw = System.IO.File.CreateText(File))
                {
                    sw.Write("0");
                }
            }
            catch (Exception ex)
            {
                logger.Error("putZeroInControlFile() " + ex.Message);
            }
        }

        private static int readControlFile(string file)
        {
            int c;
            // lettura del primo carattere del file di controllo
            try
            {
                using (StreamReader sr = new StreamReader(file))
                {
                    {
                        c = sr.Read();
                        logger.Debug("acquire.txt = " + c.ToString());
                    }
                }
                return c;
            }
            catch (Exception ex)
            {
                logger.Error("readControlFile() " + ex.Message);
                return int.MinValue;
            }
        }

        private static void Acquire()
        {
            logger.Debug("Acquire_00");
            logger.Prompt("\nSampling: " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " ");
            logger.Prompt("Umidita' dell'aria: " + (relativeHumidity.Measure().ToString()));
            logger.Debug("Acquire_10");

            logger.Prompt("Temperatura: " + temperature.Measure().ToString());
            logger.Debug("Acquire_20");

            logger.Prompt("Luminosita': " + light.Measure().ToString());
            logger.Debug("Acquire_30");

            //log.Prompts("Umidità del terreno: " + terrainHumidity.Measure());
            
            logger.Prompt("");
            logger.Debug("Acquire_99");
            return;
        }
        private static void SaveLog()
        {
            // salvataggio delle misurazioni su file locale ASCII "datalog.tsv" (tab separated values)
            // una riga, un campionamento
            // prima riga: i nomi delle colonne, separati da tab (già fatto in Initialize())
            logger.Debug("Save_00");

            foreach(Sensor sensore in Sensors)
            {
                try
                {
                    logger.Debug("Save_10 " + sensore.Name);
                    datalogAppend(sensore.LastMeasurement.ToString(), Common.DatalogFile);
                }
                catch
                {
                    logger.Error("Save_20 " + sensore.Name);
                }
            }
            //TODO finire e provare la seguente
            //////dbWriter.SaveAll(Sensors); 

            logger.Debug("Save_99");
            return;
        }
        private static void datalogAppend(string misura, string file)
        {
            using (StreamWriter sw = File.AppendText(file))
            {
                sw.WriteLine(misura);
                //sw.Close();
            }
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
            TimeSpan span = new TimeSpan(0, samplePeriod,0); // hh, mm, ss
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
                sampleIfRequested(); 
                // when awake: check if I have to stop program
                if (exitProgram())
                    return; // if I have to stop, exit method; main program will stop
            }
            // active sleep, to catch sharp sample time instant
            while (DateTime.Now < nextSampleTime) ;

            return; 
        }

        private static void sampleIfRequested()
        {
            int c; 
            try
            {
                c = readControlFile(Common.AcquireCommandFile); 
            }
            catch (Exception ex)
            {
                logger.Error("sampleIfRequested " + ex.Message);
                return; 
            }
            if (c == 49) // codice ASCII di 1 
            {
                logger.Prompt("Sample on request"); 
                Acquire();
                saveSingleSample();
                putZeroInControlFile(Common.AcquireCommandFile);
            }
            else
                return;
        }

        private static void saveSingleSample()
        {
            // salvataggio delle misurazioni su file locale ASCII "datalog.tsv" (tab separated values)
            // una riga, un campionamento
            // prima riga: i nomi delle colonne, separati da tab (già fatto in Initialize())
            logger.Debug("saveSingleSample_00");
            // cancella il file dell'ultimo campionamento, che verrà riscritto 
            File.Delete(Common.SingleSampleFile); 

            foreach (Sensor sensore in Sensors)
            {
                try
                {
                    logger.Debug("saveSingleSample_10 " + sensore.Name);
                    datalogAppend(sensore.LastMeasurement.ToString(), Common.SingleSampleFile);
                }
                catch
                {
                    logger.Error("saveSingleSample_20 " + sensore.Name);
                }
            }
            logger.Debug("saveSingleSample_99");
            return;
        }
    }
}
