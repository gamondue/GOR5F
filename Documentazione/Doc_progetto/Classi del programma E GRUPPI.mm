<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1415612391932" ID="ID_1455873036" MODIFIED="1422576195047" TEXT="Classi del programma">
<node CREATED="1415612399672" ID="ID_1643890703" MODIFIED="1422576196976" POSITION="right" TEXT="Sensori">
<node CREATED="1415612446989" ID="ID_781383240" MODIFIED="1422576196979" TEXT="Ogni sensore deriva da ISensor">
<node CREATED="1415616445128" ID="ID_424138271" MODIFIED="1415616472474" TEXT="Costruttore: viene passato se il sensore deve essere in simulazione o no"/>
<node CREATED="1415616473267" ID="ID_290271065" MODIFIED="1415616523286" TEXT="L&apos;oggetto ricorda se deve essere in simulazione ed ogni volta che viene chiamato Misurazione() simula o meno il comportamento del sensore"/>
</node>
<node CREATED="1415704860125" ID="ID_396550769" MODIFIED="1422576196982" TEXT="ISensor">
<node CREATED="1415612488345" ID="ID_1051409897" MODIFIED="1422576196986" TEXT="Metodi">
<node CREATED="1415706522343" ID="ID_1338090631" MODIFIED="1422576196989" TEXT="Inizializzazione">
<node CREATED="1415706541882" ID="ID_1238904292" MODIFIED="1415706611796" TEXT="Provvede a fare tutte le operazioni sul sensore che sono necessarie prima di poterlo usare (sar&#xe0; eseguito una volta sola, prima di usare il sensore)"/>
</node>
<node CREATED="1416219935989" ID="ID_224912127" MODIFIED="1422576196991" TEXT="string Lettura()">
<node CREATED="1415612647178" ID="ID_536035289" MODIFIED="1415612655632" TEXT="legge il sensore"/>
<node CREATED="1415620177288" ID="ID_781880340" MODIFIED="1415704958787" TEXT="non fa elaborazioni"/>
<node CREATED="1416219992816" ID="ID_1978759589" MODIFIED="1416220002885" TEXT="restituisce un stringa"/>
<node CREATED="1415704983568" ID="ID_1975497070" MODIFIED="1415704994349" TEXT="ottiene un valore &quot;raw&quot;"/>
<node CREATED="1416220003754" ID="ID_1358734148" MODIFIED="1416220021872" TEXT="usato per i sensori digitali"/>
</node>
<node CREATED="1415612622039" ID="ID_1372490647" MODIFIED="1422576196993" TEXT="int LetturaInt()">
<node CREATED="1415612647178" ID="ID_1360286058" MODIFIED="1415612655632" TEXT="legge il sensore"/>
<node CREATED="1415620177288" ID="ID_329164174" MODIFIED="1415704958787" TEXT="non fa elaborazioni"/>
<node CREATED="1415616885654" ID="ID_717283932" MODIFIED="1416219975650" TEXT="restituisce un int"/>
<node CREATED="1416219977023" ID="ID_1228475109" MODIFIED="1416219985988" TEXT="usato per i convertitori AD"/>
<node CREATED="1415704983568" ID="ID_606396083" MODIFIED="1415704994349" TEXT="ottiene un valore &quot;raw&quot;"/>
</node>
<node CREATED="1415612656490" ID="ID_20463665" MODIFIED="1422576196995" TEXT="Misura Misurazione()">
<node CREATED="1415616841698" ID="ID_589059073" MODIFIED="1415616876399" STYLE="fork" TEXT="restituisce un valore di classe Misura (vedi oltre)"/>
<node CREATED="1415612660844" ID="ID_1860468486" MODIFIED="1415612675439" TEXT="converte nell&apos;unit&#xe0; di misura"/>
<node CREATED="1415612783769" ID="ID_270264697" MODIFIED="1415616883815" TEXT="chiama Lettura()"/>
<node CREATED="1415706362132" ID="ID_1387935603" MODIFIED="1422576196998" TEXT="Misurazione deve avere tre overload ">
<node CREATED="1415706389423" ID="ID_1140723965" MODIFIED="1415706395299" TEXT="Misurazione()"/>
<node CREATED="1415706395744" ID="ID_1537078753" MODIFIED="1422576196999" STYLE="fork" TEXT="Misurazione (DateTime IstanteSimulazione)">
<node CREATED="1415706432045" ID="ID_1216794234" MODIFIED="1415924812537" TEXT="Acquisisce il tempo per produrre un valore &quot;casuale&quot; che dipenda dalla stagione"/>
</node>
<node CREATED="1415925190908" ID="ID_1378091717" MODIFIED="1422576197002" TEXT="Misurazione(int NLetture, ref double ScartoTipo)">
<node CREATED="1415925211972" ID="ID_1503820057" MODIFIED="1415925384161" TEXT="fornisce una misura ottenuta come media aritmetica di NLetture letture, invece di una sola lettura. Della sequenza calcola anche lo scarto tipo. "/>
<node CREATED="1416223725168" ID="ID_354616704" MODIFIED="1416224015922" TEXT="il valore dello scarto tipo viene fornito in uscita nella variabile passata per riferimento"/>
</node>
</node>
</node>
<node CREATED="1415612816588" ID="ID_504747394" MODIFIED="1422576197006" TEXT="double Ripetibilit&#xe0;()">
<node CREATED="1415612825981" ID="ID_1160002690" MODIFIED="1415612834325" TEXT="10 misure"/>
<node CREATED="1415612834733" ID="ID_698242781" MODIFIED="1422576197008" TEXT="return scarto tipo">
<node CREATED="1415705062423" ID="ID_555278650" MODIFIED="1415705073299" TEXT="scarto quadratico medio"/>
<node CREATED="1415706639685" ID="ID_1326858569" MODIFIED="1415706670468" TEXT="radice quadrata della somma del quadrato degli scostamenti dei valori rispetto al loro valor medio"/>
</node>
<node CREATED="1415706677451" ID="ID_1911708512" MODIFIED="1415706712922" TEXT="Per valutare grossolanamente le prestazioni del sensore"/>
<node CREATED="1415706713367" ID="ID_1620674927" MODIFIED="1415919954703" TEXT="Verr&#xe0; eseguito una volta al giorno, nel momento in cui, dai dati del giorno precedente, si prevede che il valore della misura sia il pi&#xf9; costante possibile"/>
</node>
<node CREATED="1415925021568" ID="ID_1101752194" MODIFIED="1422576197010" TEXT="Taratura del sensore">
<node CREATED="1415925052073" ID="ID_1768346635" MODIFIED="1422576197011" STYLE="fork" TEXT="void TaraturaInizio()">
<node CREATED="1415925089416" ID="ID_1729702143" MODIFIED="1415925121209" TEXT="fa iniziare una sequenza di taratura"/>
<node CREATED="1415925147136" ID="ID_1442155395" MODIFIED="1415925170564" TEXT="interrompe le misurazioni regolari"/>
</node>
<node CREATED="1415925128514" ID="ID_1916029839" MODIFIED="1422576197012" TEXT="void TaraturaPunto(double ValoreVero)">
<node CREATED="1415925445554" ID="ID_1676412016" MODIFIED="1415925463738" TEXT="Acquisisce un nuovo punto di taratura (messa a punto)"/>
</node>
<node CREATED="1415925469070" ID="ID_1467766701" MODIFIED="1415925500020" TEXT="void TaraturaFine()"/>
</node>
</node>
<node CREATED="1415612864233" ID="ID_481516" MODIFIED="1422576197017" TEXT="Propriet&#xe0;">
<node CREATED="1415612873698" ID="ID_1899184464" MODIFIED="1421252973894" STYLE="fork" TEXT="Misura MisuraAttuale"/>
<node CREATED="1415612873698" ID="ID_875954426" MODIFIED="1421252985820" STYLE="fork" TEXT="Misura MisuraPrecedente"/>
<node CREATED="1415612969700" ID="ID_48870568" MODIFIED="1422576197018" TEXT="bool Simulazione">
<node CREATED="1415612979269" ID="ID_748234960" MODIFIED="1415613037836" TEXT="se true quando viene chiamato Misurazione non si legge il sensore e si produce un valore casuale"/>
<node CREATED="1415705349675" ID="ID_132262913" MODIFIED="1415705352144" TEXT="sola lettura"/>
</node>
<node CREATED="1415706882667" ID="ID_608900921" MODIFIED="1422576197021" TEXT="double AlarmMax">
<node CREATED="1415706894868" ID="ID_1809712799" MODIFIED="1415925551049" TEXT="Numero del valore della misurazione al di sopra del quale il sensore &#xe8; rotto, oppure siamo in una condizione straordinaria, &quot;da allarme&quot; "/>
</node>
<node CREATED="1415706882667" ID="ID_335286115" MODIFIED="1422576197023" TEXT="double AlarmMin">
<node CREATED="1415706894868" ID="ID_967849523" MODIFIED="1415707031108" TEXT="Valore della misurazione al di sotto del quale il sensore &#xe8; rotto, oppure siamo in una condizione straordinaria, &quot;da allarme&quot; "/>
</node>
<node CREATED="1415706818652" ID="ID_763698069" MODIFIED="1422576197024" TEXT="double MaxValue">
<node CREATED="1415706831917" ID="ID_1195294164" MODIFIED="1415706850262" TEXT="Valore della misurazione oltre il quale si &#xe8; certi che il sensore &#xe8; rotto"/>
</node>
<node CREATED="1415706818652" ID="ID_1972351737" MODIFIED="1422576197025" TEXT="double MinValue">
<node CREATED="1415706831917" ID="ID_1713480254" MODIFIED="1415706881314" TEXT="Valore della misurazione al di sotto del quale si &#xe8; certi che il sensore &#xe8; rotto"/>
</node>
</node>
<node CREATED="1415613071414" ID="ID_189729825" MODIFIED="1422576197026" TEXT="produzione del valore casuale per la misurazione simulata">
<node CREATED="1416220160284" ID="ID_1791242680" MODIFIED="1416220197452" TEXT="Valore di Misura() quando il sensore &#xe8; instanziato come in &quot;simulazione&quot;"/>
<node CREATED="1415613044972" ID="ID_1355376790" MODIFIED="1422576197027" TEXT="ottenuto come">
<node CREATED="1416220254697" ID="ID_1975588749" MODIFIED="1416220265164" TEXT="1 - ultimo valore + qualcosa di random"/>
<node CREATED="1415613085936" ID="ID_854149253" MODIFIED="1422576197027" TEXT="2 - pi&#xf9; bello">
<node CREATED="1415613090433" ID="ID_835358880" MODIFIED="1416220284719" TEXT="valore casuale che dipende dall&apos;istante (se siamo in inversno, inverno-primavera ..)"/>
</node>
</node>
</node>
</node>
<node CREATED="1415612915374" ID="ID_208266433" MODIFIED="1422576197028" TEXT="Classi">
<node CREATED="1415612921935" ID="ID_325774101" MODIFIED="1422576197029" TEXT="class Misura">
<node CREATED="1415616579702" ID="ID_1166214514" MODIFIED="1422576197032" TEXT="Attributi">
<node CREATED="1415616584471" ID="ID_1043259305" MODIFIED="1415616814300" TEXT="double Value"/>
<node CREATED="1415706199640" ID="ID_1976522418" MODIFIED="1422576197033" TEXT="DateTime Istante">
<node CREATED="1415706210617" ID="ID_900064719" MODIFIED="1415706292304" TEXT="istante di tempo in cui viene effettuato il campionamento"/>
</node>
<node CREATED="1415616798485" ID="ID_1318816961" MODIFIED="1422576197034" TEXT="string Unit">
<node CREATED="1415619180720" ID="ID_585059390" MODIFIED="1415619195173" TEXT="fra parentesi quadre: l&apos;unit&#xe0; di misura"/>
<node CREATED="1415705132438" ID="ID_1717338700" MODIFIED="1422576197036" TEXT="es.">
<node CREATED="1415705134606" ID="ID_1983672422" MODIFIED="1415705139028" TEXT="[ms]"/>
<node CREATED="1415705139623" ID="ID_1203795647" MODIFIED="1415705143435" TEXT="[&#xb0;C]"/>
<node CREATED="1416220309037" ID="ID_1178950583" MODIFIED="1416220312346" TEXT="[%]"/>
</node>
</node>
<node CREATED="1415616817839" ID="ID_1038369393" MODIFIED="1422576197038" TEXT="string DisplayFormat">
<node CREATED="1415619200858" ID="ID_790167894" MODIFIED="1415619363338" TEXT="da usare nel ToString(displayFormat)"/>
<node CREATED="1415619225115" ID="ID_1757370962" MODIFIED="1422576197041" TEXT="es.">
<node CREATED="1415619236805" ID="ID_296541574" MODIFIED="1415619252294" TEXT="value = 12.9493459"/>
<node CREATED="1415619227700" ID="ID_1859981411" MODIFIED="1422576197042" TEXT="&quot;0.00&quot;">
<node CREATED="1415619275889" ID="ID_388465840" MODIFIED="1415619302558" TEXT="12.95"/>
</node>
<node CREATED="1415619283370" ID="ID_1296867479" MODIFIED="1422576197043" TEXT="&quot;0.000&quot;">
<node CREATED="1415619291275" ID="ID_1232493393" MODIFIED="1415619299479" TEXT="12.949"/>
</node>
<node CREATED="1415619319982" ID="ID_1346908481" MODIFIED="1422576197044" TEXT="&quot;0&quot;">
<node CREATED="1415619324534" ID="ID_471179327" MODIFIED="1415619325894" TEXT="13"/>
</node>
</node>
</node>
<node CREATED="1415616911657" ID="ID_1228940039" MODIFIED="1422576197045" TEXT="var Lettura">
<node CREATED="1415616915433" ID="ID_1449954114" MODIFIED="1415616926168" TEXT="il valore &quot;raw&quot; del sensore"/>
<node CREATED="1415619487472" ID="ID_1407714667" MODIFIED="1415619503442" TEXT="ottenuto con il metodo Lettura()"/>
<node CREATED="1416220339193" ID="ID_1244208881" MODIFIED="1416220348885" TEXT="pu&#xf2; essere un numero o una stringa"/>
</node>
<node CREATED="1415707072559" ID="ID_47636539" MODIFIED="1422576197046" TEXT="int Errore">
<node CREATED="1415707142520" ID="ID_596656367" MODIFIED="1415707161646" TEXT="Codice numerico di errore"/>
</node>
<node CREATED="1415707164210" ID="ID_483457954" MODIFIED="1422576197047" TEXT="string TextError">
<node CREATED="1415707142520" ID="ID_299127597" MODIFIED="1415707196473" STYLE="fork" TEXT="Stringa di errore"/>
</node>
</node>
</node>
<node CREATED="1416181973493" ID="ID_831333320" MODIFIED="1422576197049" TEXT="class Log">
<node CREATED="1416181980034" ID="ID_1099853452" MODIFIED="1416182040014" TEXT="Memorizza localmente le acquisizioni fatte e gli errori occorsi"/>
<node CREATED="1416182309400" ID="ID_157827476" MODIFIED="1422576197050" TEXT="opzioni, memorizzare su:">
<node CREATED="1416182318758" ID="ID_501437697" MODIFIED="1416182333490" TEXT="Flat file di tipo testo"/>
<node CREATED="1416220397831" ID="ID_1960769187" MODIFIED="1416220399844" TEXT="oppure"/>
<node CREATED="1416182313974" ID="ID_263541886" MODIFIED="1416182318326" TEXT="MySQL"/>
</node>
</node>
</node>
</node>
<node CREATED="1415613162608" ID="ID_1518730068" MODIFIED="1422576197054" POSITION="right" TEXT="Programma di acquisizione">
<node CREATED="1415613247280" ID="ID_1216185522" MODIFIED="1422576197055" TEXT="chi lo fa, fa l&apos;integrazione">
<node CREATED="1415618012021" ID="ID_270251939" MODIFIED="1415618033241" TEXT="si interfaccia con chi sviluppa il codice dei sensori"/>
<node CREATED="1415618033638" ID="ID_833174730" MODIFIED="1415618047608" TEXT="integra nel suo programma il lavoro degli altri"/>
</node>
<node CREATED="1415613310504" ID="ID_253253754" MODIFIED="1421253317273" TEXT="istanziare sensori e oggetto per accesso a DB"/>
<node CREATED="1421253277613" ID="ID_874448410" MODIFIED="1421253303350" TEXT="0 - attendere il momento del campionamento"/>
<node CREATED="1415613196956" ID="ID_1510667823" MODIFIED="1415618000581" TEXT="1 - fare &quot;il giro&quot; delle acquisizioni"/>
<node CREATED="1415613221662" ID="ID_716449407" MODIFIED="1415924894592" TEXT="2 - scrivere sul database"/>
<node CREATED="1415613236096" ID="ID_915243961" MODIFIED="1421253321026" TEXT="3 - tornare a 0"/>
<node CREATED="1416951561510" ID="ID_1863952533" MODIFIED="1422576197056" TEXT="Watchdog">
<node CREATED="1416951572729" ID="ID_1520004678" MODIFIED="1416951587252" TEXT="Usando il watchdog timer interno"/>
<node CREATED="1421677842822" ID="ID_1302735949" MODIFIED="1421677847344" TEXT="vedi oltre"/>
</node>
</node>
<node CREATED="1415613271660" ID="ID_1221196046" MODIFIED="1422576197059" POSITION="right" TEXT="Scrittura su database">
<node CREATED="1415613299166" ID="ID_334927009" MODIFIED="1416220434792" TEXT="&#xe8; una classe, usata nel programma di acquisizione"/>
<node CREATED="1415618525962" ID="ID_21809942" MODIFIED="1415618561683" TEXT="il programma principale istanzia questa classe, come &quot;simulazione&quot; o &quot;trasferimento reale&quot;"/>
<node CREATED="1415618567095" ID="ID_684034580" MODIFIED="1415924947292" TEXT="se &#xe8; istanziato come simulazione, il metodo che scrive sul database scrive sulla console, altrimenti sul database"/>
</node>
<node CREATED="1421679277302" ID="ID_1620161083" MODIFIED="1422576197063" POSITION="right" TEXT="Namespaces">
<node CREATED="1421695898733" ID="ID_840894385" MODIFIED="1422576197064" TEXT="Gor">
<node CREATED="1421695904821" ID="ID_1511280128" MODIFIED="1421695952734" TEXT="Librerie o classi &quot;sfuse&quot; che servono a tutti gli altri pezzi del programma"/>
</node>
<node CREATED="1421679293554" ID="ID_635194912" MODIFIED="1422576197064" TEXT="Gor.Acquisition.Daemon">
<node CREATED="1421679325091" ID="ID_324662434" MODIFIED="1421679375310" TEXT="programma a console di acquisizione dati"/>
</node>
<node CREATED="1421679293554" ID="ID_207136482" MODIFIED="1422576197065" TEXT="Gor.Acquisition.Web">
<node CREATED="1421679325091" ID="ID_227054924" MODIFIED="1421679532584" TEXT="Web application di configurazione e taratura"/>
</node>
<node CREATED="1421679310115" ID="ID_760435624" MODIFIED="1422576197065" TEXT="Gor.Devices">
<node CREATED="1421679412832" ID="ID_442854330" MODIFIED="1421679456607" TEXT="Sensori, attuatori e librerie fatte da noi (le librerie altrui mantengono il loro namespace)"/>
</node>
</node>
<node CREATED="1421680278670" ID="ID_58603189" MODIFIED="1422576197068" POSITION="right" TEXT="Files e struttura delle cartelle della soluzione">
<node CREATED="1421680327528" ID="ID_632736046" MODIFIED="1422576197070" TEXT="Devices">
<node CREATED="1421680336357" ID="ID_235441551" MODIFIED="1421680361141" TEXT="cartella che contiene i file delle classi dei tipi di sensore"/>
<node CREATED="1421680556197" ID="ID_41988480" MODIFIED="1421680584163" TEXT="ogni device ha riferimenti alle sue librerie"/>
<node CREATED="1421682839502" ID="ID_1782287135" MODIFIED="1422576197071" TEXT="nomi delle classi dei sensori">
<node CREATED="1421683607111" ID="ID_1148235840" MODIFIED="1422576197072" TEXT="&lt;Tipo di device&gt;_&lt;Sigla &quot;elettronica&quot;&gt;">
<node CREATED="1421684364226" ID="ID_1621541391" MODIFIED="1422576197073" TEXT="es.">
<node CREATED="1421684376461" ID="ID_548620871" MODIFIED="1421684505269" TEXT="Adc_MCP3208"/>
<node CREATED="1421684419405" ID="ID_1845464838" MODIFIED="1422576197074" TEXT="BarometricPressure_BMP180">
<node CREATED="1421684449207" ID="ID_218065796" MODIFIED="1421684473104" TEXT="deriva da Sensor, non &#xe8; necessario dire nel suo nome che &#xe8; un sensor"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1421680369150" ID="ID_1465562530" MODIFIED="1422576197075" TEXT="GorAcquire">
<node CREATED="1421680417157" ID="ID_903233690" MODIFIED="1421680477611" TEXT="progetto del programma di acquisizione dati"/>
<node CREATED="1421680528532" ID="ID_1207920010" MODIFIED="1421680631148" TEXT="il programma di acquisizione dati ha riferimenti ai devices NON alle librerie"/>
</node>
<node CREATED="1421680369150" ID="ID_1703179585" MODIFIED="1422576197076" TEXT="GorConfigure">
<node CREATED="1421680417157" ID="ID_1928418523" MODIFIED="1421680477611" TEXT="progetto del programma di acquisizione dati"/>
<node CREATED="1421680528532" ID="ID_245570765" MODIFIED="1421680640748" TEXT="ha riferimenti ai devices NON alle librerie"/>
</node>
<node CREATED="1421680425836" ID="ID_1923329168" MODIFIED="1422576197077" TEXT="Librerie">
<node CREATED="1421680431457" ID="ID_727041266" MODIFIED="1421680454760" TEXT="cartella che contiene i sorgenti delle librerie"/>
</node>
</node>
<node CREATED="1421701682185" ID="ID_1548019306" MODIFIED="1422576197081" POSITION="right" TEXT="Classi dei sensori">
<node CREATED="1421701692460" ID="ID_1689774178" MODIFIED="1421701878985" TEXT="La soluzione presentata NON tiene in nessuna considerazione la possibilit&#xe0; di simulazione della lettura dei sensori, PRIMA RICHIESTA DEL PROJECT MANAGER!!"/>
<node CREATED="1421701742653" ID="ID_40753542" MODIFIED="1421701810950" TEXT="Azioni correttive: modificare la classe astratta sensore e tutte le sue derivazioni per accettare nel costruttore anche un parametro bool che fa funzionare il sistema in simulazione"/>
</node>
<node CREATED="1421600104333" ID="ID_424358820" MODIFIED="1422576197086" POSITION="right" TEXT="GorAcquire: Main program">
<node CREATED="1421602255588" ID="ID_1403590642" MODIFIED="1421602862098" TEXT="Il programma viene lanciato automaticamente all&apos;accensione del Raspi e NON ha interfaccia utente. NON gira da una shell, per cui pu&#xf2; comunicare solo attraverso file. (Zhu sa come farlo partire al boot)"/>
<node CREATED="1421600323247" ID="ID_1218445394" MODIFIED="1421679063967" TEXT="Metodi DA REALIZZARE i nomi dovranno essere questi"/>
<node CREATED="1421601072959" ID="ID_1837457666" MODIFIED="1422576197092" TEXT="Initialize()">
<node CREATED="1421601406706" ID="ID_724312465" MODIFIED="1422576197092" TEXT="Istanzia un convertitore AD">
<node CREATED="1421602911788" ID="ID_1926895307" MODIFIED="1421602926363" TEXT="&quot;finto&quot; se siamo in simulazione"/>
</node>
<node CREATED="1421601179250" ID="ID_1323753231" MODIFIED="1422576197094" TEXT="Istanzia gli oggetti sensore">
<node CREATED="1421602668812" ID="ID_1832934744" MODIFIED="1421602788609" TEXT="All&apos;istanziazione gli oggetti sensore leggono da un file tutti i parametri che servono (configurazione, taratura)"/>
<node CREATED="1421602911788" ID="ID_1220477031" MODIFIED="1421602957775" TEXT="&quot;finti&quot; se siamo in simulazione"/>
<node CREATED="1421686675140" ID="ID_661015461" MODIFIED="1422576197095" TEXT="File di configurazione">
<node CREATED="1421686684911" ID="ID_103232087" MODIFIED="1422576197096" TEXT="&lt;Nome della classe&gt;_&lt;codice identificativo GOT&gt;.xml">
<node CREATED="1421686877490" ID="ID_1234765502" MODIFIED="1422576197097" TEXT="&lt;codice identificativo GOT&gt;">
<node CREATED="1421686944384" ID="ID_927609097" MODIFIED="1421686987775" TEXT="la key del sensore nel database centrale Garden Of Things"/>
</node>
</node>
</node>
</node>
<node CREATED="1421680017263" ID="ID_1788737290" MODIFIED="1421680034486" TEXT="Istanzia l&apos;oggetto per la scrittura nel database"/>
<node CREATED="1421601239466" ID="ID_362751972" MODIFIED="1421601549606" TEXT="I sensori analogici, che necessitano di un convertitore AD, prendono l&apos;oggetto ADC come parametro del loro costruttore. Gli serve anche il numero del canale dell&apos;ADC su cui sono calblati. Anche il canale ADC viene passato come parametro del costruttore. "/>
<node CREATED="1421601430090" ID="ID_1976562313" MODIFIED="1422576197100" TEXT="I sensori digitali chiederanno al costruttore i parametri che gli servono.">
<node CREATED="1421601710117" ID="ID_645523940" MODIFIED="1421601809507" TEXT="In particolare i sensori di temperatura devono avere il loro identificatore univoco come parametro del costruttore"/>
<node CREATED="1421601809939" ID="ID_1144182863" MODIFIED="1421601936791" TEXT="L&apos;identificatore deve essere una propriet&#xe0; di sola lettura dell&apos;oggetto sensore di temperatura"/>
</node>
<node CREATED="1421607636052" ID="ID_249195033" MODIFIED="1422576197101" TEXT="Scrittura dell&apos;intestazione nel file di log">
<node CREATED="1421607692660" ID="ID_1292406674" MODIFIED="1421607759944" TEXT="descrizioni dei campi i cui valori si salveranno nella fase di acquisizione, separati da tab (\t)"/>
</node>
</node>
<node CREATED="1421600112359" ID="ID_1456166693" MODIFIED="1422576197104" STYLE="fork" TEXT="Wait()">
<node CREATED="1421600117635" ID="ID_1968107530" MODIFIED="1422576197105" TEXT="Attende l&apos;inizio preciso del minuto stabilito per l&apos;inizio del campionamento">
<node CREATED="1421600252210" ID="ID_1506719203" MODIFIED="1421678998456" TEXT="Il campionamento inizia al secondo zero del minuto "/>
</node>
<node CREATED="1421600154493" ID="ID_808961811" MODIFIED="1422576197107" TEXT="Ciclo di Thread.Sleep(5000) fino a 5 s prima del campionamento">
<node CREATED="1421600230832" ID="ID_449671375" MODIFIED="1421600234598" TEXT="Attesa passiva"/>
<node CREATED="1421678954730" ID="ID_122984398" MODIFIED="1421678970802" TEXT="controlla se il programma deve finire"/>
<node CREATED="1421609347391" ID="ID_1544505283" MODIFIED="1422576197110" TEXT="Watchdog">
<node CREATED="1421609459976" ID="ID_1032577701" MODIFIED="1421609492958" TEXT="Il SOC del Raspi ha un contatore che conta a rovescio fino a che non arriva a 0"/>
<node CREATED="1421609493594" ID="ID_1299961608" MODIFIED="1421609552399" TEXT="Quando arriva a zero, resetta il computer"/>
<node CREATED="1421609552987" ID="ID_1665689292" MODIFIED="1421609669702" TEXT="Ogni tanto il software deve settare il contatore, per evitare che il computer sia resettato"/>
<node CREATED="1421609671328" ID="ID_1666339895" MODIFIED="1421609734512" TEXT="Se il nostro programma si inchioda, non setta pi&#xf9; il watchdog ed il computer si resetta"/>
<node CREATED="1421609743890" ID="ID_272808471" MODIFIED="1421609761075" TEXT="in questa parte del programma dovrebbe stare "/>
<node CREATED="1421609575434" ID="ID_27889889" MODIFIED="1422576197111" STYLE="fork" TEXT="Lucchi ha studiato il watchdog, ma non c&apos;&#xe8; molta documentazione ed &#xe8; molto difficile da realizzare in C#">
<node CREATED="1421609618264" ID="ID_1048100750" MODIFIED="1421677874500" TEXT="Se qualcuno ci riuscisse: un premio!"/>
</node>
</node>
</node>
<node CREATED="1421600179937" ID="ID_1773282597" MODIFIED="1422576197111" TEXT="Ciclo su Datetime">
<node CREATED="1421600291838" ID="ID_685225604" MODIFIED="1421600295425" TEXT="Attesa attiva"/>
<node CREATED="1421600295770" ID="ID_1572502610" MODIFIED="1421607773405" TEXT="pi&#xf9; precisa, ma &quot;consuma&quot;"/>
</node>
</node>
<node CREATED="1421600304896" ID="ID_900106382" MODIFIED="1422576197114" TEXT="Acquire()">
<node CREATED="1421601116839" ID="ID_1929964097" MODIFIED="1421606115269" TEXT="Acquisisce tutte le misure richieste e le mette in un vettore (o lista) fatto di oggetti di classe Misura"/>
<node CREATED="1421608115699" ID="ID_674093931" MODIFIED="1421608253548" TEXT="Il programma deve &quot;resistere&quot; ad errori sui sensori, proseguire senza fermarsi. In caso di errore memorizza un valore convenzionale sul file di log e null nel campo di database corripondente a questo campionamento"/>
<node CREATED="1421698217494" ID="ID_1479162553" MODIFIED="1421698244697" TEXT="Usa Lettura() e Misura() che non ci sono nel programma che &#xe8; stato fatto"/>
</node>
<node CREATED="1421600404286" ID="ID_1287308582" MODIFIED="1422576197118" TEXT="Save()">
<node CREATED="1421608009243" ID="ID_101978831" MODIFIED="1421608096016" TEXT="Visualizzazione delle misure fatte su Console (solo per debugging, nel programma &quot;finito&quot; non le vedr&#xe0; nessuno)"/>
<node CREATED="1421600458619" ID="ID_1310998731" MODIFIED="1422576197120" TEXT="Salvataggio di una nuova riga su file di log con tutte le misure">
<node CREATED="1421607608310" ID="ID_331405342" MODIFIED="1421607630057" TEXT="File di testo, con i campi separati da tab (\t)"/>
<node CREATED="1421607993398" ID="ID_193625615" MODIFIED="1421607995184" TEXT="campi"/>
<node CREATED="1421607945412" ID="ID_51973263" MODIFIED="1421607988459" TEXT="Istante di campionamento (NON &quot;convenzionale&quot;, l&apos;ora vera in cui si &#xe8; fatto quel campionamento)"/>
<node CREATED="1421607996453" ID="ID_1029889863" MODIFIED="1421608000716" TEXT="Valore della misura"/>
<node CREATED="1421608001152" ID="ID_758352934" MODIFIED="1421608005525" TEXT="Unit&#xe0; di misura"/>
</node>
<node CREATED="1421601059059" ID="ID_917888055" MODIFIED="1422576197125" TEXT="Scrittura su database">
<node CREATED="1421606060580" ID="ID_468493986" MODIFIED="1421679265675" TEXT="Fatta dalla classe Classe DbWriter (bool Simulation)"/>
<node CREATED="1421608258264" ID="ID_699486872" MODIFIED="1421608308385" TEXT="L&apos;istante memorizzato deve essere quello &quot;convenzionale&quot;,  a minuto intero, di inizio del campionamento generale"/>
<node CREATED="1421608385676" ID="ID_1906037744" MODIFIED="1421608394258" TEXT="Scrive una riga di tabella"/>
<node CREATED="1421608394713" ID="ID_1250254730" MODIFIED="1422576197128" TEXT="Il codice identificativo del sensore deve essere quello previsto dallo schema di esempio database">
<node CREATED="1421608504890" ID="ID_705525036" MODIFIED="1421608601959" TEXT="Il codice identificativo del sensore va aggiunto alle propriet&#xe0; della classe astratta sensore, e di consguenza alle sue derivate"/>
</node>
<node CREATED="1421611955109" ID="ID_150598474" MODIFIED="1421612197899" TEXT="Se il programma non riesce a scrivere sul database deve proseguire memorizzando localmente (file di log spiegato prima) e segnandosi il punto in cui iniziano i dati che non sono stati trasmessi. Quando riesce ancora a collegarsi, scrive sul databse tutti i dati che non era riuscito a trasmettere prima. "/>
</node>
</node>
<node CREATED="1421600426683" ID="ID_1932860793" MODIFIED="1421719080758" TEXT="Ciclo infinito, ritornando a Wait()"/>
</node>
<node CREATED="1421601997867" ID="ID_1358388583" MODIFIED="1422576197131" POSITION="right" TEXT="GorConfigure: Configurazione e Tarature">
<node CREATED="1421602076743" ID="ID_1550156504" MODIFIED="1421605868236" TEXT="Il programma &#xe8; una Web application ASP .NET"/>
<node CREATED="1421602999587" ID="ID_137304889" MODIFIED="1422576197133" TEXT="Pagina di Configurazione">
<node CREATED="1421603014128" ID="ID_30991592" MODIFIED="1422576197134" TEXT="Sensori obbligatori">
<node CREATED="1421606243431" ID="ID_105778733" MODIFIED="1421606272722" TEXT="I tre sensori principali possono avere controlli &quot;fissi&quot; nella pagine"/>
</node>
<node CREATED="1421603024281" ID="ID_203561702" MODIFIED="1422576197135" TEXT="Aggiunta nuovi sensori">
<node CREATED="1421606374812" ID="ID_1375509684" MODIFIED="1421606384618" TEXT="Da fare DOPO la fine del progetto"/>
<node CREATED="1421606233952" ID="ID_1226304478" MODIFIED="1421606297446" TEXT="Se il programma deve essere generale ci vuole una Datagrid"/>
<node CREATED="1421606297998" ID="ID_1753569090" MODIFIED="1422576197136" TEXT="?? risolvere il problema dei parametri diversi in base al tipo di sensore che viene aggiunto">
<node CREATED="1421606428657" ID="ID_1146736985" MODIFIED="1422576197137" TEXT="problemi">
<node CREATED="1421606441869" ID="ID_761588909" MODIFIED="1421606472415" TEXT="come sapere quali parametri &quot;personalizzati&quot; ha un tipo di sensore"/>
<node CREATED="1421606472854" ID="ID_907302081" MODIFIED="1421606503189" TEXT="come visualizzare i par. &quot;personalizzati&quot; nella interfaccia utente"/>
</node>
<node CREATED="1421608626639" ID="ID_899832878" MODIFIED="1421608630048" TEXT="da discutere"/>
</node>
</node>
<node CREATED="1421608535922" ID="ID_1646225301" MODIFIED="1422576197137" TEXT="Configurazione dei sensori">
<node CREATED="1421608549130" ID="ID_960929352" MODIFIED="1421611047642" TEXT="Il file dei parametri del sensore &#xe8; un XML in cui viene serializzato il valore degli attibuti dell&apos;oggetto"/>
</node>
<node CREATED="1421603128439" ID="ID_1451386881" MODIFIED="1422576197138" TEXT="Nuovi metodi da aggiungere per i sensori!">
<arrowlink DESTINATION="ID_1451386881" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_60681097" STARTARROW="None" STARTINCLINATION="0;0;"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_1451386881" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_60681097" SOURCE="ID_1451386881" STARTARROW="None" STARTINCLINATION="0;0;"/>
<node CREATED="1421608707628" ID="ID_737799945" MODIFIED="1421608731097" TEXT="Usciti dal brainstormig fatto per questo programma"/>
<node CREATED="1421603160629" ID="ID_871456450" MODIFIED="1421603217459" TEXT="Chiedere a Targhini"/>
</node>
<node CREATED="1422359538215" ID="ID_1628838924" MODIFIED="1422359542916" TEXT="Tempo di campionamento"/>
</node>
<node CREATED="1421606128465" ID="ID_72964089" MODIFIED="1422578344650" TEXT="Pagina di interventi sul programma Acquire() mentre &#xe8; in esecuzione">
<node CREATED="1421606139744" ID="ID_1104708012" MODIFIED="1422576197142" TEXT="Chiusura">
<node CREATED="1421606184704" ID="ID_97763806" MODIFIED="1421606208075" TEXT="Spegne il programma"/>
<node CREATED="1421609768903" ID="ID_1008411600" MODIFIED="1421609858173" TEXT="Se c&apos;&#xe8; un watchdog, quando esce il programma lo deve disabilitare, altrimenti il computer si resetta"/>
</node>
<node CREATED="1421608791259" ID="ID_796521703" MODIFIED="1422576197143" TEXT="Ripartenza">
<node CREATED="1421608802773" ID="ID_1178528543" MODIFIED="1421608819077" TEXT="Controlla che il programma non stia gi&#xe0; girando"/>
<node CREATED="1421608820711" ID="ID_563413716" MODIFIED="1421608823709" TEXT="Lo lancia"/>
</node>
<node CREATED="1421609020733" ID="ID_183067783" MODIFIED="1422576197143" TEXT="?? campionamento ??">
<node CREATED="1421609029803" ID="ID_674792176" MODIFIED="1421609082576" TEXT="Fa un campionamento, in un momento diverso da quello previsto"/>
<node CREATED="1421609097958" ID="ID_1123244469" MODIFIED="1421609141267" TEXT="?? Si pu&#xf2; prendere il codice del campionamento dal programma Acquire"/>
</node>
<node CREATED="1421606515157" ID="ID_1132012659" MODIFIED="1422576197144" TEXT="Altri">
<node CREATED="1421606518645" ID="ID_1900455984" MODIFIED="1421609017808" TEXT="da inventare, quelli che servono"/>
</node>
<node CREATED="1422359538215" ID="ID_1474429048" MODIFIED="1422359542916" TEXT="Tempo di campionamento"/>
</node>
<node CREATED="1421602609502" ID="ID_338770243" MODIFIED="1422576197146" TEXT="Pagina di Taratura">
<node CREATED="1421602007162" ID="ID_317988145" MODIFIED="1421602075636" TEXT="Gli oggetti sensore espongono nella loro interfaccia i metodi per la taratura"/>
<node CREATED="1421602628829" ID="ID_651374830" MODIFIED="1421602632934" TEXT="Operazioni"/>
<node CREATED="1422359608905" ID="ID_1212616922" MODIFIED="1422576197149" TEXT="0 - spegne Acquire">
<node CREATED="1421683498624" ID="ID_1849190239" MODIFIED="1421683579174" TEXT="Meglio se viene fatta eseguire mentre il programma di acquisizione non gira: VERIFIFICARE ED AVVERTIRE (eventualmente spegnerlo automaticamente da pagina Web)"/>
</node>
<node CREATED="1421602633284" ID="ID_202291515" MODIFIED="1421602648976" TEXT="1 - Visualizza nel Web Form i sensori "/>
<node CREATED="1421603238725" ID="ID_788807555" MODIFIED="1422576197151" TEXT="2 - bottone &quot;Punto di taratura&quot;">
<node CREATED="1421604591092" ID="ID_752538811" MODIFIED="1421604626072" TEXT="legge il valore &quot;vero&quot; da una text box"/>
<node CREATED="1421605226329" ID="ID_614978487" MODIFIED="1422576197157" TEXT="chiama il metodo CalibrationPoint() del sensore passandogli il valore &quot;vero&quot;">
<node CREATED="1421604627865" ID="ID_702307182" MODIFIED="1421605778271" TEXT="il metodo legge il valore del sensore con una misurazione di ripetibilit&#xe0; (Lettura, non Misura() con N letture e calcolo dello scarto tipo)">
<arrowlink DESTINATION="ID_702307182" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_465085488" STARTARROW="None" STARTINCLINATION="0;0;"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_702307182" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_465085488" SOURCE="ID_702307182" STARTARROW="None" STARTINCLINATION="0;0;"/>
</node>
<node CREATED="1421604750981" ID="ID_620184323" MODIFIED="1421605213140" TEXT="memorizza i valori &quot;vero&quot; e misurato del punto, in un array da cui verranno presi al momento della conclusione della taratura"/>
<node CREATED="1421605337576" ID="ID_1235062794" MODIFIED="1421605432068" TEXT="comunica al programma chiamante il valore letto sul sensore e la sua variabilit&#xe0; (scarto)"/>
</node>
<node CREATED="1421604708210" ID="ID_1682759753" MODIFIED="1421604728811" TEXT="visualizza lo scarto tipo del punto di taratura"/>
</node>
<node CREATED="1421603250734" ID="ID_610126102" MODIFIED="1422576197160" TEXT="3 - bottone &quot;Chiudi Taratura&quot;">
<node CREATED="1421604815176" ID="ID_1818110386" MODIFIED="1421605836976" TEXT="Calcola i parametri della curva di taratura, prendendo i punti dall&apos;array"/>
<node CREATED="1421604840812" ID="ID_1360891916" MODIFIED="1422576197161" TEXT="Salva i parametri della curva di taratura nel file che sar&#xe0; letto dal sensore nel momento in cui viene istanziato">
<node CREATED="1421611111711" ID="ID_305319886" MODIFIED="1421611175825" TEXT="pu&#xf2; essere lo stesso file degli altri parametri di configurazione del sensore"/>
</node>
</node>
<node CREATED="1421604791696" ID="ID_744852096" MODIFIED="1422576197164" TEXT="4 - bottone &quot;Abort Taratura&quot;">
<node CREATED="1421604965373" ID="ID_284615443" MODIFIED="1421605014920" TEXT="Senza salvare, cancella i valori dei punti di taratura gi&#xe0; fatti"/>
</node>
</node>
</node>
<node CREATED="1421686257067" ID="ID_896310099" MODIFIED="1422576197165" POSITION="right" TEXT="Framework">
<node CREATED="1421686263471" ID="ID_664242002" MODIFIED="1421686298928" TEXT="Nel progetto Dente, che ho modificato, ho messo il framework 4.0"/>
</node>
<node CREATED="1422359405588" ID="ID_1195117691" MODIFIED="1422359409761" POSITION="right" TEXT="WLAN"/>
<node CREATED="1421611375806" ID="ID_1080514645" MODIFIED="1422576197167" POSITION="right" TEXT="Problemi difficili">
<node CREATED="1421611388989" ID="ID_184509696" MODIFIED="1422576197168" TEXT="Nuovo RTC, funzionante e della scuola (il mio non va..)">
<node CREATED="1421611505147" ID="ID_1606541121" MODIFIED="1421611551836" TEXT="Ha un&apos;interfaccia seriale non standard a 3 fili, c&apos;&#xe8; del codice abbastanza complicato in C cui ispirarsi"/>
</node>
<node CREATED="1421611610816" ID="ID_1004026128" MODIFIED="1422576197169" TEXT="DHT22">
<node CREATED="1421611637970" ID="ID_810035854" MODIFIED="1421611671419" TEXT="sensore digitale 1wire non standard"/>
<node CREATED="1421611673254" ID="ID_1652434770" MODIFIED="1421611813990" TEXT="si pu&#xf2; pilotare da un pin di I/O ispirandosi ad un programma python che eiste, funzionante e provato"/>
</node>
<node CREATED="1421611602796" ID="ID_1659294964" MODIFIED="1421611609576" TEXT="Watchdog"/>
</node>
<node CREATED="1421681009600" ID="ID_340586762" MODIFIED="1422576197172" POSITION="right" TEXT="Per progetto Garibaldi">
<node CREATED="1421681151264" ID="ID_1284025878" MODIFIED="1422576197173" TEXT="Dove deve andare?">
<node CREATED="1421740837925" ID="ID_1982781877" MODIFIED="1421740861788" TEXT="nella serra, in alto, ?? penzolante ??"/>
</node>
<node CREATED="1421681021413" ID="ID_901638378" MODIFIED="1421681025753" TEXT="Una scatola"/>
<node CREATED="1421681060905" ID="ID_515352302" MODIFIED="1422576197174" TEXT="PCB">
<node CREATED="1421681066850" ID="ID_76059247" MODIFIED="1421681074907" TEXT="Printed Circuit Board"/>
<node CREATED="1421740886729" ID="ID_1283263052" MODIFIED="1421740922911" TEXT="Con CAD per circuiti stampati o Fritzing"/>
<node CREATED="1421740929769" ID="ID_977520012" MODIFIED="1421740960097" TEXT="Stampato da Lombardi "/>
</node>
<node CREATED="1421681048968" ID="ID_1663544407" MODIFIED="1421681060505" TEXT="Cablaggi definitivi"/>
<node CREATED="1421681026130" ID="ID_1254205654" MODIFIED="1421681048491" TEXT="Installazione in serra"/>
<node CREATED="1421681128613" ID="ID_1119699639" MODIFIED="1422576197176" TEXT="Taratura">
<node CREATED="1421681091230" ID="ID_891473788" MODIFIED="1422576197177" TEXT="Taratura umidit&#xe0;">
<node CREATED="1421686554678" ID="ID_1456857220" MODIFIED="1421686572480" TEXT="Chiedere a Picci e Francisconi"/>
</node>
<node CREATED="1421681100670" ID="ID_913469684" MODIFIED="1421681110713" TEXT="Taratura luminosit&#xe0;"/>
<node CREATED="1421681111151" ID="ID_1297879765" MODIFIED="1421681125328" TEXT="Taratura temperatura"/>
</node>
</node>
</node>
</map>
