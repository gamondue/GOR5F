using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace i2c
{
    public static class Extensions
    {
        public static string ToHexString<T>(this T number)
        {
            return string.Format("0x{0}", int.Parse(number.ToString()).ToString("X"));
        }
    }
}
