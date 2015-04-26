//Giorgetti Samuele Gianluca Oreste 5F
//Modifiche apportate da Babbi in data 20-03-15
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Gor; 

public partial class _Runtime : System.Web.UI.Page
{
    //private static string pathProgamma = "/home/pi/gor/";
    Logger logger = new Logger(Gor.Common.LogsPath, "events.txt", "errors.txt",
    "debug.txt", "prompts.txt", "data.txt"); 

    protected void Page_Load(object sender, EventArgs e)
    {
        imgLed.Visible = false; //inizialmente spento.
    }
    protected void btnSpegni_Click(object sender, EventArgs e)
    {
        using (FileStream svs = new FileStream(Gor.Common.CloseCommandFile, FileMode.Create, FileAccess.Write, FileShare.Read))
        using (StreamWriter wr = new StreamWriter(svs))
        {
            wr.Write("1");
        }
    }
    protected void btnPrendiNota_Click(object sender, EventArgs e)
    {
        using (FileStream pn = new FileStream(Gor.Common.NotesFile, FileMode.Append, FileAccess.Write, FileShare.Read))
        using (StreamWriter wr = new StreamWriter(pn))
        {
            // ricorda l'istante di tempo in cui si è presa la nota e la nota stessa
            wr.WriteLine(DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + ": " + txtPrendiNota.Text);
        }
    }
    protected void btnAcquisisci_Click(object sender, EventArgs e)
    {
        using (FileStream svs = new FileStream(Gor.Common.AcquireCommandFile, FileMode.Create, 
            FileAccess.Write, FileShare.Read))
        using (StreamWriter wr = new StreamWriter(svs))
        {
            wr.Write("1");
        }
        // attende 7s
        Thread.Sleep(7000);
        // legge il file del campionamento fatto
        using (FileStream svs = new FileStream(Gor.Common.SingleSampleFile, FileMode.Open, 
            FileAccess.Read, FileShare.Read))
        using (StreamReader rd = new StreamReader(svs))
        {
            string s = rd.ReadToEnd();
            lblRead.Text = s; 
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
        string command = "/bin/ps";
        string arguments = "aux";

        //logger.Debug(i2cgetCmdArgs); 

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
        p.StartInfo.Arguments = arguments;
        // Now run command & wait for it to finish

        p.Start();
        p.WaitForExit();

        string data = p.StandardOutput.ReadToEnd();

        logger.Debug(data);

        if (data.IndexOf("GorAcquire", data.IndexOf("GorAcquire")) > 0)
        {
            imgLed.Visible = true;
        }
        else
        {
            imgLed.Visible = false;
        }
    }
}