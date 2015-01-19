using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gor
{
    public abstract class Sensor
    {
        protected double voltage;
        protected bool isCalibrating;
        protected Calibration_2Points calibration;

        public string CalibrationFileName { get; set; }

        public Measurement LastMeasurement { get; internal set; }

        public bool Simulation { get; private set; }

        public double AlarmMax { get; set; }

        public double AlarmMin { get; set; }

        public double MaxValue { get; set; }

        public double MinValue { get; set; }

        public Sensor(bool sim)
        {
            this.Simulation = sim;
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

        ////////protected void onAlarm(AlarmEventArgs e)
        ////////{
        ////////    if (Alarm != null)
        ////////        Alarm(this, e);
        ////////}

        ////////public event EventHandler<AlarmEventArgs> Alarm;
    }
}
