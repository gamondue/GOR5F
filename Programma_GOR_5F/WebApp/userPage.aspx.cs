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
    // importante: LANCIARE il webserver xsp4 COME SUPERUSER! (sudo xsp4. 
    // Se xsp4 viene lanciato al boot da rc.local non serve sudo, perchè i programmi
    // di rc.local sono lanciati da root)

    Logger logger;
    Temperature_DS1822 T;
    Light_PhotoResistor L;
    Humidity_Air_HIH4000 RH;
    Humidity_Temperature_Air_DHT22 Trh;

    const string versione = "1.1.0"; 

    protected void Page_Load(object sender, EventArgs e)
    {
        // se si richiama la pagina da fuori NON è postback, per cui gli oggetti
        // vengono istanziati TUTTE le volte 
        // TODO fare una sessione e vedere se si riesce ad istanziare i sensori all'interno 
        //      della sessione una sola volta
        Gor.Common.InitializeCommonVariables();
        Logger logger = new Logger(Gor.Common.LogsPath, false, "events.txt", "errors.txt",
            "debug.txt", "prompts.txt", "data.txt");
        //Logger logger = new Logger(Gor.Common.LogsPath, false, "tutto.txt", "tutto.txt",
        //    "tutto.txt", "tutto.txt", "data.txt");

        Page.EnableViewState = false;
        visualizzazione.EnableViewState = false;
        contenutoStandard.EnableViewState = false;
        logger.Debug("Gor v." + versione); // i file di log si trovano in /home/pi/gor/logs

        // inizializzazione dei sensori
        Trh = new Humidity_Temperature_Air_DHT22("DHT22_Umidita-Temperatura-aria", false, 11, logger);
        logger.Debug("DHT22-inizializzato");
        //T = new Temperature_DS1822("Sonda temperatura", false, "28-0000062196f0", logger);
        T = new Temperature_DS1822("DS1822_Temperatura-sonda", false, logger);
        logger.Debug("DS1822-inizializzato");
        L = new Light_PhotoResistor("Fotoresistore_Luminosità", false, new Adc_MCP3208(), 1, logger);
        logger.Debug("Photoresistor-inizializzato");
        RH = new Humidity_Air_HIH4000("HIH4000_Umidità-aria", false, new Adc_MCP3208(), 1, logger);
        logger.Debug("HIH4000-inizializzato");
      
        // acquisizione dati
        // HTML per visualizzazione su pagina Web:
        string vis = "Versione " + versione + "<br/>\n"; 
        // "xml Serri" per scambio dati con programma "Collector": 
        string standard = "<cen>Raspberry</cen><br/>\n<ver>" + versione +"</ver><br/>\n"; 

        T.Measure(); 
        vis += T.LastMeasurements[0].ToString() + "<br/>";

        L.Measure();
        vis += L.LastMeasurements[0].ToString() + "<br/>";
        standard += "<lum>" + L.LastMeasurements[0].Value.ToString() + "</lum>\n";

        RH.Measure().ToString();
        vis += RH.LastMeasurements[0].ToString() + "<br/>"; 

        Trh.Measure().ToString(); 
        vis += Trh.LastMeasurements[0].ToString() + "<br/>"; 
        standard += "<tem>" + Trh.LastMeasurements[0].Value.ToString() + "</tem>\n";

        vis += Trh.LastMeasurements[1].ToString() + "<br/>";
        standard += "<umi>" + Trh.LastMeasurements[1].Value.ToString() + "</umi>\n";

        standard += "\n";
        visualizzazione.Text = vis;
        contenutoStandard.Text = standard;
    }
}