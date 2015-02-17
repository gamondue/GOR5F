using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gor.Devices
{
    public class Humidity_Terrain_YL69YL38 : Sensor
    {
        public int Channel { get; set; }

        public Adc_MCP3208 Adc { get; set; }

<<<<<<< HEAD:Programma_GOR_5F/GorDevices/Humidity_Terrain_YL69YL38.cs
        public Humidity_Terrain_YL69YL38(bool simulation, Adc_MCP3208 adc, int channel)
            : base(simulation)
=======
        public Adc_MCP3208 adc { get; set; }

        private bool firstValue = true;

        public TerrainHumidity_YL69YL38(bool Simulation, Adc_MCP3208 adc, int Channel)
            : base(Simulation)
>>>>>>> Modifica metodo Initialization() e modifica generale di alcuni particolari della classe:Programma_GOR_5F/GorDevices/TerrainHumidity_YL69YL38.cs
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
                SetFirstValue();
        }

        public override string Read()
        {
<<<<<<< HEAD:Programma_GOR_5F/GorDevices/Humidity_Terrain_YL69YL38.cs
<<<<<<< HEAD:Programma_GOR_5F/GorDevices/Humidity_Terrain_YL69YL38.cs
            return "0";
=======
            if (adc == null)
                throw new Exception("No connection!");

            double value;
            if (calibration == null)
                value = ReadInt() * voltage / 4096;
            else
                value = calibration.Calculate(ReadInt());
             

            return value.ToString();
>>>>>>> Modifica metodo Initialization() e modifica generale di alcuni particolari della classe:Programma_GOR_5F/GorDevices/TerrainHumidity_YL69YL38.cs
=======
            return "";
>>>>>>> Revert "Modifica metodo Initialization() e modifica generale di alcuni particolari della classe":Programma_GOR_5F/GorDevices/TerrainHumidity_YL69YL38.cs
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
                return SimulateSensor();
            }
            else
            {
                int read = ReadInt();

                return new Measurement
                {
                    Value = calibration.Calculate(read),
                    Unit = "[%]",
                    Name = "Terrain Humidity",
                    ReadValue = read.ToString()
                };
            }
        }

        public override void Initialization()
        {
            //calibration = new Calibration_2Points(CalibrationFileName);
        }
    }
}
