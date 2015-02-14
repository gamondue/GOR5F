using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gor.Devices
{
    public class Temperature_DS1822 : Sensor, IDisposable 
    {
        private Process p;

        private string IdSensor { get; set; }

        public Temperature_DS1822(bool Simulation, string SensorID)
            : base(Simulation)
        {
            MinValue = -20;
            MaxValue = 45;

            firstValue = true;

            AlarmMin = MinValue;
            AlarmMax = MaxValue;

            IdSensor = SensorID;

            LastMeasurement.Unit = "°C"; 

            p = new Process();
            Initialization();
        }

        public override string Read()
        {
            p.Start();
            p.WaitForExit();

            string data = p.StandardOutput.ReadToEnd();
            return (data);
        }

        public override int ReadInt()
        { return -1; }

        public override Measurement Measure()
        {
            if (Simulation)
            {
                if(firstValue)
                {
                    double value = Math.Round((rnd.Next(-10, 55)+rnd.NextDouble()), 4);
                    LastMeasurement = new Measurement() { Value = value, Unit = "°C" };
                    firstValue = false;
                }
                else
                {
                    double varianza = Math.Round((rnd.Next(-2, 3)+rnd.NextDouble()),4);
                    LastMeasurement.Value += varianza;
                }
                return LastMeasurement;
            }
            else
            {
            string s = Read();
            string[] d = s.Split(' ');
            string data = d[d.Length - 1];
            data = data.Substring(2);

            Measurement m = new Measurement
            {
                Value = double.Parse(data) / 1000,
                Unit = "[°C]",
                DisplayFormat = "0.000",
                SampleTime = DateTime.Now,
                ReadValue = s,
                Name = "Temperature"
            };

            //////if (m.Value > AlarmMax)
            //////    onAlarm(new AlarmEventArgs(this, AlarmType.Max));
            //////else if (m.Value < AlarmMin)
            //////    onAlarm(new AlarmEventArgs(this, AlarmType.Min));

            return m;
        }
        }

        public override void Initialization()
        {
            // comando con il registro passato come parametro
            // un esempio del parametro: "-y 1 0x51 2 b"
            string readTemperature = "/bin/cat";
            string arguments = "/sys/bus/w1/devices/"+IdSensor+"/w1_slave";
            // MONTI: il valore dell'ID deve cambiare con il sensore che si utilizza

            //Console.WriteLine(i2cgetCmdArgs); 
            // Don't raise event when process exits
            p.EnableRaisingEvents = false;
            // We're using an executable not document, so UseShellExecute false
            p.StartInfo.UseShellExecute = false;
            // Redirect StandardError
            p.StartInfo.RedirectStandardError = true;
            // Redirect StandardOutput so we can capture it
            p.StartInfo.RedirectStandardOutput = true;
            p.StartInfo.RedirectStandardInput = true;
            // i2cgetExe has full path to executable
            // Need full path because UseShellExecute is false

            p.StartInfo.FileName = readTemperature;
            p.StartInfo.Arguments = arguments;
            // Now run i2cget & wait for it to finish
        }

        public void Dispose()
        {
        }
    }
}
