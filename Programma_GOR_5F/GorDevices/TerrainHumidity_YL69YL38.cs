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

        public Adc_MCP3208 Adc { get; set; }

        public TerrainHumidity_YL69YL38(bool simulation, Adc_MCP3208 adc, int channel)
            : base(simulation)
        {
            Initialization();
            this.Adc = adc;

            MinValue = 0;
            MaxValue = 100;

            AlarmMin = MinValue;
            AlarmMax = MaxValue;

            LastMeasurement.Unit = "%";

            voltage = 3.3;

            Channel = channel;
            firstValue = true;

            if (Simulation)
                PrimoValore();
        }

        public override string Read()
        {
            return "0";
        }

        public override int ReadInt()
        {
            if (Adc == null)
                throw new Exception("Nessuna connessione.");

            return Adc.Read(Channel);
        }
        
        public override Measurement Measure()
        {
            if (Simulation)
            {
                return simulaSensore();
            }
            else
            {
                int read = ReadInt();

                return new Measurement
                {
                    Value = calibration.Calculate(read),
                    Unit = "[%]",
                    Name = "Terrain Humidity",
                    ReadValue = read.ToString()
                };
            }
        }

        public override void Initialization()
        {
            //calibration = new Calibration_2Points(CalibrationFileName);
        }
    }
}
