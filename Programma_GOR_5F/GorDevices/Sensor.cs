using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gor
{
    public abstract class Sensor
    {
        // generatore di numeri random valido per ogni sensore
        internal Random rnd = new Random();

        // ultimo valore. Valido per ogni sensore
        public Measurement LastMeasurement = new Measurement(); 

        protected bool isCalibrating;
        protected Calibration_2Points calibration;

        public string CalibrationFileName { get; set; }

        public bool Simulation { get; private set; }

        public double AlarmMax { get; set; }

        public double AlarmMin { get; set; }

        public double MaxValue { get; set; }

        public double MinValue { get; set; }

        public Sensor(bool sim)
        {
            this.Simulation = sim;
        }

        internal Measurement PrimoValore()
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

        public abstract Measurement Measure();

        public abstract void Initialization();

        public virtual void StartCalibration()
        {
            if (!Simulation)
                isCalibrating = true;
        }

        public virtual void CalibrationPoint(double value)
        {
            if (!isCalibrating)
                throw new Exception("Impossibile effettuare la calibrazione: sensore in simulazione o calibrazione non iniziata.");

            calibration.AddPoint(double.Parse(Read()), value);
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

        internal Measurement simulaSensore()
        {
            bool ok = false;
            do
            {
                double varianza = (rnd.Next(0, 2) + rnd.NextDouble()) / 100;
                if (rnd.Next(0, 2) == 0 && (LastMeasurement.Value - varianza) > MinValue)
                {
                    LastMeasurement.Value -= varianza;
                    ok = true;
                }
                else if ((LastMeasurement.Value + varianza) < MaxValue)
                {
                    LastMeasurement.Value += varianza;
                    ok = true;
                }
            } while (!ok);
            return LastMeasurement; 
        }
        ////////protected void onAlarm(AlarmEventArgs e)
        ////////{
        ////////    if (Alarm != null)
        ////////        Alarm(this, e);
        ////////}

        ////////public event EventHandler<AlarmEventArgs> Alarm;
    }
}
