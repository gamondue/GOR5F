/*
 * Babbi
 * Targhini
 * 5°F
 * Progetto Garden of Raspberries
 * 13-02-15
 * QUASI TERMINATO
 */ 
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

public partial class ConfigPage : System.Web.UI.Page
{
    List<Sensor> sensori;

    string pathProgramma ="/home/pi/gor/";
    Logger logger;

    protected void Page_Load(object sender, EventArgs e)
    {
        sensori = new List<Sensor>();

        logger = new Logger(pathProgramma + "logs/", "events.txt", "errors.txt", 
            "debug.txt", "prompts.txt", "data.txt");

        try
        {
            //logger.Debug("ConfigPage|btnSalva_Click|-10");

            // Deserializzazione dal file di configurazione.
            using (FileStream fs = new FileStream(pathProgramma + "configurazione.xml", FileMode.OpenOrCreate, FileAccess.Read, FileShare.None))
            using (XmlReader xmlr = XmlReader.Create(fs))
            {
                //logger.Debug("ConfigPage|btnSalva_Click|0");
                DataContractSerializer dcs = new DataContractSerializer(typeof(List<Sensor>));
                sensori = (List<Sensor>)dcs.ReadObject(xmlr);
            }

            UpdateDataSource(lstCanali, lstIDSensori, sensori);
        }
        catch (Exception ex)
        {
            this.Alert("Errore nel caricamento dei sensori" + ex.Message);
            //Logger.Err("ConfigPage|btnSalva_Click " + ex.Message);
        }
    }

    protected void btnEliminaSensore_Click(object sender, EventArgs e)
    {
        
    }

    protected void btnAggiungi_Click(object sender, EventArgs e)
    {
        Adc_MCP3208 converter = new Adc_MCP3208();

        if (rdbTemperature.Checked && txtIdCircuitoIntegratoTemp.Text != "")
        {
            //logger.Test("ConfigPage|btnAggiungi_click|Temperature");
            Temperature_DS1822 T = new Temperature_DS1822("Tcalibr", chkInSim.Checked,
                txtIdCircuitoIntegratoTemp.Text, logger);
            T.CodiceGardenOfThings = txtIdDatabaseLux.Text;
            sensori.Add(T);
        }
        else if (rdbTerrainHumidity.Checked)
        {
            //logger.Test("ConfigPage|btnAggiungi_click|Terrain_Humidity");
            Humidity_Terrain_YL69YL38 th = new Humidity_Terrain_YL69YL38("Humidity", 
                chkInSim.Checked, converter, int.Parse(txtCanaleTerrain.Text), logger);
            th.CodiceGardenOfThings = txtIdDatabaseTerrain.Text;
            sensori.Add(th);
        }
        else if (rdbHIH4000.Checked)
        {
            //logger.Test("ConfigPage|btnAggiungi_click|Air_Humidity_HIH4000");
            Humidity_Air_HIH4000 ah = new Humidity_Air_HIH4000("Humidity", chkInSim.Checked, converter, int.Parse(txtCanaleHIH.Text), logger);
            ah.CodiceGardenOfThings = txtIdDatabaseHIH.Text;
            sensori.Add(ah);
        }
        else if (rdbLux.Checked)
        {
            //logger.Debug("ConfigPage|btnAggiungi_click|Photo_Resistor");
            Light_PhotoResistor l = new Light_PhotoResistor("Light", chkInSim.Checked, converter, int.Parse(txtCanaleLux.Text), logger);
            l.CodiceGardenOfThings = txtIdDatabaseLux.Text;
            sensori.Add(l);
        }
        else if (rdbDHT22.Checked)
        {
            //logger.Debug("ConfigPage|btnAggiungi_click|Air_Humidity_DHT22");
            Humidity_Temperature_Air_DHT22 dht = new Humidity_Temperature_Air_DHT22("Humidity_Temperature", 
                chkInSim.Checked, int.Parse(txtPinDht.Text), logger);
            foreach (Sensor s in dht.Sensors)
                sensori.Add(s);
        }

        UpdateDataSource(lstCanali, lstIDSensori, sensori);
    }

    protected void btnSalva_Click(object sender, EventArgs e)
    {
        try
        {
            //logger.Debug("ConfigPage|btnSalva_Click|-10");

            // Serializzazione nel file di configurazione.
            using (FileStream fs = new FileStream(pathProgramma + "configurazione.xml", FileMode.OpenOrCreate, FileAccess.Write, FileShare.None))
            using (XmlWriter xmlw = XmlWriter.Create(fs))
            {
                //logger.Debug("ConfigPage|btnSalva_Click|0");
                DataContractSerializer dcs = new DataContractSerializer(typeof(List<Sensor>));
                dcs.WriteObject(xmlw, sensori);
            }

            ////logger.Debug("ConfigPage|btnSalva_Click|0");

            //XmlSerializer xsSubmit = new XmlSerializer(typeof(List<Sensor>));
            ////logger.Debug("ConfigPage|btnSalva_Click|10");
            //StringWriter sww = new StringWriter();
            ////logger.Debug("ConfigPage|btnSalva_Click|20");
            //XmlWriter writer = XmlWriter.Create(sww);
 
            //xsSubmit.Serialize(writer, sensori);
            ////logger.Debug("ConfigPage|btnSalva_Click|40");
            //var xml = sww.ToString(); // questo è xml testuale
            ////logger.Debug("ConfigPage|btnSalva_Click|50");
            ////logger.Debug(xml);
            //using (StreamWriter sw = File.AppendText(pathProgramma + "configurazione.xml"))
            //{
            //    sw.Write(xml);
            //    sw.Close();
            //}
        }
        catch(Exception ex)
        {
            this.Alert("Errore nel salvataggio dei sensori" + ex.Message);
            //Logger.Err("ConfigPage|btnSalva_Click " + ex.Message); 
        }
    }

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
    protected void lstIDSensori_SelectedIndexChanged(object sender, EventArgs e)
    {
        lstCanali.SelectedIndex = lstIDSensori.SelectedIndex;
    }
    protected void lstCanali_SelectedIndexChanged(object sender, EventArgs e)
    {
        lstIDSensori.SelectedIndex = lstCanali.SelectedIndex;
    }
}