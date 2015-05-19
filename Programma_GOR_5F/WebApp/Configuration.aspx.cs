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
    string pathProgramma = /*"/home/pi/Server5F/Lucchi/";//*/"C:/Users/MAURIZIO.LUCCHI/Desktop/";
    List<Sensor> sensori;
    DataTable dt;
    Adc_MCP3208 converter;

    protected void Page_Load(object sender, EventArgs e)
    {
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

            try
            {
                #region commenti
                //Logger.Test("ConfigPage|btnSalva_Click|-10");

                // Deserializzazione dal file di configurazione.
                /*using (FileStream fs = new FileStream(pathProgramma + "configurazione.xml", FileMode.Create, FileAccess.Write, FileShare.None))
                using (XmlReader xmlr = XmlReader.Create(fs))
                {
                    //Logger.Test("ConfigPage|btnSalva_Click|0");
                    DataContractSerializer dcs = new DataContractSerializer(typeof(List<Sensor>));
                    dcs.WriteObject(fs, sensori);//sensori = (List<Sensor>)dcs.ReadObject(xmlr);
                }*/

                //UpdateDataSource(grdSensori, sensori);
                #endregion

                StreamWriter sw = new StreamWriter(pathProgramma + "configuration.tsv");
            
                sw.Close();
            }
            catch (Exception ex)
            {
                //this.Alert("Errore nel caricamento dei sensori" + ex.Message);
                //Logger.Err("ConfigPage|btnSalva_Click " + ex.Message);
            }
            
        }
        else
        {
            try
            {
                #region commenti
                /*//Logger.Test("ConfigPage|btnSalva_Click|-10");

                // Deserializzazione dal file di configurazione.
                using (FileStream fs = new FileStream(pathProgramma + "configurazione.xml", FileMode.Open, FileAccess.Read, FileShare.None))
                using (XmlReader xmlr = XmlReader.Create(fs))
                {
                    //Logger.Test("ConfigPage|btnSalva_Click|0");
                    DataContractSerializer dcs = new DataContractSerializer(typeof(List<Sensor>));
                    sensori = (List<Sensor>)dcs.ReadObject(xmlr);
                }

                //UpdateDataSource(grdSensori, sensori);*/
                #endregion

                dt = (DataTable)ViewState["Tabella"];
                
                sensori = new List<Sensor>();                 

                StreamReader sr = new StreamReader(pathProgramma + "configuration.tsv");
                while(sr.Peek() >= 0)
                {
                    string[] dati = sr.ReadLine().Split('\t');
                    switch (dati[1])
                    {
                        case "Temperatura aria":
                            sensori.Add(new Temperature_DS1822(bool.Parse(dati[4]), dati[2]));
                            sensori[sensori.Count - 1].CodiceGardenOfThings = dati[3];
                            break;
                        case "Umidità aria":
                            sensori.Add(new Humidity_Air_HIH4000(bool.Parse(dati[4]), converter, int.Parse(dati[2])));
                            sensori[sensori.Count - 1].CodiceGardenOfThings = dati[3];
                            break;
                        case "Illuminazione":
                            sensori.Add(new Light_PhotoResistor(bool.Parse(dati[4]), converter, int.Parse(dati[2])));
                            sensori[sensori.Count - 1].CodiceGardenOfThings = dati[3];
                            break;
                        case "Umidità terreno":
                            sensori.Add(new Humidity_Terrain_YL69YL38(bool.Parse(dati[4]), converter, int.Parse(dati[2])));
                            sensori[sensori.Count - 1].CodiceGardenOfThings = dati[3];
                            break;
                    }
                }

                UpdateDataGrid(sensori);

                sr.Close();

            }
            catch (Exception ex)
            {
                //this.Alert("Errore nel caricamento dei sensori" + ex.Message);
                //Logger.Err("ConfigPage|btnSalva_Click " + ex.Message);
            }
        }
    }

    protected void btnEliminaSensore_Click(object sender, EventArgs e)
    {
        if(lstSensori.SelectedIndex != 1)
        {
            int i = lstSensori.SelectedIndex;
            sensori.RemoveAt(i);
            lstSensori.Items.RemoveAt(i);
            AggiornaFile();
        }
        
        
    }

    protected void btnAggiungi_Click1(object sender, EventArgs e)
    {
        Adc_MCP3208 converter = new Adc_MCP3208();

        if (rdbTemperature.Checked && txtIdCircuitoIntegratoTemp.Text != "")
        {
            //Logger.Test("ConfigPage|btnAggiungi_click|Temperature");
            Temperature_DS1822 T = new Temperature_DS1822(chkInSim.Checked, txtIdCircuitoIntegratoTemp.Text);
            T.CodiceGardenOfThings = txtIdDatabaseLux.Text;
            sensori.Add(T);
        }
        else if (rdbTerrainHumidity.Checked)
        {
            //Logger.Test("ConfigPage|btnAggiungi_click|Terrain_Humidity");
            Humidity_Terrain_YL69YL38 th = new Humidity_Terrain_YL69YL38(chkInSim.Checked, converter, int.Parse(txtCanaleTerrain.Text));
            th.CodiceGardenOfThings = txtIdDatabaseTerrain.Text;
            sensori.Add(th);
        }
        else if (rdbHIH4000.Checked)
        {
            //Logger.Test("ConfigPage|btnAggiungi_click|Air_Humidity_HIH4000");
            Humidity_Air_HIH4000 ah = new Humidity_Air_HIH4000(chkInSim.Checked, converter, int.Parse(txtCanaleHIH.Text));
            ah.CodiceGardenOfThings = txtIdDatabaseHIH.Text;
            sensori.Add(ah);
        }
        else if (rdbLux.Checked)
        {
            //Logger.Test("ConfigPage|btnAggiungi_click|Photo_Resistor");
            Light_PhotoResistor l = new Light_PhotoResistor(chkInSim.Checked, converter, int.Parse(txtCanaleLux.Text));
            l.CodiceGardenOfThings = txtIdDatabaseLux.Text;
            sensori.Add(l);
        }
        else if (rdbDHT22.Checked)
        {
            //Logger.Test("ConfigPage|btnAggiungi_click|Air_Humidity_DHT22");
            Humidity_Air_DHT22 dht = new Humidity_Air_DHT22(chkInSim.Checked, int.Parse(txtPinDht.Text));
            foreach (Sensor s in dht.Sensors)
                sensori.Add(s);
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
        catch(Exception ex)
        {
            //this.Alert("Errore nel salvataggio dei sensori" + ex.Message);
            //Logger.Err("ConfigPage|btnSalva_Click " + ex.Message); 
        }
    }

    /// <summary>
    /// Aggiorna il contenuto del GridView.
    /// </summary>
    /// <param name="grid">GridView.</param>
    /// <param name="source">Nuova sorgente dati.</param>
    protected void UpdateDataGrid(IEnumerable<Sensor> source)
    {
        foreach (Sensor s in source)
        {
            string grandezzaFisica = "";

            if (s.GetType() == typeof(Temperature_DS1822))
            {
                grandezzaFisica = "Temperatura";
                //AggiungiAGrigliaSensore(grandezzaFisica, s.Simulation, ((Temperature_DS1822)s).IdSensor, s.CodiceGardenOfThings);
            }
            else if (s.GetType() == typeof(Humidity_Air_HIH4000))
            {
                grandezzaFisica = "Umidità aria HIH4000";
                //AggiungiAGrigliaSensore(grandezzaFisica, s.Simulation, ((Humidity_Air_HIH4000)s).Channel, s.CodiceGardenOfThings);
            }
            else if (s.GetType() == typeof(Light_PhotoResistor))
            {
                grandezzaFisica = "Illuminazione";
               // AggiungiAGrigliaSensore(grandezzaFisica, s.Simulation, ((Light_PhotoResistor)s).Channel, s.CodiceGardenOfThings);
            }
            else if(s.GetType() == typeof(Humidity_Terrain_YL69YL38))
            {
                grandezzaFisica = "Umidità terreno";
                //AggiungiAGrigliaSensore(grandezzaFisica, s.Simulation, ((Humidity_Terrain_YL69YL38)s).Channel, s.CodiceGardenOfThings);
            }
   
        }

    }

    protected void btnAggiungi_Click(object sender, EventArgs e)
    {
        if (rdbTemperature.Checked && txtIdCircuitoIntegratoTemp.Text != "" && txtIdDatabaseTemp.Text != "")
        {
            sensori.Add(new Temperature_DS1822(chkInSim.Checked, txtIdCircuitoIntegratoTemp.Text));
            sensori[sensori.Count-1].CodiceGardenOfThings = txtIdDatabaseTemp.Text;

           // AggiungiAGrigliaSensore("Temperatura", chkInSim.Checked, txtIdCircuitoIntegratoTemp.Text, txtIdDatabaseTemp.Text);

            AggiungiALista(sensori.Count - 1);
            AggiornaFile();

            txtIdDatabaseTemp.Text = txtIdCircuitoIntegratoTemp.Text = "";

        }
        else if(rdbHIH4000.Checked && txtCanaleHIH.Text != "" && txtIdDatabaseHIH.Text != "")
        {
            sensori.Add(new Humidity_Air_HIH4000(chkInSim.Checked, converter, int.Parse(txtCanaleHIH.Text)));
            sensori[sensori.Count - 1].CodiceGardenOfThings = txtIdDatabaseHIH.Text;

            //AggiungiAGrigliaSensore("Umidità aria HIH4000", chkInSim.Checked, txtCanaleHIH.Text, txtIdDatabaseHIH.Text);

            AggiungiALista(sensori.Count - 1);
            AggiornaFile();

            txtIdDatabaseHIH.Text = txtCanaleHIH.Text = "";
        }
        else if (rdbLux.Checked && txtCanaleLux.Text != "" && txtIdDatabaseLux.Text != "")
        {
            sensori.Add(new Light_PhotoResistor(chkInSim.Checked, converter, int.Parse(txtCanaleLux.Text)));
            sensori[sensori.Count - 1].CodiceGardenOfThings = txtIdDatabaseLux.Text;

            //AggiungiAGrigliaSensore("Illuminazione", chkInSim.Checked, txtCanaleLux.Text, txtIdDatabaseLux.Text);

            AggiungiALista(sensori.Count - 1);
            AggiornaFile();

            txtCanaleLux.Text = txtIdDatabaseLux.Text = "";
        }
        else if (rdbTerrainHumidity.Checked && txtCanaleTerrain.Text != "" && txtIdDatabaseTerrain.Text != "")
        {
            sensori.Add(new Humidity_Terrain_YL69YL38(chkInSim.Checked, converter, int.Parse(txtCanaleTerrain.Text)));
            sensori[sensori.Count - 1].CodiceGardenOfThings = txtIdDatabaseTerrain.Text;

            //AggiungiAGrigliaSensore("Umidità terreno", chkInSim.Checked, txtCanaleTerrain.Text, txtIdDatabaseTerrain.Text);

            AggiungiALista(sensori.Count - 1);
            AggiornaFile();

            txtCanaleTerrain.Text = txtIdDatabaseTerrain.Text = "";
        }
    }

    private void AggiornaFile()
    {
        StreamWriter sw = new StreamWriter(pathProgramma + "configuration.tsv");

        foreach (Sensor s in sensori)
        {
            if(s.GetType() == typeof(Temperature_DS1822))
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
        
        Response.Write("<script>alert('Ciao')</script>");
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

    protected void AggiungiAGrigliaSensore(string grandezzaFisica, bool inSimulazione, object dato, string codGot)
    {
        DataRow dr = dt.NewRow();
        dt.Rows.Add(dr);

        grdSensori.DataSource = dt;
        grdSensori.DataBind();

        grdSensori.Rows[grdSensori.Rows.Count - 1].Cells[0].Text = grandezzaFisica;
        grdSensori.Rows[grdSensori.Rows.Count - 1].Cells[1].Text = inSimulazione.ToString();
        grdSensori.Rows[grdSensori.Rows.Count - 1].Cells[2].Text = dato.ToString();
        grdSensori.Rows[grdSensori.Rows.Count - 1].Cells[3].Text = codGot;
    }

    protected void AggiungiALista(int i)
    {
        string testo = "";

        if (sensori[i].GetType() == typeof(Temperature_DS1822))
            testo = ("Temperatura aria\t" + ((Temperature_DS1822)sensori[i]).Simulation + "\t" + ((Temperature_DS1822)sensori[i]).IdSensor + "\t" + ((Temperature_DS1822)sensori[i]).CodiceGardenOfThings);
        else if (sensori[i].GetType() == typeof(Humidity_Air_HIH4000))
            testo = ("Umidità aria\t" + ((Humidity_Air_HIH4000)sensori[i]).Simulation + "\t" + ((Humidity_Air_HIH4000)sensori[i]).Channel + "\t" + ((Humidity_Air_HIH4000)sensori[i]).CodiceGardenOfThings);
        else if (sensori[i].GetType() == typeof(Light_PhotoResistor))
            testo = ("Illuminazione\t" + ((Light_PhotoResistor)sensori[i]).Simulation + "\t" + ((Light_PhotoResistor)sensori[i]).Channel + "\t" + ((Light_PhotoResistor)sensori[i]).CodiceGardenOfThings);
        else if (sensori[i].GetType() == typeof(Humidity_Terrain_YL69YL38))
            testo = ("Umidità terreno\t" + ((Humidity_Terrain_YL69YL38)sensori[i]).Simulation + "\t" + ((Humidity_Terrain_YL69YL38)sensori[i]).Channel + "\t" + ((Humidity_Terrain_YL69YL38)sensori[i]).CodiceGardenOfThings);

        lstSensori.Items.Add(testo);
        lstSensori.DataBind();
    }
}