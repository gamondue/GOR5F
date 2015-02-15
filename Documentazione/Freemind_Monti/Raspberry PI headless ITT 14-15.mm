<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1356636942371" ID="ID_757975246" MODIFIED="1420190491656" TEXT="Raspberry PI headless">
<node CREATED="1358182794740" ID="ID_1416347831" MODIFIED="1423997825437" POSITION="right" TEXT="Copiare su una SD un file immagine, rendendola &quot;bootable&quot;">
<node CREATED="1358182828249" ID="ID_1967307488" MODIFIED="1361028515044" TEXT="l&apos;immagine potrebbe essere presa da Internet, o clonata da una card esistente, con la procedura descritta in seguito"/>
<node CREATED="1361028519559" ID="ID_1465778392" MODIFIED="1411979925711" TEXT="su windows">
<node CREATED="1361028526185" ID="ID_1615921910" MODIFIED="1361028549803" TEXT="usare Win32DiskImager.exe">
<node CREATED="1412009808180" ID="ID_1127335628" MODIFIED="1412009980310" TEXT="assicurarsi di eseguire il programma con diritti di amministratore, altrimenti non avr&#xe0; il diritto di scrivere sulla SDCard"/>
</node>
<node CREATED="1361028556063" ID="ID_794321095" MODIFIED="1411979936368" TEXT="scegliere il device su cui scrivere">
<node CREATED="1361028569586" ID="ID_508847094" MODIFIED="1361028573963" TEXT="ATTENZIONE!"/>
</node>
<node CREATED="1361028587308" ID="ID_156745454" MODIFIED="1411979937544" STYLE="fork" TEXT="scegliere il file di immagine">
<node CREATED="1411313147104" ID="ID_446539222" MODIFIED="1411313155212" TEXT="scaricato da Internet"/>
<node CREATED="1411313156025" ID="ID_407005100" MODIFIED="1411313158432" TEXT="oppure"/>
<node CREATED="1411313158819" ID="ID_1766362120" MODIFIED="1411313300921" TEXT="&quot;fotografato&quot; dalla SDcard di un sistema &quot;pronto&quot;, con i programmi che servono gi&#xe0; installati e configurati"/>
</node>
</node>
</node>
<node CREATED="1356636955633" ID="ID_761825239" MODIFIED="1424001137790" POSITION="right" TEXT="Configurazione headless &quot;da zero&quot;">
<node CREATED="1356636977035" ID="ID_866445894" MODIFIED="1356639532233" TEXT="Connettere il raspi alla Ethernet, con un server DHCP del quale si pu&#xf2; vedere il log"/>
<node CREATED="1356639532900" ID="ID_885597228" MODIFIED="1356639569719" TEXT="Alimentare il raspi, si accendono i LED relativi alla rete"/>
<node CREATED="1356637243385" ID="ID_1506666854" MODIFIED="1356639663846" TEXT="Cercare nel log del server DHCP l&apos;indirizzo che &#xe8; stato assegnato al raspi ( &#xe8; indicato come raspberrypi)"/>
<node CREATED="1411980192574" ID="ID_159108964" MODIFIED="1411980195246" TEXT="Oppure">
<node CREATED="1411980196094" ID="ID_1787294764" MODIFIED="1412032568196" TEXT="usare un ipscanner"/>
</node>
<node CREATED="1356639694742" ID="ID_1307448944" MODIFIED="1356639751935" TEXT="Far partire un client SSH (es. Putty) e collegarsi al raspi, utilizzando l&apos;indirizzo assegnato dal server DHCP"/>
<node CREATED="1356639764601" ID="ID_405019662" MODIFIED="1356639796890" TEXT="Accettare il certificato di sicurezza richiesto dal server SSH"/>
<node CREATED="1356639843435" ID="ID_918965901" MODIFIED="1356639870954" TEXT="Ci si collega al raspi e viene fatta la richiesta per il login da remoto"/>
<node CREATED="1356637132191" ID="ID_1562414222" MODIFIED="1423997851238" TEXT="Login utente">
<node CREATED="1356637139424" ID="ID_1066788689" MODIFIED="1411980431291" TEXT="Utente sudoer di default all&apos;inizializzazione di Raspbian">
<node CREATED="1356637161189" ID="ID_701243109" MODIFIED="1356637163742" TEXT="pi"/>
</node>
<node CREATED="1356637139424" ID="ID_285374584" MODIFIED="1411980429275" TEXT="Password di default">
<node CREATED="1356637166724" ID="ID_1715841156" MODIFIED="1356637170942" TEXT="raspberry"/>
</node>
</node>
<node CREATED="1356637430095" FOLDED="true" ID="ID_1807659478" MODIFIED="1423999527509" TEXT="Esecuzione del programma di configurazione">
<node CREATED="1361031250019" ID="ID_1608441541" MODIFIED="1361031327866" TEXT="se abbiamo monitor e tastiera la prima volta parte automaticamente il programma di configurazione"/>
<node CREATED="1356637453822" ID="ID_1149703422" MODIFIED="1411469697584" TEXT="se configuriamo un sistema headless, si finisce in una normale shell. Come consigliato al boot">
<node CREATED="1356639881511" ID="ID_1731852722" MODIFIED="1411469703423" TEXT="eseguire">
<node CREATED="1356637444154" ID="ID_349659770" MODIFIED="1356637445121" TEXT="sudo raspi-config"/>
</node>
</node>
<node CREATED="1423997980917" ID="ID_231665482" MODIFIED="1423997987269" TEXT="Expand filesystem">
<node CREATED="1423997988371" ID="ID_539333335" MODIFIED="1423998024031" TEXT="permette di usare tutta la SD card che &#xe8; inserita attualmente nel raspi"/>
<node CREATED="1423998024443" ID="ID_982463547" MODIFIED="1423998138723" TEXT="se si fa una copia campione, da ripodurre, farlo solo su SD card identiche a quelle dove la copia deve essere riprodotta, altrimenti rischia di non starci, se le altre SD card sono solo di un po&apos; pi&#xf9; piccole (anche per pochi byte)."/>
<node CREATED="1423998140419" ID="ID_290067051" MODIFIED="1423998163327" TEXT="se si espande il filesystem, rifare il boot"/>
</node>
<node CREATED="1423998773438" ID="ID_330593352" MODIFIED="1423998783030" TEXT="Enable boot to desktop">
<node CREATED="1423998783830" ID="ID_1996318101" MODIFIED="1423998784893" TEXT="no"/>
<node CREATED="1356638638805" ID="ID_710351292" MODIFIED="1423999050100" TEXT="boot-behaviour">
<node CREATED="1356639018458" ID="ID_317557424" MODIFIED="1412032977833" TEXT="straight to desktop">
<node CREATED="1356639056202" ID="ID_139972516" MODIFIED="1411258449411" TEXT="per un sistema headless no (il desktop principale non serve perch&#xe8; non lo attacchiamo mai ad un monitor)"/>
</node>
</node>
</node>
<node CREATED="1423998403431" ID="ID_519146128" MODIFIED="1423998419482" TEXT="Internalizationalization Options">
<node CREATED="1356637846397" FOLDED="true" ID="ID_1798652892" MODIFIED="1423998508251" TEXT="change_locale">
<node CREATED="1356637854765" ID="ID_633379180" MODIFIED="1356646396569" TEXT="it_IT@euro ISO-8859-15"/>
<node CREATED="1412032739658" ID="ID_1755998823" MODIFIED="1412032820402" TEXT="per ora no">
<node CREATED="1356637854765" ID="ID_1856226033" MODIFIED="1356646313309" TEXT="it_IT ISO-8859-1"/>
<node CREATED="1356637854765" ID="ID_618953991" MODIFIED="1356646324868" TEXT="it_IT-UTF-8 UTF-8"/>
</node>
<node CREATED="1356637977954" ID="ID_93854620" MODIFIED="1412032821985" TEXT="Selezione del locale di default">
<node CREATED="1356637990185" ID="ID_778490272" MODIFIED="1356637993468" TEXT="Scelto"/>
<node CREATED="1356637993705" ID="ID_75875926" MODIFIED="1423998501732" TEXT="it_IT@euro"/>
<node CREATED="1356646428019" ID="ID_308086863" MODIFIED="1423998372262" TEXT="en_GB-UTF-8">
<icon BUILTIN="button_ok"/>
<node CREATED="1356646439178" ID="ID_1090790505" MODIFIED="1356646454680" TEXT="c&apos;&#xe8; di default anche senza sceglierlo"/>
</node>
</node>
<node CREATED="1356637854765" ID="ID_679309584" MODIFIED="1411982326109" TEXT="en_GB.UTF-8 UTF-8">
<node CREATED="1356647212144" ID="ID_355678345" MODIFIED="1357130241959" TEXT="il default del sistema"/>
</node>
</node>
<node CREATED="1356638029988" ID="ID_1383819974" MODIFIED="1411982329365" TEXT="change_timezone">
<node CREATED="1356638037111" ID="ID_504220339" MODIFIED="1356638069234" TEXT="europe ! Rome"/>
</node>
<node CREATED="1423998611851" ID="ID_1708126689" MODIFIED="1423998622094" TEXT="keyboard layout">
<node CREATED="1423998720352" ID="ID_304413664" MODIFIED="1423998750122" TEXT="scelta l&apos;opzione, tastiera configurata automaticamente"/>
</node>
</node>
<node CREATED="1423998787716" ID="ID_1723353414" MODIFIED="1423998797755" TEXT="enable camera">
<node CREATED="1423998798742" ID="ID_562327861" MODIFIED="1423998799730" TEXT="no"/>
</node>
<node CREATED="1423998801940" ID="ID_1956074855" MODIFIED="1423998811250" TEXT="Add to Rastrack">
<node CREATED="1423998812146" ID="ID_722488516" MODIFIED="1423998813516" TEXT="no"/>
</node>
<node CREATED="1356638596941" ID="ID_913426627" MODIFIED="1411982343495" TEXT="overclock">
<node CREATED="1356638610677" ID="ID_1846694316" MODIFIED="1356638615954" TEXT="non cambiato"/>
</node>
<node CREATED="1423997924192" ID="ID_582255699" MODIFIED="1423997928444" TEXT="Opzioni avanzate">
<node CREATED="1361031380186" ID="ID_706566414" MODIFIED="1411982320037" TEXT="overscan">
<node CREATED="1361031393553" ID="ID_771521924" MODIFIED="1361031455214" TEXT="mette un bordo nero intorno al frame video, per poter vedere le parti esterne del video anche su vecchi televisori"/>
<node CREATED="1423997878908" ID="ID_552852140" MODIFIED="1423997882521" TEXT="non necessario"/>
</node>
<node CREATED="1412033002009" ID="ID_297942279" MODIFIED="1412033006114" TEXT="hostname">
<node CREATED="1412033007914" ID="ID_1180288347" MODIFIED="1423998896462" TEXT="garden-100">
<node CREATED="1423998897269" ID="ID_470999435" MODIFIED="1423998912884" TEXT="100 ultimo Byte dell&apos;indirizzo IP"/>
</node>
</node>
<node CREATED="1356638108927" ID="ID_465915920" MODIFIED="1411982330461" TEXT="memory_split">
<node CREATED="1356638209387" ID="ID_229197870" MODIFIED="1356638243541" TEXT="stabilisce quanta memoria assegnare alla scheda video e quanta alla CPU"/>
<node CREATED="1356638243906" ID="ID_234124611" MODIFIED="1423998947822" TEXT="per un sistema headless, consigliato">
<node CREATED="1356638259218" ID="ID_1645675725" MODIFIED="1356638260874" TEXT="224MiB for Arm, 32MiB for VideoCore"/>
<node CREATED="1423998967760" ID="ID_1768377313" MODIFIED="1423999015293" TEXT="io ho messo il minimo per la grafica (GPU)">
<node CREATED="1423998976950" ID="ID_457142399" MODIFIED="1423998980669" TEXT="16"/>
</node>
</node>
</node>
<node CREATED="1356638629638" ID="ID_1716908824" MODIFIED="1423999199234" TEXT="SSH">
<node CREATED="1356638632410" ID="ID_1622809758" MODIFIED="1356638636344" TEXT="non cambiato"/>
<node CREATED="1411258371505" ID="ID_794081062" MODIFIED="1411258382184" TEXT="abilitato di default"/>
</node>
<node CREATED="1423999199803" ID="ID_594927166" MODIFIED="1423999206960" TEXT="Device Tree">
<node CREATED="1423999207850" ID="ID_897530715" MODIFIED="1423999235768" TEXT="nuova opzione per versioni recenti di Raspbian"/>
<node CREATED="1423999236108" ID="ID_1846507858" MODIFIED="1423999240142" TEXT="lasciata intoccata"/>
</node>
<node CREATED="1423999244585" ID="ID_1942028278" MODIFIED="1423999245757" TEXT="SPI">
<node CREATED="1423999266414" ID="ID_1373468991" MODIFIED="1423999282263" TEXT="Per &quot;GOR&quot; da abilitare, al boot"/>
</node>
<node CREATED="1423999244585" ID="ID_998252523" MODIFIED="1423999320866" TEXT="I2C">
<node CREATED="1423999266414" ID="ID_1298729027" MODIFIED="1423999282263" TEXT="Per &quot;GOR&quot; da abilitare, al boot"/>
</node>
<node CREATED="1423999321326" ID="ID_1110771244" MODIFIED="1423999325076" TEXT="Serial">
<node CREATED="1423999325726" ID="ID_27034014" MODIFIED="1423999351283" TEXT="Solo se serve (RICORDARSI di abilitarla, se serve!)"/>
</node>
<node CREATED="1423999361862" ID="ID_364754183" MODIFIED="1423999364162" TEXT="Audio">
<node CREATED="1423999366364" ID="ID_537813849" MODIFIED="1423999374822" TEXT="non toccato"/>
</node>
<node CREATED="1423999375812" ID="ID_978751586" MODIFIED="1423999393565" TEXT="Update">
<node CREATED="1423999394364" ID="ID_1266293107" MODIFIED="1423999396130" TEXT="fatto"/>
</node>
</node>
<node CREATED="1356639204094" ID="ID_707507361" MODIFIED="1356639208771" TEXT="finish"/>
<node CREATED="1356646528914" FOLDED="true" ID="ID_1184414937" MODIFIED="1423997948212" TEXT="per riconfigurare la tastiera senza questo programma:">
<node CREATED="1356646545630" ID="ID_239319851" MODIFIED="1356646547347" TEXT="sudo dpkg-reconfigure keyboard-configuration"/>
</node>
</node>
<node CREATED="1362406986100" FOLDED="true" ID="ID_239732714" MODIFIED="1423999551302" TEXT="cambio della password dell&apos;utente pi">
<node CREATED="1362406995358" ID="ID_673346401" MODIFIED="1362417326863" TEXT="sudo passwd pi"/>
<node CREATED="1412033090870" ID="ID_866712052" MODIFIED="1412033095510" TEXT="se serve">
<node CREATED="1423999532840" ID="ID_1271529375" MODIFIED="1423999548913" TEXT="non fatto per le immagini da usare in GOR"/>
</node>
</node>
<node CREATED="1357127416679" ID="ID_28344809" MODIFIED="1412073417766" TEXT="Cambiare il nome al computer">
<node CREATED="1411314828835" ID="ID_785571024" MODIFIED="1411476024614" TEXT="meglio farlo con il programma di configurazione iniziale">
<node CREATED="1356637444154" ID="ID_1003442830" MODIFIED="1356637445121" TEXT="sudo raspi-config"/>
<node CREATED="1411314891949" ID="ID_1034055090" MODIFIED="1411314916933" TEXT="c&apos;&#xe8; una riga di scelta per il cambio del nome del sistema"/>
</node>
<node CREATED="1423999561579" ID="ID_619764739" MODIFIED="1423999564376" TEXT="altrimenti">
<node CREATED="1361033887371" ID="ID_362193859" MODIFIED="1412073432282" TEXT="modificare il file /etc/hostname">
<node CREATED="1361033867039" ID="ID_694009186" MODIFIED="1361033867039">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <code>sudo nano /etc/hostname</code>
  </body>
