using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//using Raspberry.IO.GeneralPurpose;
using System.Threading;
using Gor.Devices;
//using Raspberry.IO.InterIntegratedCircuit;

namespace Gor.Acquisition.Daemon
{
    class Program
    {
        //const ConnectorPin SPI_SCLK = ConnectorPin.P1Pin23;
        //const ConnectorPin SPI_MISO = ConnectorPin.P1Pin21;
        //const ConnectorPin SPI_MOSI = ConnectorPin.P1Pin19;
        //const ConnectorPin SPI_CS = ConnectorPin.P1Pin24;
        //const ConnectorPin I2C_SCL = ConnectorPin.P1Pin05;
        //const ConnectorPin I2C_SDA = ConnectorPin.P1Pin03;
        const int RELATIVE_HUMIDITY_CHANNEL = 0;
        const int TERRAIN_HUMIDITY_CHANNEL = 1;
        const int PHOTO_RESISTOR_CHANNEL = 2;

        const int RTC_ADDRESS = 0x51;
        const int BMP180_ADDRESS = 0x00;

        static Adc_MCP3208 converter;

        //RelativeHumidity_HIH4000 relativeHumidity = new RelativeHumidity_HIH4000(RELATIVE_HUMIDITY_CHANNEL, converter);
        //PhotoResistor light = new PhotoResistor(PHOTO_RESISTOR_CHANNEL, converter);
        //TerrainHumidity_YL69YL38 terrainHumidity = new TerrainHumidity_YL69YL38(TERRAIN_HUMIDITY_CHANNEL, converter);
        ////static Temperature_DS1822 temperature;
        //Temperature_DS1822 temperature = new Temperature_DS1822(false, "28-0000062196f0");

        ////Rtc_PCF8563 rtc = new Rtc_PCF8563(RTC_ADDRESS, i2cDriver);
        //Rtc_PCF8563 rtc = new Rtc_PCF8563(RTC_ADDRESS);

        static void Main(string[] args)
        {
            try
            {
                ////GpioConnectionDriver gpioDriver = new GpioConnectionDriver();
                ////I2cDriver i2cDriver = new I2cDriver(I2C_SDA.ToProcessor(), I2C_SCL.ToProcessor());

                ////Adc_MCP3208 converter = new Adc_MCP3208(
                ////    gpioDriver.Out(SPI_SCLK),
                ////    gpioDriver.Out(SPI_CS),
                ////    gpioDriver.In(SPI_MISO),
                ////    gpioDriver.Out(SPI_MOSI));

                Initialize();
                while (true)
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

        private static void Initialize()
        {
            //RelativeHumidity_HIH4000 relativeHumidity = new RelativeHumidity_HIH4000(RELATIVE_HUMIDITY_CHANNEL, converter);
            //PhotoResistor light = new PhotoResistor(PHOTO_RESISTOR_CHANNEL, converter);
            //TerrainHumidity_YL69YL38 terrainHumidity = new TerrainHumidity_YL69YL38(TERRAIN_HUMIDITY_CHANNEL, converter);
            ////temperature = new Temperature_DS1822(false);
            //Temperature_DS1822 temperature = new Temperature_DS1822(false, "28-0000062196f0");

            ////Rtc_PCF8563 rtc = new Rtc_PCF8563(RTC_ADDRESS, i2cDriver);
            //Rtc_PCF8563 rtc = new Rtc_PCF8563(RTC_ADDRESS);

            converter = new Adc_MCP3208();
            return;
        }

        private static void Acquire()
        {
            Console.Write(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
            Console.Write(converter.Read(PHOTO_RESISTOR_CHANNEL));
            //Console.Write(temperature.Measure());
            Console.WriteLine(); 
            return;
        }
        private static void Save()
        {
            return;
        }

        private static void Wait()
        {
            Thread.Sleep(500);
            return; 
        }
    }
}
