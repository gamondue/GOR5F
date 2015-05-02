using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace Gor.Devices
{
    public class Temperature_DS1822 : Sensor, IDisposable 
    {
        private Process p;

        public string IdSensor { get; set; }

        public Temperature_DS1822(string Name, bool Simulation, string SensorId,Logger Logger)
            : base(Name, Simulation, Logger)
        {
            Logger.Debug("Temperature_DS1822_Constructor. SensorId: " + SensorId);

            MinValue = -20;
            MaxValue = 45;

            firstValue = true;  

            AlarmMin = MinValue;
            AlarmMax = MaxValue;

            IdSensor = SensorId;

            p = new Process();
            Initialization();
        }


        public override void Initialization()
        {
            string readTemperature = "/bin/cat";
            string arguments = "/sys/bus/w1/devices/" + IdSensor + "/w1_slave";
            //logger.Debug(i2cgetCmdArgs); 

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
            // Now run command & wait for it to finish
            Measurement m = new Measurement 
            {
                Value = MinValue,
                Unit = "[°C]",
                DisplayFormat = "0.00",
                SampleTime = DateTime.Now,
                Name = this.Name,
            };
            LastMeasurements.Add(m); 

            // test readout
            try
            {
                logger.Debug(Measure().ToString());
            }
            catch (Exception ex)
            {
                logger.Error("Temperature_DS1822_Initialization, test measurement. Sensor " + this.Name + " " + ex.Message);
            }
        }

        public override string Read()
        {
            if (!Simulation)
            {
                p.Start();
                p.WaitForExit();

                string data = p.StandardOutput.ReadToEnd();
                return (data);
            } else
            {
                return "TEMPERATURA SIMULATA !!!! : crc=e1 YES " +
                        "70 01 4b 46 7f ff 10 10 e1 t=23000"; 
            }
        }

        public override int ReadInt()
        { return -1; }

        public override List<Measurement> Measure()
        {
            logger.Debug("Temperature_DS1822_Measure_00");
            DateTime instant = DateTime.Now;
            try 
            {
                if (Simulation)
                {
                    if (firstValue)
                    {
                        double value = Math.Round((rnd.Next(-10, 55) + rnd.NextDouble()), 4);

                        LastMeasurements[0].Value = value;
                        firstValue = false;
                    }
                    else
                    {
                        double variabilita = Math.Round((rnd.Next(-2, 3) + rnd.NextDouble()), 4);

                        LastMeasurements[0].Value += variabilita;
                    }
                    LastMeasurements[0].SampleTime = instant;
                    firstValue = false;
                    return LastMeasurements;
                }
                else
                {
                    logger.Debug("Temperature_DS1822_Measure_10");
                    string s = Read();
                    logger.Debug("Lettura " + s);

                    logger.Debug("Temperature_DS1822_Measure: reading: " + s);
                    string[] d = s.Split(' ');
                    string data = d[d.Length - 1];
                    logger.Debug("Temperature_DS1822_Measure_20");

                    if (data == null || data == "")
                    {
                        logger.Debug("Temperature_DS1822_Measure_22");
                        // if reading error, give back a not suitable value
                        LastMeasurements[0].Value = -300; // impossibile
                        LastMeasurements[0].SampleTime = instant;
                        logger.Debug("Temperature_DS1822_Measure_24");

                        return LastMeasurements;
                    }
                    else
                    {
                        data = data.Substring(2);
                        logger.Debug("Temperature_DS1822_Measure_30");

                        LastMeasurements[0].Value = double.Parse(data) / 1000;
                        LastMeasurements[0].SampleTime = instant;

                        return LastMeasurements;
                    }
                }
            }
            catch (Exception ex)
            {
                logger.Error("Temperature_DS1822_Constructor, Measure(). Sensor " + this.Name + " " + ex.Message);
                return null; 
            }
        }

        public void Dispose()
        {
        }
    }
}
