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
        public int Channel { get; set; }

        private Adc_MCP3208 Adc { get; set; }

        Calibration_2Points calibration;

        public RelativeHumidity_HIH4000(bool simulation, Adc_MCP3208 adc, int channel)
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

        public RelativeHumidity_HIH4000(bool Simulation, Adc_MCP3208 adc, int Channel, string CalibrationFile)
            :this (Simulation, adc, Channel)
        {
            calibration = Calibration_2Points.Load(CalibrationFile);
        }

        public override string Read()
        {
            if (Adc == null)
                throw new Exception("Nessuna connessione.");

            double val;

            if(calibration==null)//If the sensor isn't calibrated
                val = ReadInt() * voltage / 4096;
            else//If the sensor is calibrated
                val = calibration.Calculate(ReadInt());

            return val.ToString();
        }

        public override int ReadInt()
        {
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
                //Modifiche apportate Zambelli-Zhu
                int read = ReadInt();

                return new Measurement
                {
                    Value = calibration.Calculate(read),
                    Unit = "[%]",
                    DisplayFormat = "0.00",
                    Moment = DateTime.Now,
                    Name = "Relative Humidity",
                    ReadValue = read.ToString()
                };
       		} 
        }

        public override void Initialization()
        {
            // NO!! non deve fare la taratura tutte le volte. Solo una volta e sotto controllo di un 
            //altro programma, che chiama i metodi di taratura del sensore
            //calibration = new Calibration_2Points(CalibrationFileName);

            /*calibration = new Calibration_2Points();
            calibration.AddPoint(0, 0);
            calibration.AddPoint(4095, 100);*/
            try
            {
                if (CalibrationFileName != null)
                    calibration = Calibration_2Points.Load(CalibrationFileName);
            }
            catch(Exception ex)
            {
                StartCalibration();//Nel metodo initialization bisogna calibrare il sensore se nonsi riesce a caricare una calibrazione?
            }
            
            



        }
    }
}