</html></richcontent>
</node>
<node CREATED="1361033904641" ID="ID_1888965753" MODIFIED="1361033980331" TEXT="sostituire raspberrypi con il nuovo nome che si deve dare al computer"/>
</node>
<node CREATED="1361033887371" ID="ID_33128930" MODIFIED="1412033118356" TEXT="modificare il file /etc/hosts">
<node CREATED="1361033867039" ID="ID_163681417" MODIFIED="1361034142287">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      <code>sudo nano /etc/hosts</code>
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1361033904641" ID="ID_150729008" MODIFIED="1361033980331" TEXT="sostituire raspberrypi con il nuovo nome che si deve dare al computer"/>
</node>
</node>
<node CREATED="1361034143885" ID="ID_1672561948" MODIFIED="1362257262599" TEXT="al reboot successivo il computer avr&#xe0; cambiato nome"/>
</node>
<node CREATED="1411314450771" ID="ID_393983498" MODIFIED="1412073386674" TEXT="eventuale creazione di nuovi utenti">
<node CREATED="1411314533741" ID="ID_1425619124" MODIFIED="1411314545252" TEXT="adduser &lt;nome del nuovo utente&gt;"/>
</node>
</node>
<node CREATED="1362407579091" FOLDED="true" ID="ID_1264442117" MODIFIED="1424000044103" POSITION="right" TEXT="Configurazione dell&apos;interfaccia di rete">
<node CREATED="1362407780625" FOLDED="true" ID="ID_410364146" MODIFIED="1423999678310" TEXT="configurazione con indirizzo IP dinamico">
<node CREATED="1394472297114" ID="ID_1047720353" MODIFIED="1394472307192" TEXT="impostata di default">
<node CREATED="1362408095562" ID="ID_518052469" MODIFIED="1412033225318" TEXT="nel file /etc/network/interfaces"/>
<node CREATED="1412033232521" ID="ID_128749952" MODIFIED="1412033250482" TEXT="deve esserci la seguente scritta, non commentata"/>
<node CREATED="1412033189680" ID="ID_721339414" MODIFIED="1412033193354" TEXT="iface eth0 inet dhcp"/>
</node>
<node CREATED="1394472321354" ID="ID_593392438" MODIFIED="1394472337151" TEXT="(per rimetterla se la si &#xe8; tolta, vedere in seguito)"/>
</node>
<node CREATED="1362407780625" FOLDED="true" ID="ID_1665436016" MODIFIED="1423999953731" TEXT="configurazione con indirizzo IP statico">
<node CREATED="1362408095562" ID="ID_79926291" MODIFIED="1423999699114" TEXT="modificare il file nano /etc/network/interfaces">
<node CREATED="1423999699114" ID="ID_855703110" MODIFIED="1423999702241" TEXT="sudo nano /etc/network/interfaces"/>
<node CREATED="1362419673627" ID="ID_32858449" MODIFIED="1412073735464">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      # interfaccia di loopback
    </p>
    <p>
      auto lo
    </p>
    <p>
      iface lo inet loopback
    </p>
    <p>
      
    </p>
    <p>
      # configurazione automatica in dhcp per la scheda di rete cablata:
    </p>
    <p>
      # commentata per funzionare in modo statico
    </p>
    <p>
      #iface eth0 inet dhcp
    </p>
    <p>
      
    </p>
    <p>
      # configurazione con indirizzo IP statico per la scheda di rete cablata:
    </p>
    <p>
      # indirizzo IP di default
    </p>
    <p>
      auto eth0
    </p>
    <p>
      iface eth0 inet static
    </p>
    <p>
      address 172.16.13.100
    </p>
    <p>
      netmask 255.255.0.0
    </p>
    <p>
      network 172.16.0.0
    </p>
    <p>
      broadcast 172.16.255.255
    </p>
    <p>
      gateway 172.16.46.254
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362419718635" ID="ID_1680593565" MODIFIED="1423999851709" TEXT="dare l&apos;indirizzo: 172.16.13.1XX">
<node CREATED="1394475859787" ID="ID_692190741" MODIFIED="1412033496431" TEXT="Dove XX &#xe8; il numero di registro dell&apos;allievo"/>
</node>
<node CREATED="1362762858837" ID="ID_20186002" MODIFIED="1412034684730" TEXT="per far ripartire il software di rete e leggere la nuova configurazione senza spegnere il computer">
<node CREATED="1362762783694" ID="ID_1197924327" MODIFIED="1423999902436" TEXT="sudo /etc/init.d/networking restart"/>
</node>
<node CREATED="1394477069831" ID="ID_1037577989" MODIFIED="1412034828678" TEXT="per far ripartire la sola scheda di rete">
<node CREATED="1394477084095" FOLDED="true" ID="ID_780858677" MODIFIED="1423999913248" TEXT="sudo ifconfig eth0 down">
<node CREATED="1394477230358" ID="ID_1604011757" MODIFIED="1394477274515" TEXT="naturalmente la scheda si spegne, per cui questa &#xe8; da evitare se si &#xe8; in sessione remota (da terminale esterno al raspi)"/>
</node>
<node CREATED="1394477084095" ID="ID_627840899" MODIFIED="1423999915289" TEXT="sudo ifconfig eth0 up"/>
</node>
</node>
<node CREATED="1362832331797" FOLDED="true" ID="ID_1236788913" MODIFIED="1424000023116" TEXT="indirizzi dei server DNS">
<node CREATED="1362832350371" ID="ID_1263605277" MODIFIED="1412034833590" TEXT="aggiunto hagrid come primo server DNS"/>
<node CREATED="1362832521317" ID="ID_1087925179" MODIFIED="1412034461619" TEXT="modificare /etc/resolv.conf">
<node CREATED="1362832521317" ID="ID_999483608" MODIFIED="1363029649283" STYLE="fork" TEXT="sudo nano /etc/resolv.conf"/>
<node CREATED="1362832587420" ID="ID_1004600470" MODIFIED="1424000021762" TEXT="aggiungere nella prima riga (se non c&apos;&#xe8; gi&#xe0;):">
<node CREATED="1362832606644" ID="ID_1132671706" MODIFIED="1423961485191" TEXT="nameserver 172.16.46.254">
<node CREATED="1411314991649" ID="ID_1653559026" MODIFIED="1411314995973" TEXT="(&#xe8; hagrid)"/>
</node>
</node>
</node>
</node>
<node CREATED="1423960884073" FOLDED="true" ID="ID_968675959" MODIFIED="1424000038891" TEXT="se c&apos;&#xe8; NetworkManager che configura la rete, meglio disabilitarlo (si pu&#xf2; configurare solo da GUI)">
<node CREATED="1423961402113" ID="ID_1077037931" MODIFIED="1423961402113" TEXT="sudo /etc/init.d/network-manager stop">
<node CREATED="1423961418019" ID="ID_721645570" MODIFIED="1423961450459" TEXT="se questo Sw non &#xe8; installato il comando non lo trova."/>
</node>
<node CREATED="1423961160577" ID="ID_585005337" MODIFIED="1423961192751" TEXT="mostra le interfacce che sono gestite da Network Manager. ">
<node CREATED="1423961153478" ID="ID_1903994350" MODIFIED="1423961159703" TEXT="$ nmcli dev status"/>
</node>
</node>
</node>
<node CREATED="1424000397067" FOLDED="true" ID="ID_563131089" MODIFIED="1424001378661" POSITION="right" TEXT="Disinstallazione programmi inutili per uso headless">
<node CREATED="1424000964388" ID="ID_1387385760" MODIFIED="1424000971969" TEXT="Mathematica">
<node CREATED="1424001162643" ID="ID_1607923740" MODIFIED="1424001349058" TEXT="prende 460 MByte, che possono essere utili.."/>
<node CREATED="1424001224213" ID="ID_1084440940" MODIFIED="1424001308235" TEXT="sudo apt-get purge wolfram-engine"/>
</node>
</node>
<node CREATED="1362406953971" ID="ID_720375592" MODIFIED="1424001384818" POSITION="right" TEXT="Aggiornamenti vari (da fare prima di tutte le nuove installazioni di programmi)">
<node CREATED="1362406965532" ID="ID_76207515" MODIFIED="1362406966705" TEXT="sudo apt-get update"/>
<node CREATED="1362406959150" ID="ID_1141248444" MODIFIED="1362406959917" TEXT="sudo apt-get upgrade"/>
</node>
<node CREATED="1356654108245" FOLDED="true" ID="ID_1661543619" MODIFIED="1424002153383" POSITION="right" TEXT="Server LAMP">
<node CREATED="1411986234593" ID="ID_1641980693" MODIFIED="1412036539739" TEXT="LAMP = Linux Apache MySql Php"/>
<node CREATED="1363356906364" FOLDED="true" ID="ID_533113047" MODIFIED="1424001620986" TEXT="apache">
<node CREATED="1363356911465" ID="ID_1523833780" MODIFIED="1363356914716" TEXT="Web server"/>
<node CREATED="1363357020382" ID="ID_1718274411" MODIFIED="1363357022102" TEXT="sudo apt-get install apache2"/>
<node CREATED="1411315405720" ID="ID_698931631" MODIFIED="1411986371330" TEXT="Prova del web server">
<node CREATED="1411315416854" ID="ID_92596751" MODIFIED="1411986374755" TEXT="Puntare il browser sull&apos;indirizzo IP del Raspberry">
<node CREATED="1411315444931" ID="ID_1675371980" MODIFIED="1411315494714" TEXT="scrivere 172.16.13.100 nella barra degli indirizzi (URL) del browser"/>
<node CREATED="1411316147352" ID="ID_1021747019" MODIFIED="1411986399806" TEXT="esce la home page di default">
<node CREATED="1411316166334" ID="ID_619263461" MODIFIED="1411316174446" TEXT="It works!"/>
</node>
</node>
</node>
</node>
<node CREATED="1362408087514" FOLDED="true" ID="ID_1406234059" MODIFIED="1424001619928" TEXT="MySql">
<node CREATED="1411315514884" ID="ID_1310938675" MODIFIED="1411315523030" TEXT="MySql &#xe8; un database server"/>
<node CREATED="1362408083974" ID="ID_11869430" MODIFIED="1362408086468" TEXT="sudo apt-get install mysql-server"/>
<node CREATED="1411316394750" ID="ID_1894587776" MODIFIED="1411316408841" TEXT="Dettagli della configurazione in altro momento">
<node CREATED="1412036468118" ID="ID_1984588323" MODIFIED="1412036486427" TEXT="password utente root MySql">
<node CREATED="1412036487605" ID="ID_959593303" MODIFIED="1412036491087" TEXT="raspberry"/>
</node>
</node>
</node>
<node CREATED="1363356957722" ID="ID_485364723" MODIFIED="1411986465061" TEXT="php">
<node CREATED="1363356962701" ID="ID_1946784399" MODIFIED="1363356978213" TEXT="linguaggio di programmazione lato server"/>
<node CREATED="1363358678842" ID="ID_878866690" MODIFIED="1363358680682" TEXT="sudo apt-get install php5"/>
<node CREATED="1363358713256" ID="ID_1964768115" MODIFIED="1411986472479" TEXT="sudo apt-get install php5-mysql">
<node CREATED="1411316297833" ID="ID_166892246" MODIFIED="1411316309517" TEXT="per usare MySql da php"/>
</node>
<node CREATED="1424002110991" ID="ID_1750563042" MODIFIED="1424002111899" TEXT="sudo apt-get install php5-sybase">
<node CREATED="1411316297833" ID="ID_1877630346" MODIFIED="1424002125795" TEXT="per usare Microsoft SQL server da php"/>
</node>
<node CREATED="1363367435732" ID="ID_1370079261" MODIFIED="1411986483152" TEXT="prova del php">
<node CREATED="1363367466613" ID="ID_559038471" MODIFIED="1411986485840" TEXT="creare un file php di prova nella cartella della home page del web server">
<node CREATED="1363367511082" ID="ID_1849472555" MODIFIED="1411986495621" TEXT="passare nella cartella home">
<node CREATED="1363367502728" ID="ID_469486905" MODIFIED="1363367510452" TEXT="cd /var/www"/>
</node>
<node CREATED="1363367538402" ID="ID_1180304159" MODIFIED="1411987107155" TEXT="creare il file">
<node CREATED="1363367462622" ID="ID_13096832" MODIFIED="1411317078341" TEXT="sudo nano info.php"/>
</node>
<node CREATED="1363367545858" ID="ID_958432393" MODIFIED="1411987109093" TEXT="mettere nel file la pi&#xf9; semplice pagina php">
<node CREATED="1363367581111" ID="ID_925348143" MODIFIED="1363367606124">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      &lt;?php<br/>&#xa0;&#xa0;&#xa0;&#xa0;phpinfo();
    </p>
    <p>
      ?&gt;
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1412037231702" ID="ID_849235371" MODIFIED="1412037240524" TEXT="in un file .php">
<node CREATED="1412037241869" ID="ID_452521214" MODIFIED="1412037251178" TEXT="es. info.php"/>
</node>
</node>
<node CREATED="1363367729547" ID="ID_53494993" MODIFIED="1412037252851" TEXT="da un browser, caricare la pagina php">
<node CREATED="1363367758312" ID="ID_41565455" MODIFIED="1363367796207" TEXT="mettere nel browser la URI"/>
<node CREATED="1363367796559" ID="ID_287184838" MODIFIED="1412037260806" TEXT="http://172.16.13.100/info.php"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1363597286998" FOLDED="true" ID="ID_1669574243" MODIFIED="1424007088824" POSITION="right" TEXT="Server FTP">
<node CREATED="1411294254343" ID="ID_1179389226" MODIFIED="1411986527390" TEXT="Installare il server FTP">
<node CREATED="1383697611108" ID="ID_1717263234" MODIFIED="1411986532025" TEXT="sudo apt-get install vsftpd">
<arrowlink DESTINATION="ID_1717263234" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_166761568" STARTARROW="None" STARTINCLINATION="0;0;"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_1717263234" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_166761568" SOURCE="ID_1717263234" STARTARROW="None" STARTINCLINATION="0;0;"/>
<node CREATED="1383697700481" ID="ID_1067523463" MODIFIED="1411986552401" TEXT="vsftpd">
<node CREATED="1383697661968" ID="ID_273091524" MODIFIED="1383697664827" TEXT="&quot;Very Secure FTP Daemon&quot;"/>
<node CREATED="1383697712036" ID="ID_1259432311" MODIFIED="1383697754028" TEXT="&#xe8; installato di default in Ubuntu, CentOS, Fedora, Slackware, Red Hat Linux .."/>
</node>
</node>
</node>
<node CREATED="1383697841764" ID="ID_430875814" MODIFIED="1411986578948" TEXT="configurare il server ftp">
<node CREATED="1383697850981" ID="ID_1792280373" MODIFIED="1424002221043" TEXT="editare /etc/vsftpd.conf">
<node CREATED="1383697857913" ID="ID_733680411" MODIFIED="1383697862662" TEXT="sudo nano /etc/vsftpd.conf"/>
<node CREATED="1383697884662" ID="ID_368501931" MODIFIED="1411986585812" TEXT="cambiare">
<node CREATED="1383697888407" ID="ID_1162351026" MODIFIED="1383698908858" TEXT="se non si vuole accesso anonimo modificare: &#xa;anonymous_enable=YES &#xa;in &#xa;anonymous_enable=NO&#xa;&#xa;togliere il commento da: &#xa;local_enable=YES &#xa;e da:&#xa;write_enable=YES&#xa;&#xa;alla file del file aggiungere la linea: &#xa;force_dot_files=YES&#xa;&#xa;Salvare ed uscire da nano&#xa;"/>
<node CREATED="1383698955935" ID="ID_439078716" MODIFIED="1424002295597" TEXT="force_dot_files=YES">
<node CREATED="1383699030726" ID="ID_1571737969" MODIFIED="1383699068523" TEXT="mostra i file nascosti che iniziano per . ed i puntatori alle cartelle superiori .."/>
<node CREATED="1383699069071" ID="ID_1137046064" MODIFIED="1383699102729" TEXT="utile per non sovrascrivere per sbaglio file che sono presenti ma non visibili perch&#xe8; hanno il punto all&apos;inizio"/>
</node>
</node>
</node>
</node>
<node CREATED="1383699174793" ID="ID_24520569" MODIFIED="1411986644426" TEXT="far ripartire il server, per applicare la nuova configurazione">
<node CREATED="1383699200768" ID="ID_422162275" MODIFIED="1383699202222" TEXT="sudo service vsftpd restart"/>
</node>
<node CREATED="1411294678557" FOLDED="true" ID="ID_374998580" MODIFIED="1424002350974" TEXT="Serve se si vuole gestire il RaspberryPi come server http controllato da remoto">
<node CREATED="1411344761412" ID="ID_115381903" MODIFIED="1411344806664" TEXT="con FTP si scriveranno i file del sito nella giusta cartella sul server"/>
<node CREATED="1411344807222" ID="ID_994018899" MODIFIED="1411344873528" TEXT="all&apos;installazione il proprietario della cartella del sito &#xe8; l&apos;utente root, quindi da FTP non &#xe8; possibile scrivere nella cartella"/>
<node CREATED="1383696564310" ID="ID_102435823" MODIFIED="1411344903144" TEXT="se si vuole scrivere nella cartella del sito da remoto via FTP, &#xe8; necessario cambiare il proprietario della cartella homepage del sito web">
<node CREATED="1411294731083" ID="ID_1046032793" MODIFIED="1411294865329" TEXT="cos&#xec; potremo fare l&apos;upload sulle cartelle del sito, entrando in FTP con l&apos;utente indicato in seguito"/>
<node CREATED="1383697500071" FOLDED="true" ID="ID_1788247852" MODIFIED="1424002345332" TEXT="sudo chown -R pi /var/www">
<node CREATED="1383697537456" ID="ID_985795851" MODIFIED="1383697573990" TEXT="-R = recursive fa operare il cambio di owner ricorsivamente su tutte le sottocartelle"/>
<node CREATED="1411294766588" ID="ID_239705215" MODIFIED="1411294822466" TEXT="pi &#xe8; l&apos;utente con cui faremo il login ftp (qui &#xe8; l&apos;utente di default, se si entra con un altro utente, mettere il suo nome qui)"/>
</node>
</node>
</node>
<node CREATED="1412037125256" ID="ID_219394154" MODIFIED="1412037148628" TEXT="Provare il server FTP con un client (p.es. Filezilla)"/>
</node>
<node CREATED="1411258936925" FOLDED="true" ID="ID_1767617393" MODIFIED="1424007086569" POSITION="right" TEXT="Intallazione e configurazione di I2C">
<node CREATED="1411258979470" ID="ID_819548151" MODIFIED="1411259040679" TEXT="all&apos;installazione I2C &#xe8; disabilitato. Per abilitarlo si modifica il file di configurazione del driver I2C"/>
<node CREATED="1411259044803" ID="ID_1221324913" MODIFIED="1412038252880" TEXT="sudo nano /etc/modprobe.d/raspi-blacklist.conf">
<node CREATED="1411259173179" ID="ID_701418848" MODIFIED="1411259195243" TEXT="Il file potrebbe essere cos&#xec;:"/>
<node CREATED="1411259101069" ID="ID_533258270" MODIFIED="1411259203033" TEXT="# blacklist spi and i2c by default (many users don&apos;t need them)  &#xa;blacklist spi-bcm2708 &#xa;blacklist i2c-bcm2708 ">
<node CREATED="1412038300130" ID="ID_589983874" MODIFIED="1412038312278" TEXT="in tal caso deve diventare cos&#xec;:">
<node CREATED="1411259101069" ID="ID_1306814393" MODIFIED="1412038322395" TEXT="# blacklist spi and i2c by default (many users don&apos;t need them)  &#xa;blacklist spi-bcm2708 &#xa;#blacklist i2c-bcm2708 "/>
</node>
</node>
<node CREATED="1411259205269" ID="ID_152265635" MODIFIED="1412037711068" TEXT="La presenza in blacklist del modulo I2C viene disabilitata"/>
</node>
<node CREATED="1411259331863" ID="ID_305384711" MODIFIED="1412037783757" STYLE="fork" TEXT="Editare l&apos;elenco dei moduli del kernel, aggiungendoci in fondo all&apos;ultima riga, la scritta i2c-dev">
<node CREATED="1411259350788" ID="ID_1775996892" MODIFIED="1411259406658" TEXT="sudo nano /etc/modules"/>
<node CREATED="1411259562910" ID="ID_1234093222" MODIFIED="1411259611700" TEXT="aggiungere a mano una riga dopo l&apos;ultima riga del file"/>
<node CREATED="1411259616106" ID="ID_150766631" MODIFIED="1412037800876" TEXT="il testo della riga da aggiungere">
<node CREATED="1411259622481" ID="ID_823714619" MODIFIED="1411987441085" TEXT="i2c-dev"/>
</node>
</node>
<node CREATED="1411259530397" ID="ID_1462857263" MODIFIED="1411259548413" TEXT="Installare gli strumenti per i2C:">
<node CREATED="1411259531820" ID="ID_879076123" MODIFIED="1411259534087" TEXT="sudo apt-get install i2c-tools"/>
<node CREATED="1411259718888" ID="ID_469153826" MODIFIED="1411260029516" TEXT="Aggiungere ora un nuovo utente, gestore del bus I2C">
<node CREATED="1411259748309" ID="ID_1560295088" MODIFIED="1411259749450" TEXT="sudo adduser pi i2c"/>
</node>
</node>
<node CREATED="1411260038962" FOLDED="true" ID="ID_1050908276" MODIFIED="1424002736813" TEXT="far ripartire il raspberry">
<node CREATED="1411987458905" ID="ID_1716478077" MODIFIED="1424002576100" TEXT="sudo reboot"/>
</node>
<node CREATED="1411260068245" ID="ID_1318291141" MODIFIED="1412037865613" TEXT="dopo la ripartenza si dovrebbero vedere i device I2C collegati">
<node CREATED="1411317767039" ID="ID_1535383111" MODIFIED="1411317802776" TEXT="programma che trova i device I2C che sono attualmente collegati al RasPI"/>
<node CREATED="1411260278101" FOLDED="true" ID="ID_240501922" MODIFIED="1424002747958" TEXT="sudo i2cdetect -y 1">
<node CREATED="1411260244793" ID="ID_135503867" MODIFIED="1424002745143" TEXT="oppure (se RaspPI vecchia (rev.1))">
<node CREATED="1411260271836" ID="ID_1526765265" MODIFIED="1411260288185" TEXT="sudo i2cdetect -y 0"/>
</node>
</node>
</node>
<node CREATED="1411324057653" ID="ID_1330862068" MODIFIED="1411427149779" TEXT="Comandi di i2ctools">
<node CREATED="1411324108806" ID="ID_1845061163" MODIFIED="1411427149786" TEXT="i2cdetect">
<node CREATED="1411324115977" ID="ID_71930745" MODIFIED="1411324146317" TEXT="permette di vedere a quali indirizzi si trovano device I2C"/>
<node CREATED="1411324275986" ID="ID_1560946245" MODIFIED="1420229288211" TEXT="Opzioni">
<node CREATED="1411324282951" ID="ID_439197180" MODIFIED="1411324307572" TEXT="-y disabilita la visualizzazione interattiva"/>
</node>
<node CREATED="1411324156678" ID="ID_864300485" MODIFIED="1414364546904" TEXT="Uso: i2cdetect &lt;i2cbus&gt;">
<node CREATED="1411317905868" ID="ID_1424368850" MODIFIED="1414364549607" TEXT="&lt;i2cbus&gt; &#xe8; il numero della porta I2C del Raspberry">
<node CREATED="1411318091442" ID="ID_344303551" MODIFIED="1411318094720" TEXT="nella revisione 2 del Raspi deve essere 1 "/>
<node CREATED="1411318101815" ID="ID_1134198701" MODIFIED="1411318131783" TEXT="la revisione 2 ha la porta 0 per la telecamera, la 1 &#xe8; quella &quot;usabile&quot;"/>
</node>
</node>
<node CREATED="1411324156678" ID="ID_730608909" MODIFIED="1411427149788" TEXT="Uso 2: i2cdetect -l">
<node CREATED="1411317905868" ID="ID_1117451628" MODIFIED="1411324435268" TEXT="-l (list) scansiona e visualizza tutte le porte I2C presenti nel computer"/>
</node>
</node>
<node CREATED="1411322061240" ID="ID_37328396" MODIFIED="1411468784914" TEXT="i2cdump">
<node CREATED="1411322067919" ID="ID_477293992" MODIFIED="1411322976413" TEXT="Per esaminare i registri del chip visibili attraverso la I2C"/>
<node CREATED="1411322939331" ID="ID_1018234559" MODIFIED="1411323212544" TEXT="Legge moolti registri e li presenta in forma tabellare, con i valori in esadecimale ed in ASCII"/>
<node CREATED="1411317905868" FOLDED="true" ID="ID_1934193581" MODIFIED="1411344678364" TEXT="uso: i2cdump  [-r &lt;primo&gt;-&lt;ultimo&gt;] &lt;i2cbus&gt; &lt;chip-address&gt; ">
<node CREATED="1411323293308" ID="ID_1281996488" MODIFIED="1411323561317" TEXT="-r (range) permette di specificare l&apos;intervallo di registri che si and&#xe0; a leggere"/>
<node CREATED="1411322863797" ID="ID_1290600230" MODIFIED="1411323551206" TEXT="gli altri parametri sono gli stessi degli altri comandi"/>
<node CREATED="1411323610268" FOLDED="true" ID="ID_827821895" MODIFIED="1411344678364" TEXT="es.">
<node CREATED="1411323611660" ID="ID_773120936" MODIFIED="1411323613122" TEXT="i2cdump -r 0-0xF 1 0x51 "/>
</node>
</node>
</node>
<node CREATED="1411318956625" ID="ID_801601984" MODIFIED="1411468651035" TEXT=" i2cget">
<node CREATED="1411318959125" ID="ID_1637430695" MODIFIED="1411468681373" TEXT="legge i registri dei dispositivi I2C collegati al raspberry">
<node CREATED="1411322917636" ID="ID_457703465" MODIFIED="1411322929652" TEXT="legge un Byte dal registro indicato"/>
</node>
<node CREATED="1411317905868" ID="ID_760868322" MODIFIED="1411468685824" TEXT="uso: i2cget &lt;i2cbus&gt; &lt;chip-address&gt; [&lt;data-address&gt;]">
<node CREATED="1411317905868" ID="ID_950184004" MODIFIED="1411318090083" TEXT="&lt;i2cbus&gt; &#xe8; il numero della porta I2C del Raspberry"/>
<node CREATED="1411318080846" FOLDED="true" ID="ID_1831808080" MODIFIED="1411344678364" TEXT="&lt;chip-address&gt;">
<node CREATED="1411318142153" ID="ID_1507161602" MODIFIED="1411319057112" TEXT="indirizzo del chip che si vuole leggere"/>
<node CREATED="1411319241503" ID="ID_927494126" MODIFIED="1411319257190" TEXT="vuole un numero decimale"/>
<node CREATED="1411319257758" ID="ID_1570544103" MODIFIED="1411319581938" TEXT="per dare l&apos;indirizzo in esadecimale, farlo precedere da 0x"/>
</node>
<node CREATED="1411318080846" FOLDED="true" ID="ID_23505392" MODIFIED="1411344678364" TEXT="&lt;data-address&gt;">
<node CREATED="1411318142153" ID="ID_823385943" MODIFIED="1411319100117" TEXT="numero del registro dentro il chip che si vuole leggere"/>
<node CREATED="1411319059667" FOLDED="true" ID="ID_229585677" MODIFIED="1411344678364" TEXT="[]">
<node CREATED="1411319064284" ID="ID_5442360" MODIFIED="1411319068865" TEXT="opzionale"/>
<node CREATED="1411319201636" ID="ID_1312253543" MODIFIED="1411319214484" TEXT="se si omette mostra solo il primo registro"/>
</node>
</node>
<node CREATED="1411319224549" ID="ID_777588551" MODIFIED="1411469127169" TEXT="es.">
<node CREATED="1411319285141" ID="ID_1577316149" MODIFIED="1411319562612" TEXT="i2cget 1 0x51 "/>
</node>
</node>
</node>
<node CREATED="1411317754309" ID="ID_235721832" MODIFIED="1414718554385" TEXT="i2cset">
<node CREATED="1411317849731" ID="ID_163843902" MODIFIED="1411317871422" TEXT="scrive nei registri dei device I2C collegati al raspberry"/>
<node CREATED="1411317905868" FOLDED="true" ID="ID_513038067" MODIFIED="1411344678364" TEXT="uso: i2cset  &lt;i2cbus&gt; &lt;chip-address&gt; &lt;data-address&gt;">
<node CREATED="1411322886858" ID="ID_304278121" MODIFIED="1411322896699" TEXT="i parametri sono gli stessi dell&apos;altro comando"/>
<node CREATED="1411318080846" FOLDED="true" ID="ID_1498797071" MODIFIED="1411344678364" TEXT="&lt;chip-address&gt;">
<node CREATED="1411318142153" ID="ID_973065023" MODIFIED="1411319057112" TEXT="indirizzo del chip che si vuole leggere"/>
<node CREATED="1411319241503" ID="ID_615088787" MODIFIED="1411319257190" TEXT="vuole un numero decimale"/>
<node CREATED="1411319257758" ID="ID_1818615721" MODIFIED="1411319581938" TEXT="per dare l&apos;indirizzo in esadecimale, farlo precedere da 0x"/>
</node>
<node CREATED="1411318080846" FOLDED="true" ID="ID_239829830" MODIFIED="1411344678364" TEXT="&lt;data-address&gt;">
<node CREATED="1411318142153" ID="ID_790040623" MODIFIED="1411319100117" TEXT="numero del registro dentro il chip che si vuole leggere"/>
<node CREATED="1411319059667" FOLDED="true" ID="ID_1543821653" MODIFIED="1411344678364" TEXT="[]">
<node CREATED="1411319064284" ID="ID_875653583" MODIFIED="1411319068865" TEXT="opzionale"/>
<node CREATED="1411319201636" ID="ID_16874982" MODIFIED="1411319214484" TEXT="se si omette mostra solo il primo registro"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1411260446980" ID="ID_716212828" MODIFIED="1411987604817" TEXT="Installazione del modulo Python per I2C (SMBus)">
<node CREATED="1411260484176" ID="ID_1783172640" MODIFIED="1411260487177" TEXT="sudo apt-get install python-smbus"/>
</node>
</node>
<node CREATED="1357141894691" FOLDED="true" ID="ID_756966032" MODIFIED="1412038964614" POSITION="left" TEXT="NAS Server SMB">
<node CREATED="1357141934575" FOLDED="true" ID="ID_123290289" MODIFIED="1411344678364" TEXT="Installazione di Samba">
<node CREATED="1357142992339" ID="ID_1704255972" MODIFIED="1357142997581" TEXT="se non c&apos;&#xe8; gi&#xe0;!"/>
<node CREATED="1357141943357" FOLDED="true" ID="ID_897622139" MODIFIED="1411344678364" TEXT="da CUI">
<node CREATED="1357141948017" ID="ID_131306674" MODIFIED="1357142046318" TEXT="sudo apt-get install samba samba-common-bin"/>
</node>
<node CREATED="1357141950370" FOLDED="true" ID="ID_130362211" MODIFIED="1411344678364" TEXT="da GUI">
<node CREATED="1357141953560" FOLDED="true" ID="ID_1004079657" MODIFIED="1411344678364" TEXT="synaptic">
<node CREATED="1357143019944" ID="ID_1467871049" MODIFIED="1357143484742" TEXT="cercare samba"/>
<node CREATED="1357143485029" FOLDED="true" ID="ID_769265080" MODIFIED="1411344678364" TEXT="installare il metapackage &quot;samba&quot;, se non c&apos;&#xe8; gi&#xe0;">
<node CREATED="1357143504226" ID="ID_1146413832" MODIFIED="1357143534276" TEXT="la presenza del server samba deve essere citata nei commenti in synaptic"/>
</node>
<node CREATED="1357143485029" FOLDED="true" ID="ID_864153904" MODIFIED="1411344678364" TEXT="installare il metapackage &quot;samba-common-bin&quot;, se non c&apos;&#xe8; gi&#xe0;">
<node CREATED="1357143504226" ID="ID_381120892" MODIFIED="1358185169313" TEXT="solo &quot;samba&quot; non &#xe8; bastato!"/>
</node>
</node>
</node>
<node CREATED="1357142075529" FOLDED="true" ID="ID_809015766" MODIFIED="1411344678364" TEXT="backup del file di configurazione di samba (just in case!)">
<node CREATED="1357142107651" ID="ID_882156315" MODIFIED="1357142110741" TEXT="sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.old"/>
</node>
<node CREATED="1357142261643" FOLDED="true" ID="ID_1629216549" MODIFIED="1411344678364" TEXT="modifica del file di configurazione di samba">
<node CREATED="1357142279127" ID="ID_860982333" MODIFIED="1357142280402" TEXT="sudo nano /etc/samba/smb.conf"/>
<node CREATED="1357142294780" ID="ID_1955748626" MODIFIED="1357142341121" TEXT="modificare la riga che riguarda la sicurezza dell&apos;accesso in modo che diventi"/>
<node CREATED="1357142349525" ID="ID_1902979504" MODIFIED="1357142390779" TEXT="(^W per cercare la parola &quot;security&quot;)"/>
<node CREATED="1357142298590" ID="ID_749416849" MODIFIED="1357142299877" TEXT="security = user"/>
<node CREATED="1357142699649" ID="ID_1459705693" MODIFIED="1357142725027" TEXT="(dovrebbe bastare togliere il #, simbolo di commento)"/>
<node CREATED="1357143117032" FOLDED="true" ID="ID_96923523" MODIFIED="1411344678364" TEXT="configurazione delle home degli utenti">
<node CREATED="1357143134493" ID="ID_1725564389" MODIFIED="1357143170867" TEXT="cercare con nano la stringa [homes]"/>
<node CREATED="1357143211026" ID="ID_929730473" MODIFIED="1357143264366" TEXT="qualche riga sotto [homes], modificare la riga che riguarda i diritti di scrittura, in questo modo:"/>
<node CREATED="1357143254675" ID="ID_165618516" MODIFIED="1357143256269" TEXT="read only = no"/>
<node CREATED="1357144540458" ID="ID_1120291456" MODIFIED="1357144863580" TEXT="ATTENZIONE: le home directory sono nella SDcard, bisogna dire agli utenti di non esagerare con la memorizzazione in queste cartelle! "/>
<node CREATED="1357147228102" FOLDED="true" ID="ID_1820642493" MODIFIED="1411344678364" TEXT="fare i nuovi utenti che servono ed associarli a samba">
<node CREATED="1357147309495" ID="ID_1556322392" MODIFIED="1357147311870" TEXT="esempio"/>
</node>
</node>
</node>
<node CREATED="1357143312395" FOLDED="true" ID="ID_832736195" MODIFIED="1411344678364" TEXT="assegnazione di utenti samba e loro password">
<node CREATED="1357143336727" ID="ID_730944206" MODIFIED="1357144880932" TEXT="usare il comando smbpasswd per associare un utente unix ad un utente samba e dargli una password"/>
<node CREATED="1357143394296" ID="ID_558475322" MODIFIED="1357143421666" TEXT="la password samba pu&#xf2; essere diversa dalla password unix"/>
<node CREATED="1357144920863" FOLDED="true" ID="ID_911371619" MODIFIED="1411344678364" TEXT="esempio">
<node CREATED="1357143330446" ID="ID_1808346593" MODIFIED="1357143335173" TEXT="sudo smbpasswd -a pi"/>
<node CREATED="1357144926554" ID="ID_1907967121" MODIFIED="1357144946800" TEXT="per l&apos;utente di default del raspi (utente pi)"/>
<node CREATED="1357147144493" ID="ID_1240402582" MODIFIED="1357147189232" TEXT="nella configurazione ho messa la stessa password di Unix (raspberry)"/>
</node>
<node CREATED="1357158932990" ID="ID_806193436" MODIFIED="1357159067800" TEXT="creare tutti gli utenti che serviranno per la gestione del file server, assegnargli una password ed aggiungerli agli utenti samba"/>
<node CREATED="1357158960456" FOLDED="true" ID="ID_501121704" MODIFIED="1411344678364" TEXT="es.">
<node CREATED="1357158963493" FOLDED="true" ID="ID_1482083597" MODIFIED="1411344678364" TEXT="sudo useradd lettore -m -G users">
<node CREATED="1357159107229" ID="ID_1156133470" MODIFIED="1357159126535" TEXT="(aggiunge al gruppo degli &quot;users&quot;)"/>
</node>
<node CREATED="1357159076733" FOLDED="true" ID="ID_547258892" MODIFIED="1411344678364" TEXT="sudo passwd lettore">
<node CREATED="1357159131648" ID="ID_1889280217" MODIFIED="1357159243769" TEXT="assegna la password Unix all&apos;utente appena creato"/>
<node CREATED="1357159287286" ID="ID_153884726" MODIFIED="1357159299885" TEXT="es. leggere"/>
</node>
<node CREATED="1357159159150" FOLDED="true" ID="ID_868310141" MODIFIED="1411344678364" TEXT="sudo smbpasswd -a lettore">
<node CREATED="1357159246113" ID="ID_945028810" MODIFIED="1357159286199" TEXT="associa l&apos;utente lettore a samba e ne chiede la password"/>
<node CREATED="1357159413919" ID="ID_1766576056" MODIFIED="1357159425613" TEXT="es. password leggere"/>
</node>
<node CREATED="1357158963493" ID="ID_1716396352" MODIFIED="1357159014995" TEXT="sudo useradd scrittore -m -G users"/>
<node CREATED="1357159087697" FOLDED="true" ID="ID_586582335" MODIFIED="1411344678364" TEXT="sudo passwd scrittore">
<node CREATED="1357159366087" ID="ID_578773573" MODIFIED="1357159474825" TEXT="es. password: tutto"/>
</node>
<node CREATED="1357159159150" FOLDED="true" ID="ID_1837935722" MODIFIED="1411344678364" TEXT="sudo smbpasswd -a scrittore">
<node CREATED="1357159366087" ID="ID_1612039347" MODIFIED="1357159469199" TEXT="es. password: diversa"/>
<node CREATED="1357159504106" ID="ID_683432490" MODIFIED="1357159527784" TEXT="dove si vede che le password Unix e Samba possono essere diverse"/>
</node>
</node>
</node>
<node CREATED="1357142790381" FOLDED="true" ID="ID_265410825" MODIFIED="1411344678364" TEXT="riavvio del demone di samba, che legge le modifiche effettuate sul file smb.conf">
<node CREATED="1357142819210" ID="ID_122707362" MODIFIED="1357142820977" TEXT="sudo /etc/init.d/samba restart"/>
</node>
<node CREATED="1357144892163" FOLDED="true" ID="ID_800959021" MODIFIED="1411344678364" TEXT="prova di una condivisione da Windows">
<node CREATED="1357147374704" FOLDED="true" ID="ID_1130720901" MODIFIED="1411344678364" TEXT="nella barra della path di Windows digitare">
<node CREATED="1357157706376" ID="ID_1100478046" MODIFIED="1357157738228" TEXT="il nome del raspi od il suo indirizzo IP"/>
<node CREATED="1357157743917" FOLDED="true" ID="ID_1897570122" MODIFIED="1411344678364" TEXT="il nome della condivisione">
<node CREATED="1357157764191" ID="ID_298903230" MODIFIED="1357157809527" TEXT="se la condivisione &#xe8; una delle home directory degli utenti, coincide con il nome dell&apos;utente"/>
</node>
<node CREATED="1357157828759" ID="ID_453638233" MODIFIED="1357157846996" TEXT="dare le credenziali dell&apos;utente quando vengono richieste"/>
</node>
<node CREATED="1357147429334" FOLDED="true" ID="ID_227794316" MODIFIED="1411344678364" TEXT="esempio">
<node CREATED="1357158134982" ID="ID_1420009120" MODIFIED="1357158136753" TEXT="\\raspberrypi\pi"/>
<node CREATED="1357158131813" ID="ID_312632735" MODIFIED="1357158134366" TEXT="o anche"/>
<node CREATED="1357147432989" ID="ID_1900347511" MODIFIED="1357147433870" TEXT="\\172.16.46.144\pi"/>
<node CREATED="1357158137198" ID="ID_392265512" MODIFIED="1357158152194" TEXT="se non funziona con il nome, provare con l&apos;indirizzo IP"/>
<node CREATED="1357147434693" ID="ID_1659443969" MODIFIED="1357158190111" TEXT="vengono richiesti nome utente (pi) e la password SAMBA  impostata (raspberry)"/>
<node CREATED="1357147450012" ID="ID_213387025" MODIFIED="1357158213480" TEXT="si finisce nella home directory dell&apos;utente pi, con diritti di lettura e scrittura"/>
<node CREATED="1357147462553" ID="ID_1716961850" MODIFIED="1357157936578" TEXT="provare a creare un file ed a vederlo da shell con ls"/>
</node>
</node>
<node CREATED="1357157970591" FOLDED="true" ID="ID_1964732148" MODIFIED="1411344678364" TEXT="condivisione di una cartella di un hard disk esterno USB, o una chiavetta flash">
<node CREATED="1357158650129" ID="ID_1113233990" MODIFIED="1357158673332" TEXT="inserire il disco ed accendere"/>
<node CREATED="1357158673603" ID="ID_1443611025" MODIFIED="1357158705747" TEXT="nella cartella /media appare una cartella che ha il nome del volume appena inserito"/>
<node CREATED="1357158810961" FOLDED="true" ID="ID_203620325" MODIFIED="1411344678364" TEXT="spostarsi nella cartella /media">
<node CREATED="1357158830381" ID="ID_1243507736" MODIFIED="1357158831314" TEXT="$ cd /media"/>
</node>
<node CREATED="1357158835390" FOLDED="true" ID="ID_841958731" MODIFIED="1411344678364" TEXT="individuare la cartella che corrisponde al disco che si vuole condividere">
<node CREATED="1357158866164" ID="ID_885157673" MODIFIED="1357158868843" TEXT="es."/>
<node CREATED="1357158869513" ID="ID_241601772" MODIFIED="1357158874551" TEXT="discoditutti"/>
</node>
<node CREATED="1357161506053" FOLDED="true" ID="ID_440934619" MODIFIED="1411344678364" TEXT="editare il file smb.conf">
<node CREATED="1357161524968" ID="ID_1881006179" MODIFIED="1357161527038" TEXT="sudo nano /etc/samba/smb.conf"/>
</node>
<node CREATED="1357161536380" FOLDED="true" ID="ID_247368166" MODIFIED="1411344678364" TEXT="aggiungere in fondo al file la configurazione della cartella del disco esterno come cartella condivisa">
<node CREATED="1357161579909" ID="ID_1587388317" MODIFIED="1357162956197" TEXT="[dischi]&#xa;comment = dischi rimovibili&#xa;path = /media/&#xa;valid users = @users&#xa;force group = users&#xa;create mask = 0660&#xa;directory mask = 0771&#xa;read only = yes"/>
<node CREATED="1357162226646" ID="ID_211948087" MODIFIED="1357163130957" TEXT="Queste linee definiscono una condivisione che si chiama public, che &#xe8; accessibile in sola lettura da tutti i membri del gruppo users. La cartella condivisa del Raspbery &#xe8; /media, per cui qualunque disco o chiavetta aggiuntiva potr&#xe0; essere vista ed usata attraverso la rete. "/>
<node CREATED="1357163132899" ID="ID_1298547483" MODIFIED="1357163447922" TEXT="Se si vuole che l&apos;utente possa anche scrivere nelle cartelle in condivizione, potranno sorgere problemi legati ai diritti di accesso a file e cartelle. Si risolveranno cambiando i diritti di accesso alla cartella od al file, con chmod, cambiando l&apos;utente proprietario della cartella, con chown od il gruppo proprietario con chgrp. "/>
<node CREATED="1357163913517" ID="ID_315799957" MODIFIED="1357164033306" TEXT="Se il disco &#xe8; formattato con ntfs il sistema potrebbe rifuitarsi di montarlo in scrittura. Il tal caso lo si dovr&#xe0; utilizzare in sola lettura, od accettare il rischio della scrittura su filesystem NTFS da parte di Linux."/>
</node>
<node CREATED="1357161778064" ID="ID_1037483032" MODIFIED="1357161912294" TEXT="I Linux moderni montano automaticamente i drive removibili all&apos;accensione, od al momento dell&apos;inserzione. Se cos&#xec; non fosse, bisogna montare a mano con il comando mount, e/o scrivere nel file /etc/fstab i dati del drove per il montaggio automatico. "/>
<node CREATED="1357142790381" FOLDED="true" ID="ID_866892107" MODIFIED="1411344678364" TEXT="riavvio del demone di samba">
<node CREATED="1357142819210" ID="ID_973244183" MODIFIED="1357142820977" TEXT="sudo /etc/init.d/samba restart"/>
</node>
</node>
</node>
</node>
<node CREATED="1356738208796" FOLDED="true" ID="ID_363363194" MODIFIED="1412038962206" POSITION="left" TEXT="Installazione e configurazione di Gnome">
<node CREATED="1356738228029" FOLDED="true" ID="ID_1726150811" MODIFIED="1411344678364" TEXT="Installazione">
<node CREATED="1356739020844" FOLDED="true" ID="ID_598678646" MODIFIED="1411344678364" TEXT="&#xe8; enorme">
<node CREATED="1356739283976" ID="ID_1525372154" MODIFIED="1356739297690" TEXT="Scarica 500 Mbyte da Internet"/>
<node CREATED="1357137145839" ID="ID_793419244" MODIFIED="1357137163036" TEXT="non ci sta in una SDcard da 4 GByte"/>
</node>
<node CREATED="1362257288802" ID="ID_1507215912" MODIFIED="1362257300570" TEXT="sudo apt-get update"/>
<node CREATED="1362257288802" ID="ID_998418576" MODIFIED="1362257309592" TEXT="sudo apt-get upgrade"/>
<node CREATED="1356738223741" ID="ID_1083067607" MODIFIED="1362257319256" TEXT="sudo apt-get install gnome-desktop-environment"/>
<node CREATED="1356738864134" FOLDED="true" ID="ID_1076783864" MODIFIED="1411344678364" TEXT="display manager">
<node CREATED="1356738880404" ID="ID_1045545795" MODIFIED="1356738886085" TEXT="scelto lightdm"/>
</node>
<node CREATED="1362268159002" ID="ID_320332284" MODIFIED="1362268175279" TEXT="quattro ore di installazione"/>
</node>
</node>
<node CREATED="1356642908689" FOLDED="true" ID="ID_1539020407" MODIFIED="1412038958687" POSITION="left" TEXT="Installazione e configurazione programmi">
<node CREATED="1197841180109" FOLDED="true" ID="Freemind_Link_1935974070" MODIFIED="1411344678379" TEXT="Aptitude">
<node CREATED="1356642933240" ID="ID_466254707" MODIFIED="1356642937189" TEXT="solo testo"/>
<node CREATED="1253512297014" ID="_Freemind_Link_1357150821" MODIFIED="1253512297014" TEXT="Serve per Installare, aggiornare, rimuovere programmi in forma binaria da Ubuntu server"/>
<node CREATED="1253512297014" ID="_Freemind_Link_323539782" MODIFIED="1253512297014" TEXT="Eseguire dalla shell (#sudo aptitude)"/>
<node CREATED="1197841187156" ID="Freemind_Link_836033168" MODIFIED="1197841236468" TEXT="Una versione testuale dei vari programmi come Synaptic che si trovano sotto interfacce grafiche"/>
<node CREATED="1197841301609" ID="Freemind_Link_483970954" MODIFIED="1197841353468" TEXT="Navigare sul package da installare, aggiornare o rimuovere"/>
<node CREATED="1253512297014" FOLDED="true" ID="_Freemind_Link_667377924" MODIFIED="1411344678364" TEXT="I menu si usano premendo F10">
<node CREATED="1253512297014" FOLDED="true" ID="_Freemind_Link_1600094717" MODIFIED="1411344678364" TEXT="nel menu di help c&apos;&#xe8; anche il riepilogo dei comandi &quot;letterali&quot; del programma">
<node CREATED="1253512297014" ID="ID_1238180948" MODIFIED="1253512297014" TEXT="quei comandi che si danno pigiando una lettera"/>
</node>
<node CREATED="1253512297014" ID="_ID_1727581030" MODIFIED="1253512297014" TEXT="serve!"/>
</node>
<node CREATED="1284747351678" ID="ID_1033010243" MODIFIED="1284747422569" TEXT="Per selezionare per l&apos;installazione un package premere + e diventa verde"/>
<node CREATED="1284747425689" FOLDED="true" ID="ID_1604495497" MODIFIED="1411344678379" TEXT="Per fare le azioni definite sui package selezionati">
<node CREATED="1284747855562" ID="ID_1176764778" MODIFIED="1284747872447" TEXT="g - visualizza quello che &#xe8; selezionato"/>
<node CREATED="1284747872889" ID="ID_1055016213" MODIFIED="1284747902293" TEXT="g (una seconda volta) esegue le azioni selezionate sui package selezionati (installa)"/>
</node>
</node>
<node CREATED="1356654047209" FOLDED="true" ID="ID_449885077" MODIFIED="1411344678379" TEXT="Aggiornamenti">
<node CREATED="1356654053067" ID="ID_898340931" MODIFIED="1356654064788" TEXT="sudo aptitude update"/>
<node CREATED="1356654053067" ID="ID_363344977" MODIFIED="1356654072679" TEXT="sudo aptitude upgrade"/>
</node>
<node CREATED="1357138817825" FOLDED="true" ID="ID_1675263049" MODIFIED="1411344678379" TEXT="synaptic">
<node CREATED="1357138890065" ID="ID_1959888096" MODIFIED="1357138901846" TEXT="Programma grafico di installazione appplicazioni"/>
<node CREATED="1357138726727" FOLDED="true" ID="ID_682550419" MODIFIED="1411344678379" TEXT="Installare">
<node CREATED="1357138742532" ID="ID_605654674" MODIFIED="1357138743736" TEXT="sudo apt-get install synaptic"/>
<node CREATED="1357138744523" FOLDED="true" ID="ID_1934329897" MODIFIED="1411344678379" TEXT="una volta finito, per eseguirlo: ">
<node CREATED="1357139053309" FOLDED="true" ID="ID_1739915109" MODIFIED="1411344678379" TEXT="da terminale">
<node CREATED="1357139059972" ID="ID_1937223719" MODIFIED="1357139065098" TEXT="gksudo synaptic &amp;"/>
</node>
<node CREATED="1357139292093" FOLDED="true" ID="ID_1242576344" MODIFIED="1411344678379" TEXT="dal men&#xf9; &quot;Start&quot;">
<node CREATED="1357139304398" ID="ID_1462673228" MODIFIED="1357139322314" TEXT="Preferenze | Gestore di pacchetti"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1363597348175" FOLDED="true" ID="ID_1269755464" MODIFIED="1424004989689" POSITION="left" TEXT="Creazione di utenti per uso particolare">
<node CREATED="1363597361957" FOLDED="true" ID="ID_805644339" MODIFIED="1411344678379" TEXT="in server MySql">
<node CREATED="1363597370929" ID="ID_285891740" MODIFIED="1411258826761" TEXT="utente: "/>
<node CREATED="1363597378823" ID="ID_1964898019" MODIFIED="1411258829755" TEXT="password: "/>
</node>
<node CREATED="1363597361957" FOLDED="true" ID="ID_192059379" MODIFIED="1411344678379" TEXT="in server LAMP">
<node CREATED="1363597370929" ID="ID_945237492" MODIFIED="1411258833218" TEXT="utente: "/>
<node CREATED="1363597378823" ID="ID_845355168" MODIFIED="1411258840672" TEXT="password: "/>
</node>
</node>
<node CREATED="1361909792974" FOLDED="true" ID="ID_940526742" MODIFIED="1424007079201" POSITION="left" TEXT="Bluetooth">
<node CREATED="1361909803090" FOLDED="true" ID="ID_810926519" MODIFIED="1411344678379" TEXT="sudo apt-get install bluetooth bluez-utils blueman">
<node CREATED="1361912878793" ID="ID_672083686" MODIFIED="1361912883263" TEXT="oppure"/>
<node CREATED="1361912883753" ID="ID_514701418" MODIFIED="1361912885239" TEXT="sudo apt-get install --no-install-recommends bluetooth"/>
</node>
<node CREATED="1361909996856" FOLDED="true" ID="ID_293169601" MODIFIED="1411344678379" TEXT="lsusb">
<node CREATED="1361910064549" FOLDED="true" ID="ID_1120474264" MODIFIED="1411344678379" TEXT="mostra lo stato della porta USB; viene qualcosa del genere">
<node CREATED="1361909993084" ID="ID_1943545202" MODIFIED="1361909996304" TEXT="Bus 001 Device 004: ID 2001:f111 D-Link Corp. DBT-122 Bluetooth adapter"/>
</node>
</node>
<node CREATED="1361910246272" FOLDED="true" ID="ID_1539607678" MODIFIED="1411344678379" TEXT="per vedere se funziona">
<node CREATED="1361910119591" FOLDED="true" ID="ID_69677980" MODIFIED="1411344678379" TEXT="/etc/init.d/bluetooth status">
<node CREATED="1361910132052" ID="ID_760356944" MODIFIED="1361910277229" TEXT="viene una cosa cos&#xec;:"/>
<node CREATED="1361910277594" ID="ID_805154665" MODIFIED="1361910279204" TEXT="bluetooth is running"/>
</node>
</node>
<node CREATED="1361911013114" FOLDED="true" ID="ID_635498201" MODIFIED="1411344678379" TEXT="per vedere i dispositivi con cui fare il pairing">
<node CREATED="1361911596392" ID="ID_344603411" MODIFIED="1361911651582" TEXT="rendere visibile il dispositivo che si vuole accoppiare al Raspberry con Bluetooth"/>
<node CREATED="1361911048998" ID="ID_1893057318" MODIFIED="1361911051143" TEXT=" hcitool scan"/>
<node CREATED="1361911051618" FOLDED="true" ID="ID_1222485400" MODIFIED="1411344678379" TEXT="si deve vedere qualcosa come:">
<node CREATED="1361911068465" ID="ID_1079305948" MODIFIED="1361911575843" TEXT="Scanning ...  00:17:B2:B4:7C:92       GamonDroid"/>
</node>
</node>
<node CREATED="1361915027032" FOLDED="true" ID="ID_240822141" MODIFIED="1411344678379" TEXT="per pingare un dispositivo Bluetooth">
<node CREATED="1361915044686" ID="ID_745081698" MODIFIED="1361915061330" TEXT="sudo l2ping -c 1 EC:9B:5B:00:00:00"/>
<node CREATED="1361915061757" ID="ID_1124230202" MODIFIED="1361916121623" TEXT="il ping si fa con il comando con il ping MAC (di livello 2, l2ping) e con l&apos;indirizzo MAC"/>
<node CREATED="1361916121894" ID="ID_1926014386" MODIFIED="1361916137062" TEXT="l2ping &#xe8; un comando solo per bluetooth"/>
</node>
</node>
<node CREATED="1362160695786" FOLDED="true" ID="ID_105204129" MODIFIED="1420230380118" POSITION="left" TEXT="OpenVPN">
<node CREATED="1362170967111" FOLDED="true" ID="ID_1356711664" MODIFIED="1411344678379" TEXT="generalit&#xe0;">
<node CREATED="1362171079209" FOLDED="true" ID="ID_1822011719" MODIFIED="1411344678379" TEXT="bridged VPN">
<node CREATED="1362171084858" ID="ID_369028924" MODIFIED="1362171093281" TEXT="a livello 2 (Ethernet)"/>
</node>
<node CREATED="1362171059912" FOLDED="true" ID="ID_1098404529" MODIFIED="1411344678379" TEXT="routed VPN">
<node CREATED="1362171084858" ID="ID_504998763" MODIFIED="1362171106669" TEXT="a livello 3 (IP)"/>
</node>
</node>
<node CREATED="1362170971759" FOLDED="true" ID="ID_1262143219" MODIFIED="1363597327671" TEXT="installazione">
<node CREATED="1362160787031" ID="ID_626722602" MODIFIED="1362162306017" TEXT="per diventare root:"/>
<node CREATED="1362160774049" ID="ID_209000671" MODIFIED="1362160786291" TEXT="sudo su"/>
<node CREATED="1362160821867" ID="ID_1849488929" MODIFIED="1362162313409" TEXT="aggiornamento della distribuzione:"/>
<node CREATED="1362160819298" ID="ID_1616475173" MODIFIED="1362160820877" TEXT="apt-get update"/>
<node CREATED="1362160856305" ID="ID_1240746584" MODIFIED="1362162333129" TEXT="installazione di openvpn e openssl:"/>
<node CREATED="1362160852985" ID="ID_840560970" MODIFIED="1362160854112" TEXT="apt-get install openvpn openssl"/>
<node CREATED="1362162079362" ID="ID_129736343" MODIFIED="1362162338535" TEXT="passare nella cartella di configurazione:"/>
<node CREATED="1362162071335" ID="ID_1328091116" MODIFIED="1362162073027" TEXT="cd /etc/openvpn"/>
<node CREATED="1362162246271" ID="ID_553761965" MODIFIED="1362162346895" TEXT="copia una cartella di esempio nella cartella di configurazione:"/>
<node CREATED="1362161069264" ID="ID_1085158261" MODIFIED="1362161070453" TEXT="cp -r /usr/share/doc/openvpn/examples/easy-rsa/2.0 ./easy-rsa"/>
<node CREATED="1362162286796" ID="ID_502217880" MODIFIED="1362162395015" TEXT="modificare il file vars:"/>
<node CREATED="1362162376215" ID="ID_732600596" MODIFIED="1362162377529" TEXT="nano easy-rsa/vars"/>
<node CREATED="1362162396302" ID="ID_1105950927" MODIFIED="1362162550165" TEXT="modificare la linea export EASY_RSA in modo che diventi cos&#xec;:"/>
<node CREATED="1362162509380" ID="ID_1411383676" MODIFIED="1362162511037" TEXT="export EASY_RSA=&#x201d;/etc/openvpn/easy-rsa&#x201d;"/>
<node CREATED="1362162700822" ID="ID_171071218" MODIFIED="1362162707840" TEXT="uscire salvando"/>
<node CREATED="1362163618880" ID="ID_616414889" MODIFIED="1362163618880" TEXT=""/>
<node CREATED="1362163619343" ID="ID_211420853" MODIFIED="1362163619343" TEXT=""/>
<node CREATED="1362163620272" ID="ID_1338461896" MODIFIED="1362163620272" TEXT=""/>
<node CREATED="1362163625391" ID="ID_1308046813" MODIFIED="1362163678820" TEXT="creare il &quot;distinguish name&quot; del server OpenVPN:"/>
<node CREATED="1362163621012" FOLDED="true" ID="ID_58759585" MODIFIED="1362171041093" TEXT="./easy-rsa/build-ca OpenVPN">
<node CREATED="1362163699205" ID="ID_445301776" MODIFIED="1362163704965" TEXT="Immettere:"/>
<node CREATED="1362163705314" FOLDED="true" ID="ID_507356673" MODIFIED="1411344678379" TEXT="Country Name:">
<node CREATED="1362163714252" ID="ID_1324945065" MODIFIED="1362163716090" TEXT="IT"/>
</node>
<node CREATED="1362163736692" FOLDED="true" ID="ID_939242544" MODIFIED="1411344678379" TEXT="State or Province Name (full name)">
<node CREATED="1362163738739" ID="ID_1321579673" MODIFIED="1362163740500" TEXT="FC"/>
</node>
<node CREATED="1362163769257" ID="ID_1807892867" MODIFIED="1362163771033" TEXT="Locality Name (eg, city) [SanFrancisco]:Forl&#xec;"/>
<node CREATED="1362163802266" ID="ID_1946236174" MODIFIED="1362163803224" TEXT="Organization Name (eg, company) [Fort-Funston]:gamon"/>
<node CREATED="1362163830891" ID="ID_1385271320" MODIFIED="1362163831951" TEXT=" Organizational Unit Name (eg, section) [changeme]:-"/>
<node CREATED="1362163910973" ID="ID_160875907" MODIFIED="1362163912378" TEXT="Common Name (eg, your name or your server&apos;s hostname) [changeme]:gamon-raspi1"/>
<node CREATED="1362164008313" ID="ID_1636099032" MODIFIED="1362164009646" TEXT="Name [changeme]:Gabriele Email Address [mail@host.domain]:gabriele@ingmonti.it"/>
</node>
<node CREATED="1362164132576" ID="ID_581181072" MODIFIED="1362164142544" TEXT="creare il certificato del server"/>
<node CREATED="1362164143670" FOLDED="true" ID="ID_582269078" MODIFIED="1362171042687" TEXT="./easy-rsa/build-key-server server">
<node CREATED="1362164283057" ID="ID_1836750352" MODIFIED="1362164296607" TEXT="Immettere, oltre ai dati di prima:"/>
<node CREATED="1362164297010" ID="ID_1027762658" MODIFIED="1362165984380" TEXT="Country Name (2 letter code) [US]:IT&#xa;State or Province Name (full name) [CA]:FC&#xa;Locality Name (eg, city) [SanFrancisco]:Forli&#xa;Organization Name (eg, company) [Fort-Funston]:gamon &#xa;Organizational Unit Name (eg, section) [changeme]:- &#xa;Common Name (eg, your name or your server&apos;s hostname) [server]:gamon-rasp1&#xa;Name [changeme]:Gabriele Monti &#xa;Email Address [mail@host.domain]:gamon@ingmonti.it &#xa;&#xa;Please enter the following &apos;extra&apos; attributes to be sent with your certificate request &#xa;A challenge password []:sfida &#xa;An optional company name []:gamon &#xa;Using configuration from /etc/openvpn/easy-rsa/openssl-1.0.0.cnf &#xa;Check that the request matches the signature Signature ok &#xa;The Subject&apos;s Distinguished Name is as follows &#xa;countryName           :PRINTABLE:&apos;IT&apos; &#xa;stateOrProvinceName   :PRINTABLE:&apos;FC&apos; &#xa;localityName          :T61STRING:&apos;Forl\0xEC&apos; &#xa;organizationName      :PRINTABLE:&apos;gamon&apos; &#xa;organizationalUnitName:PRINTABLE:&apos;-&apos; &#xa;commonName            :PRINTABLE:&apos;gamon-rasps1&apos; &#xa;name                  :PRINTABLE:&apos;Gabriele Monti&apos; &#xa;emailAddress          :IA5STRING:&apos;gamon@ingmonti.it&apos; &#xa;Certificate is to be certified until Feb 27 18:57:43 2023 GMT (3650 days) &#xa;Sign the certificate? [y/n]: &#xa;&#xa;1 out of 1 certificate requests certified, commit? [y/n]y&#xa;Write out database with 1 new entries&#xa;Data Base Updated"/>
</node>
<node CREATED="1362166031031" ID="ID_390490005" MODIFIED="1362166204254" TEXT="creare il certificato del client"/>
<node CREATED="1362166045991" ID="ID_1732529267" MODIFIED="1362166047149" TEXT="./easy-rsa/build-key client1"/>
<node CREATED="1362166233339" ID="ID_677246784" MODIFIED="1362166423161" TEXT="Genera i parametri crittografici di Diffie-Hellman"/>
<node CREATED="1362166233986" FOLDED="true" ID="ID_572528033" MODIFIED="1411344678379" TEXT="./easy-rsa/build-dh">
<node CREATED="1362166424886" ID="ID_728664869" MODIFIED="1362166432512" TEXT="ci pu&#xf2; volere del tempo!"/>
<node CREATED="1362166691550" ID="ID_1738550044" MODIFIED="1362166701880" TEXT="sul raspi 5 minuti"/>
</node>
<node CREATED="1362166703323" ID="ID_298874019" MODIFIED="1362166775058" TEXT="creare il file openvpn.conf"/>
<node CREATED="1362166723253" FOLDED="true" ID="ID_414481314" MODIFIED="1362171046593" TEXT="nano openvpn.conf">
<node CREATED="1362166914213" ID="ID_1945214213" MODIFIED="1362167132576">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      dev tun
    </p>
    <p>
      proto udp
    </p>
    <p>
      port 1194
    </p>
    <p>
      ca /etc/openvpn/easy-rsa/keys/ca.crt
    </p>
    <p>
      cert /etc/openvpn/easy-rsa/keys/server.crt
    </p>
    <p>
      key /etc/openvpn/easy-rsa/keys/server.key
    </p>
    <p>
      dh /etc/openvpn/easy-rsa/keys/dh1024.pem
    </p>
    <p>
      user nobody
    </p>
    <p>
      group nogroup
    </p>
    <p>
      server 10.8.0.0 255.255.255.0
    </p>
    <p>
      persist-key
    </p>
    <p>
      persist-tun
    </p>
    <p>
      status /var/log/openvpn-status.log
    </p>
    <p>
      verb 3
    </p>
    <p>
      client-to-client
    </p>
    <p>
      push "redirect-gateway def1"
    </p>
    <p>
      #set the dns servers
    </p>
    <p>
      push "dhcp-option DNS 8.8.8.8"
    </p>
    <p>
      push "dhcp-option DNS 8.8.4.4"
    </p>
    <p>
      log-append /var/log/openvpn
    </p>
    <p>
      comp-lzo
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362168055047" ID="ID_277316326" MODIFIED="1362168082347" TEXT="l&apos;indirizzo IP del server in questo caso &#xe8;: 10.8.0.0, maschera  255.255.255.0"/>
</node>
<node CREATED="1362167170568" ID="ID_1475785249" MODIFIED="1362167170568" TEXT=""/>
<node CREATED="1362167171090" ID="ID_264485870" MODIFIED="1362167172779" TEXT="echo 1 &gt; /proc/sys/net/ipv4/ip_forward"/>
<node CREATED="1362167286925" ID="ID_68311081" MODIFIED="1362167815052" TEXT="modificare il firewall per far passare OpenVPN"/>
<node CREATED="1362167303027" ID="ID_1477824179" MODIFIED="1362168033836" TEXT="iptables -t nat -A POSTROUTING -s &lt;indirizzo IP del server OpenVPN&gt;/&lt;prefisso&gt; -o eth0 -j SNAT --to &lt;indirizzo IP del computer&gt;"/>
<node CREATED="1362168190112" ID="ID_740481756" MODIFIED="1362168346346" TEXT="passare alla cartella superiore (/etc)"/>
<node CREATED="1362168197568" ID="ID_461784156" MODIFIED="1362168199194" TEXT="cd .."/>
<node CREATED="1362168349304" ID="ID_1577904605" MODIFIED="1362168367467" TEXT="modificare sysctl.conf"/>
<node CREATED="1362168368035" FOLDED="true" ID="ID_1199004102" MODIFIED="1411344678379" TEXT="nano sysctl.conf">
<node CREATED="1362169017995" ID="ID_499650252" MODIFIED="1362169036951" TEXT="abilitare il packet forwarding per IP versione 4"/>
<node CREATED="1362168921004" ID="ID_1954487647" MODIFIED="1362168949775" TEXT="scommentare la linea con  #net.ipv4.ip_forward (togliere #) "/>
</node>
<node CREATED="1362169104702" ID="ID_792300016" MODIFIED="1362169110759" TEXT="cd .."/>
<node CREATED="1362169111389" ID="ID_151834694" MODIFIED="1362169140308" TEXT="far partire OpenVPN"/>
<node CREATED="1362169140720" ID="ID_1128667679" MODIFIED="1362169142284" TEXT="/etc/init.d/openvpn start"/>
</node>
</node>
<node CREATED="1363032718569" FOLDED="true" ID="ID_403742342" MODIFIED="1412038984311" POSITION="left" TEXT="GPIO">
<node CREATED="1363032722544" FOLDED="true" ID="ID_881356669" MODIFIED="1411344678379" TEXT="con mono e C#">
<node CREATED="1363033779815" FOLDED="true" ID="ID_1541830426" MODIFIED="1411344678379" TEXT="installare in /lib la libreria lpigpio ">
<node CREATED="1363032728755" ID="ID_694078933" MODIFIED="1363032729944" TEXT="sudo cp libpigpio.so /lib"/>
<node CREATED="1363032732356" FOLDED="true" ID="ID_1098182590" MODIFIED="1411344678379" TEXT="scaricare libpigpio">
<node CREATED="1363032766663" ID="ID_1286308089" MODIFIED="1363032769320" TEXT="da: http://www.codehosting.net/blog/files/libpigpio.zip"/>
</node>
<node CREATED="1363032779717" FOLDED="true" ID="ID_1930013283" MODIFIED="1411344678379" TEXT="copiare libpigpio.so su /lib nel raspberry">
<node CREATED="1363032828521" ID="ID_325940167" MODIFIED="1363033960287" TEXT="E&apos; facile che non funzioni. In tal caso, compilare sul raspberry con le istruzioni che si trovano in libpigpio.c"/>
<node CREATED="1363033678345" ID="ID_501436171" MODIFIED="1363033705497">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      gcc -c -fpic libpigpio.c
    </p>
    <p>
      gcc -shared -o libpigpio.so libpigpio.o
    </p>
    <p>
      sudo cp libpigpio.so /lib
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1363033713774" ID="ID_1266323609" MODIFIED="1363033732589" TEXT="per compilare e provare il programma di test "/>
<node CREATED="1363033733751" ID="ID_1768507977" MODIFIED="1363033748784">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      gcc -Wall -o test main.c -lpigpio
    </p>
    <p>
      sudo ./test
    </p>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1393357109533" FOLDED="true" ID="ID_1338479687" MODIFIED="1411292628816" POSITION="left" TEXT="Windows Terminal client via RDP">
