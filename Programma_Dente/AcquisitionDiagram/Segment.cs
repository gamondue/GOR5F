using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Shapes;

namespace AcquisitionDiagram
{
    public class Segment : Shape, IRender
    {
        private Line line;

        public double DestinationX { get; set; }
        public double DestinationY { get; set; }

        public Segment()
            : this(0, 0, 0, 0)
        {

        }

        public Segment(double x1, double y1, double x2, double y2)
            : this(x1, y1, x2, y2, Color.FromArgb(0,0,0,0))
        {

        }

        public Segment(double x1, double y1, double x2, double y2, Color c)
            : base(x1, y1, c)
        {
            DestinationX = x2;
            DestinationY = y2;
        }

        public override void Transform(Transform t)
        {
            Point p = t.Transform(new Point(OriginX, OriginY));
            OriginX = p.X;
            OriginY = p.Y;

            p = t.Transform(new Point(DestinationX, DestinationY));
            DestinationX = p.X;
            DestinationY = p.Y;
        }
    
        public void Render(Canvas destination)
        {
            Remove(destination);

            line = new Line();
            line.Stroke = new SolidColorBrush(Color);

            line.SetValue(RenderOptions.EdgeModeProperty, EdgeMode.Aliased);

            line.X1 = OriginX;
            line.Y1 = OriginY;
            line.X2 = DestinationX;
            line.Y2 = DestinationY;

            destination.Children.Add(line);
        }

        internal void Remove(Canvas destination)
        {
            if (destination.Children.Contains(line))
                destination.Children.Remove(line);
        }
    }
}
