using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media;

namespace AcquisitionDiagram
{
    public abstract class Shape
    {
        public double OriginX { get; set; }
        public double OriginY { get; set; }
        public Color Color { get; set; }

        public Shape(double x, double y, Color c)
        {
            OriginX = x;
            OriginY = y;
            Color = c;
        }

        public abstract void Transform(Transform t);
    }
}
