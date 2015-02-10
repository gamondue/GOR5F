using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gor.Acquisition.Daemon
{
    public class GorDbWriter
    {
        OleDbConnection connection;
        OleDbCommand command;
        
        //NON CAPISCO IL DATABASE 
        string[,] idRilevazione = new string[2,2];


        public GorDbWriter(string connectionString)
        {
            try
            {
                //creazine oggetto e passagio stringa di connessione
                connection = new OleDbConnection(connectionString);
            }
            catch
            {
                throw new Exception();
            }
        }

        public void SaveMeasurement(Measurement m)
        {
            
            string text = "INSERT INTO Rilevazione";
            command = new OleDbCommand(text,connection);

        }


        //Da implementare 
        //Non so come deve essere fatto il file 
        //E QUESTO IL FORMATO DEL FILE
        //NOME DATOACQUISITO ORA??????? 
        
        //prendi fa file i dati quando la rete non funziona 
        public void PrediDaFile(string percorso)
        { }
    }
}
