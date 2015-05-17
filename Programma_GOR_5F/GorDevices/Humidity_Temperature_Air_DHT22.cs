using Raspberry.IO;
using Raspberry.IO.Components.Sensors.Temperature.Dht;
using Raspberry.IO.GeneralPurpose;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Gor.Devices
{
    public class Humidity_Temperature_Air_DHT22 : Sensor
    {
        DhtConnection dht22;

        //bool simulation = false; // in base class

        // Logger logger; in base class 

        /// <summary>
        /// Calibration settings
        /// </summary>
        Calibration_2Points calibration;

        ConnectorPin measurePin;

        int dataIoPin;

        public Humidity_Temperature_Air_DHT22(string Name, bool Simulation, int DataIoPin, Logger Logger)
            : base(Name, Simulation, Logger)
        {
            // logger = Logger; in base class
            logger.Debug("Humidity_Temperature_Air_DHT22-Constructor_00");

            this.dataIoPin = DataIoPin;

            //firstValue = true;

            //if (Simulation)
            //    SetFirstValue();

            logger.Debug("Humidity_Temperature_Air_DHT22-Constructor_10");
            Initialization();
        }

        public override void Initialization()
        {
            logger.Debug("Humidity_Temperature_Air_DHT22|Initialization_00");
            try
            {
                if (!Simulation)
                {
                    logger.Debug("Humidity_Temperature_Air_DHT22|Initialization_05");
                    MemoryGpioConnectionDriver driver = new MemoryGpioConnectionDriver();
                    logger.Debug("Humidity_Temperature_Air_DHT22|Initialization_06");
                    const ConnectorPin measurePin = ConnectorPin.P1Pin11;
                    logger.Debug("Humidity_Temperature_Air_DHT22|Initialization_07");
                    IInputOutputBinaryPin pin = driver.InOut(measurePin);
                    logger.Debug("Humidity_Temperature_Air_DHT22|Initialization_10");
                    dht22 = new Dht22Connection(pin);
                    logger.Debug("Humidity_Temperature_Air_DHT22|Initialization_11");
                }
                else
                {
                    // do nothing
                }
                // define measurements list
                DateTime instant = DateTime.Now;
                Measurement t = new Measurement()
                {
                    Value = MinValue,
                    Unit = "[°C]",
                    DisplayFormat = "0.00",
                    SampleTime = instant,
                    Name = "Temperature",
                };
                LastMeasurements.Add(t);
                Measurement rh = new Measurement()
                {
                    Value = MinValue,
                    Unit = "[RH%]",
                    DisplayFormat = "0",
                    SampleTime = instant,
                    Name = "Relative Humidity"
                };
                LastMeasurements.Add(rh);
            }
            catch (Exception ex)
            {
                logger.Error("Humidity_Temperature_Air_DHT22|Initialization_20 " + ex.Message);
            }
            logger.Debug("Humidity_Temperature_Air_DHT22|Initialization_99");
        }

        /// <summary>
        /// Value containing all the info about the measurement
        /// </summary>
        public override List<Measurement> Measure()
        {
            logger.Debug("Humidity_Temperature_Air_DHT22|Measure()_00");
            DateTime instant = DateTime.Now;
            if (Simulation)
            {
                logger.Debug("Humidity_Temperature_Air_DHT22|Measure_05() ");
                // TODO mettere i valori casuali
                LastMeasurements[0].Value = 25.01;
                LastMeasurements[0].SampleTime = instant;
                LastMeasurements[1].Value = 63;
                LastMeasurements[1].SampleTime = instant;
                return LastMeasurements;
            }
            else
            {
                logger.Debug("Humidity_Temperature_Air_DHT22|Measure_10() ");
                DhtData data = null; 
                try
                {
                    logger.Debug("Humidity_Temperature_Air_DHT22|Measure_11() ");
                    data = dht22.GetData();
                    logger.Debug("Humidity_Temperature_Air_DHT22|Measure_12() ");
                    LastMeasurements[0].Value = data.Temperature.DegreesCelsius;
                    logger.Debug("Humidity_Temperature_Air_DHT22|Measure_13() " + " " + 
                        data.Temperature.DegreesCelsius + " " + LastMeasurements[0].Value);
                    LastMeasurements[0].SampleTime = instant;
                    LastMeasurements[1].Value = data.RelativeHumidity.Percent;
                    logger.Debug("Humidity_Temperature_Air_DHT22|Measure_14() " + LastMeasurements[1].Value);
                    LastMeasurements[1].SampleTime = instant;
                    return LastMeasurements;
                }
                catch (Exception ex)
                {
                    logger.Error("Humidity_Temperature_Air_DHT22:Measure_50() " + ex.Message);
                    return null;
                }
            }
        }

        public override string Read()
        {
            throw new NotImplementedException();
        }
        
        public override int ReadInt()
        {
            throw new NotImplementedException();
        }
    }
}
