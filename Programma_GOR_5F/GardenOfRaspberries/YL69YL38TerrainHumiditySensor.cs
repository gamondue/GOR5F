using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GardenOfRaspberries
{
    public class YL69YL38TerrainHumiditySensor : Sensor, IMCP3208Convertible
    {

        public int Channel { get; set; }

        public MCP3208ADConverter Connection { get; set; }

        public YL69YL38TerrainHumiditySensor() : this(true)
        {

        }

        public YL69YL38TerrainHumiditySensor(bool sim) : base(sim)
        {

        }

        public YL69YL38TerrainHumiditySensor(int channel) : base(false)
        {
            Channel = channel;
        }

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
                Name = "Terrain Humidity",
                ReadValue = read
            };
        }

        public override void Initialization()
        {
            calibration = new Calibration(CalibrationFileName);
        }
    }
}
