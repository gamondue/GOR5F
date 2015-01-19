using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using GardenOfRaspberries;
using Raspberry.IO.GeneralPurpose;
using System.Threading;
using Raspberry.IO.InterIntegratedCircuit;

namespace AcquisitionProgram
{
    class Program
    {
        const ConnectorPin SPI_SCLK = ConnectorPin.P1Pin23;
        const ConnectorPin SPI_MISO = ConnectorPin.P1Pin21;
        const ConnectorPin SPI_MOSI = ConnectorPin.P1Pin19;
        const ConnectorPin SPI_CS = ConnectorPin.P1Pin24;
        const ConnectorPin I2C_SCL = ConnectorPin.P1Pin05;
        const ConnectorPin I2C_SDA = ConnectorPin.P1Pin03;
        const int RELATIVE_HUMIDITY_CHANNEL = 0;
        const int TERRAIN_HUMIDITY_CHANNEL = 1;
        const int PHOTO_RESISTOR_CHANNEL = 2;
        const int RTC_ADDRESS = 0x51;
        const int BMP180_ADDRESS = 0x00;

        static void Main(string[] args)
        {
            try
            {
                GpioConnectionDriver gpioDriver = new GpioConnectionDriver();
                I2cDriver i2cDriver = new I2cDriver(I2C_SDA.ToProcessor(), I2C_SCL.ToProcessor());

                MCP3208ADConverter converter = new MCP3208ADConverter(
                    gpioDriver.Out(SPI_SCLK),
                    gpioDriver.Out(SPI_CS),
                    gpioDriver.In(SPI_MISO),
                    gpioDriver.Out(SPI_MOSI));

                HIH4000RelativeHumiditySensor relativeHumidity = new HIH4000RelativeHumiditySensor(RELATIVE_HUMIDITY_CHANNEL);
                PhotoResistor light = new PhotoResistor(PHOTO_RESISTOR_CHANNEL);
                YL69YL38TerrainHumiditySensor terrainHumidity = new YL69YL38TerrainHumiditySensor(TERRAIN_HUMIDITY_CHANNEL);
                BMP180BarometricPressureSensor pressure = new BMP180BarometricPressureSensor(BMP180_ADDRESS, i2cDriver);
                DS1822TemperatureSensor temperature = new DS1822TemperatureSensor(false);

                RTCPCF8563 rtc = new RTCPCF8563(RTC_ADDRESS, i2cDriver);


            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }
    }
}
