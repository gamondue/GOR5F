using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gor
{
    public class Calibration_2Points
    {
        private double _x1;
        private double _x2;
        private double _y1;
        private double _y2;
        private bool _firstPoint;

        public Calibration_2Points()
        {
            _firstPoint = true;
        }

        public Calibration_2Points(string fileName)
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


        public void Save(string fileName)//Non sarebbe meglio statico?
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


        /// <summary>
        /// Load the calibration settings(x,y) from a file
        /// </summary>
        /// <param name="fileName">Path of the file with settings</param>
        /// <returns>Calibration_2Points</returns>
        static public Calibration_2Points Load(string fileName)
        {
            StreamReader sr = null;
            Calibration_2Points result = new Calibration_2Points();
            try
            {
                sr = new StreamReader(fileName);
                if (!double.TryParse(sr.ReadLine(), out result._x1))
                    throw new Exception();
                if (!double.TryParse(sr.ReadLine(), out result._y1))
                    throw new Exception();
                if (!double.TryParse(sr.ReadLine(), out result._x2))
                    throw new Exception();
                if (!double.TryParse(sr.ReadLine(), out result._y2))
                    throw new Exception();

            }
            catch(Exception ex)
            {
                throw new Exception("Impossibile leggere dal file.", ex);
            }
            finally
            {
                if (sr != null)
                    sr.Close();
            }

            return result;
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
