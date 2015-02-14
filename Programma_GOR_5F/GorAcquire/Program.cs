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
        const int RELATIVE_HUMIDITY_CHANNEL = 0;
        const int TERRAIN_HUMIDITY_CHANNEL = 1;
        const int PHOTO_RESISTOR_CHANNEL = 2;

        //const int RTC_ADDRESS = 0x51;
        //const int BMP180_ADDRESS = 0x00;

        static Adc_MCP3208 converter;

        static Humidity_Air_HIH4000 relativeHumidity;
        static Light_PhotoResistor light;
        static Humidity_Terrain_YL69YL38 terrainHumidity;
        static Temperature_DS1822 temperature1, temperature2;

        ////Rtc_PCF8563 rtc = new Rtc_PCF8563(RTC_ADDRESS, i2cDriver);
        //Rtc_PCF8563 rtc = new Rtc_PCF8563(RTC_ADDRESS);

        static void Main(string[] args)
        {
            
            try
            {
                Initialize(false);
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
            // TODO lettura del file stop_program
            // TODO restituisce false se nel file trova uno 0
            // TODO restituisce true se nel file trova qualcosa di diverso da zero
            return false;
        }

        private static void Initialize(bool inSimulation)
        {
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
            light = new Light_PhotoResistor(inSimulation, converter, PHOTO_RESISTOR_CHANNEL);
            temperature1 = new Temperature_DS1822(inSimulation, "28-0000066e578f"); // PASSARE L'IDENTIFICATORE UNICO DEL TERMOMETRO
            temperature2 = new Temperature_DS1822(inSimulation, "28-000006707ae6"); // PASSARE L'IDENTIFICATORE UNICO DEL TERMOMETRO
            terrainHumidity = new Humidity_Terrain_YL69YL38(inSimulation, converter, TERRAIN_HUMIDITY_CHANNEL);

            //Rtc_PCF8563 rtc = new Rtc_PCF8563(RTC_ADDRESS);

            // mette zero nel file che stabilisce se il programma deve fermarsi
            zeroInFile();

            return;
        }

        /// <summary>
        /// Mette il numero zero nel file "stop_program"
        /// </summary>
        private static void zeroInFile()
        {
            // scrittura di uno zero nel file stop_program
            using (StreamWriter sw = File.AppendText(".\\stop_program"))
            {
                sw.WriteLine("0");
            }
            return; 
        }

        private static void Acquire()
        {
            Console.WriteLine(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " ");
            Console.WriteLine("Umidità dell'aria: " + relativeHumidity.Measure());
            Console.WriteLine("Temperatura 1: " + temperature1.Measure());
            Console.WriteLine("Temperatura 2: " + temperature2.Measure());
            Console.WriteLine("Luminosità: " + light.Measure());
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
            return;
        }

        private static void Wait()
        {
            Thread.Sleep(1000);
            return; 
        }
    }
}
