using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using Raspberry.IO.Components.Sensors.Temperature.Ds18b20; 

namespace Gor.Devices
{
    public class Temperature_DS1822 : Sensor, IDisposable 
    {
        //private Process p;
        Ds18b20Connection termometro; 

        public string IdSensor { get; set; }

        public Temperature_DS1822(string Name, bool Simulation, string SensorId,Logger Logger)
            : base(Name, Simulation, Logger)
        {
            Logger.Debug("Temperature_DS1822_Constructor con ID. SensorId: " + SensorId);
            // creazione del termometro con l'Id passato
            try
            {
                termometro = new Ds18b20Connection(SensorId);
            } 
            catch (Exception ex)
            {
                Logger.Error("Temperature_DS1822_Constructor con ID. SensorId" + ex.Message);
                return;
            }
            IdSensor = SensorId;
            Initialization();
        }

        /// <summary>
        /// Costruttore senza ID del sensore, trovato automaticamente dal software
        /// Prende il primo termometro che trova 
        /// </summary>
        /// <param name="Name"></param>
        /// <param name="Simulation"></param>
        /// <param name="Logger"></param>
        public Temperature_DS1822(string Name, bool Simulation, Logger Logger)
            : base(Name, Simulation, Logger)
        {
            Logger.Debug("Temperature_DS1822_Constructor senza ID. SensorId automatico");
            // creazione del termometro; se il parametro DeviceIndex = 0 usa il primo sensore che trova
            try
            {
                termometro = new Ds18b20Connection(0);
            }
            catch (Exception ex)
            {
                Logger.Error("Temperature_DS1822_Constructor senza ID. " + ex.Message);
                return; 
            }
            Initialization();
        }

        public override void Initialization()
        {
            MinValue = -20;
            MaxValue = 45;

            firstValue = true;

            AlarmMin = MinValue;
            AlarmMax = MaxValue;
            
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

        public override double ReadDouble()
        {
            if (!Simulation)
            {
                return termometro.GetTemperature().DegreesCelsius; 
            }
            else
            {
                return 23.00;
            }
        }

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
                {   // real sampling
                    logger.Debug("Temperature_DS1822_Measure_10");
                    if (termometro != null)
                    {
                        LastMeasurements[0].Value = ReadDouble();
                        logger.Debug("Temperature_DS1822_Measure_20: LastMeasurements[0].Value=" + LastMeasurements[0].Value);
                        LastMeasurements[0].SampleTime = instant;
                        return LastMeasurements;
                    }
                    else
                    {
                        // se il sensore non era stato istanziato, dà errore
                        logger.Debug("Temperature_DS1822_Measure_22");
                        // if reading error, give back a not suitable value
                        LastMeasurements[0].Value = -300; // temperatura impossibile
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
