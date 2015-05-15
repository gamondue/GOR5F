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
using System.Data;

public partial class ConfigPage : System.Web.UI.Page
{
    string pathProgramma = /*"/home/pi/Server5F/Lucchi/";//*/"C:/Users/FRANCESCO.DENTE/Desktop/";
    List<Sensor> sensori;
    DataTable dt;
    Adc_MCP3208 converter;
    Logger logger;

    protected void Page_Load(object sender, EventArgs e)
    {
        logger = new Logger();
        logger.LoggingData = false;
        logger.LoggingDebug = false;
        logger.LoggingErrors = false;
        logger.LoggingEvents = false;
        logger.LoggingPrompts = false;

        converter = null;

        if (!IsPostBack)
        {
            sensori = new List<Sensor>();
            dt = new DataTable();


            dt.Columns.Add("GrandezzaFisica");
            dt.Columns.Add("InSimulazione");
            dt.Columns.Add("Dato");
            dt.Columns.Add("IdDatabase");
            ViewState["Tabella"] = dt;
        }
        else
        {
            try
            {
                sensori = new List<Sensor>();

                StreamReader sr = new StreamReader(pathProgramma + "configuration.tsv");
                while (sr.Peek() >= 0)
                {
                    string[] dati = sr.ReadLine().Split('\t');
                    switch (dati[0])
                    {
                        case "Temperature_DS1822":
                            sensori.Add(new Temperature_DS1822(dati[1], bool.Parse(dati[4]), dati[2], logger));
                            sensori[sensori.Count - 1].CodiceGardenOfThings = dati[3];
                            break;
                        case "Humidity_Air_HIH4000":
                            sensori.Add(new Humidity_Air_HIH4000(dati[1], bool.Parse(dati[4]), converter, int.Parse(dati[2]), logger));
                            sensori[sensori.Count - 1].CodiceGardenOfThings = dati[3];
                            break;
                        case "Light_PhotoResistor":
                            sensori.Add(new Light_PhotoResistor(dati[1], bool.Parse(dati[4]), converter, int.Parse(dati[2]), logger));
                            sensori[sensori.Count - 1].CodiceGardenOfThings = dati[3];
                            break;
                        case "Humidity_Terrain_YL69YL38":
                            sensori.Add(new Humidity_Terrain_YL69YL38(dati[1], bool.Parse(dati[4]), converter, int.Parse(dati[2]), logger));
                            sensori[sensori.Count - 1].CodiceGardenOfThings = dati[3];
                            break;
                    }
                }

                sr.Close();

            }
            catch (Exception ex)
            {
                this.Alert("Errore nel caricamento dei sensori" + ex.Message);
                //Logger.Err("ConfigPage|btnSalva_Click " + ex.Message);
            }
        }
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

    protected void btnAggiungi_Click1(object sender, EventArgs e)
    {
        Adc_MCP3208 converter = new Adc_MCP3208();

        if (rdbTemperature.Checked && txtIdCircuitoIntegratoTemp.Text != "")
        {
            //Logger.Test("ConfigPage|btnAggiungi_click|Temperature");
            Temperature_DS1822 T = new Temperature_DS1822("Temperatura aria", chkInSim.Checked, txtIdCircuitoIntegratoTemp.Text, logger);
            T.CodiceGardenOfThings = txtIdDatabaseLux.Text;
            sensori.Add(T);
        }
        else if (rdbTerrainHumidity.Checked)
        {
            //Logger.Test("ConfigPage|btnAggiungi_click|Terrain_Humidity");
            Humidity_Terrain_YL69YL38 th = new Humidity_Terrain_YL69YL38("Umidità terreno", chkInSim.Checked, converter, int.Parse(txtCanaleTerrain.Text), logger);
            th.CodiceGardenOfThings = txtIdDatabaseTerrain.Text;
            sensori.Add(th);
        }
        else if (rdbHIH4000.Checked)
        {
            //Logger.Test("ConfigPage|btnAggiungi_click|Air_Humidity_HIH4000");
            Humidity_Air_HIH4000 ah = new Humidity_Air_HIH4000("Umidità aria", chkInSim.Checked, converter, int.Parse(txtCanaleHIH.Text), logger);
            ah.CodiceGardenOfThings = txtIdDatabaseHIH.Text;
            sensori.Add(ah);
        }
        else if (rdbLux.Checked)
        {
            //Logger.Test("ConfigPage|btnAggiungi_click|Photo_Resistor");
            Light_PhotoResistor l = new Light_PhotoResistor("Illuminazione", chkInSim.Checked, converter, int.Parse(txtCanaleLux.Text), logger);
            l.CodiceGardenOfThings = txtIdDatabaseLux.Text;
            sensori.Add(l);
        }

        //UpdateDataSource(Table1, sensori);
    }

    protected void btnSalva_Click(object sender, EventArgs e)
    {
        try
        {
            #region commenti
            /*//Logger.Test("ConfigPage|btnSalva_Click|-10");

            // Serializzazione nel file di configurazione.
            using (FileStream fs = new FileStream(pathProgramma + "configurazione.xml", FileMode.OpenOrCreate, FileAccess.Write, FileShare.None))
            using (XmlWriter xmlw = XmlWriter.Create(fs))
            {
                //Logger.Test("ConfigPage|btnSalva_Click|0");
                DataContractSerializer dcs = new DataContractSerializer(typeof(List<Sensor>));
                dcs.WriteObject(xmlw, sensori);
            }

            ////Logger.Test("ConfigPage|btnSalva_Click|0");

            //XmlSerializer xsSubmit = new XmlSerializer(typeof(List<Sensor>));
            ////Logger.Test("ConfigPage|btnSalva_Click|10");
            //StringWriter sww = new StringWriter();
            ////Logger.Test("ConfigPage|btnSalva_Click|20");
            //XmlWriter writer = XmlWriter.Create(sww);
 
            //xsSubmit.Serialize(writer, sensori);
            ////Logger.Test("ConfigPage|btnSalva_Click|40");
            //var xml = sww.ToString(); // questo è xml testuale
            ////Logger.Test("ConfigPage|btnSalva_Click|50");
            ////Logger.Test(xml);
            //using (StreamWriter sw = File.AppendText(pathProgramma + "configurazione.xml"))
            //{
            //    sw.Write(xml);
            //    sw.Close();
            //}*/
            #endregion
            
            Response.Redirect("Runtime.aspx");
        }
        catch (Exception ex)
        {
            this.Alert("Errore nel salvataggio dei sensori" + ex.Message);
            //Logger.Err("ConfigPage|btnSalva_Click " + ex.Message); 
        }
    }

    /// <summary>
    /// Aggiorna il contenuto del GridView.
    /// </summary>
    /// <param name="grid">GridView.</param>
    /// <param name="source">Nuova sorgente dati.</param>
    protected void UpdateDataSource(Table table, IEnumerable<Sensor> source)
    {
        table.Rows.Clear();

        foreach (Sensor s in source)
        {
            TableRow row = new TableRow();
            TableCell cell1 = new TableCell();
            cell1.Text = s.CodiceGardenOfThings;
            row.Cells.Add(cell1);
        }

    }
    protected void btnAggiungi_Click(object sender, EventArgs e)
    {
        if (rdbTemperature.Checked && txtIdCircuitoIntegratoTemp.Text != "" && txtIdDatabaseTemp.Text != "")
        {
            sensori.Add(new Temperature_DS1822("Temperatura aria", chkInSim.Checked, txtIdCircuitoIntegratoTemp.Text, logger));
            sensori[sensori.Count - 1].CodiceGardenOfThings = txtIdDatabaseTemp.Text;

            DataRow dr = dt.NewRow();
            dt.Rows.Add(dr);

            grdSensori.DataSource = dt;
            grdSensori.DataBind();

            grdSensori.Rows[grdSensori.Rows.Count - 1].Cells[0].Text = "Temperatura";
            grdSensori.Rows[grdSensori.Rows.Count - 1].Cells[1].Text = chkInSim.Checked.ToString();
            grdSensori.Rows[grdSensori.Rows.Count - 1].Cells[2].Text = txtIdCircuitoIntegratoTemp.Text;
            grdSensori.Rows[grdSensori.Rows.Count - 1].Cells[3].Text = txtIdDatabaseTemp.Text;

            AggiornaFile();

        }
        else if (rdbHIH4000.Checked && txtCanaleHIH.Text != "" && txtIdDatabaseHIH.Text != "")
        {
            sensori.Add(new Humidity_Air_HIH4000("Umidità aria", chkInSim.Checked, converter, int.Parse(txtCanaleHIH.Text), logger));
            sensori[sensori.Count - 1].CodiceGardenOfThings = txtIdDatabaseHIH.Text;

            DataRow dr = dt.NewRow();
            dt.Rows.Add(dr);

            grdSensori.DataSource = dt;
            grdSensori.DataBind();

            grdSensori.Rows[grdSensori.Rows.Count - 1].Cells[0].Text = "Umidità aria HIH";
            grdSensori.Rows[grdSensori.Rows.Count - 1].Cells[1].Text = chkInSim.Checked.ToString();
            grdSensori.Rows[grdSensori.Rows.Count - 1].Cells[2].Text = txtCanaleHIH.Text;
            grdSensori.Rows[grdSensori.Rows.Count - 1].Cells[3].Text = txtIdDatabaseHIH.Text;

            AggiornaFile();
        }
        else if (rdbLux.Checked && txtCanaleLux.Text != "" && txtIdDatabaseLux.Text != "")
        {
            sensori.Add(new Light_PhotoResistor("Illuminazione", chkInSim.Checked, converter, int.Parse(txtCanaleLux.Text), logger));
            sensori[sensori.Count - 1].CodiceGardenOfThings = txtIdDatabaseLux.Text;

            DataRow dr = dt.NewRow();
            dt.Rows.Add(dr);

            grdSensori.DataSource = dt;
            grdSensori.DataBind();

            grdSensori.Rows[grdSensori.Rows.Count - 1].Cells[0].Text = "Luminosità";
            grdSensori.Rows[grdSensori.Rows.Count - 1].Cells[1].Text = chkInSim.Checked.ToString();
            grdSensori.Rows[grdSensori.Rows.Count - 1].Cells[2].Text = txtCanaleLux.Text;
            grdSensori.Rows[grdSensori.Rows.Count - 1].Cells[3].Text = txtIdDatabaseLux.Text;

            AggiornaFile();
        }
        else if (rdbTerrainHumidity.Checked && txtCanaleTerrain.Text != "" && txtIdDatabaseTerrain.Text != "")
        {
            sensori.Add(new Humidity_Terrain_YL69YL38("Umidità terreno", chkInSim.Checked, converter, int.Parse(txtCanaleTerrain.Text), logger));
            sensori[sensori.Count - 1].CodiceGardenOfThings = txtIdDatabaseTerrain.Text;

            DataRow dr = dt.NewRow();
            dt.Rows.Add(dr);

            grdSensori.DataSource = dt;
            grdSensori.DataBind();

            grdSensori.Rows[grdSensori.Rows.Count - 1].Cells[0].Text = "Umidità terreno";
            grdSensori.Rows[grdSensori.Rows.Count - 1].Cells[1].Text = chkInSim.Checked.ToString();
            grdSensori.Rows[grdSensori.Rows.Count - 1].Cells[2].Text = txtCanaleTerrain.Text;
            grdSensori.Rows[grdSensori.Rows.Count - 1].Cells[3].Text = txtIdDatabaseTerrain.Text;

            AggiornaFile();
        }
    }

    private void AggiornaFile()
    {
        StreamWriter sw = new StreamWriter(pathProgramma + "configuration.tsv");

        foreach (Sensor s in sensori)
        {
            if (s.GetType() == typeof(Temperature_DS1822))
                sw.WriteLine("Temperature_DS1822\tTemperatura aria\t" + ((Temperature_DS1822)s).IdSensor + "\t" + ((Temperature_DS1822)s).CodiceGardenOfThings + "\t" + ((Temperature_DS1822)s).Simulation + "\t" + ((Temperature_DS1822)s).AlarmMax + "\t" + ((Temperature_DS1822)s).AlarmMin + "\t" + ((Temperature_DS1822)s).MaxValue + "\t" + ((Temperature_DS1822)s).MinValue + "\t[°C]");
            else if (s.GetType() == typeof(Humidity_Air_HIH4000))
                sw.WriteLine("Humidity_Air_HIH4000\tUmidità aria\t" + ((Humidity_Air_HIH4000)s).Channel + "\t" + ((Humidity_Air_HIH4000)s).CodiceGardenOfThings + "\t" + ((Humidity_Air_HIH4000)s).Simulation + "\t" + ((Humidity_Air_HIH4000)s).AlarmMax + "\t" + ((Humidity_Air_HIH4000)s).AlarmMin + "\t" + ((Humidity_Air_HIH4000)s).MaxValue + "\t" + ((Humidity_Air_HIH4000)s).MinValue + "\t[Rh%]");
            else if (s.GetType() == typeof(Light_PhotoResistor))
                sw.WriteLine("Light_PhotoResistor\tIlluminazione\t" + ((Light_PhotoResistor)s).Channel + "\t" + ((Light_PhotoResistor)s).CodiceGardenOfThings + "\t" + ((Light_PhotoResistor)s).Simulation + "\t" + ((Light_PhotoResistor)s).AlarmMax + "\t" + ((Light_PhotoResistor)s).AlarmMin + "\t" + ((Light_PhotoResistor)s).MaxValue + "\t" + ((Light_PhotoResistor)s).MinValue + "\t[lx]");
            else if (s.GetType() == typeof(Humidity_Terrain_YL69YL38))
                sw.WriteLine("Humidity_Terrain_YL69YL38\tUmidità terreno\t" + ((Humidity_Terrain_YL69YL38)s).Channel + "\t" + ((Humidity_Terrain_YL69YL38)s).CodiceGardenOfThings + "\t" + ((Humidity_Terrain_YL69YL38)s).Simulation + "\t" + ((Humidity_Terrain_YL69YL38)s).AlarmMax + "\t" + ((Humidity_Terrain_YL69YL38)s).AlarmMin + "\t" + ((Humidity_Terrain_YL69YL38)s).MaxValue + "\t" + ((Humidity_Terrain_YL69YL38)s).MinValue + "\t[Rh%]");
        }

        sw.Close();

        ViewState["Tabella"] = dt;

    }
    protected void lnkElimina_Click(object sender, EventArgs e)
    {

        this.Alert("ciao");
    }

    protected void rdb_CheckedChanged(object sender, EventArgs e)
    {
        if (((RadioButton)sender).Checked)
        {
            switch (((RadioButton)sender).Text)
            {
                case "Temperatura":
                    lblIntestazione.Text = "IdTermometro";
                    break;
                case "Umidità dell'aria (HIH4000)":
                case "Umidità del terreno":
                case "Luminosità":
                    lblIntestazione.Text = "Canale ADC";
                    break;
                case "Umidità dell'aria (DHT22)":
                    lblIntestazione.Text = "Pin IO Raspi GOT";
                    break;
            }
        }
    }
}
