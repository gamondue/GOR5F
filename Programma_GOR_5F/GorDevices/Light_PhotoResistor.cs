using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//Foschini Lucia - Beatrice Bartoloni
namespace Gor.Devices
{
    public class Light_PhotoResistor : Sensor
    {
        public int Channel { get; set; }

        public Adc_MCP3208 Adc { get; set; }

        public Light_PhotoResistor(string Name, bool Simulation, Adc_MCP3208 Adc, int Channel, Logger Logger)
            : base(Name, Simulation, Logger)
        {
            this.Adc = Adc;
            this.Channel = Channel;

            MinValue = 0;
            MaxValue = 1000;

            AlarmMin = MinValue;
            AlarmMax = MaxValue;

            voltage = 3.3;

            firstValue = true;

            if (Simulation)
                SetFirstValue();

            Initialization();
        }
        
        public override void Initialization()
        {
            // define measurements list
            DateTime instant = DateTime.Now;
            Measurement m = new Measurement()
            {
                Value = MinValue,
                Unit = "[lx]",
                DisplayFormat = "0",
                SampleTime = instant,
                Name = this.Name,
            };
            LastMeasurements.Add(m);

            // NO!! non deve fare la taratura tutte le volte. Solo una volta e sotto controllo di un altro programma,
            // che chiama i metodi di taratura del sensore
            //calibration = new Calibration_2Points(CalibrationFileName); 

            calibration = new Calibration_2Points();
            calibration.AddPoint(0, 0);
            calibration.AddPoint(4095, 100);
        }

        /*TODO: Trovare valori della luce senza utilizzare la taratura attraverso una formula 
         * I= (Vcc - Va/d)/R1 (vedi documentazione) 
        */   

        /// <summary>
        /// Return ADC points of reading
        /// </summary>
        /// <returns></returns>
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

                //LastMeasurements[0].Value = calibration.Calculate(read);
                LastMeasurements[0].Value = read;
                LastMeasurements[0].ReadValue = read.ToString();
                LastMeasurements[0].SampleTime = istante;
                return LastMeasurements;
            }
        }
    }
}
