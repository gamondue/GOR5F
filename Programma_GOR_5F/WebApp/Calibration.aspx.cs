//Beatrice Bartoloni

using Gor.Devices;
using Gor;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{

    Sensor k;

    
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    
    protected void btnSeleziona_Click(object sender, EventArgs e)
    {
        //L'utente seleziona il sensore di temperatura
        if (DropDownList1.SelectedIndex == 0)
        {
            //Informazioni riguardanti il sensore di temperatura
            lblUnitàDiMisura.Text = "Gradi";
            lblNomeSensore.Text = "DS-1822";
            lblInterfaccia.Text = "1-Wire";
            //k = new Temperature_DS1822(false, "a");

        }
        //L'utente seleziona il sensore di umidità dell'aria
        else if (DropDownList1.SelectedIndex == 1)
        {
            //Informazioni riguardanti il sensore di umidità dell'aria
            lblUnitàDiMisura.Text = "Percentuale";
            lblNomeSensore.Text = "HIH-4000";
            lblInterfaccia.Text = "1-Wire";
            k = new Humidity_Air_HIH4000(false, new Adc_MCP3208(), 1);
        }
        //L'utente seleziona il sensore di umidità del terreno
        else if (DropDownList1.SelectedIndex == 2)
        {
            //Informazioni riguardanti il sensore di umidità del terreno
            lblUnitàDiMisura.Text = "Percentuale";
            lblNomeSensore.Text = "YL-69-YL-38";
            lblInterfaccia.Text = "1-Wire";
            k = new Humidity_Terrain_YL69YL38(false, new Adc_MCP3208(), 1);
        }
        //L'utente seleziona il sensore di luce
        else if (DropDownList1.SelectedIndex == 3)
        {
            //Informazioni riguardanti il sensore di luce
            lblUnitàDiMisura.Text = "Lux";
            lblNomeSensore.Text = "Fotoresistor";
            lblInterfaccia.Text = "###";
            k = new Light_PhotoResistor(false, new Adc_MCP3208(), 1);
        }
    }
    protected void btnAvvia_Click(object sender, EventArgs e)
    {
        k.StartCalibration();
    }
    protected void btnPunto_Click(object sender, EventArgs e)
    {
        //k.
        //txtPuntoInput.Text = k.CalibrationPoint(double.Parse(txtPuntoInput.Text));
    }
    protected void btnChiusura_Click(object sender, EventArgs e)
    {
        k.EndCalibration();
    }
    protected void btnAbort_Click(object sender, EventArgs e)
    {
        
    }
    //Reindirizza alla pagina Configuration
    protected void btnConfiguration_Click(object sender, EventArgs e)
    {
        Response.Redirect("Configuration.aspx");
    }
    //Reindirizza alla pagina Runtime
    protected void btnRuntime_Click(object sender, EventArgs e)
    {
        Response.Redirect("Runtime.aspx");
    }
    //Reindirizza alla pagina iniziale Default
    protected void btnDefault_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}