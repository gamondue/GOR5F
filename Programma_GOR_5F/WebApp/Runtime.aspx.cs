//Lucia Foschini 5F 24-03-15
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Runtime : System.Web.UI.Page
{
    private static string pathProgamma = "/home/pi/gor/";

    protected void Page_Load(object sender, EventArgs e)
    {
        imgLed.Visible = false; //inizialmente spento.
    }
    protected void btnSpegni_Click(object sender, EventArgs e)
    {
        using (FileStream svs = new FileStream(pathProgamma + "close.txt", FileMode.Create, FileAccess.Write, FileShare.Read))
        using (StreamWriter wr = new StreamWriter(svs))
        {
            wr.Write("1");
        }
    }
    protected void btnPrendiNota_Click(object sender, EventArgs e)
    {
        using (FileStream pn = new FileStream(pathProgamma + "notes.txt", FileMode.Append, FileAccess.Write, FileShare.Read))
        using (StreamWriter wr = new StreamWriter(pn))
        {
            // ricorda l'istante di tempo in cui si è presa la nota e la nota stessa
            wr.WriteLine(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + ": " + txtPrendiNota.Text);
        }
    }
    protected void btnAcquisisci_Click(object sender, EventArgs e)
    {
        using (FileStream svs = new FileStream(pathProgamma + "acquire.txt", FileMode.Create, FileAccess.Write, FileShare.Read))
        using (StreamWriter wr = new StreamWriter(svs))
        {
            wr.Write("1");
        }
    }

    public void Initialization()
    {

    }
    /// <summary>
    /// Pulsante che su richiesta dell'utente controlla se in esecuzione.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnControllo_Click(object sender, EventArgs e)
    {
        string command = "ps aux | grep GorAcquire";
        //Logger.Test(i2cgetCmdArgs); 

        Process p = new Process();

        // Don't raise event when process exits
        p.EnableRaisingEvents = false;
        // We're using an executable not document, so UseShellExecute false
        p.StartInfo.UseShellExecute = false;
        // Redirect StandardError
        p.StartInfo.RedirectStandardError = true;
        // Redirect StandardOutput so we can capture it
        p.StartInfo.RedirectStandardOutput = true;
        p.StartInfo.RedirectStandardInput = true;
        // i2cgetExe has full path to executable
        // Need full path because UseShellExecute is false

        p.StartInfo.FileName = command;
        // p.StartInfo.Arguments = arguments; 
        // Now run i2cget & wait for it to finish

        p.Start();
        p.WaitForExit();

        string data = p.StandardOutput.ReadToEnd();
        if (data.IndexOf("GorAcquire", data.IndexOf("GorAcquire")) > 0)
        {
            imgLed.Visible = true;
        }
        else
        {
            imgLed.Visible = false;
        }
    }
    protected void btnConfigurazione_Click(object sender, EventArgs e)
    {
        Response.Redirect("Configuration.aspx");
    }
}