using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gor.Devices
{
    public class Humidity_Terrain_YL69YL38 : Sensor
    {
        public int Channel { get; set; }

        public Adc_MCP3208 Adc { get; set; }

        public Adc_MCP3208 adc { get; set; }

        private bool firstValue = true;

        public Humidity_Terrain_YL69YL38(bool Simulation, Adc_MCP3208 adc, int Channel)
            : base(Simulation)

        {
            int channel;
            Initialization();
            this.Adc = adc;

            MinValue = 0;
            MaxValue = 100;

            AlarmMin = MinValue;
            AlarmMax = MaxValue;

            LastMeasurement.Unit = "%";

            voltage = 3.3;

            channel = Channel;
            firstValue = true;

            if (Simulation)
                SetFirstValue();
        }

        public override string Read()
        {

         
            if (adc == null)
                throw new Exception("No connection!");

            double value;
            if (calibration == null)
                value = ReadInt() * voltage / 4096;
            else
                value = calibration.Calculate(ReadInt());
             

            return value.ToString();


          

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
                return SimulateSensor();
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
            try 
            {
                if (CalibrationFileName != null)
                    calibration = Calibration_2Points.Load(CalibrationFileName);

            }
            catch(Exception ex)
            {
                StartCalibration();
            }
        }
    }
}
