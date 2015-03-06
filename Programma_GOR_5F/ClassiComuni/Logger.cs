using System;
using System.Text;
using System.Threading.Tasks;

namespace Gor
{
    public static class Logger
    {
 /// <summary>
 /// Realizza il log degli eventi significati
 /// </summary>
 /// <param name="testo"></param>
        public static void Log(string testo)
        {

            if (false)
                Console.WriteLine(testo);
        }

        /// <summary>
        /// Realizza il logo degli errori
        /// </summary>
        /// <param name="testo"></param>
        public static void Err(string testo)
        {
            if (false)
                Console.WriteLine(testo);
        }
        /// <summary>
            /// Realizza il log di debugging
        /// </summary>
    /// <param name="testo"></param>
        internal static void Test(string testo)
        {
            if (false)
                Console.WriteLine(testo);
        }
    }
}