<node CREATED="1393366068680" FOLDED="true" ID="ID_899750724" MODIFIED="1411344678379" TEXT="con remmina">
<node CREATED="1393357130993" ID="ID_343672704" MODIFIED="1393359089117" TEXT="Installare remmina"/>
<node CREATED="1393357165475" ID="ID_929551859" MODIFIED="1393357166361" TEXT="sudo apt-get install remmina"/>
<node CREATED="1393357190852" ID="ID_1965535364" MODIFIED="1393357213636" TEXT="Far partire remmina e dare l&apos;indirizzo IP del computer da controllare da remoto"/>
<node CREATED="1393366460558" ID="ID_1511563977" MODIFIED="1393366467003" TEXT="(NON HA FUNZIONATO)"/>
</node>
<node CREATED="1393366081057" FOLDED="true" ID="ID_869646152" MODIFIED="1411344678379" TEXT="con rdesktop">
<node CREATED="1393366159932" ID="ID_396569983" MODIFIED="1393366162796" TEXT="sudo apt-get install rdesktop"/>
<node CREATED="1393366468451" FOLDED="true" ID="ID_162392747" MODIFIED="1411344678379" TEXT="lanciare rdesktop da una sessione Linux a interfaccia grafica (Gnome, KDE, LXDE (desktop di Raspbian))">
<node CREATED="1393366782538" ID="ID_933259880" MODIFIED="1393367660494" TEXT="da terminale ENTRO una sessione di UI grafica"/>
<node CREATED="1393366821864" ID="ID_1639844760" MODIFIED="1393367641796" TEXT="rdesktop  &lt;indirizzo IP del computer da controllare da remoto&gt;"/>
<node CREATED="1393366983773" FOLDED="true" ID="ID_1431916796" MODIFIED="1411344678379" TEXT="opzioni">
<node CREATED="1393366991985" ID="ID_1845880584" MODIFIED="1393366999811" TEXT="-f full screen"/>
<node CREATED="1393367037555" ID="ID_1019811364" MODIFIED="1393367049014" TEXT="-z: enable compression"/>
<node CREATED="1393367050609" ID="ID_1785531690" MODIFIED="1393367064274" TEXT="-x lan: set experience to &#x201c;LAN&#x201d; (will show desktop wallpaper, windows while moving them etc.) "/>
<node CREATED="1393367064918" ID="ID_634060504" MODIFIED="1393367066738" TEXT="-P: enable caching to disk (i.e. the Raspberry Pi&#x2019;s disk)"/>
</node>
</node>
</node>
</node>
<node CREATED="1357340460988" FOLDED="true" ID="ID_1489951289" MODIFIED="1370678648397" POSITION="left" TEXT="Lavagna Interattiva Multimediale">
<node CREATED="1361744026958" FOLDED="true" ID="ID_1988696334" MODIFIED="1361744035599" TEXT=" python-whiteboard">
<node CREATED="1357340477145" FOLDED="true" ID="ID_1888123919" MODIFIED="1411344678379" TEXT="installazione python-whiteboard">
<node CREATED="1357340484022" FOLDED="true" ID="ID_1323704307" MODIFIED="1411344678379" TEXT="da console">
<node CREATED="1357340488659" ID="ID_1254528250" MODIFIED="1357342840349" STYLE="fork" TEXT="sudo apt-get install python-whiteboard"/>
</node>
<node CREATED="1357340566746" FOLDED="true" ID="ID_1484204559" MODIFIED="1411344678379" TEXT="da GUI">
<node CREATED="1357340574392" ID="ID_719867978" MODIFIED="1357340723800" TEXT="lanciare synaptic, cercare ed installare python-whiteboard"/>
</node>
</node>
<node CREATED="1357342849633" FOLDED="true" ID="ID_521699084" MODIFIED="1411344678379" TEXT="esecuzione di python-whiteboard">
<node CREATED="1357342856217" ID="ID_441475453" MODIFIED="1357342862970" TEXT="DA FARE!!!!!!!"/>
</node>
<node CREATED="1357342864324" FOLDED="true" ID="ID_700446338" MODIFIED="1411344678379" TEXT="collegamento del wiimote con raspi">
<node CREATED="1357343119554" FOLDED="true" ID="ID_462190758" MODIFIED="1411344678379" TEXT="PROVARE CON QUESTO">
<node CREATED="1357343126315" ID="ID_769722981" MODIFIED="1357343240925" TEXT="http://www.brianhensley.net/2012/08/wii-controller-raspberry-pi-python.html"/>
</node>
</node>
</node>
<node CREATED="1363023780847" ID="ID_203919566" MODIFIED="1363023792489" TEXT="Installare mono, se non gi&#xe0; fatto"/>
<node CREATED="1361743897331" FOLDED="true" ID="ID_1327628459" MODIFIED="1411344678379" TEXT="per lanciare SharpBoard.NET">
<node CREATED="1361743911925" FOLDED="true" ID="ID_103757467" MODIFIED="1411344678379" TEXT="mono SharpBoardWin.exe">
<node CREATED="1361743998006" ID="ID_1630958138" MODIFIED="1361744024990" TEXT=""/>
</node>
</node>
<node CREATED="1361743692189" FOLDED="true" ID="ID_605355054" MODIFIED="1411344678379" TEXT="con SharpBoard.NET">
<node CREATED="1361744119195" ID="ID_606932138" MODIFIED="1361744131702" TEXT="scaricare SharpBoard.NET da http://sharpboard.codeplex.com/"/>
</node>
<node CREATED="1361913409437" FOLDED="true" ID="ID_1513346694" MODIFIED="1411313019594" TEXT="Acquisizione input tasti da wiimote">
<node CREATED="1361913428680" ID="ID_399652048" MODIFIED="1361913430650" TEXT="sudo apt-get install python-cwiid"/>
<node CREATED="1361913500105" FOLDED="true" ID="ID_1023496957" MODIFIED="1411344678379" TEXT="per vedere se il wiimote &#xe8; visibile">
<node CREATED="1361913518926" FOLDED="true" ID="ID_678822229" MODIFIED="1411344678379" TEXT="hcitool scan">
<node CREATED="1361913535934" ID="ID_523355552" MODIFIED="1361913537622" TEXT="Scanning ...          00:19:1C:B6:BB:41       Nintendo RVL-CNT-01"/>
</node>
</node>
<node CREATED="1361913431656" FOLDED="true" ID="ID_620375576" MODIFIED="1411344678379" TEXT="poi usare uno script che usi i comandi del wiimote">
<node CREATED="1361913630396" ID="ID_685070970" MODIFIED="1361913648725" TEXT="es. wii_remote.py"/>
</node>
</node>
</node>
<node CREATED="1361741917086" ID="ID_1196626461" MODIFIED="1424008124964" POSITION="right" TEXT="Installazione mono">
<node CREATED="1411312127332" ID="ID_1532467221" MODIFIED="1411312177393" TEXT="E&apos; la versione &quot;libera&quot;, per Linux, del &quot;framewok&quot; .NET"/>
<node CREATED="1423958577282" ID="ID_1331937212" MODIFIED="1423958603333" TEXT="Se si deve solo eseguire programmi sviluppati su altri computer">
<node CREATED="1363024044206" ID="ID_649619303" MODIFIED="1412038349077" TEXT="Installare il runtime">
<node CREATED="1361742013686" ID="ID_986879669" MODIFIED="1361742014796" TEXT="sudo apt-get install mono-runtime"/>
</node>
</node>
<node CREATED="1423958608972" ID="ID_727346557" MODIFIED="1423958620926" TEXT="Se si deve sviluppare su questo computer">
<node CREATED="1423958623738" ID="ID_400137571" MODIFIED="1423958680381" TEXT="Installare tutto di mono">
<node CREATED="1361742013686" ID="ID_295467388" MODIFIED="1423958690114" TEXT="sudo apt-get install mono-complete"/>
</node>
</node>
<node CREATED="1363024052901" ID="ID_623580605" MODIFIED="1412038410646" TEXT="Installare una shell Csharp, che pu&#xf2; essere utile per i programmi a console">
<node CREATED="1411312243263" ID="ID_1688682617" MODIFIED="1411312415345" TEXT="non &#xe8; indispensabile per il lavoro del &quot;garden&quot;"/>
<node CREATED="1363024100355" ID="ID_355092763" MODIFIED="1363024101669" TEXT="sudo apt-get install mono-csharp-shell"/>
<node CREATED="1363024184974" ID="ID_815771471" MODIFIED="1412038476909" STYLE="fork" TEXT="per provare: lanciare la shell da un terminale">
<node CREATED="1363024199169" ID="ID_1551796077" MODIFIED="1412038465822" TEXT="$ csharp"/>
<node CREATED="1363024217554" ID="ID_606253695" MODIFIED="1412038465822" TEXT="si entra nella shell remota di c#"/>
</node>
</node>
<node CREATED="1363023914348" ID="ID_1199244725" MODIFIED="1412038586812" TEXT="per far girare programmi in GUI">
<node CREATED="1411312473336" ID="ID_1876918317" MODIFIED="1411312501720" TEXT="non serve molto per il lavoro del &quot;garden&quot; "/>
<node CREATED="1361742021615" ID="ID_513020400" MODIFIED="1361742023647" TEXT="sudo apt-get install gtk-sharp2"/>
<node CREATED="1361742003116" ID="ID_1865402486" MODIFIED="1361742005133" TEXT="sudo apt-get install libmono-winforms2.0-cil"/>
<node CREATED="1361742738257" ID="ID_762883401" MODIFIED="1361742739382" TEXT="sudo apt-get install libxtst-dev"/>
</node>
<node CREATED="1361742725985" ID="ID_408401039" MODIFIED="1412039469938" TEXT="per provare se mono gira">
<node CREATED="1412039471035" ID="ID_1647590970" MODIFIED="1412039476421" TEXT="mono -V"/>
</node>
<node CREATED="1414710737966" ID="ID_103813168" MODIFIED="1414710765225" TEXT="per compilare con mono di usa mcs">
<node CREATED="1414710766749" ID="ID_592516517" MODIFIED="1414710767955" TEXT="es.">
<node CREATED="1414710768444" ID="ID_584756169" MODIFIED="1414710787738" TEXT="# mcs helloWorld.cs"/>
</node>
</node>
<node CREATED="1414710788824" ID="ID_780637224" MODIFIED="1414710831672" TEXT="si pu&#xf2; anche compilare con VisualStudio e trasferire l&apos;exe sul Linux">
<node CREATED="1414710833056" ID="ID_903162805" MODIFIED="1414710878277" TEXT="se non si usano classi del Frameworl che non sono state realizzate in mono, il programma funzioner&#xe0; anche sotto Linux."/>
</node>
<node CREATED="1424008110365" ID="ID_1361731219" MODIFIED="1424008141419" TEXT="Installazione del Web server XSP">
<node CREATED="1424008515068" ID="ID_32036133" MODIFIED="1424008540616" STYLE="fork" TEXT="?? E&apos; necessario, se si &#xe8; installato mono-complete ??"/>
<node CREATED="1424008105814" ID="ID_1620157860" MODIFIED="1424008163108" TEXT="sudo apt-get install mono-xsp4">
<node CREATED="1424008175942" ID="ID_1075740075" MODIFIED="1424008193862" TEXT="per ASP.Net versione 4"/>
</node>
<node CREATED="1424008245463" ID="ID_1506452534" MODIFIED="1424008248527" TEXT="sudo apt-get install asp.net-examples">
<node CREATED="1424008249492" ID="ID_1705001165" MODIFIED="1424008266203" TEXT="installa gli esempi di asp.Net"/>
</node>
<node CREATED="1424008767187" ID="ID_1516799374" MODIFIED="1424008909630" TEXT="nella cartella /usr/lib/xsp/4.0 ci sono gli esempi. Per vederli">
<node CREATED="1424008910736" ID="ID_1668652358" MODIFIED="1424008915288" TEXT="cd /usr/lib/xsp/4.0"/>
<node CREATED="1424008915803" ID="ID_1933215409" MODIFIED="1424008941595" TEXT="aprire un browswer e portarlo alla URL">
<node CREATED="1424008942465" ID="ID_1216780593" MODIFIED="1424008956978" TEXT="&lt;indirizzo raspi&gt;:8080"/>
<node CREATED="1424008957904" ID="ID_1513616131" MODIFIED="1424008959326" TEXT="es.">
<node CREATED="1424008960252" ID="ID_1357631200" MODIFIED="1424008973324" TEXT="172.16.13.100:8080"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1366324098502" ID="ID_333082949" MODIFIED="1424007184909" POSITION="right" TEXT="ASP.NET">
<node CREATED="1366324104739" ID="ID_14674427" MODIFIED="1424007111701" TEXT="con XSP, server scritto in C#">
<node CREATED="1423958526623" ID="ID_462978964" MODIFIED="1424007678379" TEXT="E&apos; molto lento, da non usare per server di produzione"/>
<node CREATED="1424007135562" ID="ID_1496848128" MODIFIED="1424007164703" TEXT="Va bene per fare delle prove o per siti molto &quot;piccoli&quot;"/>
<node CREATED="1424010555204" ID="ID_1968228016" MODIFIED="1424010640662" TEXT="La prima volta che si &quot;guarda&quot; una pagina aspx modificata, il sistema ci mette molto pi&#xf9; tempo, perch&#xe8; la compila. Dalla seconda volta che si usa sempre lo stesso codice, senza modificarlo, tutto va molto pi&#xf9; veloce. "/>
<node CREATED="1424007240664" ID="ID_667135360" MODIFIED="1424007244602" TEXT="Uso di XSP">
<node CREATED="1424007245556" ID="ID_1077556467" MODIFIED="1424007277781" TEXT="lanciarlo dalla root directory del sito">
<node CREATED="1424007284135" ID="ID_315577282" MODIFIED="1424007299528" TEXT="cd &lt;root directory del sito&gt;"/>
<node CREATED="1424007299990" ID="ID_1367875188" MODIFIED="1424010888020" TEXT="xsp4"/>
<node CREATED="1424010890491" ID="ID_1812562852" MODIFIED="1424010892475" TEXT="oppure"/>
<node CREATED="1424007299990" ID="ID_297734167" MODIFIED="1424008551342" TEXT="xsp4 &amp;">
<node CREATED="1424007311633" ID="ID_1880090074" MODIFIED="1424007358394" TEXT="&amp; per eseguire il programma e tornare al prompt prima che esso finisca"/>
</node>
</node>
</node>
<node CREATED="1424010652168" ID="ID_894343418" MODIFIED="1424011156432" TEXT="Pagine .aspx da visualizzare">
<node CREATED="1424010672153" ID="ID_530707200" MODIFIED="1424010703843" TEXT="1 - svilupparle su VisualStudio"/>
<node CREATED="1424010704270" ID="ID_107737522" MODIFIED="1424010746430" TEXT="2 - trasferire sul raspi i file *.aspx ed i *.cs.aspx delle pagine sviluppate">
<node CREATED="1424010781258" ID="ID_1765581595" MODIFIED="1424011190779" TEXT="con FileZilla, nella cartella designata; p.es /home/pi/aspx"/>
</node>
<node CREATED="1424010758893" ID="ID_297320689" MODIFIED="1424010776813" TEXT="3 - provare da browser">
<node CREATED="1424010849748" ID="ID_1440359371" MODIFIED="1424010859619" TEXT="nella shell ssh">
<node CREATED="1424010860116" ID="ID_547350972" MODIFIED="1424010863846" TEXT="cd /home/pi/aspx"/>
<node CREATED="1424007299990" ID="ID_381494833" MODIFIED="1424010888020" TEXT="xsp4"/>
<node CREATED="1424010905554" ID="ID_1214860593" MODIFIED="1424010933025" TEXT="viene lanciato il server xspx4, che scrive qualcosa di simile a: "/>
<node CREATED="1424010934847" ID="ID_479744241" MODIFIED="1424011203629" TEXT="xsp4 &#xa;Listening on address: 0.0.0.0 &#xa;Root directory: /home/pi/aspx&#xa;Listening on port: 8080 (non-secure) &#xa;Hit Return to stop the server. "/>
<node CREATED="1424011087306" ID="ID_37023041" MODIFIED="1424011145326" TEXT="Ora il server &#xe8; attivo e funzionante; se co sono degli errori nella sua utilizzazione li comunicher&#xe0; a console."/>
</node>
<node CREATED="1424011035579" ID="ID_1331161203" MODIFIED="1424011055424" TEXT="puntare il broswer sulla pagina da provare">
<node CREATED="1424011056329" ID="ID_788047230" MODIFIED="1424011058048" TEXT="es.">
<node CREATED="1424011073307" ID="ID_1629111350" MODIFIED="1424011074260" TEXT="http://172.16.13.100:8080/Config.aspx"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1366324111995" ID="ID_281139289" MODIFIED="1423958280169" TEXT="con Apache e mod_mono">
<node CREATED="1366324117294" ID="ID_1258437456" MODIFIED="1424003868887" TEXT="installare mod_mono in apache">
<node CREATED="1366324277436" ID="ID_1935198149" MODIFIED="1423958348728" STYLE="fork" TEXT="sudo apt-get update"/>
<node CREATED="1366324277436" ID="ID_941618770" MODIFIED="1423958355554" TEXT="sudo apt-get upgrade"/>
<node CREATED="1366324319462" ID="ID_457102672" MODIFIED="1366324631831" TEXT="fermare il demone apache prima dell&apos;installazione di mod_mono"/>
<node CREATED="1366324367459" ID="ID_1684090966" MODIFIED="1366324388057" TEXT="/etc/init.d/apache2 stop"/>
<node CREATED="1366324530172" ID="ID_1826527230" MODIFIED="1366324631831" TEXT="installare mod_mono"/>
<node CREATED="1366324527503" ID="ID_1613637308" MODIFIED="1424003307814" TEXT="sudo apt-get install mono-apache-server4">
<node CREATED="1423959670895" ID="ID_1406623267" MODIFIED="1423959677642" TEXT="per framework 4.5"/>
</node>
<node CREATED="1366324527503" ID="ID_1126018780" MODIFIED="1423959344937" TEXT="sudo apt-get install libapache2-mod_mono">
<node CREATED="1366326249713" ID="ID_1168424768" MODIFIED="1366326251183" TEXT="Impossibile trovare il pacchetto libapache2-mod_mono"/>
</node>
<node CREATED="1366324527503" ID="ID_429193681" MODIFIED="1423959451692" TEXT="sudo apt-get install libmono-i1">
<node CREATED="1366326277896" ID="ID_743381919" MODIFIED="1366326278710" TEXT="Impossibile trovare il pacchetto libmono-i1"/>
</node>
<node CREATED="1366324562187" ID="ID_1388281225" MODIFIED="1366324572664" TEXT="far ripartire il server apache"/>
<node CREATED="1366324573097" ID="ID_1347363034" MODIFIED="1366324574355" TEXT="/etc/init.d/apache2 start"/>
</node>
<node CREATED="1366324147017" ID="ID_827897252" MODIFIED="1412038914670" TEXT="ATTENZIONE: mod_mono d&#xe0; problemi con php!">
<node CREATED="1366324174760" ID="ID_1848839538" MODIFIED="1366324183428" TEXT="meglio non usarli insieme"/>
</node>
</node>
</node>
<node CREATED="1418337632476" ID="ID_1374887828" MODIFIED="1418338212810" POSITION="right" TEXT="watchdog">
<node CREATED="1418337906710" ID="ID_919176048" MODIFIED="1418337920657" TEXT="installare il driver">
<node CREATED="1418337921923" ID="ID_241831640" MODIFIED="1418337922944" TEXT="sudo modprobe bcm2708_wdog"/>
</node>
<node CREATED="1418337927654" ID="ID_151852796" MODIFIED="1418337964648" TEXT="modificare l&apos;elenco dei moduli (driver) che vengono ricaricati al boot">
<node CREATED="1418338012941" ID="ID_1205852159" MODIFIED="1418338067947" TEXT="sudo nano /etc/modules"/>
<node CREATED="1418338068333" ID="ID_442260859" MODIFIED="1418338157333" TEXT="aggiungere nell&apos;ultima riga il nome del modulo da caricare"/>
<node CREATED="1418338162005" ID="ID_1795200219" MODIFIED="1418338186046" TEXT="bcm2708_wdog"/>
</node>
<node CREATED="1418340951725" ID="ID_1229809149" MODIFIED="1418340962786" TEXT="??? questo &#xe8; necessario installarlo ???">
<node CREATED="1418340967022" ID="ID_82347119" MODIFIED="1418340968726" TEXT="sudo apt-get install watchdog chkconfig ">
<node CREATED="1424004460625" ID="ID_1481502" MODIFIED="1424004464471" TEXT="installato"/>
</node>
</node>
</node>
<node CREATED="1356640065186" ID="ID_742874669" MODIFIED="1424004755786" POSITION="right" TEXT="Installazione e configurazione di VNC">
<node CREATED="1356640282260" ID="ID_664690088" MODIFIED="1412039436596" TEXT="installare tightvnc">
<node CREATED="1356640243199" ID="ID_1538279865" MODIFIED="1356640244147" TEXT="sudo apt-get install tightvncserver"/>
</node>
<node CREATED="1356640291482" ID="ID_1673523306" MODIFIED="1412039439754" TEXT="eseguire tightvnc">
<node CREATED="1356652840915" ID="ID_473851417" MODIFIED="1412039441854" TEXT="lanciare il server VNC">
<node CREATED="1356640300702" ID="ID_1235688439" MODIFIED="1412039514632" TEXT="il programma si chiama tightvncserver"/>
<node CREATED="1356640300702" ID="ID_1718896078" MODIFIED="1356640301809" TEXT="/usr/bin/tightvncserver"/>
</node>
<node CREATED="1356640437009" ID="ID_908497871" MODIFIED="1412039445591" TEXT="viene chiesta la password VNC">
<node CREATED="1356640589977" ID="ID_1977169323" MODIFIED="1393358554045" TEXT="messo raspberry, che &#xe8; stato troncato a 8 caratteri"/>
</node>
<node CREATED="1356640621848" ID="ID_110850689" MODIFIED="1412039451122" TEXT="chiede se si vuole mettere una view only password">
<node CREATED="1356640639667" ID="ID_1305042684" MODIFIED="1356640641090" TEXT="no"/>
</node>
<node CREATED="1356640656867" ID="ID_1018384115" MODIFIED="1412039453752" TEXT="new X desktop is raspberrypi:1">
<node CREATED="1356640695308" ID="ID_974258018" MODIFIED="1356640722843" TEXT=":1 andr&#xe0; indicato nel client VNC"/>
</node>
</node>
<node CREATED="1356640883114" ID="ID_2316712" MODIFIED="1424004558234" TEXT="collegarsi al desktop con VNC">
<node CREATED="1356640819611" FOLDED="true" ID="ID_57476264" MODIFIED="1411344678364" TEXT="puntare un client vnc (vnc viewer) sull&apos;indirizzo del raspi">
<node CREATED="1356640835201" ID="ID_1062468333" MODIFIED="1356640856504" TEXT="per la ultracompressione ci vuole un client tightvnc"/>
<node CREATED="1356641106788" FOLDED="true" ID="ID_1580689216" MODIFIED="1411344678364" TEXT="es. usare &lt;indirizzo&gt;:&lt;numero di display indicato da vnc all&apos;accensione&gt;">
<node CREATED="1356641159918" FOLDED="true" ID="ID_972913229" MODIFIED="1411344678364" TEXT="es.">
<node CREATED="1356641166759" ID="ID_950496093" MODIFIED="1356641172138" TEXT="172.16.46.141:1"/>
</node>
</node>
</node>
<node CREATED="1356640896748" ID="ID_1948154934" MODIFIED="1356640918823" TEXT="dare la password appena configurata"/>
<node CREATED="1356641481475" ID="ID_1058971636" MODIFIED="1412039742628" TEXT="parte una sessione lxde">
<node CREATED="1356641495739" ID="ID_953043882" MODIFIED="1356641551025" TEXT="&#xe8; un window manager molto leggero e veloce che pu&#xf2; essere usato se non serve un&apos;interfaccia utente particolarmente sofisticata"/>
<node CREATED="1356641758992" ID="ID_1736664252" MODIFIED="1356641767529" TEXT="da remoto potrebbe bastare!"/>
</node>
<node CREATED="1356641796664" FOLDED="true" ID="ID_1695959204" MODIFIED="1424004692403" TEXT="se si vuole che vnc parta con una sessione di un altro desktop manager">
<node CREATED="1356641831270" ID="ID_1114392754" MODIFIED="1412039754170" TEXT="modificare il file ">
<node CREATED="1356641840466" ID="ID_1126447959" MODIFIED="1356641841722" TEXT="~/.vnc/xstartup "/>
<node CREATED="1356642028902" FOLDED="true" ID="ID_409670878" MODIFIED="1411344678364" TEXT="~ &#xe8; la home directory dell&apos;utente considerato">
<node CREATED="1356642054279" FOLDED="true" ID="ID_187857527" MODIFIED="1411344678364" TEXT="es.">
<node CREATED="1356642056045" ID="ID_722866845" MODIFIED="1356642063683" TEXT="/home/pi/"/>
</node>
</node>
<node CREATED="1356642139901" ID="ID_1824153098" MODIFIED="1356643871151" TEXT="exec ck-launch-session gnome-session&#x9;# per usare gnome&#xa;exec ck-launch-session startkde&#x9;# per un desktop kde&#xa;exec ck-launch-session startlxde&#x9;# per una sessione lxde (default, parte questa se non si fa nessuna modifica)"/>
</node>
<node CREATED="1356642275613" ID="ID_467670197" MODIFIED="1412039756332" TEXT="rimpiazzare la linea">
<node CREATED="1356642281937" ID="ID_648410592" MODIFIED="1356642310847" TEXT="/etc/X11/Xsession"/>
<node CREATED="1356642283966" ID="ID_1977462302" MODIFIED="1356643848363" TEXT="con una delle seguanti, in base al window manager che si vuole far girare"/>
</node>
<node CREATED="1356643158041" ID="ID_904397472" MODIFIED="1356643176880" TEXT="gnome con l&apos;immagine che avevo non ha funzionato"/>
</node>
</node>
<node CREATED="1393358505756" FOLDED="true" ID="ID_131684511" MODIFIED="1424004697412" TEXT="cambiare la password di vnc">
<node CREATED="1393358517258" ID="ID_1599343051" MODIFIED="1393358534862" TEXT=" vncpasswd"/>
<node CREATED="1356640437009" ID="ID_256870086" MODIFIED="1356640458695" TEXT="viene chiesta la password VNC"/>
<node CREATED="1356640621848" ID="ID_1434814007" MODIFIED="1412039767310" TEXT="chiede se si vuole mettere una view only password">
<node CREATED="1356640639667" ID="ID_1218484944" MODIFIED="1356640641090" TEXT="no"/>
</node>
</node>
<node CREATED="1356640764861" FOLDED="true" ID="ID_1999542573" MODIFIED="1424004699936" TEXT="rendere tightvnc un servizio che parte al boot">
<node CREATED="1356641317833" FOLDED="true" ID="ID_1472584169" MODIFIED="1411344678364" TEXT="Tratto da ">
<node CREATED="1356641320069" ID="ID_3014876" MODIFIED="1356641321546" TEXT="http://www.penguintutor.com/linux/tightvnc"/>
</node>
<node CREATED="1361032288722" ID="ID_973967053" MODIFIED="1361032305403">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre>#!/bin/sh
### BEGIN INIT INFO
# Provides:          tightvncserver
# Required-Start:    $local_fs
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start/stop tightvncserver
### END INIT INFO

