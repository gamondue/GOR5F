//Beatrice Bartoloni

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

    //Reindirizza alla pagina Configuration
    protected void btnConfig_Click(object sender, EventArgs e)
    {
        Response.Redirect("Configuration.aspx"); 
    }

    //Reindirizza alla pagina Calibration
    protected void btnCalibration_Click(object sender, EventArgs e)
    {
        Response.Redirect("Calibration.aspx"); 
    }

    //Reindirizza alla pagina Runtime
    protected void btnRuntime_Click(object sender, EventArgs e)
    {
        Response.Redirect("Runtime.aspx"); 
    }
}