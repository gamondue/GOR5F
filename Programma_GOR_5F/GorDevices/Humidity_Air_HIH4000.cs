﻿using Raspberry.IO.SerialPeripheralInterface;
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
        [DataMember (Name="Channel")]
        public int Channel { get; set; }

        [DataMember(Name = "Adc")]
        private Adc_MCP3208 Adc { get; set; }

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
            calibration = Calibration_2Points.Load(CalibrationFile);
        }

        public override string Read()
        {
            if (Adc != null)
                throw new Exception("Nessuna connessione.");

            double val;

            if(calibration==null) //If the sensor isn't calibrated
                val = ReadInt() * voltage / 4096;
            else //If the sensor is calibrated
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
                return SimulateSensor();
            } 
			else
			{
                Logger.Log("Humidity_Air_HIH4000_Measure-00");
                //Modifiche apportate Zambelli-Zhu
                int reading = ReadInt();

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

                return new Measurement
                {
                    Value = reading,
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
