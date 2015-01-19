using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gor.Devices
{
    public class TerrainHumidity_YL69YL38 : Sensor, IMCP3208Convertible
    {

        public int Channel { get; set; }

        public Adc_MCP3208 Connection { get; set; }

        public TerrainHumidity_YL69YL38() : this(true)
        {

        }

        public TerrainHumidity_YL69YL38(bool sim) : base(sim)
        {

        }

        public TerrainHumidity_YL69YL38(int channel) : base(false)
        {
            Channel = channel;
        }

        public override string Read()
        {
            if (Connection == null)
                throw new Exception("Nessuna connessione.");

            double val = Connection.Read(Channel) * voltage / 4096;

            return val.ToString();
        }
        
        public override int ReadInt()
        { return -1; }
        
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
            calibration = new Calibration_2Points(CalibrationFileName);
        }
    }
}
