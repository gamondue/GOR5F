﻿using System;
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

        private const string progamPath = "/home/pi/gor/"; // path of program in Raspi 
        private static Logger logger; 

        // ADC channel of sensors
        private const int RELATIVE_HUMIDITY_CHANNEL = 0;
        private const int PHOTO_RESISTOR_CHANNEL = 1;
        private const int TERRAIN_HUMIDITY_CHANNEL = 2;

        // sensori con stelo ITT
        //const string idTermometro = "28-000006707ae6"; // gor3 172.16.13.103
        //const string idTermometro = "28-0000066e578f"; // gor2 172.16.13.102
        //const string idTermometro = "28-0000066e88a3"; // gor0 172.16.13.100
        //const string idTermometro = "28-0000066f1902"; // gor0 172.16.13.100

        // sensori in circuito ITT 
        //const string idTermometro = "22-0000003c0ff9"; // gor2 172.16.13.102
        //const string idTermometro = "28-0000062196f0"; // gor0 172.16.13.100

        // sensori con stelo gamon
        const string idTermometro = "28-00042c5e80ff";
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
            logger = new Logger(progamPath + "logs/", "events.txt", "errors.txt", "debug.txt", "prompts.txt", "data.tsv");
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
                logger.Error("exitProgram "+ ex.Message);
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

            // istanziazione dei sensori 
            relativeHumidity = new Humidity_Air_HIH4000("RH%_HIH4000", inSimulation, converter, RELATIVE_HUMIDITY_CHANNEL, logger); 
            logger.Debug(relativeHumidity.AlarmMax.ToString());

            light = new Light_PhotoResistor("Light", inSimulation, converter, PHOTO_RESISTOR_CHANNEL, logger); 
            logger.Debug(light.Measure().ToString());

            temperature = new Temperature_DS1822("Tair_DS1822", inSimulation, idTermometro, logger);
            logger.Debug(temperature.Read().ToString());
            
            //terrainHumidity = new Humidity_Terrain_YL69YL38(inSimulation, converter, TERRAIN_HUMIDITY_CHANNEL);
            
            //TODO legge la lista Sensori: le linee precedenti  devono essere sostituite
            // Sensori = 
            ////////////dbWriter = new GorDbWriter(Sensori); 
            
            //TODO appende nel file .tsv l'intestazione

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
                sw.Close();
            }
            return; 
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

            //TODO for each (Sensore sens in Sensori) al posto delle linee precedenti

            // test di tutti i canali: 
            //Console.Write(temperature.Measure());
            //for (int i = 0; i < 8; i++)
            //    Console.Write(i + " " + converter.Read(i) + " ");
            
            logger.Prompt(""); 
            return;
        }
        private static void Save()
        {
            // TODO salvataggio delle misurazioni su file locale ASCII "datalog.tsv" (tab separated values)
            // una riga, un campionamento
            // prima riga: i nomi delle colonne, separati da tab (già fatto in Initialize())
            // "questa" riga Sensori[i].Value+ "\t"

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
                //TODO sampleIfRequested(); 
                // when awake: check if I have to stop program
                if (exitProgram())
                    return; // if I have to stop, exit method; main program will stop
            }
            // active sleep, to catch sharp sample time instant
            while (DateTime.Now < nextSampleTime) ;

            return; 

            ////Neri Luca 5F
            //int c = 0;
            ////Thread.Sleep(5000);
            //DateTime exitTime = DateTime.Now; //Prendo la data attuale
            //int sampleSeconds = 60; //variabile di controllo per i secondi
            //sampleSeconds -= exitTime.Second;
            //using (StreamReader sr = new StreamReader(progamPath + "sample.txt"))
            //{
            //     c =  sr.Read(); //legge dal file
            //}
            ////if(devoFareUnCampionameto())
            //    //faiUnCampionamento();

            //// prosegue normalmente 

            //if (c == 49)  //49 = valore ASCII corrispondente a 1
            //{
            //    //creo il filestream e passo i parametri
            //    using(FileStream fs = new FileStream ((progamPath+"sample.txt"), FileMode.Create, FileAccess.Write, FileShare.None))
            //    using (StreamWriter wr = new StreamWriter(fs))
            //    {
            //        wr.Write(0);//sostituisco il valore nel file con uno zero
            //    }
            //    log.Test("Comando letto dal file, valori misurati: ");
            //    return;//restituisce la misurazione
    
            //    // valore letto = 1 deve fare un campionamento e restituirlo al programma Web
            //    // SHOULD DO (da fare alla fine)
            //}
            //else//il valore letto non è 1 ma 0
            //{
            //    if (exitTime.Minute % sampleTime == 0 && sampleSeconds == 0) //controllo se è il minuto esatto
            //            return; //restituisco la misurazione
            //    else if(sampleSeconds == 60)
            //    {
            //        Thread.Sleep((1000 * (60 * Convert.ToInt32(sampleTime))));//aspetto il tempo prestabilito
            //        return; //restituisco la misura

            //    }
            //    else //altrimenti faccio aspettare
            //    {
            //        Thread.Sleep((1000 * (60 * Convert.ToInt32(sampleTime)) ) + (sampleSeconds * 1000)); // aspetta un tempo determinato dal tempo di campionamento, più i secondi esatti per arrivare al minuto giusto
            //        return;
            //    }
            //}
        }
    }
}