# More details see: 
# <a href="http://www.penguintutor.com/linux/tightvnc" class="linkification-ext" title="Linkification: http://www.penguintutor.com/linux/tightvnc">http://www.penguintutor.com/linux/tightvnc</a>

### Customize this entry
# Set the USER variable to the name of the user to start tightvncserver under
export USER='pi'
### End customization required

eval cd ~$USER

case "$1" in
  start)
    su $USER -c '/usr/bin/tightvncserver :1'
    echo "Starting TightVNC server for $USER "
    ;;
  stop)
    pkill Xtightvnc
    echo "Tightvncserver stopped"
    ;;
  *)
    echo "Usage: /etc/init.d/tightvncserver {start|stop}"
    exit 1
    ;;
esac
exit 0</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1356641254617" FOLDED="true" ID="ID_657003845" MODIFIED="1424004704067" TEXT="hardening di VNC">
<node CREATED="1356641263774" ID="ID_1695490877" MODIFIED="1356641297334" TEXT="vedere negli hotwo come far in modo che ci si possa collegare crittando i dati trasferiti da VNC"/>
<node CREATED="1356641299413" FOLDED="true" ID="ID_478213688" MODIFIED="1411344678364" TEXT="es.">
<node CREATED="1356641308721" ID="ID_389934712" MODIFIED="1356641309891" TEXT="http://www.penguintutor.com/linux/tightvnc"/>
</node>
</node>
<node CREATED="1424004758512" ID="ID_282483792" MODIFIED="1424004802315" TEXT="naturalmente, se si &#xe8; scelto di dare poca memoria alla grafica, l&apos;ambiente a finestre &#xe8; molto lento!"/>
</node>
<node CREATED="1394487471493" ID="ID_919716523" MODIFIED="1424004937916" POSITION="right" TEXT="Alla fine delle installazioni, PULIRE!">
<node CREATED="1394487486112" ID="ID_744132618" MODIFIED="1411987926641" TEXT="sudo apt-get clean"/>
<node CREATED="1394487505093" ID="ID_1448297896" MODIFIED="1394487515244" TEXT="Cancella i file di installazione"/>
</node>
<node CREATED="1363007740758" ID="ID_1731962922" MODIFIED="1411987928619" POSITION="right" TEXT="Python">
<node CREATED="1411329911656" ID="ID_1896242429" MODIFIED="1412038697567" TEXT="Nel Raspberry PI, Python &#xe8; gi&#xe0; installato all&apos;inizio"/>
<node CREATED="1363012513260" ID="ID_1194838198" MODIFIED="1363012536952" TEXT="Per creare un Web server con una riga di codice basta usare python">
<node CREATED="1363012538643" ID="ID_1845608556" MODIFIED="1363012618081" TEXT="Si lancia il programma Python SimpleHTTPServer, che fornir&#xe0; le pagine HTML comprese nella cartella corrente"/>
<node CREATED="1363012625330" ID="ID_1400235219" MODIFIED="1411987989932" TEXT="Come fare:">
<node CREATED="1363012690582" FOLDED="true" ID="ID_1707915438" MODIFIED="1411344678379" TEXT="creare la home page html">
<node CREATED="1363012241815" ID="ID_922563679" MODIFIED="1363012243567" TEXT="echo funziona! &gt; index.html"/>
<node CREATED="1363012706156" ID="ID_189220334" MODIFIED="1363012712453" TEXT="(molto semplice..)"/>
</node>
<node CREATED="1363012256361" FOLDED="true" ID="ID_1107945686" MODIFIED="1411988000965" TEXT="python -m SimpleHTTPServer">
<node CREATED="1363012415040" ID="ID_1223960675" MODIFIED="1363012422313" TEXT="scrive:"/>
<node CREATED="1363012261041" ID="ID_1409672694" MODIFIED="1363012334342" TEXT="Serving HTTP on 0.0.0.0 port 8000 ..."/>
<node CREATED="1363012426323" FOLDED="true" ID="ID_828815918" MODIFIED="1411344678379" TEXT="il server sta sul port 8000, per cui, puntando il browser su">
<node CREATED="1363012456880" ID="ID_1393008117" MODIFIED="1363012481919" TEXT="http://&lt;indirizzo IP del raspeberry:&gt;:8000"/>
<node CREATED="1363012484249" ID="ID_207941094" MODIFIED="1363012490028" TEXT="compare la pagina"/>
<node CREATED="1363012490440" ID="ID_1573087368" MODIFIED="1363012494275" TEXT="funziona!"/>
</node>
</node>
<node CREATED="1363012752101" ID="ID_1152256959" MODIFIED="1363013103004" TEXT="Naturalmente, se il programma Python viene interrotto, il server non esiste pi&#xf9;!"/>
</node>
</node>
</node>
<node CREATED="1356736455233" ID="ID_1882703059" MODIFIED="1412038872932" POSITION="right" TEXT="Istruzioni per la creazione di una SD contenente un&apos;immagine &quot;campione&quot;, da clonare">
<node CREATED="1411315083032" ID="ID_141303431" MODIFIED="1411315160395" TEXT="Quando il sistema &#xe8; configurato ed operativo, lo si pu&#xf2; &quot;fotografare&quot;, come backup, o per poterlo replicare uguale su altre Raspberry"/>
<node CREATED="1370678921723" FOLDED="true" ID="ID_216955398" MODIFIED="1411344678379" TEXT="In Windows">
<node CREATED="1370678939933" ID="ID_582349069" MODIFIED="1370678958465" TEXT="Installare il programma &quot;Win32 disk imager&quot;"/>
<node CREATED="1370678958847" ID="ID_568791065" MODIFIED="1370679038942" TEXT="Se il lettore SDcard viene riconosciuto, si pu&#xf2; scegliere in alto a destra"/>
<node CREATED="1370679040296" ID="ID_926689978" MODIFIED="1370679109046" TEXT="Se non viene riconosciuto vuol dire che non &#xe8; standard, e non funzioner&#xe0; con questo programma"/>
<node CREATED="1370679109500" ID="ID_1124810961" MODIFIED="1370679193330" TEXT="Si pu&#xf2; acquistare un lettore SD su USB. Di solito i lettori su USB, non interfacciandosi direttamente al bus di sistema, vengono letti senza problemi dal programma &quot;win32 disk imager&quot;"/>
<node CREATED="1370679200270" ID="ID_1547920742" MODIFIED="1411313416618" TEXT="Una volta scelta l&apos;SD card su cui leggere | scrivere, l&apos;immagine ed il nome del file, il resto non richiede spiegazioni.."/>
</node>
<node CREATED="1358181924030" FOLDED="true" ID="ID_489184865" MODIFIED="1411313356592" TEXT="In Linux">
<node CREATED="1358181919351" ID="ID_161220202" MODIFIED="1358181935875" TEXT="Inserire la SD card"/>
<node CREATED="1358181936396" FOLDED="true" ID="ID_1208581100" MODIFIED="1411344678379" TEXT="Se Linux monta automaticamente la SD card">
<node CREATED="1358181957529" FOLDED="true" ID="ID_722946934" MODIFIED="1411344678379" TEXT="per sapere il nome del device che si deve &quot;clonare&quot;">
<node CREATED="1358182028136" FOLDED="true" ID="ID_84675390" MODIFIED="1411344678379" TEXT="df -h">
<node CREATED="1358182374967" ID="ID_591950855" MODIFIED="1358183807318" TEXT="-h per mostrare tutti i dati delle partizioni attualmente montate (h = human readable)"/>
</node>
<node CREATED="1358182050385" FOLDED="true" ID="ID_1132438074" MODIFIED="1411344678379" TEXT="se &#xe8; una raspbian potrebbero esserci due partizioni montate">
<node CREATED="1358184045760" ID="ID_357308472" MODIFIED="1358184047150" TEXT="(una per il boot e l&apos;altra per il resto)"/>
</node>
<node CREATED="1358182075728" FOLDED="true" ID="ID_405530660" MODIFIED="1411344678379" TEXT="se sono montate, per es.">
<node CREATED="1358184124938" ID="ID_713384179" MODIFIED="1358184241974" TEXT="/dev/sda1 montata come /media/Windows"/>
<node CREATED="1358184185254" ID="ID_91589634" MODIFIED="1358184248044" TEXT=" /dev/sda5 montata come /">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1358182094236" ID="ID_1667460709" MODIFIED="1358182109285" TEXT="allora il device dal clonare &#xe8; /dev/sda"/>
</node>
<node CREATED="1358182111072" FOLDED="true" ID="ID_1964445964" MODIFIED="1411344678379" TEXT="se sono montate, per es.">
<node CREATED="1358182249447" ID="ID_1943197678" MODIFIED="1358182305578" TEXT="/dev/mmcblk0p1 montata come /media/8b12-9122"/>
<node CREATED="1358182249447" ID="ID_89060648" MODIFIED="1358182326833" TEXT="/dev/mmcblk0p2 montata come /media/2098432-2344"/>
<node CREATED="1358182339543" ID="ID_1737947764" MODIFIED="1358182367054" TEXT="allora il device dal clonare &#xe8; /dev/mmcblk0"/>
</node>
</node>
</node>
<node CREATED="1358182447450" FOLDED="true" ID="ID_269196713" MODIFIED="1411344678379" TEXT="Se Linux non monta la SDcard">
<node CREATED="1358182513999" FOLDED="true" ID="ID_1854252690" MODIFIED="1411344678379" TEXT="eseguire">
<node CREATED="1358183537803" FOLDED="true" ID="ID_1812644700" MODIFIED="1411344678379" TEXT="fdisk -l">
<node CREATED="1358183545935" ID="ID_398583903" MODIFIED="1358183674380" TEXT="se il sistema riesce ad identificare le partizioni presenti, la SDcard si dovrebbe riuscire ad individuare digitande questo comando. Se non si vede provare con il seguente."/>
</node>
</node>
<node CREATED="1358183681105" ID="ID_888273898" MODIFIED="1358183689247" TEXT="togliere la SDcard"/>
<node CREATED="1358182513999" FOLDED="true" ID="ID_98642556" MODIFIED="1411344678379" TEXT="eseguire">
<node CREATED="1358182555063" ID="ID_71117157" MODIFIED="1358182572284" TEXT="dmesg | tail"/>
<node CREATED="1358182573321" ID="ID_954891196" MODIFIED="1358182649185" TEXT="fra gli ultimi messaggi, ce n&#xe8; uno che indica l&apos;inserzione della SD card, specificando il nome del device"/>
</node>
</node>
<node CREATED="1358182664386" FOLDED="true" ID="ID_481672728" MODIFIED="1411344678379" TEXT="Una volta noto il nome del device, fare la clonazione">
<node CREATED="1358182710025" ID="ID_896693328" MODIFIED="1358182781046" TEXT="sudo if=&lt;nome di device della SDcard&gt; of=&lt;path e nome del file in cui copiare l&apos;immagine&gt;"/>
</node>
</node>
</node>
<node CREATED="1362407031680" FOLDED="true" ID="ID_1632974059" MODIFIED="1420192995231" POSITION="left" TEXT="Configurazione IP sofisticata, con indirizzi fissi ed alias">
<node CREATED="1362419718635" ID="ID_1055393924" MODIFIED="1362419729421" TEXT="dato l&apos;indirizzo: 172.16.27.7"/>
<node CREATED="1362408095562" ID="ID_1807005937" MODIFIED="1362419673215" TEXT="modificare con nano /etc/network/interfaces"/>
<node CREATED="1362419673627" ID="ID_373313250" MODIFIED="1362762734195">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <p>
      # interfaccia di loopback
    </p>
    <p>
      auto lo
    </p>
    <p>
      iface lo inet loopback
    </p>
    <p>
      
    </p>
    <p>
      # configurazione automatica in dhcp per la scheda di rete cablata:
    </p>
    <p>
      # commentata per funzionare in modo statico
    </p>
    <p>
      #iface eth0 inet dhcp
    </p>
    <p>
      # configurazione con indirizzo IP statico per la scheda di rete cablata:
    </p>
    <p>
      
    </p>
    <p>
      # indirizzo IP di default
    </p>
    <p>
      auto eth0
    </p>
    <p>
      iface eth0 inet static
    </p>
    <p>
      address 172.16.27.7
    </p>
    <p>
      netmask 255.255.0.0
    </p>
    <p>
      network 172.16.0.0
    </p>
    <p>
      broadcast 172.16.255.255
    </p>
    <p>
      gateway 172.16.46.254
    </p>
    <p>
      
    </p>
    <p>
      # configurazione degli alias IP
    </p>
    <p>
      auto eth0:0
    </p>
    <p>
      iface eth0:0 inet static
    </p>
    <p>
      address 172.16.46.247
    </p>
    <p>
      netmask 255.255.0.0
    </p>
    <p>
      network 172.16.0.0
    </p>
    <p>
      broadcast 172.16.255.255
    </p>
    <p>
      gateway 172.16.46.254
    </p>
    <p>
      
    </p>
    <p>
      auto eth0:1
    </p>
    <p>
      iface eth0:1 inet static
    </p>
    <p>
      address 172.16.13.247
    </p>
    <p>
      netmask 255.255.0.0
    </p>
    <p>
      network 172.16.0.0
    </p>
    <p>
      broadcast 172.16.255.255
    </p>
    <p>
      gateway 172.16.13.254
    </p>
    <p>
      
    </p>
    <p>
      auto eth0:2
    </p>
    <p>
      iface eth0:2 inet static
    </p>
    <p>
      address 172.16.38.247
    </p>
    <p>
      netmask 255.255.0.0
    </p>
    <p>
      network 172.16.0.0
    </p>
    <p>
      broadcast 172.16.255.255
    </p>
    <p>
      gateway 172.16.38.254
    </p>
    <p>
      
    </p>
    <p>
      auto eth0:3
    </p>
    <p>
      iface eth0:3 inet static
    </p>
    <p>
      address 172.16.39.247
    </p>
    <p>
      netmask 255.255.0.0
    </p>
    <p>
      network 172.16.0.0
    </p>
    <p>
      broadcast 172.16.255.255
    </p>
    <p>
      gateway 172.16.39.254
    </p>
    <p>
      
    </p>
    <p>
      # configurazione automatica del wif quando si inserisce la scheda
    </p>
    <p>
      # commentato per sicurezza
    </p>
    <p>
      #allow-hotplug wlan0
    </p>
    <p>
      #iface wlan0 inet manual
    </p>
    <p>
      #wpa-roam /etc/wpa_supplicant/wpa_supplicant.conf
    </p>
    <p>
      #iface default inet dhcp
    </p>
  </body>
