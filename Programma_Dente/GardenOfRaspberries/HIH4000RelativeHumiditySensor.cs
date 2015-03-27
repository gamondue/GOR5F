using Raspberry.IO.SerialPeripheralInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GardenOfRaspberries
{
    public class HIH4000RelativeHumiditySensor : Sensor, IMCP3208Convertible
    {
        public int Channel { get; set; }
        public MCP3208ADConverter Connection { get; set; }

        public HIH4000RelativeHumiditySensor() : this(true)
        {

        }

        public HIH4000RelativeHumiditySensor(bool sim) : base(sim)
        {
            voltage = 3.3;
            SensorName = "HIH4000 Relative Humidity";
        }

        public HIH4000RelativeHumiditySensor(int channel) : base(false)
        {
            Channel = channel;
            voltage = 3.3;
            SensorName = "HIH4000 Relative Humidity";
        }

        private double _startRead = 2;

        public override string Read()
        {
            if (Connection == null)
                throw new Exception("Nessuna connessione.");

            double val = Connection.ReadConverted(Channel) * voltage / 4096;

            return val.ToString();
        }

        public override Measurement Measure()
        {
            string read = Read();

            return new Measurement
            {
                Value = calibration.Calculate(double.Parse(read)),
                Unit = "[%]",
                Name = "Relative Humidity",
                ReadValue = read
            };
        }

        public override void Initialization()
        {
            calibration = new Calibration(CalibrationFileName);
        }
    }
}
