using Raspberry.IO.Components.Sensors.Temperature.Dht;
using Raspberry.IO.GeneralPurpose;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Test.Gpio.Dht22
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Clear();

            Console.WriteLine("DHT22 Sample: Reading Temperature and Relative Humidity of air");
            Console.WriteLine();

            Console.WriteLine("10");
            GpioConnectionDriver driver = new GpioConnectionDriver();
            Console.WriteLine("20");
            ProcessorPin pinDati = ProcessorPin.Pin22;
            Console.WriteLine("30");

            GpioInputOutputBinaryPin dhtData = new GpioInputOutputBinaryPin(driver, pinDati);
            Console.WriteLine("40");

            DhtConnection connection = new DhtConnection(dhtData);
            Console.WriteLine("50");

            DhtData data = connection.GetData();
            Console.WriteLine("60");

            while (!Console.KeyAvailable)
            {
                Console.WriteLine("Umidità = " + data.Humidity + " Temperatura = " + data.Temperature);
                Console.WriteLine("70");
            }
        }
    }
}
