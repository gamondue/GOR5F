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
    //Logger logger = new Logger(Gor.Common.LogsPath, "events.txt", "errors.txt",
    //    "debug.txt", "prompts.txt", "data.txt");

    //Temperature_DS1822 T; 
    //Light_PhotoResistor L; 
    //Humidity_Air_HIH4000 RH; 

    protected void Page_Load(object sender, EventArgs e)
    {
        Page.EnableViewState = false; 
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
        using (
            FileStream svs = new FileStream(Gor.Common.SingleSampleFile, FileMode.Open,
            FileAccess.Read, FileShare.Read))
        using (StreamReader rd = new StreamReader(svs))
        {
            string s = rd.ReadToEnd();
            string vis = "Versione 1.0<br/>\n";
            string standard = "<cen>Raspberry</cen><br/>\n<ver>1.0</ver><br/>\n"; 
            string[] righe = s.Replace("\r","").Split('\n');
            int i=0;
            foreach (string riga in righe)
            {
                
                i++;

                string[] campi = riga.Split('\t');
                if (campi.GetLength(0) == 4)
                {
                    vis += riga + "<br/>";
                    //standard += "<" + campi[1] + ">   " + campi[2] + "</" + campi[1] + ">\n";  
                    switch(i){
                        case 1:break;
                        case 2:
                            {
                                standard += "<lum>   " + campi[2] + "</lum>\n";
                                break;
                            }
                        case 3:
                            {
                                standard += "<tem>   " + campi[2] + "</tem>\n";
                                break;
                            }
                        case 4:
                            {
                                standard += "<umi>   " + campi[2] + "</umi>\n";
                                break;
                            }
                        default:
                            break;
                    }
                        
                }
            }
            standard += "\n";
            visualizzazione.Text = vis;
            contenutoStandard.Text = standard;
        }
    }
}