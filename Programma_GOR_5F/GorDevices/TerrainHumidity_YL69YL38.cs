using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gor.Devices
{
    public class TerrainHumidity_YL69YL38 : Sensor, IMCP3208Convertible
    {

        public int channel { get; set; }

        public Adc_MCP3208 adc { get; set; }

        private bool firstValue = true;

        public TerrainHumidity_YL69YL38(bool Simulation, Adc_MCP3208 adc, int Channel)
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
            return "";
        }

        public override int ReadInt()
        {
            if (adc == null)
                throw new Exception("Nessuna connessione.");

            return adc.Read(channel);
        }
        
        public override Measurement Measure()
        {
            if (Simulation)
            {
                return simulaSensore();
            }
            else
            {
                // mettere qui l'acquisizione vera 
                // da verificare 
                return null;
            string read = Read();

            return new Measurement
            {
                Value = calibration.Calculate(double.Parse(read)),
                Unit = "[%]",
                Name = "Terrain Humidity",
                ReadValue = read
            };
        }
        }

        public override void Initialization()
        {
            calibration = new Calibration_2Points(CalibrationFileName);
        }
    }
}
