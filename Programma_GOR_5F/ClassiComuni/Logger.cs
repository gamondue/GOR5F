using System;
using System.IO;
using System.Text;
using System.Threading.Tasks;

namespace Gor
{
    public static class Logger
    {
        const string pathLog = "/home/pi/gor/logs/";
        
        /// <summary>
        /// Realizza il log degli eventi significati
        /// </summary>
        /// <param name="testo"></param>
        public static void Log(string testo)
        {
            if (false)
            { 
                Console.WriteLine(testo); 
                logInFile("log.txt", testo);
            }
        }

        /// <summary>
        /// Realizza il log degli errori
        /// </summary>
        /// <param name="testo"></param>
        public static void Err(string testo)
        {
            if (false)
            {
                Console.WriteLine(testo);
                logInFile("err.txt", testo);
            }
        }
        /// <summary>
            /// Realizza il log di debugging
        /// </summary>
    /// <param name="testo"></param>
        public static void Test(string testo)
        {
            if (false)
            {
                Console.WriteLine(testo);
                logInFile("test.txt", testo);
            }
        }

        private static void logInFile(string file,string testo)
        {
            using (StreamWriter sw = File.AppendText(pathLog + file))
            {
                sw.WriteLine(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " " + testo);
                sw.Close();
            }
        }
    }
}
