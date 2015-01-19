using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace AcquisitionDiagram
{
    public class PixelConverter
    {
        public double _height;
        public double _maxValue;
        public double _minValue;

        public PixelConverter(double height, double min, double max)
        {
            _height = height;
            _minValue = min;
            _maxValue = max;
        }

        public double FromValueToPixelHeight(double value)
        {
            // height : (max - min) = (_height - x) : value
            double pix = _height - (value * _height) / (_maxValue - _minValue);

            return pix;
        }
    }
}
