using Raspberry.IO.Components.Sensors.Temperature.Ds18b20;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Test._1wire.Ds18b20
{
    class Program
    {
        static void Main(string[] args)
        {
            Ds18b20Connection Tconnection = new Ds18b20Connection("28-0000066e578f");

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