</html></richcontent>
</node>
<node CREATED="1362762858837" FOLDED="true" ID="ID_1863857689" MODIFIED="1411344678395" TEXT="far ripartire il software di rete">
<node CREATED="1362762783694" ID="ID_906114663" MODIFIED="1362762796155" TEXT="sudo /etc/init.d/networking restart"/>
</node>
<node CREATED="1362762879752" ID="ID_1004334407" MODIFIED="1362762912599" TEXT="controllare con ifconfig che gli alias siano configurati e funzionanti"/>
</node>
<node CREATED="1411316430380" FOLDED="true" ID="ID_850256543" MODIFIED="1424004981173" POSITION="left" TEXT="Configurazione di MySQL per uso a scuola">
<node CREATED="1362408179269" FOLDED="true" ID="ID_616092015" MODIFIED="1423959835118" TEXT="password per l&apos;utente root del server MySql">
<node CREATED="1362408200949" FOLDED="true" ID="ID_758396313" MODIFIED="1423959832431" TEXT="raspberry">
<node CREATED="1362516233181" ID="ID_1734804384" MODIFIED="1411316027257" TEXT="stessa password del computer, ma potrebbe essere diversa"/>
</node>
</node>
<node CREATED="1362410825070" ID="ID_1844543349" MODIFIED="1362514298470" TEXT="siccome l&apos;utente root non &#xe8; abilitato per default all&apos;accesso da remoto, non si pu&#xf2; configurare MySql da remoto utilizzando lo stesso server mysql . &#xa;Per&#xf2; &#xe8; possibile collegarsi da remoto con un server SSH (es. PuTTY). Infatti il terminale &#xe8; un computer remoto, ma la shell &#xe8; eseguita dal computer locale (server Raspberry), per cui &#xe8; possibile usare l&apos;utente root dal client che gira nella shell remota. &#xa;Oppure si lavora da console, p.es utilizzando un TV, cavo HDMI e una tastiera USB. Ci si collega dalla console locale sul raspberry, nella shell che parte al boot."/>
<node CREATED="1362411070219" ID="ID_321485992" MODIFIED="1423959838755" TEXT="nella shell, da console o da client SSH remoto, si lancia il client testuale di MySql, usando l&apos;utente root">
<node CREATED="1362412000252" ID="ID_1534393713" MODIFIED="1362509224572" TEXT="mysql -u &lt;user&gt; -p"/>
<node CREATED="1362412036148" ID="ID_602363563" MODIFIED="1423959842535" TEXT="es.">
<node CREATED="1362411084854" ID="ID_1698777505" MODIFIED="1362514310333" TEXT="$ mysql - u root -p"/>
<node CREATED="1362509232020" ID="ID_1569999773" MODIFIED="1362514320834" TEXT="viene chiesta la password dell&apos;utente root"/>
</node>
<node CREATED="1362412246903" FOLDED="true" ID="ID_847897986" MODIFIED="1411344678395" TEXT="si d&#xe0; il permesso perch&#xe8; mysql usi l&apos;utente root anche da remoto">
<node CREATED="1362412907457" FOLDED="true" ID="ID_1562908523" MODIFIED="1411344678395" TEXT="per vedere la tabella dei permessi:">
<node CREATED="1362412918341" ID="ID_976972302" MODIFIED="1362515244880" TEXT="mysql&gt; SELECT User, Host, Password FROM mysql.user;"/>
</node>
<node CREATED="1362412495308" FOLDED="true" ID="ID_1772415290" MODIFIED="1411344678395" TEXT="apertura dell&apos;accesso di root da remoto, per tutti gli schemi e tutti gli indirizzi IP">
<node CREATED="1362413673977" ID="ID_426465230" MODIFIED="1362516218519" TEXT="mysql&gt; GRANT ALL PRIVILEGES ON *.* TO &apos;root&apos;@&apos;%&apos; IDENTIFIED BY &apos;RaspMyServer&apos; WITH GRANT OPTION;"/>
<node CREATED="1362413810188" FOLDED="true" ID="ID_1000696031" MODIFIED="1411344678395" TEXT="mysql&gt; FLUSH PRIVILEGES;">
<node CREATED="1362413813414" ID="ID_79472254" MODIFIED="1362413839799" TEXT="per forzare i cambiamenti ai diritti prima del reset di MySql"/>
</node>
<node CREATED="1362514553492" FOLDED="true" ID="ID_192547388" MODIFIED="1411344678395" TEXT="uscire dal client &quot;locale&quot; mysql">
<node CREATED="1362514571591" ID="ID_961756912" MODIFIED="1362514583928" TEXT="mysql&gt; exit"/>
</node>
<node CREATED="1362511828882" FOLDED="true" ID="ID_796870701" MODIFIED="1411344678395" TEXT="ora si configura mysql per dare la possibilit&#xe0; di collegare root da tutti gli indirizzi:">
<node CREATED="1362511786223" ID="ID_1127127855" MODIFIED="1362515279710" TEXT="$ sudo nano /etc/mysql/my.cnf"/>
<node CREATED="1362515312613" FOLDED="true" ID="ID_1297649348" MODIFIED="1411344678395" TEXT="in nano cercare e commentare la linea:">
<node CREATED="1362515329881" ID="ID_858072121" MODIFIED="1362515331775" TEXT="bind-address = 127.0.0.1"/>
</node>
<node CREATED="1362515390249" ID="ID_1469311851" MODIFIED="1362515398312" TEXT="uscire e salvare"/>
</node>
<node CREATED="1362515563827" ID="ID_292418643" MODIFIED="1362515590173" TEXT="spegnere mysql e riaccenderlo, oppure fare lo stesso con il computer"/>
<node CREATED="1362413752154" ID="ID_1973602131" MODIFIED="1362515512886" TEXT="verificare se si accede dal server da remoto, entrando come root utilizzando, per esempio, MySql Workbench"/>
</node>
</node>
</node>
<node CREATED="1362412276695" ID="ID_729606201" MODIFIED="1423959845112" TEXT="da remoto, con un client MySql (es. MySqlWorkbench), si finisce la configurazione del server">
<node CREATED="1362414251463" ID="ID_1793942777" MODIFIED="1423959847033" TEXT="Da &quot;home&quot;">
<node CREATED="1362415170593" ID="ID_1218914612" MODIFIED="1362570244106" TEXT="Fatti nuovi utenti"/>
<node CREATED="1362414267236" ID="ID_1959054161" MODIFIED="1362414867461" TEXT="Server Administration | Users and Privileges | Server Access Management"/>
<node CREATED="1362570763714" FOLDED="true" ID="ID_1739451631" MODIFIED="1411344678395" TEXT="modifica account root">
<node CREATED="1362414982824" ID="ID_1977844754" MODIFIED="1362570803047" TEXT="Login name: root"/>
<node CREATED="1362414991737" FOLDED="true" ID="ID_1979409064" MODIFIED="1411344678395" TEXT="Limit Connectivity">
<node CREATED="1362415009589" ID="ID_199840014" MODIFIED="1362570811305" TEXT="172.16.46.250"/>
</node>
<node CREATED="1362415079683" FOLDED="true" ID="ID_1437315618" MODIFIED="1411344678395" TEXT="password">
<node CREATED="1362415085206" ID="ID_1115710627" MODIFIED="1362570821947" TEXT="lasciata la precedente"/>
</node>
</node>
<node CREATED="1362414889990" FOLDED="true" ID="ID_1322176712" MODIFIED="1411344678395" TEXT="bottone &quot;Add Account&quot;">
<node CREATED="1362414975145" FOLDED="true" ID="ID_169518303" MODIFIED="1411344678395" TEXT="5E">
<node CREATED="1362414982824" ID="ID_1258514328" MODIFIED="1362527384101" TEXT="Login name: 5E"/>
<node CREATED="1362414991737" FOLDED="true" ID="ID_3256589" MODIFIED="1411344678395" TEXT="Limit Connectivity">
<node CREATED="1362572508756" ID="ID_1618918948" MODIFIED="1362573147424" TEXT="172.16.%.%"/>
</node>
<node CREATED="1362415079683" FOLDED="true" ID="ID_928985828" MODIFIED="1411344678395" TEXT="password">
<node CREATED="1362415085206" ID="ID_1490585925" MODIFIED="1362528036229" TEXT="AnyOtherTools"/>
</node>
</node>
<node CREATED="1362414975145" FOLDED="true" ID="ID_242926656" MODIFIED="1411344678395" TEXT="5F">
<node CREATED="1362414982824" ID="ID_1597987443" MODIFIED="1362527384101" TEXT="Login name: 5E"/>
<node CREATED="1362414991737" ID="ID_1269951794" MODIFIED="1362415008412" TEXT="Limit Connectivity"/>
<node CREATED="1362415079683" FOLDED="true" ID="ID_46909216" MODIFIED="1411344678395" TEXT="password">
<node CREATED="1362415085206" ID="ID_1043596496" MODIFIED="1362528286901" TEXT="CommonTasks"/>
</node>
</node>
<node CREATED="1362414975145" FOLDED="true" ID="ID_564139970" MODIFIED="1411344678395" TEXT="prof">
<node CREATED="1362414982824" ID="ID_1360161194" MODIFIED="1362527445070" TEXT="Login name: prof"/>
<node CREATED="1362414991737" FOLDED="true" ID="ID_890262022" MODIFIED="1411344678395" TEXT="Limit Connectivity">
<node CREATED="1362415009589" ID="ID_454731601" MODIFIED="1362415748914" TEXT="172.16.%.%"/>
</node>
<node CREATED="1362415079683" FOLDED="true" ID="ID_344648978" MODIFIED="1411344678395" TEXT="password">
<node CREATED="1362415085206" ID="ID_979775895" MODIFIED="1362528282831" TEXT="UsoMySql"/>
</node>
</node>
</node>
<node CREATED="1362415147082" FOLDED="true" ID="ID_1748863787" MODIFIED="1411344678395" TEXT="Dare i diritti di accesso agli utenti appena fatti">
<node CREATED="1362414267236" FOLDED="true" ID="ID_52151321" MODIFIED="1411344678395" TEXT="Server Administration | Users and Privileges | Schema Privileges">
<node CREATED="1362415212759" FOLDED="true" ID="ID_1084117697" MODIFIED="1411344678395" TEXT="5E">
<node CREATED="1362415271740" FOLDED="true" ID="ID_16077046" MODIFIED="1411344678395" TEXT="Host">
<node CREATED="1362415218625" FOLDED="true" ID="ID_764733685" MODIFIED="1411344678395" TEXT="Selected host">
<node CREATED="1362527642935" ID="ID_411090073" MODIFIED="1362527648745" TEXT="quelli dell&apos;utente"/>
</node>
</node>
<node CREATED="1362415267451" FOLDED="true" ID="ID_1232127894" MODIFIED="1411344678395" TEXT="Schema">
<node CREATED="1362415289357" FOLDED="true" ID="ID_1869269782" MODIFIED="1411344678395" TEXT="Schema matching pattern or name">
<node CREATED="1362415484848" FOLDED="true" ID="ID_972149866" MODIFIED="1411344678395" TEXT="5E-db-%">
<node CREATED="1362415560196" ID="ID_1452003805" MODIFIED="1362415684727" TEXT="tutti i diritti (bottone select &quot;ALL&quot;)"/>
</node>
</node>
</node>
<node CREATED="1362415267451" FOLDED="true" ID="ID_1685369473" MODIFIED="1411344678395" TEXT="Schema">
<node CREATED="1362527725109" FOLDED="true" ID="ID_86316245" MODIFIED="1411344678395" TEXT="I database che verranno pubblicato dai prof">
<node CREATED="1362527946154" ID="ID_1084178743" MODIFIED="1362527969311" TEXT="solo i diritti &quot;Object Rights&quot;"/>
</node>
</node>
<node CREATED="1363343452660" FOLDED="true" ID="ID_326453051" MODIFIED="1363343748270" TEXT="Problemi">
<node CREATED="1363343456566" ID="ID_433018257" MODIFIED="1363343565516" TEXT="MySQL Workbench non mette le virgolette retroverse prima di 5E-__-%, per cui d&#xe0; sempre errore di sintassi."/>
<node CREATED="1363343570881" FOLDED="true" ID="ID_1603594229" MODIFIED="1363343746862" TEXT="bisogna farlo a mano dalla shell, con un&apos;istruzione tipo:">
<node CREATED="1363343592329" ID="ID_1619770074" MODIFIED="1363343740352" TEXT="GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, REFERENCES, INDEX, &#xa;ALTER, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, TRIGGER  &#xa;ON `5E-__-%`.*  &#xa;TO &apos;5E&apos;@&apos;172.16.%.%&apos;;"/>
</node>
</node>
</node>
<node CREATED="1362415212759" FOLDED="true" ID="ID_692650952" MODIFIED="1411344678395" TEXT="5F">
<node CREATED="1362415271740" FOLDED="true" ID="ID_1634009558" MODIFIED="1411344678395" TEXT="Host">
<node CREATED="1362415218625" FOLDED="true" ID="ID_542381453" MODIFIED="1411344678395" TEXT="Selected host">
<node CREATED="1362527642935" ID="ID_21470018" MODIFIED="1362527648745" TEXT="quelli dell&apos;utente"/>
</node>
</node>
<node CREATED="1362415267451" FOLDED="true" ID="ID_1803595952" MODIFIED="1411344678395" TEXT="Schema">
<node CREATED="1362415289357" FOLDED="true" ID="ID_1908352751" MODIFIED="1411344678395" TEXT="Schema matching pattern or name">
<node CREATED="1362415484848" FOLDED="true" ID="ID_594794473" MODIFIED="1411344678395" TEXT="5E-db-%">
<node CREATED="1362415560196" ID="ID_997248343" MODIFIED="1362415684727" TEXT="tutti i diritti (bottone select &quot;ALL&quot;)"/>
</node>
</node>
</node>
<node CREATED="1362415267451" FOLDED="true" ID="ID_980491090" MODIFIED="1411344678395" TEXT="Schema">
<node CREATED="1362527725109" FOLDED="true" ID="ID_1606456034" MODIFIED="1411344678395" TEXT="I database che verranno pubblicato dai prof">
<node CREATED="1362527946154" ID="ID_857567054" MODIFIED="1362527969311" TEXT="solo i diritti &quot;Object Rights&quot;"/>
</node>
</node>
</node>
<node CREATED="1362415725457" FOLDED="true" ID="ID_1027934869" MODIFIED="1411344678395" TEXT="prof">
<node CREATED="1362415271740" FOLDED="true" ID="ID_697801456" MODIFIED="1411344678395" TEXT="Host">
<node CREATED="1362415218625" ID="ID_1536518573" MODIFIED="1362415226974" TEXT="Any host"/>
</node>
<node CREATED="1362415267451" FOLDED="true" ID="ID_377436391" MODIFIED="1411344678395" TEXT="Schema">
<node CREATED="1362415289357" FOLDED="true" ID="ID_981382197" MODIFIED="1411344678395" TEXT="Schema matching pattern or name">
<node CREATED="1362415484848" FOLDED="true" ID="ID_297075652" MODIFIED="1411344678395" TEXT="%">
<node CREATED="1362415560196" ID="ID_825663449" MODIFIED="1362415684727" TEXT="tutti i diritti (bottone select &quot;ALL&quot;)"/>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1393357109533" FOLDED="true" ID="ID_750148925" MODIFIED="1411344981268" POSITION="left" TEXT="Windows Terminal client via RDP">
<node CREATED="1393366068680" ID="ID_1296206169" MODIFIED="1393366072374" TEXT="con remmina">
<node CREATED="1393357130993" ID="ID_1656784383" MODIFIED="1393359089117" TEXT="Installare remmina"/>
<node CREATED="1393357165475" ID="ID_1984430886" MODIFIED="1393357166361" TEXT="sudo apt-get install remmina"/>
<node CREATED="1393357190852" ID="ID_178294389" MODIFIED="1393357213636" TEXT="Far partire remmina e dare l&apos;indirizzo IP del computer da controllare da remoto"/>
<node CREATED="1393366460558" ID="ID_122205151" MODIFIED="1393366467003" TEXT="(NON HA FUNZIONATO)"/>
</node>
<node CREATED="1393366081057" ID="ID_1208336661" MODIFIED="1393366085270" TEXT="con rdesktop">
<node CREATED="1393366159932" ID="ID_477042305" MODIFIED="1393366162796" TEXT="sudo apt-get install rdesktop"/>
<node CREATED="1393366468451" ID="ID_1801964865" MODIFIED="1393366773570" TEXT="lanciare rdesktop da una sessione Linux a interfaccia grafica (Gnome, KDE, LXDE (desktop di Raspbian))">
<node CREATED="1393366782538" ID="ID_1674385096" MODIFIED="1393367660494" TEXT="da terminale ENTRO una sessione di UI grafica"/>
<node CREATED="1393366821864" ID="ID_151254722" MODIFIED="1393367641796" TEXT="rdesktop  &lt;indirizzo IP del computer da controllare da remoto&gt;"/>
<node CREATED="1393366983773" ID="ID_1012364186" MODIFIED="1393366990560" TEXT="opzioni">
<node CREATED="1393366991985" ID="ID_1542114645" MODIFIED="1393366999811" TEXT="-f full screen"/>
<node CREATED="1393367037555" ID="ID_939062944" MODIFIED="1393367049014" TEXT="-z: enable compression"/>
<node CREATED="1393367050609" ID="ID_1714765317" MODIFIED="1393367064274" TEXT="-x lan: set experience to &#x201c;LAN&#x201d; (will show desktop wallpaper, windows while moving them etc.) "/>
<node CREATED="1393367064918" ID="ID_46430595" MODIFIED="1393367066738" TEXT="-P: enable caching to disk (i.e. the Raspberry Pi&#x2019;s disk)"/>
</node>
</node>
</node>
</node>
<node CREATED="1420191134239" FOLDED="true" ID="ID_113043218" MODIFIED="1423959806593" POSITION="left" TEXT="WLAN, WiFi">
<node CREATED="1420191147463" FOLDED="true" ID="ID_1692459035" MODIFIED="1420193162042" TEXT="comandi iwconfig,  iwlist">
<node CREATED="1420191169859" ID="ID_245871748" MODIFIED="1420193086945" TEXT="iwconfig &#xe8; simile a ifconfig , ma per le sole interfacce WLAN"/>
</node>
<node CREATED="1420193163464" ID="ID_834463599" MODIFIED="1420193514988" TEXT="comando ip">
<node CREATED="1420193203337" ID="ID_1141546334" MODIFIED="1420193443236" TEXT="&#xe8; utile per configurare il routing e le VPN, ma, con l&apos;opzione addr, mostra anche i dati hardware delle interfacce in modo chiaro e sintetico. "/>
<node CREATED="1420193455007" ID="ID_194439374" MODIFIED="1420193472085" TEXT="addr si pu&#xf2; abbreviare:">
<node CREATED="1420193291382" ID="ID_1007740592" MODIFIED="1420193295300" TEXT="ip a"/>
</node>
<node CREATED="1420193568908" ID="ID_523561581" MODIFIED="1420193598807" TEXT="ip si u&#xf2; usare per &quot;accendere&quot; le interfacce di rete"/>
<node CREATED="1420193600328" ID="ID_1772690053" MODIFIED="1420193608284" TEXT="p.es.">
<node CREATED="1420193612952" MODIFIED="1420193612952">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre>ip link set wlan0 up</pre>
  </body>
