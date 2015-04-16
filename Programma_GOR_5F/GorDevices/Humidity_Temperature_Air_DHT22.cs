using Raspberry.IO.Components.Sensors.Temperature.Dht;
using Raspberry.IO.GeneralPurpose;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Gor.Devices
{
    public class Humidity_Temperature_Air_DHT22 : MultiSensor
    {
        private bool simulation; 

        /// <summary>
        /// Calibration settings
        /// </summary>
        [DataMember(Name = "Calibration")]
        Calibration_2Points calibration;

        ConnectorPin measurePin; 

        int dataIoPin;
     
        public Humidity_Temperature_Air_DHT22(string Name, bool Simulation, int DataIoPin, Logger Logger)
        {
            this.dataIoPin = DataIoPin;
            this.simulation = Simulation;

            //LastMeasurement = new Measurement(); 

            //logger.Test("Humidity_Air_DHT22-Constructor_00");
            //Initialization();
            //logger.Test("Humidity_Air_DHT22-Constructor_10");

            //MinValue = 0;
            //MaxValue = 100;

            //AlarmMin = MinValue;
            //AlarmMax = MaxValue;

            //LastMeasurement.Unit = "%";

            //voltage = 3.3;

            //firstValue = true;

            //if (Simulation)
            //    SetFirstValue();

            //logger.Test("Humidity_Air_DHT22-Constructor_20");
        }
        
        public void Initialization()
        {

            switch (dataIoPin)
            {
                case (11):
                    {
                        measurePin = Raspberry.IO.GeneralPurpose.ConnectorPin.P1Pin11;
                        break;
                    }
            }
            //Dht22Connection sensor = new Dht22Connection(measurePin, false); 

            //try
            //{
            //    //Load the calibrationsettings if avaiable
            //    if (CalibrationFileName != null)
            //        calibration = Calibration_2Points.Load(CalibrationFileName);
            //    else
            //    {
            //        calibration = new Calibration_2Points();
            //        calibration.AddPoint(0, 0);
            //        calibration.AddPoint(4095, 100);
            //    }
            //}
            //catch
            //{}
        }

        /// <summary>
        /// Read and convert the values from digital sensor (humidity, temperature)
        /// </summary>
        /// <returns>String contaning the value(double)</returns>
        public string Read()
        {   
                //if (calibration == null && !calibration.Ready) //If the sensor isn't calibrated
                //    val = ReadInt() * voltage / 4096;
                //else //If the sensor is calibrated
                //    val = calibration.Calculate(ReadInt());

                //return val.ToString(); 
            return null;
        }

        ///// <summary>
        ///// Not useful, is a digital sensor
        ///// </summary>
        //public override int ReadInt()
        //{
        //    return -1; 
        //}

        /// <summary>
        /// Value containing all the info about the measurement
        /// </summary>
        //public override Measurement Measure()
        //{
        //    if (Simulation)
        //    {
        //        LastMeasurement = SimulateSensor();
        //        return LastMeasurement;
        //    } 
        //    else
        //    {
        //        logger.Test("Humidity_Air_HIH4000_Measure-00");
        //        //Modifiche apportate Zambelli-Zhu
        //        int reading = ReadInt();
        //        logger.Test("Humidity_Air_HIH4000_Measure-05 reading: " + reading.ToString());
        //        double Value; 
        //        if (calibration == null && !calibration.Ready) //If the sensor isn't calibrated
        //            Value = ReadInt() * voltage / 40.96; // relative value %
        //        else //If the sensor is calibrated
        //            Value = calibration.Calculate(ReadInt());

        //        LastMeasurement = new Measurement
        //        {
        //            Value = calibration.Calculate(reading),
        //            Unit = "[%]",
        //            DisplayFormat = "0.00",
        //            SampleTime = DateTime.Now,
        //            Name = "Relative Humidity",
        //            ReadValue = reading.ToString()
        //        };
        //        return LastMeasurement; 
            //} 
        //}
     }
}
