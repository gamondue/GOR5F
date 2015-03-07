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
        int startRead = 0;
        int endRead = 100;

        string connectionString = "METTERE QUA LA CONNECTION STRING";
        List<Sensor> Sensori; 

        public GorDbWriter()
        {
            try
            {
                //creazione oggetto e passaggio stringa di connessione
                connection = new OleDbConnection(connectionString);
            }
            catch
            {
                throw new Exception();
            }
        }

/// <summary>
/// Salva una misurazione unica (su un solo sensore)
/// </summary>
/// <param name="IdDatabase">Primary key nel database Garden of Things</param>
/// <param name="m">Misura effettuata sul sensore che si deve salvare</param>
/// <returns></returns>
        public bool SaveMeasurement(string IdDatabase, Measurement m)
        {
            string id="";
            try
            {
                //Creazione stringa data + tempo ( Anno , mese, giorno , ora, minuti, secondi )
                string datatimenow = m.SampleTime.ToString("yyyy-MM-dd HH:mm:ss");
                
                //creazione query SQL
                string query = "INSERT INTO Rilevazione (Tempo,Valore,PuntoMisura) VALUES('" + datatimenow + "'," + m.Value.ToString() + "," + id + "')";
                command = new OleDbCommand(query, connection);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool SaveAll(List<Sensor> Sensori)
        {
            foreach (Sensor s in Sensori)
            {
                string IdSensore = s.CodiceGardenOfThings;
                Measurement m = s.LastMeasurement; 
                SaveMeasurement(IdSensore, m);
            }
            return true; 
        }
       
        /// <summary>
        /// Prende da file i dati quando la rete non funziona
        /// </summary>
        /// <param name="percorso">Percorso e nome del file del log dei dati</param>
 
        public void PrendiDaFile(string percorso)
        {
            //TODO: il programma deve fare: 
            // XXXX
            try
            {
                // vedere se questo codice si può riutilizzare
                using (StreamReader sr = new StreamReader(percorso))
                {
                    char[] buffer = new char[endRead];
                    sr.Read(buffer,startRead,endRead);
                    string lettura="";

                    for(int i= 0; i < buffer.Length -1; i++)
                    {
                        lettura = lettura + buffer[i];
                    }

                    string[] slitlettura = lettura.Split(' ');
                    Measurement sensore = new Measurement();
                    
                    //DA FINIRE 
                }
            }
            catch
            {
                throw new Exception();
            }
        }
    }
}
