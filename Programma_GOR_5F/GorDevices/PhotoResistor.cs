using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gor.Devices
{
    public class PhotoResistor : Sensor
    {
        public int Channel { get; set; }

        public Adc_MCP3208 Adc { get; set; }

        public bool firstValue = true;

        public PhotoResistor(bool simulation, Adc_MCP3208 adc, int channel) : base(simulation)
        {
            Initialization();
            this.Adc = adc;

            MinValue = 0;
            MaxValue = 1000;

            AlarmMin = MinValue;
            AlarmMax = MaxValue;

            LastMeasurement.Unit = "Lux"; 

            channel = channel;

            if (simulation)
                PrimoValore();
        }

        public override string Read()
        {
            return "";
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
                    Unit = "[Lux]",
                    DisplayFormat = "0.00",
                    Moment = DateTime.Now,
                    Name = "Photoresistor",
                    ReadValue = read.ToString()
                };
            }
        }

        public override void Initialization()
        {
            // NO!! non deve fare la taratura tutte le volte. Solo una volta e sotto controllo di un altro programma,
            // che chiama i metodi di taratura del sensore
            //calibration = new Calibration_2Points(CalibrationFileName); 

            calibration = new Calibration_2Points();
            calibration.AddPoint(0, 0);
            calibration.AddPoint(4095, 100);
        }
    }
}
