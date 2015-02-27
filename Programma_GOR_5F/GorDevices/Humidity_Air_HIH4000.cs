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
    [DataContract (Name="HIH4000", Namespace="http://giardinoitt.altervista.org")]
    public class Humidity_Air_HIH4000 : Sensor
    {
        /// <summary>
        /// Channel of the ADC
        /// </summary>
        [DataMember (Name="Channel")]
        public int Channel { get; set; }

        [DataMember(Name = "Adc")]
        private Adc_MCP3208 Adc { get; set; }

        /// <summary>
        /// Calibration settings
        /// </summary>
        [DataMember(Name = "Calibration")]
        Calibration_2Points calibration;

        bool simulation; 

        public Humidity_Air_HIH4000(bool simulation, Adc_MCP3208 adc, int channel)
            : base(simulation)
        {
            Logger.Log("Humidity_Air_HIH4000-Constructor_00");
            Initialization();
            Logger.Log("Humidity_Air_HIH4000-Constructor_10");

            this.Adc = adc;
            

            MinValue = 0;
            MaxValue = 100;

            AlarmMin = MinValue;
            AlarmMax = MaxValue;

            LastMeasurement.Unit = "%";

            voltage = 3.3;

            Channel = channel;
            firstValue = true;

            Logger.Log(Simulation.ToString());

            if (Simulation)
                SetFirstValue();
            Logger.Log("Humidity_Air_HIH4000-Constructor_99");
        }

        public Humidity_Air_HIH4000(bool Simulation, Adc_MCP3208 adc, int Channel, string CalibrationFile)
            :this (Simulation, adc, Channel)
        {
            //Load the calibration file
            calibration = Calibration_2Points.Load(CalibrationFile);
        }

        /// <summary>
        /// Read and convert the value from the ADC
        /// </summary>
        /// <returns>String contaning the value(double)</returns>
        public override string Read()
        {
            if (Adc != null)
                throw new Exception("Nessuna connessione.");

            double val;

            if(calibration==null && !calibration.Ready) //If the sensor isn't calibrated
                val = ReadInt() * voltage / 4096;
            else //If the sensor is calibrated
                val = calibration.Calculate(ReadInt());

            return val.ToString();
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
        public override Measurement Measure()
        {
            if (Simulation)
            {
                return SimulateSensor();
            } 
			else
			{
                Logger.Log("Humidity_Air_HIH4000_Measure-00");
                //Modifiche apportate Zambelli-Zhu
                double reading = double.Parse(Read());

                Logger.Log(reading.ToString());
                
                //return new Measurement
                //{
                //    Value = calibration.Calculate(read),
                //    Unit = "[%]",
                //    DisplayFormat = "0.00",
                //    SampleTime = DateTime.Now,
                //    Name = "Relative Humidity",
                //    ReadValue = read.ToString()
                //};

                Logger.Log(reading.ToString()); 

                


                return new Measurement
                {
                    Value = calibration.Calculate(reading),
                    Unit = "[%]",
                    DisplayFormat = "0.00",
                    SampleTime = DateTime.Now,
                    Name = "Relative Humidity",
                    ReadValue = reading.ToString()
                };
       		} 
        }

        public override void Initialization()
        {
            try
            {
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
            catch
            {}
        }
    }
}
