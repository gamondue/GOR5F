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
    // Francesco Dente 5F 2014-15
    string pathProgramma = "/home/pi/gor/";
    //string pathProgramma = @"C:\Users\francesco.dente\Desktop\";
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
        sensori = new List<Sensor>();
        dt = new DataTable();

        dt.Columns.Add("GrandezzaFisica");
        dt.Columns.Add("InSimulazione");
        dt.Columns.Add("Dato");
        dt.Columns.Add("IdDatabase");

        try
        {
            sensori = new List<Sensor>();

            //using (StreamReader sr = new StreamReader(pathProgramma + "configuration.tsv"))
            using (StreamReader sr = new StreamReader(pathProgramma + "configurazione.tsv"))
            {
                while (sr.Peek() >= 0)
                {
                    string[] dati = sr.ReadLine().Split('\t');
                    switch (dati[0])
                    {
                        case "Temperature_DS1822":
                            sensori.Add(new Temperature_DS1822(dati[1], bool.Parse(dati[4]), dati[2], logger));
                            sensori[sensori.Count - 1].GotCode = dati[3];
                            break;
                        case "Humidity_Air_HIH4000":
                            sensori.Add(new Humidity_Air_HIH4000(dati[1], bool.Parse(dati[4]), converter, int.Parse(dati[2]), logger));
                            sensori[sensori.Count - 1].GotCode = dati[3];
                            break;
                        case "Light_PhotoResistor":
                            sensori.Add(new Light_PhotoResistor(dati[1], bool.Parse(dati[4]), converter, int.Parse(dati[2]), logger));
                            sensori[sensori.Count - 1].GotCode = dati[3];
                            break;
                        case "Humidity_Terrain_YL69YL38":
                            sensori.Add(new Humidity_Terrain_YL69YL38(dati[1], bool.Parse(dati[4]), converter, int.Parse(dati[2]), logger));
                            sensori[sensori.Count - 1].GotCode = dati[3];
                            break;
                    }
                }
            }
        }
        catch (Exception ex)
        {
            this.Alert("Errore nel caricamento dei sensori" + ex.Message);
        }

        foreach (Sensor s in sensori)
            AddRow(s);

        grdSensori.DataSource = dt;
        grdSensori.DataBind();
    }

    protected void btnEliminaSensore_Click(object sender, EventArgs e)
    {
        
    }

    protected void btnSalva_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("Runtime.aspx");
        }
        catch (Exception ex)
        {
            this.Alert("Errore nel salvataggio dei sensori" + ex.Message);
        }
    }

    protected void btnAggiungi_Click(object sender, EventArgs e)
    {
        Sensor s = null;

        if (rdbTemperature.Checked && txtIdCircuitoIntegratoTemp.Text != "" && txtIdDatabaseTemp.Text != "")
        {
            s = new Temperature_DS1822("Temperatura aria", chkInSim.Checked, txtIdCircuitoIntegratoTemp.Text, logger);
            sensori.Add(s);
            s.GotCode = txtIdDatabaseTemp.Text;
        }
        else if (rdbHIH4000.Checked && txtCanaleHIH.Text != "" && txtIdDatabaseHIH.Text != "")
        {
            s = new Humidity_Air_HIH4000("Umidità aria", chkInSim.Checked, converter, int.Parse(txtCanaleHIH.Text), logger);
            sensori.Add(s);
            s.GotCode = txtIdDatabaseHIH.Text;
        }
        else if (rdbLux.Checked && txtCanaleLux.Text != "" && txtIdDatabaseLux.Text != "")
        {
            s = new Light_PhotoResistor("Illuminazione", chkInSim.Checked, converter, int.Parse(txtCanaleLux.Text), logger);
            sensori.Add(s);
            s.GotCode = txtIdDatabaseLux.Text;
        }
        else if (rdbTerrainHumidity.Checked && txtCanaleTerrain.Text != "" && txtIdDatabaseTerrain.Text != "")
        {
            s = new Humidity_Terrain_YL69YL38("Umidità terreno", chkInSim.Checked, converter, int.Parse(txtCanaleTerrain.Text), logger);
            sensori.Add(s);
            s.GotCode = txtIdDatabaseTerrain.Text;
        }

        if (s != null)
        {
            AddRow(s);
            AggiornaFile();
            grdSensori.DataBind();
        }
    }

    private void AggiornaFile()
    {
        //StreamWriter sw = new StreamWriter(pathProgramma + "configuration.tsv");
        StreamWriter sw = new StreamWriter(pathProgramma + "configurazione.tsv");

        foreach (Sensor s in sensori)
        {
            if (s.GetType() == typeof(Temperature_DS1822))
            {
                Temperature_DS1822 temp = (Temperature_DS1822)s;
                sw.WriteLine("Temperature_DS1822\t" +
                    "Temperatura aria\t" +
                    temp.IdSensor + "\t" +
                    temp.GotCode + "\t" +
                    temp.Simulation + "\t" +
                    temp.AlarmMax + "\t" +
                    temp.AlarmMin + "\t" +
                    temp.MaxValue + "\t" +
                    temp.MinValue + "\t[°C]");
            }
            else if (s.GetType() == typeof(Humidity_Air_HIH4000))
            {
                Humidity_Air_HIH4000 hih = (Humidity_Air_HIH4000)s;

                sw.WriteLine("Humidity_Air_HIH4000\t" +
                    "Umidità aria\t" +
                    hih.Channel + "\t" +
                    hih.GotCode + "\t" +
                    hih.Simulation + "\t" +
                    hih.AlarmMax + "\t" +
                    hih.AlarmMin + "\t" +
                    hih.MaxValue + "\t" +
                    hih.MinValue + "\t[Rh%]");
            }
            else if (s.GetType() == typeof(Light_PhotoResistor))
            {
                Light_PhotoResistor light = (Light_PhotoResistor)s;

                sw.WriteLine("Light_PhotoResistor\t" +
                    "Illuminazione\t" +
                    light.Channel + "\t" +
                    light.GotCode + "\t" +
                    light.Simulation + "\t" +
                    light.AlarmMax + "\t" +
                    light.AlarmMin + "\t" +
                    light.MaxValue + "\t" +
                    light.MinValue + "\t[lx]");
            }
            else if (s.GetType() == typeof(Humidity_Terrain_YL69YL38))
            {
                sw.WriteLine("Humidity_Terrain_YL69YL38\tUmidità terreno\t" + ((Humidity_Terrain_YL69YL38)s).Channel + "\t" + ((Humidity_Terrain_YL69YL38)s).GotCode + "\t" + ((Humidity_Terrain_YL69YL38)s).Simulation + "\t" + ((Humidity_Terrain_YL69YL38)s).AlarmMax + "\t" + ((Humidity_Terrain_YL69YL38)s).AlarmMin + "\t" + ((Humidity_Terrain_YL69YL38)s).MaxValue + "\t" + ((Humidity_Terrain_YL69YL38)s).MinValue + "\t[Rh%]");
            }
        }

        sw.Close();
    }

    private DataRow AddRow(Sensor s)
    {
        DataRow row = dt.NewRow();
        dt.Rows.Add(row);

        row["InSimulazione"] = s.Simulation;
        row["IdDatabase"] = s.GotCode;

        if (s.GetType() == typeof(Temperature_DS1822))
        {
            row["GrandezzaFisica"] = "Temperatura";
            row["Dato"] = ((Temperature_DS1822)s).IdSensor;
        }
        else if (s.GetType() == typeof(Humidity_Air_HIH4000))
        {
            row["GrandezzaFisica"] = "Umidità aria HIH";
            row["Dato"] = ((Humidity_Air_HIH4000)s).Channel;
        }
        else if (s.GetType() == typeof(Light_PhotoResistor))
        {
            row["GrandezzaFisica"] = "Luminosità";
            row["Dato"] = ((Light_PhotoResistor)s).Channel;
        }
        else if (s.GetType() == typeof(Humidity_Terrain_YL69YL38))
        {
            row["GrandezzaFisica"] = "Umidità terreno";
            row["Dato"] = ((Humidity_Terrain_YL69YL38)s).Channel;
        }

        return row;
    }

    protected void lnkElimina_Click(object sender, EventArgs e)
    {
        int index = ((GridViewRow)((LinkButton)sender).Parent.Parent).RowIndex;

        sensori.RemoveAt(index);
        dt.Rows.RemoveAt(index);
        grdSensori.DataBind();
        AggiornaFile();
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
