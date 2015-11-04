using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class HomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnConfig_Click(object sender, EventArgs e)
    {
        Response.Redirect("Configuration.aspx"); 
    }
    protected void btnCalibration_Click(object sender, EventArgs e)
    {
        Response.Redirect("Calibration.aspx"); 
    }
    protected void btnRuntime_Click(object sender, EventArgs e)
    {
        Response.Redirect("Runtime.aspx"); 
    }
}