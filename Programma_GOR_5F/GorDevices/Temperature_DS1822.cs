using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace Gor.Devices
{
    [DataContract(Name="Temperature_DS1822", Namespace="giardinoitt.altervista.org")]
    public class Temperature_DS1822 : Sensor, IDisposable 
    {
        [DataMember(Name="Process")]
        private Process p;

        [DataMember(Name="IdSensor")]
        public string IdSensor { get; set; }

        public Temperature_DS1822(string Name, bool Simulation, string SensorId,Logger Logger)
            : base(Name, Simulation, Logger)
        {
            this.Name = Name; 

            Logger.Debug("Temperature_DS1822_Constructor. SensorId: " + SensorId);

            LastMeasurement = new Measurement(); 

            MinValue = -20;
            MaxValue = 45;

            firstValue = true;

            AlarmMin = MinValue;
            AlarmMax = MaxValue;

            IdSensor = SensorId;

            LastMeasurement.Unit = "[°C]"; 

            p = new Process();
            Initialization();
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

        public override Measurement Measure()
        {
            logger.Debug("Temperature_DS1822_Measure_00");
            try 
            {
                if (Simulation)
                {
                    if (firstValue)
                    {
                        double value = Math.Round((rnd.Next(-10, 55) + rnd.NextDouble()), 4);

                        LastMeasurement = new Measurement() { Value = value, Unit = "[°C]" };
                        firstValue = false;
                    }
                    else
                    {
                        double variabilita = Math.Round((rnd.Next(-2, 3) + rnd.NextDouble()), 4);

                        LastMeasurement.Value += variabilita;
                    }
                    return LastMeasurement;
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

                    data = data.Substring(2);

                    logger.Debug("Temperature_DS1822_Measure_30");
                    Measurement m = new Measurement
                    {
                        Value = double.Parse(data) / 1000,
                        Unit = "[°C]",
                        DisplayFormat = "0.00",
                        SampleTime = DateTime.Now,
                        ReadValue = s,
                        Name = "Temperature"
                    };
                    LastMeasurement = m; 
                    //////if (m.Value > AlarmMax)
                    //////    onAlarm(new AlarmEventArgs(this, AlarmType.Max));
                    //////else if (m.Value < AlarmMin)
                    //////    onAlarm(new AlarmEventArgs(this, AlarmType.Min));
                    return m; 
                }
            }
            catch (Exception ex)
            {
                logger.Error("Temperature_DS1822_Constructor, Measure(). Sensor " + this.Name + " " + ex.Message);
                return null; 
            }
        }

        public override void Initialization()
        {
            string readTemperature = "/bin/cat";
            string arguments = "/sys/bus/w1/devices/"+IdSensor+"/w1_slave";
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

        public void Dispose()
        {
        }
    }
}
