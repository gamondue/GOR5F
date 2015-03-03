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
    class Program
    {
        // sensori con stelo
        private static string idTermometro = "28-000006707ae6";
        //private static string idTermometro = "28-0000066e578f";
        //private static string idTermometro = "28-0000066e88a3";
        //private static string idTermometro = "28-0000066f1902";

        // sensori in circuito 
        //private static string idTermometro = "22-0000003c0ff9";
        //private static string idTermometro = "28-0000062196f0";
        
        const double sampleTime = 1;

        private static string pathProgamma = "/home/pi/gor/"; 

        const int RELATIVE_HUMIDITY_CHANNEL = 0;
        const int PHOTO_RESISTOR_CHANNEL = 1;
        const int TERRAIN_HUMIDITY_CHANNEL = 2;

        static bool simulazioneSensori = false;  

        static List<Sensor> Sensori;
        static GorDbWriter dbWriter; 

        //const int RTC_ADDRESS = 0x51;
        //const int BMP180_ADDRESS = 0x00;

        static Adc_MCP3208 converter;

        static Humidity_Air_HIH4000 relativeHumidity;
        static Light_PhotoResistor light;
        static Humidity_Terrain_YL69YL38 terrainHumidity;
        static Temperature_DS1822 temperature;

        ////Rtc_PCF8563 rtc = new Rtc_PCF8563(RTC_ADDRESS, i2cDriver);
        //Rtc_PCF8563 rtc = new Rtc_PCF8563(RTC_ADDRESS);

        static void Main(string[] args)
        {
            Logger.Log("Main_00");

            try
            {
                Initialize(simulazioneSensori); // viene passata la modalità di simulazione
                while (!exitProgram())
                {
                    Acquire();
                    Save();
                    Wait();
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        /// <summary>
        /// Legge se nel file "stop_program" c'è un numero diverso da 0
        /// Se c'è un numero diverso da zero torna con un vero, altrimenti falso
        /// </summary>
        /// <returns></returns>
        private static bool exitProgram()
        {
            //Neri Luca 5F
            try
            {
                using (StreamReader sr = new StreamReader(pathProgamma + "close.txt"))
                {
                    int c = sr.Read();

                    Console.WriteLine(c);

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
            Logger.Log("Initialize_01");

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
            relativeHumidity = new Humidity_Air_HIH4000(inSimulation, converter, RELATIVE_HUMIDITY_CHANNEL);
            Logger.Log(relativeHumidity.AlarmMax.ToString()); 
            
            light = new Light_PhotoResistor(inSimulation, converter, PHOTO_RESISTOR_CHANNEL);
            Logger.Log(light.Measure().ToString());

            temperature = new Temperature_DS1822(inSimulation, idTermometro);
            Logger.Log(temperature.Read().ToString());
            //terrainHumidity = new Humidity_Terrain_YL69YL38(inSimulation, converter, TERRAIN_HUMIDITY_CHANNEL);
            
            //TODO legge la lista Sensori: le linee precedenti  devono essere sostituite
            // Sensori = 
            ////////////dbWriter = new GorDbWriter(Sensori); 
            
            //TODO appende nel file .tsv l'intestazione

            //Rtc_PCF8563 rtc = new Rtc_PCF8563(RTC_ADDRESS);

            // mette zero nel file che stabilisce se il programma deve fermarsi
            zeroInFile();

            Logger.Log("Initialize_99"); 

            return;
        }

        /// <summary>
        /// Mette il numero zero nel file "stop_program"
        /// </summary>
        private static void zeroInFile()
        {
            // scrittura di uno zero nel file stop_program
            using (StreamWriter sw = File.AppendText(pathProgamma + "close.txt"))
            {
                sw.WriteLine(0);
            }
            return; 
        }

        private static void Acquire()
        {
            Logger.Log("Acquire_00");
            Console.WriteLine(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " ");
            Console.WriteLine("Umidita' dell'aria: " + (relativeHumidity.Measure()));
            Logger.Log("Acquire_10"); 

            Console.WriteLine("Temperatura: " + temperature.Measure());
            Logger.Log("Acquire_20"); 
            
            Console.WriteLine("Luminosita': " + light.Measure());
            Logger.Log("Acquire_30"); 

            //TODO for each (Sensore sens in Sensori) al posto delle linee precedenti

            //Console.WriteLine("Umidità del terreno: " + terrainHumidity.Measure());

            // test di tutti i canali: 
            //Console.Write(temperature.Measure());
            //for (int i = 0; i < 8; i++)
            //    Console.Write(i + " " + converter.Read(i) + " ");
            
            Console.WriteLine(); 
            return;
        }
        private static void Save()
        {
            // TODO salvataggio delle misurazioni su file locale ASCII "logmisure.tsv" (tab separated values)
            // una riga, un campionamento
            // prima riga: i nomi delle colonne, separati da tab (già fatto in Initialize())
            // "questa" riga Sensori[i].Value+ "\t"

            //TODO finire e provare la seguente
            //////////dbWriter.SaveAll(Sensori); 
            return;
        }

        private static void Wait()
        {
            //Neri Luca 5F
            int c = 0;
            //Thread.Sleep(5000);
            DateTime exitTime = DateTime.Now; //Prendo la data attuale
            int sampleSeconds = 60; //variabile di controllo per i secondi
            sampleSeconds -= exitTime.Second;
            using (StreamReader sr = new StreamReader(pathProgamma + "sample.txt"))
            {
                 c =  sr.Read(); //legge dal file
            }
            //if(devoFareUnCampionameto())
                //faiUnCampionamento();

            // prosegue normalmente 

            if (c == 49)  //49 = valore ASCII corrispondente a 1
            {
                //creo il filestream e passo i parametri
                using(FileStream fs = new FileStream ((pathProgamma+"sample.txt"), FileMode.Create, FileAccess.Write, FileShare.None))
                using (StreamWriter wr = new StreamWriter(fs))
                {
                    wr.Write(0);//sostituisco il valore nel file con uno zero
                }
                Console.WriteLine("Comando letto dal file, valori misurati: ");
                return;//restituisce la misurazione
    
                // valore letto = 1 deve fare un campionamento e restituirlo al programma Web
                // SHOULD DO (da fare alla fine)
            }
            else//il valore letto non è 1 ma 0
            {
                if (exitTime.Minute % sampleTime == 0 && sampleSeconds == 0) //controllo se è il minuto esatto
                        return; //restituisco la misurazione
                else if(sampleSeconds == 60)
                {
                    Thread.Sleep((1000 * (60 * Convert.ToInt32(sampleTime))));//aspetto il tempo prestabilito
                    return; //restituisco la misura

                }
                else //altrimenti faccio aspettare
                {
                    Thread.Sleep((1000 * (60 * Convert.ToInt32(sampleTime)) ) + (sampleSeconds * 1000)); // aspetta un tempo determinato dal tempo di campionamento, più i secondi esatti per arrivare al minuto giusto
                    return;
                }
            }
        }
    }
}
