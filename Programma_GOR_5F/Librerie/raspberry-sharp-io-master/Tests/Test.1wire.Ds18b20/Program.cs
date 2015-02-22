using Raspberry.IO.Components.Sensors.Temperature.Ds18b20;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Test._1wire.Ds18b20
{
    class Program
    {
        // sensori con stelo
        //private static string idTermometro = "28-000006707ae6";
        //private static string idTermometro = "28-0000066e578f";
        //private static string idTermometro = "28-0000066e88a3";
        //private static string idTermometro = "28-0000066f1902";

        // sensori in circuito 
        //private static string idTermometro = "22-0000003c0ff9";
        private static string idTermometro = "28-0000062196f0";

        static void Main(string[] args)
        {


            Ds18b20Connection Tconnection = new Ds18b20Connection(idTermometro);
            
            Console.WriteLine("Ds18b20 Sample: 1wire digital temperature sensor ");
            Console.WriteLine();
            while (!Console.KeyAvailable)
            {
                Console.WriteLine(Tconnection.GetTemperatureCelsius());
                Console.WriteLine();
            }
        }
    }
}
