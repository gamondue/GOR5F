﻿using System;
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
            LastMeasurement = new Measurement(); 

            this.Adc = Adc;
            this.Channel = Channel;

            MinValue = 0;
            MaxValue = 1000;

            AlarmMin = MinValue;
            AlarmMax = MaxValue;

            LastMeasurement.Unit = "Lux";

            voltage = 3.3;

            firstValue = true;

            if (Simulation)
                SetFirstValue();

            Initialization();
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
                LastMeasurement = SimulateSensor();
                return LastMeasurement; 
            }
            else
            {
                int read = ReadInt();

                LastMeasurement = new Measurement
                {
                    Value = calibration.Calculate(read),
                    Unit = "[Lux]",
                    DisplayFormat = "0.00",
                    SampleTime = DateTime.Now,
                    Name = "Photoresistor",
                    ReadValue = read.ToString()
                };
                return LastMeasurement; 
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

        /*TODO: Trovare valori della luce senza utilizzare la taratura attraverso una formula 
         * I= (Vcc - Va/d)/R1 (vedi documentazione) 
        */   
    }
}
