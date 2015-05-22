using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using Gor.Devices;

namespace Gor
{
    public abstract class Sensor
    {
        // generatore di numeri random valido per ogni sensore
        internal Random rnd = new Random();

        protected bool firstValue;
        protected double voltage;
        protected bool isCalibrating;
        protected Calibration_2Points calibration;

        public string CalibrationFileName { get; set; }

        public string Name { get; set; }

        public bool Simulation { get; private set; }

        public double AlarmMax { get; set; }

        public double AlarmMin { get; set; }

        public double MaxValue { get; set; }

        public double MinValue { get; set; }

        public string GotCode { get; set; }
        public string Unit { get; set; }

        /// Data structures containing all the measurements taken on a single Sensor.
        /// Sensor can have embedded more than one sensing elements, any of them 
        /// can take a different measurement, with a different unit
        /// LastMeasurements contains the values of all the measurements
        /// taken the last time with this sensor
        public List<Measurement> LastMeasurements { get; set; }

        public Logger logger; 

        public Sensor(string Name, bool Simulation, Logger Logger)
        {
            this.Name = Name; 
            this.Simulation = Simulation;
            this.logger = Logger;
            LastMeasurements = new List<Measurement>();
        }

        internal List<Measurement> SetFirstValue()
        {
            // trova casualmente le prime misure, utili per la simulazione
            foreach (Measurement m in LastMeasurements)
            {
                do
                {
                    m.Value = (rnd.Next(0, 4) + rnd.NextDouble());
                } while (m.Value > MaxValue || m.Value < MinValue);
            }
            
            return LastMeasurements; 
        }

        /// <summary>
        /// Raw reading from the sensor, when it is in string format
        /// If the sensor uses this method then it will override it. 
        /// If not overridden the method signals error by returning a "Nope!" string
        /// </summary>
        /// <returns></returns>
        public virtual string Read()
        {
            return "Nope!";
        }

        /// <summary>
        /// Raw reading from the sensor, when it is a floating point number
        /// If the sensor uses this method then it will override it. 
        /// If not overridden the method signals error by returning MaxValue
        /// </summary>
        /// <returns></returns>
        public virtual double ReadDouble()
        {
            return double.MaxValue;
        }

        /// <summary>
        /// Raw reading from the sensor, when it is an integer number
        /// If the sensor uses this method then it will override it. 
        /// If not overridden the method signals error by returning MaxValue
        /// </summary>
       /// <returns></returns>
        public virtual int ReadInt()
        {
            return int.MaxValue;
        }

        /// <summary>
        /// Method that returns the "finished" measurement (or measurements), including calibration
        /// correction (if any)
        /// N.B. Measure has to set the LastMeasurement List before returning
        /// </summary>
        /// <returns></returns>
        public abstract List<Measurement> Measure();

        public abstract void Initialization();

        public virtual void StartCalibration()
        {
            if (!Simulation)
                isCalibrating = true;
        }

        public virtual double CalibrationPoint(double value)
        {
            if (!isCalibrating)
                throw new Exception("Impossibile effettuare la calibrazione: sensore in simulazione o calibrazione non iniziata.");
            double y = double.Parse(Read());
            calibration.AddPoint(y, value);
            return y;
        }

        public virtual void EndCalibration()
        {
            isCalibrating = false;
            calibration.Save(CalibrationFileName);
        }

        public double StandardDeviation(int readNumber = 10)
        {
            //TO adapt 
            Measurement[] measurements = new Measurement[readNumber];
            double average = 0;
            double deviation = 0;

            for (int i = 0; i < measurements.Length; i++)
            {
                measurements[i] = Measure()[0];
                average += measurements[i].Value;
            }

            average /= readNumber;

            foreach (Measurement m in measurements)
                deviation += Math.Pow(m.Value - average, 2);

            return deviation / readNumber;
        }

        internal Measurement SimulateSensor()
        {
            bool ok = false; //variabile per la condizione
            do
            {
                double variance = (rnd.Next(0, 2) + rnd.NextDouble()) / 100;//calcolo della varianza per lo scostamento del valore delle misure

                if (rnd.Next(0, 2) == 0 && (LastMeasurements[0].Value - variance) > MinValue)/*controllo per verificare se il valore estratto è minore di 0
                                                                                         e se l'ultimo valore misurato, meno la varianza è maggiore del valore minimo
                                                                                          * che il sensore può leggere */
                {
                    LastMeasurements[0].Value -= variance;//assegno la variabile per diminuire il valore
                    ok = true;//assegno il valore per far ripetere il ciclo
                }
                else if ((LastMeasurements[0].Value + variance) < MaxValue)//se il valore misurato più la varianza è minore del massimo valore che il convertitore può leggere
                {
                    LastMeasurements[0].Value += variance;//assegno la variabile
                    ok = true;
                }
            } while (!ok);//ripete finche il ciclo è false

            return LastMeasurements[0]; //restituisce l'ultimo valore misurato
        }

        public override string ToString()
        {
            string misura = this.Name + "\r\n";
            foreach (Measurement m in LastMeasurements)
            { 
                misura += m.SampleTime.ToString("yyyy-MM-dd HH:mm:ss") + "\t" + m.Name + "\t"
                    + m.Value.ToString(m.DisplayFormat) + "\t" + Unit + "r\n";
            }
            return misura;
        }
    }
}
