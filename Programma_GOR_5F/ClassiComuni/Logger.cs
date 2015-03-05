using System;
using System.Text;
using System.Threading.Tasks;

namespace Gor
{
    public static class Logger
    {
            public static void Log(string testo)
            {
                if (false)
                    Console.WriteLine(testo);
            }

            public static void Err(string testo)
            {
                if (true)
                    Console.WriteLine(testo);
            }

            internal static void Test(string testo)
            {
                if (true)
                    Console.WriteLine(testo);
            }
    }
}
