using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

//Valdinoci Lorenzo-Gianluca Picci 5f 
namespace Gor.Devices
{
    [DataContract (Name= "YL69YL38", Namespace="http://giardinoitt.altervista.org") ]
    public class Humidity_Terrain_YL69YL38 : Sensor
    {
        [DataMember (Name="Channel",Order=1)]
        public int Channel { get; set; }
        [DataMember(Name = "Adc_MCP3208", Order = 2)]
        public Adc_MCP3208 Adc { get; set; }
        [DataMember(Name = "adc_MCP3208", Order = 3)]
        public Adc_MCP3208 adc { get; set; }
        [DataMember(Name = "FirstValue", Order = 4)]
        private bool firstValue = true;

        public Humidity_Terrain_YL69YL38(bool Simulation, Adc_MCP3208 adc, int Channel)
            : base(Simulation)

        {
            LastMeasurement = new Measurement(); 

            int channel;
            Initialization();
            this.Adc = adc;

            MinValue = 0;
            MaxValue = 100;

            AlarmMin = MinValue;
            AlarmMax = MaxValue;

            LastMeasurement.Unit = "%";

            voltage = 3.3;

            channel = Channel;
            firstValue = true;

            if (Simulation)
                SetFirstValue();
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
                    Unit = "[%]",
                    Name = "Terrain Humidity",
                    ReadValue = read.ToString()
                };
                return LastMeasurement; 
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
                StartCalibration();
            }
        }
    }
}
