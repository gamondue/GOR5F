using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

//Valdinoci Lorenzo-Gianluca Picci 5f 
namespace Gor.Devices
{
    public class Humidity_Terrain_YL69YL38 : Sensor
    {
        public int Channel { get; set; }
        public Adc_MCP3208 Adc { get; set; }
        public Adc_MCP3208 adc { get; set; }
        private bool firstValue = true;

        public Humidity_Terrain_YL69YL38(string Name, bool Simulation, Adc_MCP3208 Adc, int Channel, Logger Logger)
            : base(Name, Simulation, Logger)
        {
            LastMeasurements[0] = new Measurement(); 

            int channel;
            Initialization();
            this.Adc = Adc;

            MinValue = 0;
            MaxValue = 100;

            AlarmMin = MinValue;
            AlarmMax = MaxValue;

            voltage = 3.3;

            channel = Channel;
            firstValue = true;

            if (Simulation)
                SetFirstValue();
        }

        public override void Initialization()
        {
            try
            {
                // define measurements list
                DateTime instant = DateTime.Now;
                Measurement rh = new Measurement()
                {
                    Value = MinValue,
                    Unit = "[%]",
                    DisplayFormat = "0",
                    SampleTime = instant,
                    Name = this.Name,
                };
                LastMeasurements.Add(rh);

                if (CalibrationFileName != null)
                    calibration = Calibration_2Points.Load(CalibrationFileName);
            }
            catch (Exception ex)
            {
                StartCalibration(); //!!!! da verificare 
            }
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

        public override List<Measurement> Measure()
        {
            DateTime istante = DateTime.Now; 
            if (Simulation)
            {
                LastMeasurements[0] = SimulateSensor();
                LastMeasurements[0].SampleTime = istante;
                return LastMeasurements;
            }
            else
            {
                int read = ReadInt();

                LastMeasurements[0].Value = calibration.Calculate(read); 
                LastMeasurements[0].ReadValue = read.ToString();
                LastMeasurements[0].SampleTime = istante;
                return LastMeasurements; 
            }
        }
    }
}
