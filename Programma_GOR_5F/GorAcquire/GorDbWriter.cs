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

        //NON CAPISCO IL DATABASE 
        
        // Sensori utilizzati Umidita, Temperatura, Luminosita
        string[,] idRilevazione = 
        {
            {"1","RelativeHumidity_HIH4000"},
            {"2","Temperature_DS1822"},
            {"3","PhotoResistor"},
        };

        public GorDbWriter(List<Sensor> Sensori)
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

        /// <summary>
        /// Salva una misurazuione unica (su un solo sensore)
        /// </summary>
        /// <param name="m"></param>
        /// <returns></returns>
        public bool SaveMeasurement(Measurement m)
        {
            string id="";
            try
            {
                
                ////verifica idsensore e assegnazione a una variabile
                //for (int i = 0; i < idRilevazione.Length - 1; i++)
                //{
                //    if (idRilevazione[i, 2] == m.Name)
                //        id = (i + 1).ToString();
                //    else
                //    {
                //        if (idRilevazione[i, 2] == m.Name)
                //        id = (i + 1).ToString();
                //        else
                //        { 
                //            if (idRilevazione[i, 2] == m.Name)
                //            id = (i + 1).ToString();
                //        }
                //    }
                    
                //}

                
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

        public bool SaveAll()
        {
            foreach (Sensor s in Sensori)
            {
                ////////////Measurement m = s.Measure(); 
                ////////////SaveMeasurement(m);
            }
            return true; 
        }
        
        //Da implementare 
        //Non so come deve essere fatto il file 
        //E QUESTO IL FORMATO DEL FILE
        //NOME DATOACQUISITO ORA??????? 
        
        //prendi fa file i dati quando la rete non funziona 
        public void PrendiDaFile(string percorso)
        {
            //TODO 
            try
            {
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



        internal void SaveAll(List<Sensor> Sensors)
        {
            throw new NotImplementedException();
        }
    }
                
}
