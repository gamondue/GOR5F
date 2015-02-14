using System;
using System.Collections.Generic;
using System.Data.OleDb;
using System.IO;
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
        
        // Sensori utilizzati Umidita, Temperatura, Luminosita
        string[,] idRilevazione = 
        {
            {"1","RelativeHumidity_HIH4000"},
            {"2","Temperature_DS1822"},
            {"3","PhotoResistor"},
        };
        


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

        public bool SaveMeasurement(Measurement m)
        {
            string id="";
            try
            {
                
                //verifica idsensore e assegnazione a una variabile
                for (int i = 0; i < idRilevazione.Length - 1; i++)
                {
                    if (idRilevazione[i, 2] == m.Name)
                        id = (i + 1).ToString();
                    else
                    {
                        if (idRilevazione[i, 2] == m.Name)
                        id = (i + 1).ToString();
                        else
                        { 
                            if (idRilevazione[i, 2] == m.Name)
                            id = (i + 1).ToString();
                        }
                    }
                    
                }
                //Anno , mese, giorno , ora, minuti, secondi

                //Creazione stringa data + tempo ( Anno , mese, giorno , ora, minuti, secondi )
                string datatimenow = m.SampleTime.ToString("yyyy-MM-dd HH:mm:ss");
                
                //creazione stringa di connessione
                string text = "INSERT INTO Rilevazione (Tempo,Valore,PuntoMisura) VALUES('" + datatimenow + "'," + m.Value.ToString() + "," + id + "')";
                command = new OleDbCommand(text, connection);
                return true;
            }
            catch
            {
                return false;
            }
        }

        
        //Da implementare 
        //Non so come deve essere fatto il file 
        //E QUESTO IL FORMATO DEL FILE
        //NOME DATOACQUISITO ORA??????? 
        
        //prendi fa file i dati quando la rete non funziona 
        public void PrediDaFile(string percorso)
        {
            try
            {
                using (StreamReader sr = new StreamReader(percorso))
                {
                    String line = sr.ReadToEnd(); 
                    
                }
            }
            catch
            {
                throw new Exception();
            }
        }
    }
}