</html></richcontent>
</node>
</node>
</node>
</node>
<node CREATED="1420190666367" FOLDED="true" ID="ID_948014527" MODIFIED="1424004978469" POSITION="left" TEXT="WLAN con abilitazione automatica al boot">
<node CREATED="1420190709835" ID="ID_481568695" MODIFIED="1420190821520" TEXT="Alcune schede funzionano se fatte partire dall&apos;ambiente grafico, mentre non partono automaticamente al boot (es. Dlink XXXX????)"/>
<node CREATED="1420190795290" ID="ID_1819950992" MODIFIED="1420190879202" TEXT="Per farlo devono essere supportate da un &quot;manager&quot;">
<node CREATED="1420190883772" ID="ID_746649924" MODIFIED="1420190888123" TEXT="ci sono">
<node CREATED="1420190889183" ID="ID_1522341393" MODIFIED="1420199228471" TEXT="&quot;Network Manager&quot;">
<node CREATED="1420190931887" ID="ID_946422266" MODIFIED="1420190985076" TEXT="https://wiki.debian.org/WiFi/HowToUse"/>
<node CREATED="1420199231960" ID="ID_1375051845" MODIFIED="1420199309646" TEXT="questo tool necessita, per la sua confgurazione, di un tool in interfaccia grafica, che non pu&#xf2; essere disponbile su un server"/>
</node>
<node CREATED="1420190920851" ID="ID_425128622" MODIFIED="1423960222472" TEXT="wicd">
<node CREATED="1420191286693" ID="ID_1577817780" MODIFIED="1420191290171" TEXT="sudo apt-get install wicd"/>
<node CREATED="1420199165506" ID="ID_1988826747" MODIFIED="1420199190471" TEXT="Operazioni non necessarie in Raspbian"/>
<node CREATED="1420191383595" ID="ID_867821744" MODIFIED="1420191750073" TEXT="fare in modo che /etc/network/interfaces contenga SOLAMENTE">
<node CREATED="1420191438148" ID="ID_287092880" MODIFIED="1420191438148">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre>auto lo
iface lo inet loopback</pre>
  </body>
