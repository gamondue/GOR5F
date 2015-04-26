using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Gor
{
    public static class Common
    {
        public const string ProgramPath = "/home/pi/gor/";      // path of program in Raspi
        public const string LogsPath = ProgramPath + "logs/";   // path of logs

        public const string CloseCommandFile = ProgramPath + "close.txt";
        public const string AcquireCommandFile = ProgramPath + "acquire.txt";
        public const string ConfigurationFile = ProgramPath + "configurazione.xml";

        public const string DatalogFile = LogsPath + "datalog.tsv";
        public const string SingleSampleFile = LogsPath + "single_sample.tsv";
        public const string NotesFile = LogsPath + "notes.txt";
        //public Logger logger = new Logger(LogsPath, "events.txt", "errors.txt", "debug.txt", "prompts.txt", "data.txt"); 
    }
}
