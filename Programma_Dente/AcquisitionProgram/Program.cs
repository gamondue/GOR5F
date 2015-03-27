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
                List<Sensor> sensors = new List<Sensor>();
                GpioConnectionDriver gpioDriver = new GpioConnectionDriver();
                //I2cDriver i2cDriver = new I2cDriver(I2C_SDA.ToProcessor(), I2C_SCL.ToProcessor());

                MCP3208ADConverter converter = new MCP3208ADConverter(
                    gpioDriver.Out(SPI_SCLK),
                    gpioDriver.Out(SPI_CS),
                    gpioDriver.In(SPI_MISO),
                    gpioDriver.Out(SPI_MOSI));

                HIH4000RelativeHumiditySensor relativeHumidity = new HIH4000RelativeHumiditySensor(RELATIVE_HUMIDITY_CHANNEL);
                PhotoResistor light = new PhotoResistor(PHOTO_RESISTOR_CHANNEL);
                YL69YL38TerrainHumiditySensor terrainHumidity = new YL69YL38TerrainHumiditySensor(TERRAIN_HUMIDITY_CHANNEL);
                //BMP180BarometricPressureSensor pressure = new BMP180BarometricPressureSensor(BMP180_ADDRESS, i2cDriver);
                DS1822TemperatureSensor temperature = new DS1822TemperatureSensor(false);

                sensors.Add(relativeHumidity);
                sensors.Add(light);
                sensors.Add(terrainHumidity);
                //sensors.Add(pressure);
                sensors.Add(temperature);

                light.CalibrationFileName = "/Acquisition-Dente/cal.txt";
                light.Connection = converter;

                //RTCPCF8563 rtc = new RTCPCF8563(RTC_ADDRESS, i2cDriver);

                while (true)
                {
                    //if (Console.KeyAvailable && Console.ReadKey(true).Key == ConsoleKey.C)
                    //{
                        for (int i = 0; i < sensors.Count; i++)
                            Console.WriteLine((i + 1) + ". " + sensors[i].SensorName);

                        int sensor;
                        bool inputOK;

                        do
                        {
                            Console.WriteLine("Which sensor would you like to calibrate? -> ");
                            inputOK = int.TryParse(Console.ReadLine(), out sensor);
                            if (!inputOK && (sensor < 1 || sensor > sensors.Count))
                                Console.WriteLine("Error.");
                        }
                        while (!inputOK && (sensor < 1 || sensor > sensors.Count));

                        CalibrateSensor(sensors[sensor - 1]);
                    //}
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }

        private static void CalibrateSensor(Sensor s)
        {
            s.StartCalibration();

            bool inputOK;
            double val;

            do
            {
                Console.WriteLine("First point calibration -> ");
                inputOK = double.TryParse(Console.ReadLine(), out val);
                if (!inputOK)
                    Console.WriteLine("Error.");
            }
            while (!inputOK);

            s.PointCalibration(val);

            do
            {
                Console.WriteLine("Second point calibration -> ");
                inputOK = double.TryParse(Console.ReadLine(), out val);
                if (!inputOK)
                    Console.WriteLine("Error.");
            }
            while (!inputOK);

            s.PointCalibration(val);

            s.EndCalibration();
        }
    }
}
