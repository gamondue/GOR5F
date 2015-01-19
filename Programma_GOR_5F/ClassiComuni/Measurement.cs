using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gor
{
    public class Measurement
    {
        public double Value { get; set; }
        public string Name { get; set; }
        public string Unit { get; set; }
        public string DisplayFormat { get; set; }
        public string ReadValue { get; set; }
        public DateTime Moment { get; set; }
        public int Error { get; set; }
        public string ErrorString { get; set; }

        public override string ToString()
        {
            return Value.ToString(DisplayFormat) + " " + Unit;
        }
    }
}
