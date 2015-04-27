using System;
using System.Collections.Generic;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace Gor
{
    [DataContract(Name="Sensor", Namespace="giardinoitt.altervista.org")]
    public abstract class Sensor
    {
        // generatore di numeri random valido per ogni sensore
        internal Random rnd = new Random();

        protected bool firstValue;
        protected double voltage;
        protected bool isCalibrating;
        protected Calibration_2Points calibration;

        [DataMember(Name="CalibrationFileName")]
        public string CalibrationFileName { get; set; }

        public string Name { get; set; }

        [DataMember(Name = "Simulation")]
        public bool Simulation { get; private set; }

        [DataMember(Name = "AlarmMax")]
        public double AlarmMax { get; set; }

        [DataMember(Name = "AlarmMin")]
        public double AlarmMin { get; set; }

        [DataMember(Name = "MaxValue")]
        public double MaxValue { get; set; }

        [DataMember(Name = "MinValue")]
        public double MinValue { get; set; }

        [DataMember(Name = "CodiceGardenOfThings")]
        public string GotCode { get; set; }
        public string Unit { get; set; }

        // ultimo valore. Valido per ogni sensore
        [DataMember(Name = "LastMeasurement")]
        public Measurement LastMeasurement { get; set; }


        public Logger logger; 

        public Sensor(string Name, bool Simulation, Logger Logger)
        {
            this.Name = Name; 
            this.Simulation = Simulation;
            this.logger = Logger;
        }

        internal Measurement SetFirstValue()
        {
            // trova casualmente la prima misura, utile per la simulazione
            do
            {
                LastMeasurement.Value = (rnd.Next(0, 4) + rnd.NextDouble());

            } while (LastMeasurement.Value > MaxValue || LastMeasurement.Value < MinValue);
            
            return LastMeasurement; 
        }

        public abstract string Read();

        public abstract int ReadInt();
        /// <summary>
        /// N.B. Measure has to set LastMeasurement before exiting
        /// </summary>
        /// <returns></returns>
        public abstract Measurement Measure();

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
            Measurement[] measurements = new Measurement[readNumber];
            double average = 0;
            double deviation = 0;

            for (int i = 0; i < measurements.Length; i++)
            {
                measurements[i] = Measure();
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

                if (rnd.Next(0, 2) == 0 && (LastMeasurement.Value - variance) > MinValue)/*controllo per verificare se il valore estratto è minore di 0
                                                                                         e se l'ultimo valore misurato, meno la varianza è maggiore del valore minimo
                                                                                          * che il sensore può leggere */
                {
                    LastMeasurement.Value -= variance;//assegno la variabile per diminuire il valore
                    ok = true;//assegno il valore per far ripetere il ciclo
                }
                else if ((LastMeasurement.Value + variance) < MaxValue)//se il valore misurato più la varianza è minore del massimo valore che il convertitore può leggere
                {
                    LastMeasurement.Value += variance;//assegno la variabile
                    ok = true;
                }
            } while (!ok);//ripete finche il ciclo è false

            return LastMeasurement; //restituisce l'ultimo valore misurato
        }
    }
}
