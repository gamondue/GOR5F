using Raspberry.IO.SerialPeripheralInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
//Daniele Piscaglia 5F
namespace Gor.Devices
{
    public class RelativeHumidity_HIH4000 : Sensor
    {
        public int channel { get; set; }

        private Adc_MCP3208 adc { get; set; }

        private bool firstValue = true;

        double voltage = 3.3; 

        public RelativeHumidity_HIH4000(bool Simulation, Adc_MCP3208 adc, int Channel)
            : base(Simulation)
        {
            this.adc = adc;

            MinValue = 0;
            MaxValue = 100;

            AlarmMin = MinValue;
            AlarmMax = MaxValue;

            LastMeasurement.Unit = "%"; 

            channel = Channel;

            if (Simulation)
                PrimoValore();
        }

        public override string Read()
        {
            if (adc == null)
                throw new Exception("Nessuna connessione.");

            double val = adc.Read(channel) * voltage / 4096;

            return val.ToString();
        }

        public override int ReadInt()
        {
			return int.MaxValue; 
        }

        public override Measurement Measure()
        {
            if (Simulation)
            {
                return simulaSensore();
            } 
			else
			{
	            Measurement measure = new Measurement();
	            measure.Name = "Relative Humidity";
	            measure.Unit = "%";
	            
	            double tmp;
	            if (double.TryParse(Read(), out tmp))
	                measure.Value = tmp;
	            else
	                throw new Exception("Impossible to parse the value");
	
	            measure.Moment = DateTime.Now;
	            return measure;
       		} 
       }

        public override void Initialization()
        {
            // NO!! non deve fare la taratura tutte le volte. Solo una volta e sotto controllo di un altro programma,
            // che chiama i metodi di taratura del sensore
            //calibration = new Calibration_2Points(CalibrationFileName);
        }
    }
}
