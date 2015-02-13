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

public partial class ConfigPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSalva_Click(object sender, EventArgs e)
    {
        string s = "";
        if (chkTemperature.Checked == true)
            s += "Temperature";
        if (chkPressure.Checked == true)
            s += "\r\n Pressure";
        if (chkGroundHumidity.Checked == true)
            s += "\r\n GroundHumidity";
        if (chkAirHumidity.Checked == true)
            s += "\r\n AirHumidity";
        if (chkLux.Checked == true)
            s += "\r\n Lux";

        //Stringa da cambiare
        using (StreamWriter sw = File.CreateText("C:\\Users\\gianluca.babbi\\Desktop\\Sensori Selezionati"))
        {
            sw.WriteLine(s);
        }
    }
}