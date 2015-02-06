using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gor.Devices
{
    public class PhotoResistor : Sensor
    {
        public int channel { get; set; }

        public Adc_MCP3208 adc { get; set; }

        public bool firstValue = true;

        public PhotoResistor(bool Simulation, Adc_MCP3208 adc, int Channel) : base(Simulation)
        {
            Initialization();
            this.adc = adc;

            MinValue = 0;
            MaxValue = 1000;

            AlarmMin = MinValue;
            AlarmMax = MaxValue;

            LastMeasurement.Unit = "Lux"; 

            channel = Channel;

            if (Simulation)
                PrimoValore();
        }

        public override string Read()
        {
            return "";
        }

        public override int ReadInt()
        {
            if (adc == null)
                throw new Exception("Nessuna connessione.");

            return adc.Read(channel);
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
