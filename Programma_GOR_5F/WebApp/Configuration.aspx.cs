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
    string pathProgramma ="/home/pi/gor/"; 
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSalva_Click(object sender, EventArgs e)
    {
        try
        {
            Logger.Test("ConfigPage|btnSalva_Click|-30");

            List<Sensor> sensori = new List<Sensor>();
            Logger.Test("ConfigPage|btnSalva_Click|-25");
            //////Adc_MCP3208 converter = new Adc_MCP3208();
            Adc_MCP3208 converter = null;

            Logger.Test("ConfigPage|btnSalva_Click|-20");

            if (chkTemperature.Checked == true && txtIdCircuitoIntegratoTemp.Text != "")
            {
                Temperature_DS1822 T = new Temperature_DS1822(chkInSim.Checked, txtIdCircuitoIntegratoTemp.Text);
                T.CodiceGardenOfThings = txtIdDatabaseLux.Text;
                sensori.Add(T);
            }
            if (chkGroundHumidity.Checked == true)
            {
                Humidity_Terrain_YL69YL38 th = new Humidity_Terrain_YL69YL38(chkInSim.Checked, converter, int.Parse(txtCanaleGround.Text));
                th.CodiceGardenOfThings = txtIdDatabaseGround.Text;
                sensori.Add(th);
            }
            if (chkAirHumidity.Checked == true)
            {
                Humidity_Air_HIH4000 ah = new Humidity_Air_HIH4000(chkInSim.Checked, converter, int.Parse(txtCanaleHIH.Text));
                ah.CodiceGardenOfThings = txtIdDatabaseHIH.Text;
                sensori.Add(ah);
            }
            if (chkLux.Checked == true)
            {
                Light_PhotoResistor l = new Light_PhotoResistor(chkInSim.Checked, converter, int.Parse(txtCanaleLux.Text));
                l.CodiceGardenOfThings = txtIdDatabaseLux.Text;
                sensori.Add(l);
            }

            Logger.Test("ConfigPage|btnSalva_Click|-10");

            // mette la lista di sensori in un file xml, in modo che il programma di acquisizione possa leggerla
            // la prossima volta che parte
            if ((chkAirHumidity.Checked && txtCanaleHIH.Text != null) || (chkGroundHumidity.Checked && txtCanaleGround.Text != null)
                || (chkLux.Checked && txtCanaleLux.Text != null) || (chkTemperature.Checked && txtIdCircuitoIntegratoTemp.Text != null))
            {
                using (FileStream fs = new FileStream(pathProgramma + "configurazione.xml", FileMode.Create, FileAccess.Write, FileShare.None))
                using (XmlWriter xmlw = XmlWriter.Create(fs))
                {
                    DataContractSerializer dcs = new DataContractSerializer(typeof(List<Sensor>));
                    dcs.WriteObject(xmlw, sensori);
                }

                //Logger.Test("ConfigPage|btnSalva_Click|0");

                //XmlSerializer xsSubmit = new XmlSerializer(typeof(List<Sensor>));
                //Logger.Test("ConfigPage|btnSalva_Click|10");
                //StringWriter sww = new StringWriter();
                //Logger.Test("ConfigPage|btnSalva_Click|20");
                //XmlWriter writer = XmlWriter.Create(sww);
 
                //xsSubmit.Serialize(writer, sensori);
                //Logger.Test("ConfigPage|btnSalva_Click|40");
                //var xml = sww.ToString(); // questo è xml testuale
                //Logger.Test("ConfigPage|btnSalva_Click|50");
                //Logger.Test(xml);
                //using (StreamWriter sw = File.AppendText(pathProgramma + "configurazione.xml"))
                //{
                //    sw.Write(xml);
                //    sw.Close();
                //}
            }
        }
        catch(Exception ex)
        {
            Response.Write("<script>alert('Errore nella selezione dei sensori' + ex.Message)</script>");
            Logger.Err("ConfigPage|btnSalva_Click " + ex.Message); 
        }
    }
}