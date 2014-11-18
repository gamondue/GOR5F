using System;

namespace i2c
{
    class Program
    {
        static void Main(string[] argv)
        {
            try
            {
                Console.WriteLine("Starting Communication with VCNL4000");
                var vcnl4000 = new VCNL4000("1", 100);
                vcnl4000.ProximityReading += sensor_ProximityReading;
                var productId = vcnl4000.ProductID;
                OutputValue(productId, "Product ID");
                vcnl4000.Start();

                //Console.WriteLine("Starting Communication with ADS1115");
                //var ads1115 = new ADS1115("1");
                //ads1115.Message += ads1115_Message;
                //ads1115.SingleEndedConversionReading += ads1115_ConversionReading;
                //ads1115.Start();                

                Console.WriteLine("Press Esc key to stop");
                do
                {
                    while (!Console.KeyAvailable)
                    {
                        // Do something
                    }
                } while (Console.ReadKey(true).Key != ConsoleKey.Escape);

                //ads1115.Stop();
                vcnl4000.Stop();

     
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
        }

        static void ads1115_Message(object sender, ConverterMessageEventArgs e)
        {
            OutputValue(e.Message, "Convertor");
        }
        private static void OutputValue(string response, string message)
        {
            Console.WriteLine(message + " Response: {0}", response);
        }
        private static void ads1115_ConversionReading(object sender, SingleEndedConversionEventArgs e)
        {
            var _sender = (ADS1115)sender;
            OutputValue(e.Data, "Conversion Reading");
        }
        static void sensor_ProximityReading(object sender, ProximtyEventArgs e)
        {
            var sensor = (VCNL4000)sender;
            OutputValue(e.Proximity, "Proximity Reading");
            OutputValue(e.RawValue, "Proximity Raw Value");
        }
        private static void OutputValue(int response, string message) 
        {
            Console.WriteLine(message  + " Response: {0} (0x{1})", response, response.ToString("X"));
        }
        private static void OutputValue(decimal response, string message)
        {
            Console.WriteLine(message + " Response: {0}", response);
        }
        private static void OutputValue(float response, string message)
        {
            Console.WriteLine(message + " Response: {0}", response);
        }
    }
}
