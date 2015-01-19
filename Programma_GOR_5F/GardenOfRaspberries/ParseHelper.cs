using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;

namespace GardenOfRaspberries
{
    public static class ParseHelper
    {
        public static double DoubleParse(string s)
        {
            return double.Parse(s, CultureInfo.InvariantCulture.NumberFormat);
        }
    }
}
