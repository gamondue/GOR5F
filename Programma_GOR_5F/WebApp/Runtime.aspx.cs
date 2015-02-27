//Giorgetti Samuele Gianluca Oreste 5F
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSpegni_Click(object sender, EventArgs e)
    {
        using (FileStream svs = new FileStream("/Home/pi/GOR/Close.txt", FileMode.Create, FileAccess.Write, FileShare.Read))
            using (StreamWriter wr = new StreamWriter(svs))
            {
                wr.Write(1);
            }
    }

    protected void btnPrendiNota_Click(object sender, EventArgs e)
    {
        using(FileStream pn = new FileStream("/Home/pi/GOR/PrendiNota.txt", FileMode.Create, FileAccess.Write, FileShare.Read))
            using (StreamWriter wr = new StreamWriter(pn))
            {

                pn.Write(txtPrendiNota.Text);
            }
    }
    protected void btnAcquisisci_Click(object sender, EventArgs e)
    {

    }
}