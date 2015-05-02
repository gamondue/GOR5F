#region References

using System;
using Raspberry.IO.Components.Sensors.Temperature.Dht;
using Raspberry.IO.GeneralPurpose;
using Raspberry.Timers;

#endregion

namespace Test.Gpio.DHT22
{
    internal class Program
    {
        private static void Main()
        {
            const ConnectorPin measurePin = ConnectorPin.P1Pin11;

            Console.WriteLine("DHT-22 Sample: measure humidity and temperature");
            Console.WriteLine();
            Console.WriteLine("\tMeasure pin: {0}", measurePin);
            Console.WriteLine();

            var driver = new MemoryGpioConnectionDriver();

            using (var pin = driver.InOut(measurePin))
            using (var DhtConnection = new Dht22Connection(pin))
            {
                int TotalRetries = 0;
                double measurements = 0;
                int errors = 0;
                int sumRetries = 0; 
                while (!Console.KeyAvailable)
                {
                    DhtData data = null; 
                    try { 
                        data = DhtConnection.GetData();

                    } catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message); 
                    }
                    TotalRetries += data.AttemptCount - 1;
                    measurements++;
                    sumRetries += data.AttemptCount -1;
                    if (data != null)
                        Console.WriteLine("{0}: Readings: {1:0.00}% humidity, {2:0.0}°C, Attempts {3}", 
                            DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), data.RelativeHumidity.Percent, 
                            data.Temperature.DegreesCelsius, data.AttemptCount);
                    else
                    {
                        errors++;
                        Console.WriteLine("Unable to read data\n");
                    }
                    Console.WriteLine("\nMeasurements {0:0}, Errors {1}, Error rate {2:0.00}%, ",
                        measurements, errors, errors / measurements * 100);
                    Console.WriteLine("TotalRetries {0:0}, Mean retries per sample {1:0.000}\n",
                        TotalRetries, sumRetries/ measurements);

                    // DHT 22: producer hints that sample period should be at least 2 seconds
                    // Test that DhtXxConnection's code enforces the specification, by calling
                    // for a shorter wait 
                    Timer.Sleep(TimeSpan.FromSeconds(2)); 
                }
            }
        }
    }
}
