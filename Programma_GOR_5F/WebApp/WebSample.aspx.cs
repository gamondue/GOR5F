using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gor; 
using Gor.Devices;
using System.Threading;
using System.IO;

public partial class WebSample : System.Web.UI.Page
{
    Logger logger = new Logger(Gor.Common.LogsPath, "events.txt", "errors.txt",
        "debug.txt", "prompts.txt", "data.txt");

    //Temperature_DS1822 T; 
    //Light_PhotoResistor L; 
    //Humidity_Air_HIH4000 RH; 

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //T = new Temperature_DS1822("Tcalibr", false, "28-0000062196f0", logger);
            //L = new Light_PhotoResistor("Temperature", false, new Adc_MCP3208(), 1, logger);
            //RH = new Humidity_Air_HIH4000("Air humidity", false, new Adc_MCP3208(), 1, logger);
        }
        //pagina.Text = T.Measure().ToString(); 
        using (FileStream svs = new FileStream(Gor.Common.AcquireCommandFile, FileMode.Create,
                FileAccess.Write, FileShare.Read))
        using (StreamWriter wr = new StreamWriter(svs))
        {
            wr.Write("1");
        }
        // attende 7s
        Thread.Sleep(7000);
        // legge il file del campionamento fatto
        using (FileStream svs = new FileStream(Gor.Common.SingleSampleFile, FileMode.Open,
            FileAccess.Read, FileShare.Read))
        using (StreamReader rd = new StreamReader(svs))
        {
            string s = rd.ReadToEnd();
            string[] righe = s.Split('\n');
            foreach (string riga in righe)
            {
                string[] campi = riga.Split('\t');

            }
            pagina.Text = s; 
        }
    }
}