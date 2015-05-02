using Raspberry.IO.SerialPeripheralInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
//Daniele Piscaglia 5F
namespace Gor.Devices
{
    public class Humidity_Air_HIH4000 : Sensor
    {
        //Logger logger; // in base class

        /// <summary>
        /// Channel of the ADC
        /// </summary>
        public int Channel { get; set; }

        private Adc_MCP3208 Adc { get; set; }

        /// <summary>
        /// Calibration settings
        /// </summary>
        Calibration_2Points calibration;

        public Humidity_Air_HIH4000(string Name, bool Simulation, Adc_MCP3208 adc, int channel, Logger Logger)
            : base(Name, Simulation, Logger)
        {
            logger.Debug("Humidity_Air_HIH4000-Constructor_00");
            logger = Logger;

            logger.Debug("Humidity_Air_HIH4000-Constructor_10");

            this.Adc = adc;
            logger.Debug("Humidity_Air_HIH4000-Constructor_11");

            MinValue = 0;
            MaxValue = 100;

            AlarmMin = MinValue;
            AlarmMax = MaxValue;

            voltage = 3.3;

            Channel = channel;
            firstValue = true;

            if (Simulation)
                SetFirstValue();
            
            Initialization();
            logger.Debug("Humidity_Air_HIH4000-Constructor_99");
        }

        public Humidity_Air_HIH4000(string Name, bool Simulation, Adc_MCP3208 Adc, int Channel, string CalibrationFile, Logger Logger)
            :this (Name, Simulation, Adc, Channel, Logger)
        {
            //Load the calibration file
            calibration = Calibration_2Points.Load(CalibrationFile);
            Initialization();
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
                    Unit = "[RH%]",
                    DisplayFormat = "0.00",
                    SampleTime = instant,
                    Name = this.Name,
                };
                LastMeasurements.Add(rh);

                //Load the calibrationsettings if avaiable
                if (CalibrationFileName != null)
                    calibration = Calibration_2Points.Load(CalibrationFileName);
                else
                {
                    calibration = new Calibration_2Points();
                    calibration.AddPoint(0, 0);
                    calibration.AddPoint(4095, 100);
                }
            }
            catch (Exception ex)
            {
                logger.Error("Humidity_Air_HIH4000|Initialization: " + ex.Message);
            }
        }

        /// <summary>
        /// Read and convert the value from the ADC
        /// </summary>
        /// <returns>String contaning the value(double)</returns>
        public override string Read()
        {   // not useful 
            double val;

            if (Adc == null)
                return "";
            else
            {
                if (calibration == null && !calibration.Ready) //If the sensor isn't calibrated
                    val = ReadInt() * voltage / 4096;
                else //If the sensor is calibrated
                    val = calibration.Calculate(ReadInt());

                return val.ToString();
            }
        }

        /// <summary>
        /// Return the value not converted asreaded from the ADC
        /// </summary>
        public override int ReadInt()
        {
			return Adc.Read(Channel); 
        }

        /// <summary>
        /// Value containing all the info about the measurement
        /// </summary>
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
                logger.Debug("Humidity_Air_HIH4000_Measure-00");
                // Modifiche apportate Zambelli-Zhu
                int reading = ReadInt();
                logger.Debug("Humidity_Air_HIH4000_Measure-05 reading: " + reading.ToString());
                double Value; 
                if (calibration == null && !calibration.Ready) //If the sensor isn't calibrated
                    Value = ReadInt() * voltage / 40.96; // relative value %
                else //If the sensor is calibrated
                    Value = calibration.Calculate(ReadInt());

                LastMeasurements[0].Value = calibration.Calculate(reading);
                LastMeasurements[0].ReadValue = reading.ToString();
                LastMeasurements[0].SampleTime = istante;
                return LastMeasurements; 
       		} 
        }
    }
}
