using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace AcquisitionDiagram
{
    /// <summary>
    /// Logica di interazione per MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        const int NUMERO_MISURE = 50;
        int nMisura = 0;
        List<Segment> graph = new List<Segment>();

        public MainWindow()
        {
            InitializeComponent();
            
        }

        //RelativeHumidity_HIH4000 sens = new RelativeHumidity_HIH4000();
        DispatcherTimer dt = new DispatcherTimer();

        private void dt_Tick(object sender, EventArgs e)
        {
            PixelConverter pc = new PixelConverter(cnvGraph.ActualHeight, 0, 50);
            Segment lastSeg = graph[graph.Count - 1];

            if (nMisura > NUMERO_MISURE * 0.9)
            {
                foreach (Segment s in graph)
                {
                    s.Transform(new TranslateTransform(-cnvGraph.ActualWidth / NUMERO_MISURE, 0));
                    s.Render(cnvGraph);
                }

                graph[0].Remove(cnvGraph);
                graph.RemoveAt(0);
            }

            //Segment seg = new Segment(
            //    lastSeg.DestinationX,
            //    lastSeg.DestinationY,
            //    lastSeg.DestinationX + cnvGraph.ActualWidth / NUMERO_MISURE,
            //    //pc.FromValueToPixelHeight(sens.Measure().Value),
            //    Color.FromRgb(255, 0, 0));

            //seg.Render(cnvGraph);
            //graph.Add(seg);

            nMisura++;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            dt.Interval = TimeSpan.FromMilliseconds(100);
            dt.Tick += dt_Tick;
            dt.Start();
            graph.Add(new Segment(0, 0, 0, 0));
        }
    }
}
