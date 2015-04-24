using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gor.Devices;
using Gor;
using System.Xml;
using System.Runtime.Serialization;
using System.Xml.Serialization;

public partial class Test : System.Web.UI.Page
{
    List<Sensor> sensori;
    Logger logger = new Logger();

    protected void Page_Load(object sender, EventArgs e)
    {
        logger.LoggingData = false;
        logger.LoggingDebug = false;
        logger.LoggingErrors = false;
        logger.LoggingEvents = false;
        logger.LoggingPrompts = false;
        sensori = new List<Sensor>();
        sensori.Add(new Humidity_Air_HIH4000("HIH4000", false, null, 1, logger));

        UpdateDataSource(lstCanali, lstIDSensori, sensori);
    }

    protected void btnEliminaSensore_Click(object sender, EventArgs e)
    {
        //int index = grdSensori.SelectedIndex;

        //if (index != -1)
        //{
        //    sensori.RemoveAt(index);
        //    //Logger.Test("ConfigPage|btnEliminaSensore_Click|0");
        //}

        //UpdateDataSource(grdSensori, sensori);
    }

    protected void btnAggiungi_Click(object sender, EventArgs e)
    {
        Adc_MCP3208 converter = null;

        if (rdbTemperature.Checked && txtIdCircuitoIntegratoTemp.Text != "")
        {
            //Logger.Test("ConfigPage|btnAggiungi_click|Temperature");
            Temperature_DS1822 T = new Temperature_DS1822("DS1822", true, txtIdCircuitoIntegratoTemp.Text, logger);
            T.CodiceGardenOfThings = txtIdDatabaseLux.Text;
            sensori.Add(T);
        }
        else if (rdbTerrainHumidity.Checked)
        {
            //Logger.Test("ConfigPage|btnAggiungi_click|Terrain_Humidity");
            Humidity_Terrain_YL69YL38 th = new Humidity_Terrain_YL69YL38("YL69-YL39", true, converter, int.Parse(txtCanaleTerrain.Text), logger);
            th.CodiceGardenOfThings = txtIdDatabaseTerrain.Text;
            sensori.Add(th);
        }
        else if (rdbHIH4000.Checked)
        {
            //Logger.Test("ConfigPage|btnAggiungi_click|Air_Humidity_HIH4000");
            Humidity_Air_HIH4000 ah = new Humidity_Air_HIH4000("HIH4000", true, converter, int.Parse(txtCanaleHIH.Text), logger);
            ah.CodiceGardenOfThings = txtIdDatabaseHIH.Text;
            sensori.Add(ah);
        }
        else if (rdbLux.Checked)
        {
            //Logger.Test("ConfigPage|btnAggiungi_click|Photo_Resistor");
            Light_PhotoResistor l = new Light_PhotoResistor("Light", true, converter, int.Parse(txtCanaleLux.Text), logger);
            l.CodiceGardenOfThings = txtIdDatabaseLux.Text;
            sensori.Add(l);
        }

        UpdateDataSource(lstCanali, lstIDSensori, sensori);
    }

    protected void btnSalva_Click(object sender, EventArgs e)
    {
        
    }

    /// <summary>
    /// Aggiorna il contenuto del GridView.
    /// </summary>
    /// <param name="grid">GridView.</param>
    /// <param name="source">Nuova sorgente dati.</param>
    protected void UpdateDataSource(ListBox lstChannel, ListBox lstID, IEnumerable<Sensor> source)
    {
        string ch_id_pin = "";

        lstChannel.Items.Clear();
        lstID.Items.Clear();

        foreach (Sensor s in source)
        {
            if (s is Temperature_DS1822)
                ch_id_pin = (s as Temperature_DS1822).IdSensor;
            //else if (s is Humidity_Air_DHT22)
            //    ch_id_pin = (s as Humidity_Air_DHT22).DataIoPin.ToString();
            else if (s is Humidity_Air_HIH4000)
                ch_id_pin = (s as Humidity_Air_HIH4000).Channel.ToString();
            else if (s is Humidity_Terrain_YL69YL38)
                ch_id_pin = (s as Humidity_Terrain_YL69YL38).Channel.ToString();
            else if (s is Light_PhotoResistor)
                ch_id_pin = (s as Light_PhotoResistor).Channel.ToString();

            lstChannel.Items.Add(ch_id_pin);
            lstID.Items.Add(s.CodiceGardenOfThings);
        }
    }
}