<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1415612391932" ID="ID_1455873036" MODIFIED="1415704811705" TEXT="Classi del programma">
<node CREATED="1415612399672" ID="ID_1643890703" MODIFIED="1415704822618" POSITION="right" TEXT="Sensori">
<node CREATED="1415612446989" FOLDED="true" ID="ID_781383240" MODIFIED="1415706630949" TEXT="Ogni sensore deriva da ISensor">
<node CREATED="1415616445128" ID="ID_424138271" MODIFIED="1415616472474" TEXT="Costruttore: viene passato se il sensore deve essere in simulazione o no"/>
<node CREATED="1415616473267" ID="ID_290271065" MODIFIED="1415616523286" TEXT="L&apos;oggetto ricorda se deve essere in simulazione ed ogni volta che viene chiamato Misurazione() simula o meno il comportamento del sensore"/>
</node>
<node CREATED="1415704860125" ID="ID_396550769" MODIFIED="1415704866141" TEXT="ISensor">
<node CREATED="1415612488345" ID="ID_1051409897" MODIFIED="1415704837635" TEXT="Metodi">
<node CREATED="1415706522343" FOLDED="true" ID="ID_1338090631" MODIFIED="1415706619939" TEXT="Inizializzazione">
<node CREATED="1415706541882" ID="ID_1238904292" MODIFIED="1415706611796" TEXT="Provvede a fare tutte le operazioni sul sensore che sono necessarie prima di poterlo usare (sar&#xe0; eseguito una volta sola, prima di usare il sensore)"/>
</node>
<node CREATED="1415612622039" FOLDED="true" ID="ID_1372490647" MODIFIED="1415705004858" TEXT="Lettura">
<node CREATED="1415612647178" ID="ID_1360286058" MODIFIED="1415612655632" TEXT="legge il sensore"/>
<node CREATED="1415620177288" ID="ID_329164174" MODIFIED="1415704958787" TEXT="non fa elaborazioni"/>
<node CREATED="1415616885654" ID="ID_717283932" MODIFIED="1415616899827" TEXT="? restituisce un int?"/>
<node CREATED="1415704983568" ID="ID_606396083" MODIFIED="1415704994349" TEXT="ottiene un valore &quot;raw&quot;"/>
</node>
<node CREATED="1415612656490" ID="ID_20463665" MODIFIED="1415705113444" TEXT="Misurazione">
<node CREATED="1415616841698" ID="ID_589059073" MODIFIED="1415616876399" STYLE="fork" TEXT="restituisce un valore di classe Misura (vedi oltre)"/>
<node CREATED="1415612660844" ID="ID_1860468486" MODIFIED="1415612675439" TEXT="converte nell&apos;unit&#xe0; di misura"/>
<node CREATED="1415612783769" ID="ID_270264697" MODIFIED="1415616883815" TEXT="chiama Lettura()"/>
<node CREATED="1415706362132" ID="ID_1387935603" MODIFIED="1415706387836" TEXT="Misurazione deve avere due overload ">
<node CREATED="1415706389423" ID="ID_1140723965" MODIFIED="1415706395299" TEXT="Misurazione()"/>
<node CREATED="1415706395744" ID="ID_1537078753" MODIFIED="1415706430231" TEXT="Misurazione (DateTime IstanteSimulazione)">
<node CREATED="1415706432045" ID="ID_1216794234" MODIFIED="1415706506947" TEXT="Acquisisce il tempo per produrre un valore &quot;casuale&quot; che dipenda dalla stagione"/>
</node>
</node>
</node>
<node CREATED="1415612816588" ID="ID_504747394" MODIFIED="1415706635341" TEXT="Ripetibilit&#xe0;">
<node CREATED="1415612825981" ID="ID_1160002690" MODIFIED="1415612834325" TEXT="10 misure"/>
<node CREATED="1415612834733" FOLDED="true" ID="ID_698242781" MODIFIED="1415706672609" TEXT="return scarto tipo">
<node CREATED="1415705062423" ID="ID_555278650" MODIFIED="1415705073299" TEXT="scarto quadratico medio"/>
<node CREATED="1415706639685" ID="ID_1326858569" MODIFIED="1415706670468" TEXT="radice quadrata della somma del quadrato degli scostamenti dei valori rispetto al loro valor medio"/>
</node>
<node CREATED="1415706677451" ID="ID_1911708512" MODIFIED="1415706712922" TEXT="Per valutare grossolanamente le prestazioni del sensore"/>
<node CREATED="1415706713367" ID="ID_1620674927" MODIFIED="1415706788920" TEXT="Verr&#xe0; eseguito una volta al giorno, nel momento in cui, dai dati del giorno precedente, si prevede che il valore "/>
</node>
</node>
<node CREATED="1415612864233" ID="ID_481516" MODIFIED="1415705337827" TEXT="Propriet&#xe0;">
<node CREATED="1415612873698" ID="ID_875954426" MODIFIED="1415612895802" TEXT="UltimaMisura"/>
<node CREATED="1415612969700" ID="ID_48870568" MODIFIED="1415705346604" TEXT="bool Simulazione">
<node CREATED="1415612979269" ID="ID_748234960" MODIFIED="1415613037836" TEXT="se true quando viene chiamato Misurazione non si legge il sensore e si produce un valore casuale"/>
<node CREATED="1415705349675" ID="ID_132262913" MODIFIED="1415705352144" TEXT="sola lettura"/>
</node>
<node CREATED="1415706818652" ID="ID_763698069" MODIFIED="1415706831121" TEXT="MaxValue">
<node CREATED="1415706831917" ID="ID_1195294164" MODIFIED="1415706850262" TEXT="Valore della misurazione oltre il quale si &#xe8; certi che il sensore &#xe8; rotto"/>
</node>
<node CREATED="1415706818652" ID="ID_1972351737" MODIFIED="1415706870391" TEXT="MinValue">
<node CREATED="1415706831917" ID="ID_1713480254" MODIFIED="1415706881314" TEXT="Valore della misurazione al di sotto del quale si &#xe8; certi che il sensore &#xe8; rotto"/>
</node>
<node CREATED="1415706882667" ID="ID_608900921" MODIFIED="1415707011029" TEXT="AlarmMax">
<node CREATED="1415706894868" ID="ID_1809712799" MODIFIED="1415707003555" TEXT="Valore della misurazione al di sopra del quale il sensore &#xe8; rotto, oppure siamo in una condizione straordinaria, &quot;da allarme&quot; "/>
</node>
<node CREATED="1415706882667" ID="ID_335286115" MODIFIED="1415707021403" TEXT="AlarmMin">
<node CREATED="1415706894868" ID="ID_967849523" MODIFIED="1415707031108" TEXT="Valore della misurazione al di sotto del quale il sensore &#xe8; rotto, oppure siamo in una condizione straordinaria, &quot;da allarme&quot; "/>
</node>
</node>
<node CREATED="1415613071414" ID="ID_189729825" MODIFIED="1415705373190" TEXT="produzione del valore casuale">
<node CREATED="1415613044972" ID="ID_1355376790" MODIFIED="1415613066247" TEXT="ultimo valore + qualcosa di random"/>
<node CREATED="1415613085936" ID="ID_854149253" MODIFIED="1415705463659" TEXT="pi&#xf9; bello">
<node CREATED="1415613090433" ID="ID_835358880" MODIFIED="1415613118029" TEXT="valore casuale che dipende dall&apos;istante (inverno-primavera ..)"/>
</node>
</node>
</node>
<node CREATED="1415612915374" ID="ID_208266433" MODIFIED="1415705116309" TEXT="Classi">
<node CREATED="1415612921935" ID="ID_325774101" MODIFIED="1415705117340" TEXT="Misura">
<node CREATED="1415616579702" ID="ID_1166214514" MODIFIED="1415705118469" TEXT="Attributi">
<node CREATED="1415616584471" ID="ID_1043259305" MODIFIED="1415616814300" TEXT="double Value"/>
<node CREATED="1415706199640" ID="ID_1976522418" MODIFIED="1415706209687" TEXT="DateTime Istante">
<node CREATED="1415706210617" ID="ID_900064719" MODIFIED="1415706292304" TEXT="istante di tempo in cui viene effettuato il campionamento"/>
</node>
<node CREATED="1415616798485" FOLDED="true" ID="ID_1318816961" MODIFIED="1415705420607" TEXT="string Unit">
<node CREATED="1415619180720" ID="ID_585059390" MODIFIED="1415619195173" TEXT="fra parentesi quadre: l&apos;unit&#xe0; di misura"/>
<node CREATED="1415705132438" ID="ID_1717338700" MODIFIED="1415705133673" TEXT="es.">
<node CREATED="1415705134606" ID="ID_1983672422" MODIFIED="1415705139028" TEXT="[ms]"/>
<node CREATED="1415705139623" ID="ID_1203795647" MODIFIED="1415705143435" TEXT="[&#xb0;C]"/>
</node>
</node>
<node CREATED="1415616817839" FOLDED="true" ID="ID_1038369393" MODIFIED="1415705321161" TEXT="string DisplayFormat">
<node CREATED="1415619200858" ID="ID_790167894" MODIFIED="1415619363338" TEXT="da usare nel ToString(displayFormat)"/>
<node CREATED="1415619225115" ID="ID_1757370962" MODIFIED="1415705196813" TEXT="es.">
<node CREATED="1415619236805" ID="ID_296541574" MODIFIED="1415619252294" TEXT="value = 12.9493459"/>
<node CREATED="1415619227700" ID="ID_1859981411" MODIFIED="1415705212182" TEXT="&quot;0.00&quot;">
<node CREATED="1415619275889" ID="ID_388465840" MODIFIED="1415619302558" TEXT="12.95"/>
</node>
<node CREATED="1415619283370" ID="ID_1296867479" MODIFIED="1415705222695" TEXT="&quot;0.000&quot;">
<node CREATED="1415619291275" ID="ID_1232493393" MODIFIED="1415619299479" TEXT="12.949"/>
</node>
<node CREATED="1415619319982" FOLDED="true" ID="ID_1346908481" MODIFIED="1415705307496" TEXT="&quot;0&quot;">
<node CREATED="1415619324534" ID="ID_471179327" MODIFIED="1415619325894" TEXT="13"/>
</node>
</node>
</node>
<node CREATED="1415616911657" FOLDED="true" ID="ID_1228940039" MODIFIED="1415705331537" TEXT="int Lettura">
<node CREATED="1415616915433" ID="ID_1449954114" MODIFIED="1415616926168" TEXT="il valore &quot;raw&quot; del sensore"/>
<node CREATED="1415619487472" ID="ID_1407714667" MODIFIED="1415619503442" TEXT="ottenuto con il metodo Lettura()"/>
</node>
<node CREATED="1415707072559" ID="ID_47636539" MODIFIED="1415707086545" TEXT="int Errore">
<node CREATED="1415707142520" ID="ID_596656367" MODIFIED="1415707161646" TEXT="Codice numerico di errore"/>
</node>
<node CREATED="1415707164210" ID="ID_483457954" MODIFIED="1415707181133" TEXT="string TextError">
<node CREATED="1415707142520" ID="ID_299127597" MODIFIED="1415707196473" STYLE="fork" TEXT="Stringa di errore"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1415613162608" FOLDED="true" ID="ID_1518730068" MODIFIED="1415706139616" POSITION="right" TEXT="Programma di acquisizione">
<node CREATED="1415613310504" ID="ID_253253754" MODIFIED="1415613327567" TEXT="0 - istanziare sensori e accesso aDB"/>
<node CREATED="1415613196956" ID="ID_1510667823" MODIFIED="1415618000581" TEXT="1 - fare &quot;il giro&quot; delle acquisizioni"/>
<node CREATED="1415613221662" ID="ID_716449407" MODIFIED="1415617996301" TEXT="scrivere sul database"/>
<node CREATED="1415613236096" ID="ID_915243961" MODIFIED="1415613239565" TEXT="tornare a 1"/>
<node CREATED="1415613247280" ID="ID_1216185522" MODIFIED="1415705771498" TEXT="chi lo fa, fa l&apos;integrazione">
<node CREATED="1415618012021" ID="ID_270251939" MODIFIED="1415618033241" TEXT="si interfaccia con chi sviluppa il codice dei sensori"/>
<node CREATED="1415618033638" ID="ID_833174730" MODIFIED="1415618047608" TEXT="integra nel suo programma il lavoro degli altri"/>
</node>
</node>
<node CREATED="1415613271660" ID="ID_1221196046" MODIFIED="1415705803190" POSITION="right" TEXT="Scrittura su database">
<node CREATED="1415613299166" ID="ID_334927009" MODIFIED="1415613308948" TEXT="&#xe8; una classe"/>
<node CREATED="1415618525962" ID="ID_21809942" MODIFIED="1415618561683" TEXT="il programma principale istanzia questa classe, come &quot;simulazione&quot; o &quot;trasferimento reale&quot;"/>
<node CREATED="1415618567095" ID="ID_684034580" MODIFIED="1415618626970" TEXT="se &#xe8; istanziato come simulazione, il metodo che scrive sul database scrive sulla console"/>
</node>
</node>
</map>
