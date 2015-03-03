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

    private static string pathProgamma = "/home/pi/gor/"; 

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSpegni_Click(object sender, EventArgs e)
    {
        using (FileStream svs = new FileStream(pathProgamma + "close.txt", FileMode.Create, FileAccess.Write, FileShare.Read))
            using (StreamWriter wr = new StreamWriter(svs))
            {
                wr.Write(1);
            }
    }

    protected void btnPrendiNota_Click(object sender, EventArgs e)
    {
        using(FileStream pn = new FileStream(pathProgamma + "notes.txt", FileMode.Append, FileAccess.Write, FileShare.Read))
            using (StreamWriter wr = new StreamWriter(pn))
            {

                wr.Write(DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss") + txtPrendiNota.Text);
            }
    }
    protected void btnAcquisisci_Click(object sender, EventArgs e)
    {
        using (FileStream svs = new FileStream(pathProgamma + "acquire.txt", FileMode.Create, FileAccess.Write, FileShare.Read))
        using (StreamWriter wr = new StreamWriter(svs))
        {
            wr.Write(1);
        }
    }
}