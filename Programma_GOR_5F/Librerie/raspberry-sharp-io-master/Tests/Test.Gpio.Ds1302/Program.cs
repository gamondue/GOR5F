using System;
using System.Collections.Generic;
using System.Threading;
//using Common.Logging;
//using NDesk.Options;
using Raspberry.IO.GeneralPurpose;
using Raspberry.IO.InterIntegratedCircuit;
////////using Raspberry.IO.Components.Rtcs.Ds1302;

namespace Test.Gpio.Ds1302
{
    // !!!! MONTI. TUTTO DA FARE !!!!
    /// </summary>
    class Program
    {
        static void Main(string[] args)
        {
            const ConnectorPin sdaPin = ConnectorPin.P1Pin03;
            const ConnectorPin sclPin = ConnectorPin.P1Pin05;

            Console.WriteLine("DS-1302 Sample: Read RTC");
            Console.WriteLine();

            Console.WriteLine ("Program Started at:"+ DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));

            using (var driver = new I2cDriver(sdaPin.ToProcessor(), sclPin.ToProcessor()))
            {
                ////////var deviceConnection = new Ds1302I2cConnection(driver.Connect(0x51));

                while (!Console.KeyAvailable)
                {
                    //////////Console.WriteLine(deviceConnection.ReadSeconds().ToString()); 
                    Thread.Sleep(1000);
                }
            }
        }

        #region Private Helpers

        #endregion
    }
}
