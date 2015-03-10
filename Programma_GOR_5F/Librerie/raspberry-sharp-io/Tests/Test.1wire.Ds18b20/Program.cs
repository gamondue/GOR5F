using Raspberry.IO.Components.Sensors.Temperature.Ds18b20;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Test._1wire.Ds18b20
{
    class Program
    {
        // sensori con stelo ITT
        //const string idTermometro = "28-000006707ae6"; // gor3 172.16.13.103
        //const string idTermometro = "28-0000066e578f"; // gor2 172.16.13.102
        //const string idTermometro = "28-0000066e88a3"; // gor0 172.16.13.100
        //const string idTermometro = "28-0000066f1902"; // gor0 172.16.13.100

        // sensori in circuito ITT 
        //const string idTermometro = "22-0000003c0ff9"; // gor2 172.16.13.102
        //const string idTermometro = "28-0000062196f0"; // gor0 172.16.13.100

        // sensori con stelo gamon
        //const string idTermometro = "28-00042c5e80ff";
        //const string idTermometro = "28-00042e0c65ff";
        //const string idTermometro = "28-00042c643aff"; 
        const string idTermometro = "28-00042e0c59ff"; 

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
