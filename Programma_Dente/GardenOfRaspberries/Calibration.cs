using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GardenOfRaspberries
{
    public class Calibration
    {
        private double _x1;
        private double _x2;
        private double _y1;
        private double _y2;
        private bool _firstPoint;

        public Calibration()
        {
            _firstPoint = true;
        }

        public Calibration(string fileName)
        {
            StreamReader sr = null;

            try
            {
                sr = new StreamReader(fileName);

                _x1 = double.Parse(sr.ReadLine());
                _y1 = double.Parse(sr.ReadLine());
                _x2 = double.Parse(sr.ReadLine());
                _y2 = double.Parse(sr.ReadLine());
            }
            catch (Exception ex)
            {
                throw new Exception("Impossibile leggere il file.", ex);
            }
            finally
            {
                if (sr != null)
                    sr.Close();
            }

            _firstPoint = true;
        }

        public void Save(string fileName)
        {
            StreamWriter sw = null;

            try
            {
                sw = new StreamWriter(fileName);

                sw.WriteLine(_x1);
                sw.WriteLine(_y1);
                sw.WriteLine(_x2);
                sw.WriteLine(_y2);
            }
            catch (Exception ex)
            {
                throw new Exception("Impossibile scrivere sul file.", ex);
            }
            finally
            {
                if (sw != null)
                    sw.Close();
            }
        }

        public void AddPoint(double x, double y)
        {
            if (_firstPoint)
            {
                _x1 = x;
                _y1 = y;
                _firstPoint = false;
            }
            else
            {
                _x2 = x;
                _y2 = y;
                _firstPoint = true;
            }
        }

        public double Calculate(double xValue)
        {
            return ((_x1 - xValue) * (_y1 - _y2) + _y1 * (_x2 - _x1)) / (_x2 - _x1);
        }
    }
}
