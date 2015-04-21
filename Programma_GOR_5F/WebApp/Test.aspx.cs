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
    protected void Page_Load(object sender, EventArgs e)
    {
        sensori = new List<Sensor>();
        sensori.Add(new Humidity_Air_HIH4000("HIH4000", false, null, 1, new Logger()));

        UpdateDataSource(lstSensori, sensori);
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
            Temperature_DS1822 T = new Temperature_DS1822("DS1822", true, txtIdCircuitoIntegratoTemp.Text, new Logger());
            T.CodiceGardenOfThings = txtIdDatabaseLux.Text;
            sensori.Add(T);
        }
        else if (rdbTerrainHumidity.Checked)
        {
            //Logger.Test("ConfigPage|btnAggiungi_click|Terrain_Humidity");
            Humidity_Terrain_YL69YL38 th = new Humidity_Terrain_YL69YL38("YL69-YL39", true, converter, int.Parse(txtCanaleTerrain.Text), new Logger());
            th.CodiceGardenOfThings = txtIdDatabaseTerrain.Text;
            sensori.Add(th);
        }
        else if (rdbHIH4000.Checked)
        {
            //Logger.Test("ConfigPage|btnAggiungi_click|Air_Humidity_HIH4000");
            Humidity_Air_HIH4000 ah = new Humidity_Air_HIH4000("HIH4000", true, converter, int.Parse(txtCanaleHIH.Text), new Logger());
            ah.CodiceGardenOfThings = txtIdDatabaseHIH.Text;
            sensori.Add(ah);
        }
        else if (rdbLux.Checked)
        {
            //Logger.Test("ConfigPage|btnAggiungi_click|Photo_Resistor");
            Light_PhotoResistor l = new Light_PhotoResistor("Light", true, converter, int.Parse(txtCanaleLux.Text), new Logger());
            l.CodiceGardenOfThings = txtIdDatabaseLux.Text;
            sensori.Add(l);
        }

        UpdateDataSource(lstSensori, sensori);
    }

    protected void btnSalva_Click(object sender, EventArgs e)
    {
        
    }

    /// <summary>
    /// Aggiorna il contenuto del GridView.
    /// </summary>
    /// <param name="grid">GridView.</param>
    /// <param name="source">Nuova sorgente dati.</param>
    protected void UpdateDataSource(ListBox table, IEnumerable<Sensor> source)
    {
        int channelCharLen = 40;
        int idCharLen = 20;

        string ch_id_pin = "";

        table.Items.Clear();

        table.Items.Add(string.Format("{0, -" + channelCharLen + "}|{1, -" + idCharLen + "}", "IdTermometro / Canale ADC / PinIoRaspi", " Id database"));

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

            table.Items.Add(string.Format("{0, -" + channelCharLen + "}| {1, -" + idCharLen + "}", ch_id_pin, s.CodiceGardenOfThings));
        }
    }
}