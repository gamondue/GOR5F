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

        private const bool readConfigFromFile = true; 

        // ADC channel of sensors
        private const int RELATIVE_HUMIDITY_CHANNEL = 0;
        private const int PHOTO_RESISTOR_CHANNEL = 1;
        private const int TERRAIN_HUMIDITY_CHANNEL = 2;

        // sensori con stelo ITT
        const string idTermometro = "28-000006707ae6"; // gor3 172.16.13.103
        //const string idTermometro = "28-0000066e578f"; // gor2 172.16.13.102
        //const string idTermometro = "28-0000066e88a3"; // gor0 172.16.13.200
        //const string idTermometro = "28-0000066f1902"; // gor0 172.16.13.200

        // sensori in circuito ITT 
        //const string idTermometro = "22-0000003c0ff9"; // gor2 172.16.13.102
        //const string idTermometro = "28-0000062196f0"; // gor0 172.16.13.200

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
            logger.Prompt("Vers." + System.Reflection.Assembly.GetExecutingAssembly().GetName().Version.ToString());
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
            logger.Debug("Initialize_00");

            converter = null; // per default il convertitore è null
            if (!inSimulation)
            {                
                // acquisizione reale, convertitore
                converter = new Adc_MCP3208();
            }
            logger.Debug("Initialize_10");

            if (readConfigFromFile)
            {   // lettura della configurazione da file
                configureFromFile();
                // intestazione del file dei dati: appende nel file .tsv l'intestazione
                string rigaIntestazione = "Istante campionamento";
                logger.Debug("Initialize_20");
                foreach(Sensor s in Sensors)
                {
                    rigaIntestazione += "\t" + s.Name + " " + s.Unit;
                }
                logger.Debug("Initialize_30");
                textFileAppend(rigaIntestazione, Gor.Common.DatalogFile);
                logger.Debug("Initialize_40");
            }
            else
            {
                // configurazione fissa
                logger.Debug("Initialize_50");
                fixedConfiguration(inSimulation);
                logger.Debug("Initialize_60");
            }

            //Rtc_PCF8563 rtc = new Rtc_PCF8563(RTC_ADDRESS);

            // mette zero nel file che stabilisce se il programma deve fermarsi
            putZeroInControlFile(Common.CloseCommandFile);
            putZeroInControlFile(Common.AcquireCommandFile);

            logger.Debug("Initialize_99"); 

            return;
        }
        private static void Acquire()
        {
            if (!readConfigFromFile)
            { // configurazione fissa
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
            }
            else
            {   // configurazione in Sensors
                logger.Debug("Acquire_1_00");
                logger.Prompt("\nSampling: " + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " ");

                foreach (Sensor s in Sensors)
                {
                    logger.Prompt(s.Name + " " + (s.Measure().ToString()));
                }
                logger.Debug("Acquire_1_30");

                logger.Prompt("");
                logger.Debug("Acquire_1_99");
            }
            return;
        }
        private static void SaveLog()
        {
            // salvataggio delle misurazioni su file locale ASCII "datalog.tsv" (tab separated values)
            // una riga, un campionamento
            // prima riga: i nomi delle colonne, separati da tab (già fatto in Initialize())
            logger.Debug("Save_00");

            string rigaDati = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"); 
            foreach(Sensor sensore in Sensors)
            {
                try
                {
                    logger.Debug("Save_10 " + sensore.Name);
                    rigaDati += "\t" + sensore.LastMeasurement.Value.ToString(sensore.LastMeasurement.DisplayFormat);
                    logger.Debug("Save_15 " + rigaDati);
                    //datalogAppend(sensore.LastMeasurement.ToString(), Common.DatalogFile); 
                }
                catch
                {
                    logger.Error("Save_20 " + sensore.Name);
                }
            }
            textFileAppend(rigaDati, Gor.Common.DatalogFile);

            //TODO salvataggio su database
            //////dbWriter.SaveAll(Sensors); 

            logger.Debug("Save_99");
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
            TimeSpan span = new TimeSpan(0, samplePeriod,0); // hh, mm, ss
            // find out next "raw" time: variable next (not truncated to the next sharp minute)
            DateTime next = now.Add(span); 
            
            // find the minute BEFORE next "raw" minute that is sharp: variable nextMinute
            int nextMinute = (next.Minute / samplePeriod) * samplePeriod;
            logger.Debug("Wait: nextMinute: " + nextMinute.ToString());
            
            // build next sample time
            DateTime nextSampleTime = new DateTime(next.Year, next.Month, next.Day,
                next.Hour, nextMinute, 0);
            logger.Prompt("Waiting for the next sample time: " + nextSampleTime.ToString("yyyy-MM-dd HH:mm:ss"));
            
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

        private static void fixedConfiguration(bool inSimulation)
        {
            try
            {
                // istanziazione dei sensori 
                relativeHumidity = new Humidity_Air_HIH4000("RH%_HIH4000", inSimulation, converter, RELATIVE_HUMIDITY_CHANNEL, logger);
                Sensors.Add(relativeHumidity);
                logger.Debug("Istanziazione: " + relativeHumidity.Measure().ToString());
            }
            catch
            {
                logger.Error("Istanziazione: Humidity_Air_HIH4000");
            }

            try
            {
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
        }

        private static void configureFromFile()
        {
            logger.Debug("configureFromFile_00");
            using (FileStream svs = new FileStream(Gor.Common.ConfigurationFile, FileMode.Open,
                FileAccess.Read, FileShare.Read))
            using (StreamReader rd = new StreamReader(svs))
            {
                logger.Debug("configureFromFile_20");
                string s = rd.ReadToEnd();
                string[] righe = s.Replace("\r", "").Split('\n');
                int i = 0; 
                foreach (string riga in righe)
                {
                    logger.Debug("configureFromFile_25: riga " + riga);
                    if (i != 0 && riga.Trim() != "")
                    {
                        string[] campi = riga.Split('\t');
                        logger.Debug("configureFromFile_30 " + campi[0]);
                        Sensor sens = null;
                        switch (campi[0])
                        {
                            case "Temperature_DS1822":
                                {
                                    logger.Debug("configureFromFile_32 Temperature_DS1822 " + campi[1] + campi[4] + campi[2]);
                                    sens = new Temperature_DS1822(campi[1], bool.Parse(campi[4]), campi[2], logger);
                                    break;
                                }
                            case "Humidity_Air_HIH4000":
                                {
                                    logger.Debug("configureFromFile_34 Humidity_Air_HIH4000 " + campi[1] + campi[4] + campi[2]);
                                    sens = new Humidity_Air_HIH4000(campi[1], bool.Parse(campi[4]), converter, int.Parse(campi[2]), logger);
                                    break;
                                }
                            case "Light_PhotoResistor":
                                {
                                    logger.Debug("configureFromFile_36 Light_PhotoResistor " + campi[1] + campi[4] + campi[2]);
                                    sens = new Light_PhotoResistor(campi[1], bool.Parse(campi[4]), converter, int.Parse(campi[2]), logger);
                                    break;
                                }
                        }
                        logger.Debug("configureFromFile_40 " + campi[5]);
                        sens.AlarmMax = double.Parse(campi[5]);
                        logger.Debug("configureFromFile_42 " + campi[6]);
                        sens.AlarmMin = double.Parse(campi[6]);
                        logger.Debug("configureFromFile_44 " + campi[7]);
                        sens.MaxValue = double.Parse(campi[7]);
                        logger.Debug("configureFromFile_46 " + campi[8]);
                        sens.MinValue = double.Parse(campi[8]);
                        logger.Debug("configureFromFile_48 " + campi[9]);
                        sens.Unit = campi[9];
                        logger.Debug("configureFromFile_50");

                        Sensors.Add(sens);
                        logger.Debug("configureFromFile_60");
                    }
                    i++;
                }
            }
            logger.Debug("configureFromFile_99");
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
                    textFileAppend(sensore.LastMeasurement.ToString(), Common.SingleSampleFile);
                }
                catch
                {
                    logger.Error("saveSingleSample_20 " + sensore.Name);
                }
            }
            logger.Debug("saveSingleSample_99");
            return;
        }

        #region helpers
        private static void textFileAppend(string riga, string file)
        {
            try
            {
                using (StreamWriter sw = File.AppendText(file))
                {
                    sw.WriteLine(riga);
                }
            }
            catch (Exception ex)
            {
                logger.Error("textFileAppend " + ex.Message);
            }
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
        #endregion
    }
}
