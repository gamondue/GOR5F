using Raspberry.IO.Components.Sensors.Temperature.Ds18b20;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Test._1wire.DS18B20
{
    class Program
    {
      
        static void Main(string[] args)
        {
            Ds18b20Connection Tconnection = new Ds18b20Connection(0); // first thermometer
            
            Console.WriteLine("Ds18b20 Sample: 1wire digital temperature sensor ");
            Console.WriteLine();
            while (!Console.KeyAvailable)
            {
                UnitsNet.Temperature T = Tconnection.GetTemperature(); 
                Console.WriteLine("{0} , {1} °C", T.ToString(), T.DegreesCelsius.ToString());
                Console.WriteLine();
            }
        }
    }
}
