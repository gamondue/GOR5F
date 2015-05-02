using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Gor
{
    public static class Common
    {
        // variable and objects common to all the programs of the Solution 
        
        // paths
        public static string ProgramPath;      // path of program 
        public static string LogsPath;         // path of logs

        public static string CloseCommandFile;
        public static string AcquireCommandFile;
        public static string ConfigurationFile;

        public static string DatalogFile;
        public static string SingleSampleFile;
        public static string NotesFile;
        public static bool sensorsSimulation; // true = program simulates sensors

        // a Logger object to be used throughout the project:        
        public static Logger logger;

        public static void InitializeCommonVariables()
        {
            OperatingSystem SystemInfo = Environment.OSVersion;
            if (SystemInfo.Platform == System.PlatformID.Unix)
            {
                ProgramPath = "/home/pi/gor/";      // path of program in Raspi
                LogsPath = ProgramPath + "logs/";   // path of logs in Raspi
                sensorsSimulation = false;
            } 
            else
            {
                ProgramPath = @"c:\home\pi\gor\";    // path of program in PC
                LogsPath = ProgramPath + @"logs\";   // path of logs in PC
                sensorsSimulation = true; 
            }
            
            CloseCommandFile = ProgramPath + "close.txt";
            AcquireCommandFile = ProgramPath + "acquire.txt";
            ConfigurationFile = ProgramPath + "configurazione.tsv";

            DatalogFile = LogsPath + "datalog.tsv";
            SingleSampleFile = LogsPath + "single_sample.tsv";
            NotesFile = LogsPath + "notes.txt";
                    
            logger = new Logger(LogsPath, false, "events.txt", "errors.txt", "debug.txt", "prompts.txt", "data.txt");
        }
    }
}