</html></richcontent>
</node>
<node CREATED="1420191701965" ID="ID_228301439" MODIFIED="1420191929724" TEXT="da debian wheezy in poi si pu&#xf2; lasciare /etc/network/interfaces com&apos;era, ma wicd non considerer&#xe0; le opzioni wifi."/>
</node>
<node CREATED="1420191962736" ID="ID_1974996955" MODIFIED="1420191993167" TEXT="aggiungere l&apos;utente che si usa al gruppo degli amministratori della rete">
<node CREATED="1420192202748" ID="ID_1812475046" MODIFIED="1420192242336" TEXT="sudo adduser &lt;username&gt; netdev"/>
<node CREATED="1420192153340" ID="ID_1438309052" MODIFIED="1420192185194" TEXT="ricaricare il demone dbus, &apos;ch&#xe8; legga la nuova configurazione"/>
<node CREATED="1420192137991" ID="ID_191710791" MODIFIED="1420192141050" TEXT="/etc/init.d/dbus reload"/>
<node CREATED="1420192015377" ID="ID_824655209" MODIFIED="1420192315932" TEXT="in Raspbian pi &#xe8; gi&#xe0; nel gruppo, per cui queste operazioni non sono necessarie"/>
</node>
<node CREATED="1420192131183" ID="ID_468468973" MODIFIED="1420192443279" TEXT="entrare nell&apos;ambiente grafico (anche via VNC) ed eseguire il programma di configurazione di wicd">
<node CREATED="1420192546071" ID="ID_1913122457" MODIFIED="1420192562180" TEXT="da un terminale dell&apos;ambiene grafico"/>
<node CREATED="1420192563131" ID="ID_1155672941" MODIFIED="1420192632389" TEXT="sudo wicd-client -n"/>
<node CREATED="1420194217527" ID="ID_1848930082" MODIFIED="1420194268092" TEXT="se non funziona, usare wicd-curses"/>
</node>
</node>
</node>
</node>
<node CREATED="1420194103898" ID="ID_1002935197" MODIFIED="1420194252734" TEXT="wicd con Raspbian">
<node CREATED="1420194118322" ID="ID_1802981659" MODIFIED="1420194199527" TEXT="Ci sono problemi con i frontend grafici di wicd, per cui bisogna installare wicd-curses, per poterlo gestire da interfaccia a comando">
<node CREATED="1420194417260" ID="ID_1136232517" LINK="http://www.raspyfi.com/wi-fi-on-raspberry-pi-a-simple-guide/" MODIFIED="1420194417260" TEXT="raspyfi.com &gt; Wi-fi-on-raspberry-pi-a-simple-guide"/>
<node CREATED="1420199082344" ID="ID_899117702" MODIFIED="1420199152912" TEXT="wicd-curses installa anche wicd, per cui le operazioni precedenti per wicd non sono necessarie"/>
<node CREATED="1420194358157" ID="ID_923386099" MODIFIED="1420194361910" TEXT="installazione">
<node CREATED="1420194386800" ID="ID_305009297" MODIFIED="1420194386800">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <strong>sudo apt-get update<br />sudo apt-get install wicd-curses</strong>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1420194364129" ID="ID_1739735583" MODIFIED="1420194454290" TEXT="lancio">
<node CREATED="1420194371414" ID="ID_1616750932" MODIFIED="1420194371414">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <strong>sudo wicd-curses</strong>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1420194455374" ID="ID_512906006" MODIFIED="1420194470670" TEXT="scegliere la rete WiFi con le frecce"/>
<node CREATED="1420195821890" ID="ID_744079977" MODIFIED="1420195871403" TEXT="con la freccia destra si possono configurare le caratteristiche dell&apos;hot spot"/>
<node CREATED="1420199012478" ID="ID_1938638405" MODIFIED="1420199337944" TEXT="ha qualche problema di robustezza ma, nonostante i lock, ha salvato ed ha funzionato."/>
<node CREATED="1420199338471" ID="ID_931960462" MODIFIED="1420199374931" TEXT="Al reboot la scheda si collega alla rete WLAN"/>
</node>
</node>
</node>
</node>
</map>
