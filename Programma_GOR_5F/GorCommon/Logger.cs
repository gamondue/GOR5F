using System;
using System.IO;
using System.Text;
using System.Threading.Tasks;

namespace Gor
{
    public class Logger
    {
        private string commonPath = "./";
        private string eventLogFile = "logger.txt";
        private string dataLogFile = "logger.txt";
        private string errorFile = "logger.txt";
        private string debugFile = "logger.txt";
        private string promptsFile = "logger.txt";
         
        /// <summary>
        /// No parameters constructor, uses predefined fields 
        /// </summary>
        public Logger()
        {
            eventLogFile = commonPath + eventLogFile;
            dataLogFile = commonPath + dataLogFile;
            errorFile = commonPath + errorFile;
            debugFile = commonPath + debugFile;
            defaultProperties();
        }
        /// <summary>
        /// Constructor 
        /// </summary>
        /// <param name="CommonPath">Path added to all filenames</param>
        /// <param name="LogFile">[Path] & filename for common events)</param>
        /// <param name="ErrorFile">[Path] & filename for errors</param>
        /// <param name="TestFile">[Path] & filename for debugging</param>
        /// <param name="PromptsFile">[Path] & filename for console prompts</param>
        public Logger (string CommonPath, string EventLogFile, string ErrorFile, 
            string DebugFile, string PromptsFile, string DataLogFile)
        {
            commonPath = CommonPath;
            eventLogFile = commonPath + EventLogFile;
            errorFile = commonPath + ErrorFile;
            debugFile = commonPath + DebugFile;
            promptsFile = commonPath + PromptsFile;
            dataLogFile = commonPath + DataLogFile;
            defaultProperties();
        }
        /// <summary>
        /// Sets default properties, to be called by constructors
        /// </summary>
        private void defaultProperties()
        {
            LoggingEvents = true;
            ShowingEvents = false; 

            LoggingErrors = true;
            ShowingErrors = true;

            LoggingDebug = true; 
            ShowingDebug = true;

            LoggingPrompts = false;
        }

        /// <summary>
        /// Logs significative events
        /// </summary>
        /// <param name="testo"></param>
        public void EventLog(string testo)
        {
            if (LoggingEvents)
            {
                logInFile(eventLogFile, testo);
            }
            if (ShowingEvents)
            { 
                Console.WriteLine(testo); 
            }
        }

        public void DataLog(string testo)
        {
            if (LoggingData)
            {
                using (StreamWriter sw = File.AppendText(dataLogFile))
                {
                    sw.WriteLine(testo);
                    sw.Close();
                }
            }
            if (ShowingData)
            {
                Console.WriteLine(testo);
            }
        }

        /// <summary>
        /// Realizza il log degli errori
        /// </summary>
        /// <param name="testo"></param>
        public void Error(string testo)
        {
            if (LoggingErrors)
            {
                logInFile(errorFile, testo);
            }
            if (ShowingErrors)
            {
                Console.WriteLine(testo);
            }
        }
        /// <summary>
        /// debugging log
        /// </summary>
        /// <param name="testo">string to output</param>
        public void Debug(string testo)
        {
            if (LoggingDebug)
            {
                logInFile(debugFile, testo);
            }
            if (ShowingDebug)
            {
                Console.WriteLine(testo);
            }
        }

        public void Prompt(string testo)
        {
            Console.WriteLine(testo); 
            if (LoggingPrompts)
            {
                using (StreamWriter sw = File.AppendText(promptsFile))
                {
                    sw.WriteLine(testo);
                    sw.Close();
                }
            }
        }

        private void logInFile(string file,string testo)
        {
            using (StreamWriter sw = File.AppendText(file))
            {
                sw.WriteLine(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + " " + testo);
                sw.Close();
            }
        }

        public bool LoggingEvents { get; set; }

        public bool ShowingEvents { get; set; }

        public bool LoggingErrors { get; set; }

        public bool ShowingErrors { get; set; }

        public bool LoggingDebug { get; set; }

        public bool ShowingDebug { get; set; }
    
        public  bool LoggingPrompts { get; set; }
        public bool ShowingData { get; set; }

        public bool LoggingData { get; set; }
    }
}
