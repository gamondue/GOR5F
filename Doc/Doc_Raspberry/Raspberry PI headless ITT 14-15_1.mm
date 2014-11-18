<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1356636942371" ID="ID_757975246" MODIFIED="1411476022817" TEXT="Raspberry PI headless">
<node CREATED="1358182794740" ID="ID_1416347831" MODIFIED="1411476024411" POSITION="right" TEXT="Copiare su una SD un file immagine, rendendola &quot;bootable&quot;">
<node CREATED="1358182828249" ID="ID_1967307488" MODIFIED="1361028515044" TEXT="l&apos;immagine potrebbe essere presa da Internet, o clonata da una card esistente, con la procedura descritta in seguito"/>
<node CREATED="1361028519559" ID="ID_1465778392" MODIFIED="1411476024426" TEXT="su windows">
<node CREATED="1361028526185" ID="ID_1615921910" MODIFIED="1361028549803" TEXT="usare Win32DiskImager.exe"/>
<node CREATED="1361028556063" ID="ID_794321095" MODIFIED="1411476024426" TEXT="scegliere il device su cui scrivere">
<node CREATED="1361028569586" ID="ID_508847094" MODIFIED="1361028573963" TEXT="ATTENZIONE!"/>
</node>
<node CREATED="1361028587308" ID="ID_156745454" MODIFIED="1411476024442" STYLE="fork" TEXT="scegliere il file di immagine">
<node CREATED="1411313147104" ID="ID_446539222" MODIFIED="1411313155212" TEXT="scaricato da Internet"/>
<node CREATED="1411313156025" ID="ID_407005100" MODIFIED="1411313158432" TEXT="oppure"/>
<node CREATED="1411313158819" ID="ID_1766362120" MODIFIED="1411313300921" TEXT="&quot;fotografato&quot; dalla SDcard di un sistema &quot;pronto&quot;, con i programmi che servono gi&#xe0; installati e configurati"/>
</node>
</node>
</node>
<node CREATED="1356636955633" ID="ID_761825239" MODIFIED="1411476024473" POSITION="right" TEXT="Configurazione headless &quot;da zero&quot;">
<node CREATED="1356636977035" ID="ID_866445894" MODIFIED="1356639532233" TEXT="Connettere il raspi alla Ethernet, con un server DHCP del quale si pu&#xf2; vedere il log"/>
<node CREATED="1356639532900" ID="ID_885597228" MODIFIED="1356639569719" TEXT="Alimentare il raspi, si accendono i LED relativi alla rete"/>
<node CREATED="1356637243385" ID="ID_1506666854" MODIFIED="1356639663846" TEXT="Cercare nel log del server DHCP l&apos;indirizzo che &#xe8; stato assegnato al raspi ( &#xe8; indicato come raspberrypi)"/>
<node CREATED="1356639694742" ID="ID_1307448944" MODIFIED="1356639751935" TEXT="Far partire un client SSH (es. Putty) e collegarsi al raspi, utilizzando l&apos;indirizzo assegnato dal server DHCP"/>
<node CREATED="1356639764601" ID="ID_405019662" MODIFIED="1356639796890" TEXT="Accettare il certificato di sicurezza richiesto dal server SSH"/>
<node CREATED="1356639843435" ID="ID_918965901" MODIFIED="1356639870954" TEXT="Ci si collega al raspi e viene fatta la richiesta per il login da remoto"/>
<node CREATED="1356637132191" ID="ID_1562414222" MODIFIED="1411476024473" TEXT="Login utente">
<node CREATED="1356637139424" ID="ID_1066788689" MODIFIED="1411476024473" TEXT="Utente sudoer di default all&apos;inizializzazione di Raspbian">
<node CREATED="1356637161189" ID="ID_701243109" MODIFIED="1356637163742" TEXT="pi"/>
</node>
<node CREATED="1356637139424" ID="ID_285374584" MODIFIED="1411476024489" TEXT="Password di default">
<node CREATED="1356637166724" ID="ID_1715841156" MODIFIED="1356637170942" TEXT="raspberry"/>
</node>
</node>
<node CREATED="1356637430095" ID="ID_1807659478" MODIFIED="1411476024520" TEXT="Esecuzione del programma di configurazione">
<node CREATED="1361031250019" ID="ID_1608441541" MODIFIED="1361031327866" TEXT="se abbiamo monitor e tastiera la prima volta parte automaticamente il programma di configurazione"/>
<node CREATED="1356637453822" ID="ID_1149703422" MODIFIED="1411476024520" TEXT="se configuriamo un sistema headless, si finisce in una normale shell. Come consigliato al boot">
<node CREATED="1356639881511" ID="ID_1731852722" MODIFIED="1411476024536" TEXT="eseguire">
<node CREATED="1356637444154" ID="ID_349659770" MODIFIED="1356637445121" TEXT="sudo raspi-config"/>
</node>
</node>
<node CREATED="1361031380186" ID="ID_706566414" MODIFIED="1411476024536" TEXT="overscan">
<node CREATED="1361031393553" ID="ID_771521924" MODIFIED="1361031455214" TEXT="mette un bordo nero intorno al frame video, per poter vedere le parti esterne del video anche su vecchi televisori"/>
</node>
<node CREATED="1356637846397" ID="ID_1798652892" MODIFIED="1411476024551" TEXT="change_locale">
<node CREATED="1356637854765" ID="ID_1856226033" MODIFIED="1356646313309" TEXT="it_IT ISO-8859-1"/>
<node CREATED="1356637854765" ID="ID_618953991" MODIFIED="1356646324868" TEXT="it_IT-UTF-8 UTF-8"/>
<node CREATED="1356637854765" ID="ID_633379180" MODIFIED="1356646396569" TEXT="it_IT@euro ISO-8859-15"/>
<node CREATED="1356637977954" ID="ID_93854620" MODIFIED="1411476024551" TEXT="Selezione del locale di default">
<node CREATED="1356637990185" ID="ID_778490272" MODIFIED="1356637993468" TEXT="Scelto"/>
<node CREATED="1356637993705" ID="ID_75875926" MODIFIED="1356646427412" TEXT="it_IT "/>
<node CREATED="1356646428019" ID="ID_308086863" MODIFIED="1411476024551" TEXT="en_GB-UTF-8">
<node CREATED="1356646439178" ID="ID_1090790505" MODIFIED="1356646454680" TEXT="c&apos;&#xe8; di default anche senza sceglierlo"/>
</node>
</node>
<node CREATED="1356637854765" ID="ID_679309584" MODIFIED="1411476024567" TEXT="en_GB.UTF-8 UTF-8">
<node CREATED="1356647212144" ID="ID_355678345" MODIFIED="1357130241959" TEXT="il default del sistema"/>
</node>
</node>
<node CREATED="1356638029988" ID="ID_1383819974" MODIFIED="1411476024567" TEXT="change_timezone">
<node CREATED="1356638037111" ID="ID_504220339" MODIFIED="1356638069234" TEXT="europe ! Rome"/>
</node>
<node CREATED="1356638108927" ID="ID_465915920" MODIFIED="1411476024567" TEXT="memory_split">
<node CREATED="1356638209387" ID="ID_229197870" MODIFIED="1356638243541" TEXT="stabilisce quanta memoria assegnare alla scheda video e quanta alla CPU"/>
<node CREATED="1356638243906" ID="ID_234124611" MODIFIED="1411476024567" TEXT="per un sistema headless, consigliato">
<node CREATED="1356638259218" ID="ID_1645675725" MODIFIED="1356638260874" TEXT="224MiB for Arm, 32MiB for VideoCore"/>
</node>
</node>
<node CREATED="1356638596941" ID="ID_913426627" MODIFIED="1411476024582" TEXT="overclock">
<node CREATED="1356638610677" ID="ID_1846694316" MODIFIED="1356638615954" TEXT="non cambiato"/>
</node>
<node CREATED="1356638629638" ID="ID_1716908824" MODIFIED="1411476024582" TEXT="ssh">
<node CREATED="1356638632410" ID="ID_1622809758" MODIFIED="1356638636344" TEXT="non cambiato"/>
<node CREATED="1411258371505" ID="ID_794081062" MODIFIED="1411258382184" TEXT="abilitato di default"/>
</node>
<node CREATED="1356638638805" ID="ID_710351292" MODIFIED="1411476024582" TEXT="boot-behaviour">
<node CREATED="1356639018458" ID="ID_317557424" MODIFIED="1411476024582" TEXT="straight to desktop">
<node CREATED="1356639056202" ID="ID_139972516" MODIFIED="1411258449411" TEXT="per un sistema headless no (il desktop principale non serve perch&#xe8; non lo attacchiamo mai ad un monitor)"/>
</node>
</node>
<node COLOR="#338800" CREATED="1356639070594" ID="ID_1217078554" MODIFIED="1411476024582" TEXT="update">
<node CREATED="1356639076702" ID="ID_1361721702" MODIFIED="1356639077919" TEXT="fatto"/>
</node>
<node CREATED="1356639204094" ID="ID_707507361" MODIFIED="1356639208771" TEXT="finish"/>
<node CREATED="1356646528914" ID="ID_1184414937" MODIFIED="1411476024598" TEXT="per riconfigurare la tastiera:">
<node CREATED="1356646545630" ID="ID_239319851" MODIFIED="1356646547347" TEXT="sudo dpkg-reconfigure keyboard-configuration"/>
</node>
</node>
<node CREATED="1362406986100" ID="ID_239732714" MODIFIED="1411476024598" TEXT="cambio della password dell&apos;utente pi">
<node CREATED="1362406995358" ID="ID_673346401" MODIFIED="1362417326863" TEXT="sudo passwd pi"/>
</node>
<node CREATED="1362419751363" ID="ID_3543572" MODIFIED="1411476024598" TEXT="cambio del nome del computer">
<node CREATED="1411314828835" ID="ID_785571024" MODIFIED="1411476024614" TEXT="meglio farlo con il programma di configurazione iniziale">
<node CREATED="1356637444154" ID="ID_1003442830" MODIFIED="1356637445121" TEXT="sudo raspi-config"/>
<node CREATED="1411314891949" ID="ID_1034055090" MODIFIED="1411314916933" TEXT="c&apos;&#xe8; una riga di scelta per il cambio del nome del sistema"/>
</node>
<node CREATED="1361033887371" ID="ID_1709163045" MODIFIED="1411476024614" TEXT="modificare il file /etc/hostname">
<node CREATED="1361033867039" ID="ID_1893222044" MODIFIED="1361033867039">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <code>sudo nano /etc/hostname</code>
  </body>
</html></richcontent>
</node>
<node CREATED="1361033904641" ID="ID_1122034991" MODIFIED="1362763803656" TEXT="sostituito raspberrypi con  mysqlserver"/>
</node>
<node CREATED="1361033887371" ID="ID_277499567" MODIFIED="1411476024629" TEXT="modificare il file /etc/hosts">
<node CREATED="1361033867039" ID="ID_1131527644" MODIFIED="1362419830876" STYLE="fork">
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
<node CREATED="1361033904641" ID="ID_1078737081" MODIFIED="1362763800265" TEXT="sostituire raspberrypi con  mysqlserver"/>
</node>
</node>
<node CREATED="1411314450771" ID="ID_393983498" MODIFIED="1411476024629" TEXT="eventuale creazione di nuovi utenti">
<node CREATED="1411314533741" ID="ID_1425619124" MODIFIED="1411314545252" TEXT="adduser &lt;nome del nuovo utente&gt;"/>
</node>
<node CREATED="1357127416679" ID="ID_28344809" MODIFIED="1411476024645" TEXT="Cambiare il nome al computer">
<node CREATED="1361033887371" ID="ID_362193859" MODIFIED="1411476024645" TEXT="modificare il file /etc/hostname">
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
<node CREATED="1361033887371" ID="ID_33128930" MODIFIED="1411476024661" TEXT="modificare il file /etc/hosts">
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
<node CREATED="1361034143885" ID="ID_1672561948" MODIFIED="1362257262599" TEXT="al reboot successivo il computer avr&#xe0; cambiato nome"/>
</node>
</node>
<node CREATED="1362407579091" ID="ID_1264442117" MODIFIED="1411476024661" POSITION="right" TEXT="Configurazione dell&apos;interfaccia di rete">
<node CREATED="1362407780625" ID="ID_410364146" MODIFIED="1411476024676" TEXT="configurazione con indirizzo IP dinamico">
<node CREATED="1394472297114" ID="ID_1047720353" MODIFIED="1394472307192" TEXT="impostata di default"/>
<node CREATED="1394472321354" ID="ID_593392438" MODIFIED="1394472337151" TEXT="(per rimetterla se la si &#xe8; tolta, vedere in seguito)"/>
</node>
<node CREATED="1362407780625" ID="ID_1665436016" MODIFIED="1411476024692" TEXT="configurazione con indirizzo IP statico">
<node CREATED="1362408095562" ID="ID_79926291" MODIFIED="1411476024707" TEXT="modificare con nano /etc/network/interfaces">
<node CREATED="1362419673627" ID="ID_32858449" MODIFIED="1411261002005">
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
      netmask 255.255.255.0
    </p>
    <p>
      network 172.16.13.0
    </p>
    <p>
      broadcast 172.16.13.255
    </p>
    <p>
      gateway 172.16.13.254
    </p>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1362419718635" ID="ID_1680593565" MODIFIED="1411476024707" TEXT="dato l&apos;indirizzo: 172.16.27.101">
<node CREATED="1394475859787" ID="ID_692190741" MODIFIED="1394486317051" TEXT="Mettere 50 + numero del computer di laboratorio"/>
<node CREATED="1394486320223" ID="ID_977962552" MODIFIED="1394486328843" TEXT="51 computer Monti cattedra"/>
</node>
<node CREATED="1362762858837" ID="ID_20186002" MODIFIED="1411476024707" TEXT="per far ripartire il software di rete e leggere la nuova configurazione senza spegnere il computer">
<node CREATED="1362762783694" ID="ID_1197924327" MODIFIED="1394477369283" TEXT="# sudo /etc/init.d/networking restart"/>
</node>
<node CREATED="1394477069831" ID="ID_1037577989" MODIFIED="1411476024723" TEXT="per far ripartire la sola scheda di rete">
<node CREATED="1394477084095" ID="ID_780858677" MODIFIED="1411476024723" TEXT="# sudo ifconfig eth0 down">
<node CREATED="1394477230358" ID="ID_1604011757" MODIFIED="1394477274515" TEXT="naturalmente la scheda si spegne, per cui questa &#xe8; da evitare se si &#xe8; in sessione remota (da terminale esterno al raspi)"/>
</node>
<node CREATED="1394477084095" ID="ID_627840899" MODIFIED="1394477114466" TEXT="# sudo ifconfig eth0 up"/>
</node>
</node>
<node CREATED="1362832331797" ID="ID_1236788913" MODIFIED="1411476024739" TEXT="indirizzi dei server DNS">
<node CREATED="1362832350371" ID="ID_1263605277" MODIFIED="1411476024739" TEXT="aggiunto hagrid come primo server DNS">
<node CREATED="1362832521317" ID="ID_1087925179" MODIFIED="1411476024739" TEXT="modificare /etc/resolv.conf">
<node CREATED="1362832521317" ID="ID_999483608" MODIFIED="1363029649283" STYLE="fork" TEXT="sudo nano /etc/resolv.conf"/>
<node CREATED="1362832587420" ID="ID_1004600470" MODIFIED="1411476024754" TEXT="aggiunto nella prima riga:">
<node CREATED="1362832606644" ID="ID_1132671706" MODIFIED="1411476024754" TEXT="172.16.13.254">
<node CREATED="1411314991649" ID="ID_1653559026" MODIFIED="1411314995973" TEXT="(&#xe8; hagrid)"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1356654108245" ID="ID_1661543619" MODIFIED="1411476024770" POSITION="right" TEXT="Server LAMP">
<node CREATED="1362406953971" ID="ID_720375592" MODIFIED="1411476024770" TEXT="aggiornamenti vari (da fare prima di tutte le nuove installazioni di programmi)">
<node CREATED="1362406965532" ID="ID_76207515" MODIFIED="1362406966705" TEXT="sudo apt-get update"/>
<node CREATED="1362406959150" ID="ID_1141248444" MODIFIED="1362406959917" TEXT="sudo apt-get upgrade"/>
</node>
<node CREATED="1363356906364" FOLDED="true" ID="ID_533113047" MODIFIED="1414707707973" TEXT="apache">
<node CREATED="1363356911465" ID="ID_1523833780" MODIFIED="1363356914716" TEXT="Web server"/>
<node CREATED="1363357020382" ID="ID_1718274411" MODIFIED="1363357022102" TEXT="sudo apt-get install apache2"/>
<node CREATED="1411315405720" ID="ID_698931631" MODIFIED="1411476024786" TEXT="Prova del web server">
<node CREATED="1411315416854" ID="ID_92596751" MODIFIED="1411476024786" TEXT="Puntare il browser sull&apos;indirizzo IP del Raspberry">
<node CREATED="1411315444931" ID="ID_1675371980" MODIFIED="1411315494714" TEXT="scrivere 172.16.13.100 nella barra degli indirizzi (URL) del browser"/>
<node CREATED="1411316147352" ID="ID_1021747019" MODIFIED="1411476024801" TEXT="esce la home page di default">
<node CREATED="1411316166334" ID="ID_619263461" MODIFIED="1411316174446" TEXT="It works!"/>
</node>
</node>
</node>
</node>
<node CREATED="1362408087514" ID="ID_1406234059" MODIFIED="1411476024801" TEXT="MySql">
<node CREATED="1411315514884" ID="ID_1310938675" MODIFIED="1411315523030" TEXT="MySql &#xe8; un database server"/>
<node CREATED="1362408083974" ID="ID_11869430" MODIFIED="1362408086468" TEXT="sudo apt-get install mysql-server"/>
<node CREATED="1411316394750" ID="ID_1894587776" MODIFIED="1411316408841" TEXT="Dettagli della configurazione in altro momento"/>
</node>
<node CREATED="1363356957722" ID="ID_485364723" MODIFIED="1411476024817" TEXT="php">
<node CREATED="1363356962701" ID="ID_1946784399" MODIFIED="1363356978213" TEXT="linguaggio di programmazione lato server"/>
<node CREATED="1363358678842" ID="ID_878866690" MODIFIED="1363358680682" TEXT="sudo apt-get install php5"/>
<node CREATED="1363358713256" ID="ID_1964768115" MODIFIED="1411476024817" TEXT="sudo apt-get install php5-mysql">
<node CREATED="1411316297833" ID="ID_166892246" MODIFIED="1411316309517" TEXT="per usare MySql da php"/>
</node>
<node CREATED="1363367435732" ID="ID_1370079261" MODIFIED="1411476024817" TEXT="prova del php">
<node CREATED="1363367466613" ID="ID_559038471" MODIFIED="1411476024832" TEXT="creare un file php di prova nella cartella della home page del web server">
<node CREATED="1363367511082" ID="ID_1849472555" MODIFIED="1411476024848" TEXT="passare nella cartella home">
<node CREATED="1363367502728" ID="ID_469486905" MODIFIED="1363367510452" TEXT="cd /var/www"/>
</node>
<node CREATED="1363367538402" ID="ID_1180304159" MODIFIED="1411476024848" TEXT="creare il file">
<node CREATED="1363367462622" ID="ID_13096832" MODIFIED="1411317078341" TEXT="sudo nano info.php"/>
</node>
<node CREATED="1363367545858" ID="ID_958432393" MODIFIED="1411476024848" TEXT="mettere nel file la pi&#xf9; semplice pagina php">
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
</node>
<node CREATED="1363367729547" ID="ID_53494993" MODIFIED="1411476024864" TEXT="da un browser, caricare la pagina php">
<node CREATED="1363367758312" ID="ID_41565455" MODIFIED="1363367796207" TEXT="mettere nel browser la URI"/>
<node CREATED="1363367796559" ID="ID_287184838" MODIFIED="1411316700706" TEXT="http://172.16.13.100/prova.php"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1363597286998" ID="ID_1669574243" MODIFIED="1411476024879" POSITION="right" TEXT="Server FTP">
<node CREATED="1383697598336" ID="ID_1744533779" MODIFIED="1411476024879" TEXT="installare il server ftp">
<node CREATED="1411293455118" ID="ID_1908156367" MODIFIED="1411476024879" TEXT="installare gli aggiornamenti del sistema (se il sistema non &#xe8; aggiornato)">
<node CREATED="1411293486851" ID="ID_923949026" MODIFIED="1411293495832" TEXT="sudo apt-get update"/>
</node>
<node CREATED="1411294254343" ID="ID_1179389226" MODIFIED="1411476024895" TEXT="Installare il server FTP">
<node CREATED="1383697611108" ID="ID_1717263234" MODIFIED="1411476024895" TEXT="sudo apt-get install vsftpd">
<arrowlink DESTINATION="ID_1717263234" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_166761568" STARTARROW="None" STARTINCLINATION="0;0;"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_1717263234" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_166761568" SOURCE="ID_1717263234" STARTARROW="None" STARTINCLINATION="0;0;"/>
<node CREATED="1383697700481" ID="ID_1067523463" MODIFIED="1411476024895" TEXT="vsftpd">
<node CREATED="1383697661968" ID="ID_273091524" MODIFIED="1383697664827" TEXT="&quot;Very Secure FTP Daemon&quot;"/>
<node CREATED="1383697712036" ID="ID_1259432311" MODIFIED="1383697754028" TEXT="&#xe8; installato di default in Ubuntu, CentOS, Fedora, Slackware, Red Hat Linux .."/>
</node>
</node>
</node>
</node>
<node CREATED="1383697841764" ID="ID_430875814" MODIFIED="1411476024911" TEXT="configurare il server ftp">
<node CREATED="1383697850981" ID="ID_1792280373" MODIFIED="1411476024911" TEXT="editare /etc/vsftpd.conf">
<node CREATED="1383697857913" ID="ID_733680411" MODIFIED="1383697862662" TEXT="sudo nano /etc/vsftpd.conf"/>
<node CREATED="1383697884662" ID="ID_368501931" MODIFIED="1411476024926" TEXT="cambiare">
<node CREATED="1383697888407" ID="ID_1162351026" MODIFIED="1383698908858" TEXT="se non si vuole accesso anonimo modificare: &#xa;anonymous_enable=YES &#xa;in &#xa;anonymous_enable=NO&#xa;&#xa;togliere il commento da: &#xa;local_enable=YES &#xa;e da:&#xa;write_enable=YES&#xa;&#xa;alla file del file aggiungere la linea: &#xa;force_dot_files=YES&#xa;&#xa;Salvare ed uscire da nano&#xa;"/>
<node CREATED="1383698955935" ID="ID_439078716" MODIFIED="1411476024942" TEXT="force_dot_files=YES">
<node CREATED="1383699030726" ID="ID_1571737969" MODIFIED="1383699068523" TEXT="mostra i file nascosti che iniziano per . ed i puntatori alle cartelle superiori .."/>
<node CREATED="1383699069071" ID="ID_1137046064" MODIFIED="1383699102729" TEXT="utile per non sovrascrivere per sbaglio file che sono presenti ma non visibili perch&#xe8; hanno il punto all&apos;inizio"/>
</node>
</node>
</node>
</node>
<node CREATED="1383699174793" ID="ID_24520569" MODIFIED="1411476024942" TEXT="far ripartire il server, per applicare la nuova configurazione">
<node CREATED="1383699200768" ID="ID_422162275" MODIFIED="1383699202222" TEXT="sudo service vsftpd restart"/>
</node>
<node CREATED="1411294678557" ID="ID_374998580" MODIFIED="1411476024958" TEXT="Serve se si vuole gestire il RaspberryPi come server http controllato da remoto">
<node CREATED="1411344761412" ID="ID_115381903" MODIFIED="1411344806664" TEXT="con FTP si scriveranno i file del sito nella giusta cartella sul server"/>
<node CREATED="1411344807222" ID="ID_994018899" MODIFIED="1411344873528" TEXT="all&apos;installazione il proprietario della cartella del sito &#xe8; l&apos;utente root, quindi da FTP non &#xe8; possibile scrivere nella cartella"/>
<node CREATED="1383696564310" ID="ID_102435823" MODIFIED="1411476024958" TEXT="se si vuole scrivere nella cartella del sito da remoto via FTP, &#xe8; necessario cambiare il proprietario della cartella homepage del sito web">
<node CREATED="1411294731083" ID="ID_1046032793" MODIFIED="1411294865329" TEXT="cos&#xec; potremo fare l&apos;upload sulle cartelle del sito, entrando in FTP con l&apos;utente indicato in seguito"/>
<node CREATED="1383697500071" ID="ID_1788247852" MODIFIED="1411476024973" TEXT="sudo chown -R pi /var/www">
<node CREATED="1383697537456" ID="ID_985795851" MODIFIED="1383697573990" TEXT="-R = recursive fa operare il cambio di owner ricorsivamente su tutte le sottocartelle"/>
<node CREATED="1411294766588" ID="ID_239705215" MODIFIED="1411294822466" TEXT="pi &#xe8; l&apos;utente con cui faremo il login ftp (qui &#xe8; l&apos;utente di default, se si entra con un altro utente, mettere il suo nome qui)"/>
</node>
</node>
</node>
</node>
<node CREATED="1411258936925" ID="ID_1767617393" MODIFIED="1411476024989" POSITION="right" TEXT="Configurazione di I2C">
<node CREATED="1411258979470" ID="ID_819548151" MODIFIED="1411259040679" TEXT="all&apos;installazione I2C &#xe8; disabilitato. Per abilitarlo si modifica il file di configurazione del driver I2C"/>
<node CREATED="1411259044803" ID="ID_1221324913" MODIFIED="1411476025036" TEXT="sudo nano /etc/modprobe.d/raspi-blacklist.conf">
<node CREATED="1411259173179" ID="ID_701418848" MODIFIED="1411259195243" TEXT="Il file potrebbe essere cos&#xec;:"/>
<node CREATED="1411259101069" ID="ID_533258270" MODIFIED="1411259203033" TEXT="# blacklist spi and i2c by default (many users don&apos;t need them)  &#xa;blacklist spi-bcm2708 &#xa;blacklist i2c-bcm2708 "/>
<node CREATED="1411259205269" ID="ID_152265635" MODIFIED="1411259220152" TEXT="La blacklist "/>
<node CREATED="1411259331863" ID="ID_305384711" MODIFIED="1411476025036" STYLE="fork" TEXT="Editare l&apos;elenco dei moduli del kernel, aggiungendoci in fondo all&apos;ultima riga, la scritta i2c-dev">
<node CREATED="1411259350788" ID="ID_1775996892" MODIFIED="1411259406658" TEXT="sudo nano /etc/modules"/>
</node>
<node CREATED="1411259561324" ID="ID_267405931" MODIFIED="1411259562258" TEXT="sudo nano /etc/modules"/>
<node CREATED="1411259562910" ID="ID_1234093222" MODIFIED="1411259611700" TEXT="aggiungere a mano una riga dopo l&apos;ultima riga del file"/>
<node CREATED="1411259616106" ID="ID_150766631" MODIFIED="1411476025036" TEXT="il testo della riga da aggiungere">
<node CREATED="1411259622481" ID="ID_823714619" MODIFIED="1411259630051" TEXT="i2d-dev"/>
</node>
<node CREATED="1411259530397" ID="ID_1462857263" MODIFIED="1411259548413" TEXT="Installare gli strumenti per i2C:"/>
<node CREATED="1411259531820" ID="ID_879076123" MODIFIED="1411259534087" TEXT="sudo apt-get install i2c-tools"/>
<node CREATED="1411259718888" ID="ID_469153826" MODIFIED="1411260029516" TEXT="Aggiungere ora un nuovo utente, gestore del bus I2C"/>
<node CREATED="1411259748309" ID="ID_1560295088" MODIFIED="1411259749450" TEXT="sudo adduser pi i2c"/>
<node CREATED="1411260038962" ID="ID_1050908276" MODIFIED="1411260059096" TEXT="far ripartire il raspberry"/>
<node CREATED="1411260068245" ID="ID_1318291141" MODIFIED="1411476025051" TEXT="ora si dovrebbero vedere i device I2C collegati">
<node CREATED="1411317767039" ID="ID_1535383111" MODIFIED="1411317802776" TEXT="programma che trova i device I2C che sono attualmente collegati al RasPI"/>
<node CREATED="1411260278101" ID="ID_240501922" MODIFIED="1411476025051" TEXT="sudo i2cdetect -y 1">
<node CREATED="1411260244793" ID="ID_135503867" MODIFIED="1411476025051" TEXT="oppure (se RaspPI vecchia (rev.1))">
<node CREATED="1411260271836" ID="ID_1526765265" MODIFIED="1411260288185" TEXT="sudo i2cdetect -y 0"/>
</node>
</node>
</node>
<node CREATED="1411324057653" ID="ID_1330862068" MODIFIED="1411476025051" TEXT="Comandi di i2ctools">
<node CREATED="1411324108806" ID="ID_1845061163" MODIFIED="1411476025067" TEXT="i2cdetect">
<node CREATED="1411324115977" ID="ID_71930745" MODIFIED="1411324146317" TEXT="permette di vedere a quali indirizzi si trovano device I2C"/>
<node CREATED="1411324275986" ID="ID_1560946245" MODIFIED="1411476025067" TEXT="Opzioni">
<node CREATED="1411324282951" ID="ID_439197180" MODIFIED="1411324307572" TEXT="-y disabilita la visualizzazione interattiva"/>
</node>
<node CREATED="1411324156678" ID="ID_864300485" MODIFIED="1411476025083" TEXT="Uso: i2cdetect &lt;i2cbus&gt;">
<node CREATED="1411317905868" ID="ID_1424368850" MODIFIED="1411476025083" TEXT="&lt;i2cbus&gt; &#xe8; il numero della porta I2C del Raspberry">
<node CREATED="1411318091442" ID="ID_344303551" MODIFIED="1411318094720" TEXT="nella revisione 2 del Raspi deve essere 1 "/>
<node CREATED="1411318101815" ID="ID_1134198701" MODIFIED="1411318131783" TEXT="la revisione 2 ha la porta 0 per la telecamera, la 1 &#xe8; quella &quot;usabile&quot;"/>
</node>
</node>
<node CREATED="1411324156678" ID="ID_730608909" MODIFIED="1411476025083" TEXT="Uso 2: i2cdetect -l">
<node CREATED="1411317905868" ID="ID_1117451628" MODIFIED="1411324435268" TEXT="-l (list) scansiona e visualizza tutte le porte I2C presenti nel computer"/>
</node>
</node>
</node>
<node CREATED="1411322061240" ID="ID_37328396" MODIFIED="1411476025098" TEXT="i2cdump">
<node CREATED="1411322067919" ID="ID_477293992" MODIFIED="1411322976413" TEXT="Per esaminare i registri del chip visibili attraverso la I2C"/>
<node CREATED="1411322939331" ID="ID_1018234559" MODIFIED="1411323212544" TEXT="Legge moolti registri e li presenta in forma tabellare, con i valori in esadecimale ed in ASCII"/>
<node CREATED="1411317905868" ID="ID_1934193581" MODIFIED="1411476025098" TEXT="uso: i2cdump  [-r &lt;primo&gt;-&lt;ultimo&gt;] &lt;i2cbus&gt; &lt;chip-address&gt; ">
<node CREATED="1411323293308" ID="ID_1281996488" MODIFIED="1411323561317" TEXT="-r (range) permette di specificare l&apos;intervallo di registri che si and&#xe0; a leggere"/>
<node CREATED="1411322863797" ID="ID_1290600230" MODIFIED="1411323551206" TEXT="gli altri parametri sono gli stessi degli altri comandi"/>
<node CREATED="1411323610268" ID="ID_827821895" MODIFIED="1411476025098" TEXT="es.">
<node CREATED="1411323611660" ID="ID_773120936" MODIFIED="1411323613122" TEXT="i2cdump -r 0-0xF 1 0x51 "/>
</node>
</node>
</node>
<node CREATED="1411318956625" ID="ID_801601984" MODIFIED="1411476025114" TEXT=" i2cget">
<node CREATED="1411318959125" ID="ID_1637430695" MODIFIED="1411476025114" TEXT="legge i registri dei dispositivi I2C collegati al raspberry">
<node CREATED="1411322917636" ID="ID_457703465" MODIFIED="1411322929652" TEXT="legge un Byte dal registro indicato"/>
</node>
<node CREATED="1411317905868" ID="ID_760868322" MODIFIED="1411476025129" TEXT="uso: i2cget &lt;i2cbus&gt; &lt;chip-address&gt; [&lt;data-address&gt;]">
<node CREATED="1411317905868" ID="ID_950184004" MODIFIED="1411318090083" TEXT="&lt;i2cbus&gt; &#xe8; il numero della porta I2C del Raspberry"/>
<node CREATED="1411318080846" ID="ID_1831808080" MODIFIED="1411476025129" TEXT="&lt;chip-address&gt;">
<node CREATED="1411318142153" ID="ID_1507161602" MODIFIED="1411319057112" TEXT="indirizzo del chip che si vuole leggere"/>
<node CREATED="1411319241503" ID="ID_927494126" MODIFIED="1411319257190" TEXT="vuole un numero decimale"/>
<node CREATED="1411319257758" ID="ID_1570544103" MODIFIED="1411319581938" TEXT="per dare l&apos;indirizzo in esadecimale, farlo precedere da 0x"/>
</node>
<node CREATED="1411318080846" ID="ID_23505392" MODIFIED="1411476025145" TEXT="&lt;data-address&gt;">
<node CREATED="1411318142153" ID="ID_823385943" MODIFIED="1411319100117" TEXT="numero del registro dentro il chip che si vuole leggere"/>
<node CREATED="1411319059667" ID="ID_229585677" MODIFIED="1411476025145" TEXT="[]">
<node CREATED="1411319064284" ID="ID_5442360" MODIFIED="1411319068865" TEXT="opzionale"/>
<node CREATED="1411319201636" ID="ID_1312253543" MODIFIED="1411319214484" TEXT="se si omette mostra solo il primo registro"/>
</node>
</node>
<node CREATED="1411319224549" ID="ID_777588551" MODIFIED="1411476025145" TEXT="es.">
<node CREATED="1411319285141" ID="ID_1577316149" MODIFIED="1411319562612" TEXT="i2cget 1 0x51 "/>
</node>
</node>
</node>
<node CREATED="1411317754309" ID="ID_235721832" MODIFIED="1411476025145" TEXT="i2cset">
<node CREATED="1411317849731" ID="ID_163843902" MODIFIED="1411317871422" TEXT="scrive nei registri dei device I2C collegati al raspberry"/>
<node CREATED="1411317905868" ID="ID_513038067" MODIFIED="1411476025161" TEXT="uso: i2cset  &lt;i2cbus&gt; &lt;chip-address&gt; &lt;data-address&gt;">
<node CREATED="1411322886858" ID="ID_304278121" MODIFIED="1411322896699" TEXT="i parametri sono gli stessi dell&apos;altro comando"/>
<node CREATED="1411318080846" ID="ID_1498797071" MODIFIED="1411476025161" TEXT="&lt;chip-address&gt;">
<node CREATED="1411318142153" ID="ID_973065023" MODIFIED="1411319057112" TEXT="indirizzo del chip che si vuole leggere"/>
<node CREATED="1411319241503" ID="ID_615088787" MODIFIED="1411319257190" TEXT="vuole un numero decimale"/>
<node CREATED="1411319257758" ID="ID_1818615721" MODIFIED="1411319581938" TEXT="per dare l&apos;indirizzo in esadecimale, farlo precedere da 0x"/>
</node>
<node CREATED="1411318080846" ID="ID_239829830" MODIFIED="1411476025176" TEXT="&lt;data-address&gt;">
<node CREATED="1411318142153" ID="ID_790040623" MODIFIED="1411319100117" TEXT="numero del registro dentro il chip che si vuole leggere"/>
<node CREATED="1411319059667" ID="ID_1543821653" MODIFIED="1411476025176" TEXT="[]">
<node CREATED="1411319064284" ID="ID_875653583" MODIFIED="1411319068865" TEXT="opzionale"/>
<node CREATED="1411319201636" ID="ID_16874982" MODIFIED="1411319214484" TEXT="se si omette mostra solo il primo registro"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1411260446980" ID="ID_716212828" MODIFIED="1411476025176" TEXT="Installazione del modulo Python per I2C (SMBus)">
<node CREATED="1411260484176" ID="ID_1783172640" MODIFIED="1411260487177" TEXT="sudo apt-get install python-smbus"/>
</node>
</node>
<node CREATED="1361741917086" ID="ID_1196626461" MODIFIED="1411476025192" POSITION="right" TEXT="Installazione mono">
<node CREATED="1411312127332" ID="ID_1532467221" MODIFIED="1411312177393" TEXT="E&apos; la versione &quot;libera&quot;, per Linux, del &quot;framewok&quot; .NET"/>
<node CREATED="1363024044206" ID="ID_649619303" MODIFIED="1411476025192" TEXT="Installare il runtime">
<node CREATED="1361742013686" ID="ID_986879669" MODIFIED="1361742014796" TEXT="sudo apt-get install mono-runtime"/>
</node>
<node CREATED="1363024052901" ID="ID_623580605" MODIFIED="1411476025208" TEXT="Installare una shell Csharp, che pu&#xf2; essere utile per i programmi a console">
<node CREATED="1411312243263" ID="ID_1688682617" MODIFIED="1411312415345" TEXT="non &#xe8; indispensabile per il lavoro del &quot;garden&quot;"/>
<node CREATED="1363024100355" ID="ID_355092763" MODIFIED="1363024101669" TEXT="sudo apt-get install mono-csharp-shell"/>
<node CREATED="1363024184974" ID="ID_815771471" MODIFIED="1411476025208" TEXT="lanciare la shell da un terminale">
<node CREATED="1363024199169" ID="ID_1551796077" MODIFIED="1363024200545" TEXT="$ csharp"/>
<node CREATED="1363024217554" ID="ID_606253695" MODIFIED="1363024230228" TEXT="si entra nella shell remota di c#"/>
</node>
</node>
<node CREATED="1363023914348" ID="ID_1199244725" MODIFIED="1411476025223" TEXT="per far girare programmi in GUI">
<node CREATED="1411312473336" ID="ID_1876918317" MODIFIED="1411312501720" TEXT="non serve molto per il lavoro del &quot;garden&quot; "/>
<node CREATED="1361742021615" ID="ID_513020400" MODIFIED="1361742023647" TEXT="sudo apt-get install gtk-sharp2"/>
<node CREATED="1361742003116" ID="ID_1865402486" MODIFIED="1361742005133" TEXT="sudo apt-get install libmono-winforms2.0-cil"/>
<node CREATED="1361742738257" ID="ID_762883401" MODIFIED="1361742739382" TEXT="sudo apt-get install libxtst-dev"/>
</node>
<node CREATED="1361742725985" ID="ID_408401039" MODIFIED="1361743896969" TEXT="per provare se mono gira mono -V"/>
</node>
<node CREATED="1394487471493" ID="ID_919716523" MODIFIED="1411476025223" POSITION="right" TEXT="Alla fine delle installzioni, PULIRE!">
<node CREATED="1394487486112" ID="ID_744132618" MODIFIED="1394487502924" TEXT="apt-get clean"/>
<node CREATED="1394487505093" ID="ID_1448297896" MODIFIED="1394487515244" TEXT="Cancella i file di installazione"/>
</node>
<node CREATED="1363007740758" ID="ID_1731962922" MODIFIED="1411476025223" POSITION="right" TEXT="Python">
<node CREATED="1411329911656" ID="ID_1896242429" MODIFIED="1411329953621" TEXT="Nel Raspberry PI, Pithon &#xe8; gi&#xe0; installato all&apos;inizio"/>
<node CREATED="1363012513260" ID="ID_1194838198" MODIFIED="1411476025239" TEXT="Per creare un Web server con una riga di codice basta usare python">
<node CREATED="1363012538643" ID="ID_1845608556" MODIFIED="1363012618081" TEXT="Si lancia il programma Python SimpleHTTPServer, che fornir&#xe0; le pagine HTML comprese nella cartella corrente"/>
<node CREATED="1363012625330" ID="ID_1400235219" MODIFIED="1411476025239" TEXT="Come fare:">
<node CREATED="1363012690582" ID="ID_1707915438" MODIFIED="1411476025254" TEXT="creare la home page html">
<node CREATED="1363012241815" ID="ID_922563679" MODIFIED="1363012243567" TEXT="echo funziona! &gt; index.html"/>
<node CREATED="1363012706156" ID="ID_189220334" MODIFIED="1363012712453" TEXT="(molto semplice..)"/>
</node>
<node CREATED="1363012256361" ID="ID_1107945686" MODIFIED="1411476025254" TEXT="python -m SimpleHTTPServer">
<node CREATED="1363012415040" ID="ID_1223960675" MODIFIED="1363012422313" TEXT="scrive:"/>
<node CREATED="1363012261041" ID="ID_1409672694" MODIFIED="1363012334342" TEXT="Serving HTTP on 0.0.0.0 port 8000 ..."/>
<node CREATED="1363012426323" ID="ID_828815918" MODIFIED="1411476025270" TEXT="il server sta sul port 8000, per cui, puntando il browser su">
<node CREATED="1363012456880" ID="ID_1393008117" MODIFIED="1363012481919" TEXT="http://&lt;indirizzo IP del raspeberry:&gt;:8000"/>
<node CREATED="1363012484249" ID="ID_207941094" MODIFIED="1363012490028" TEXT="compare la pagina"/>
<node CREATED="1363012490440" ID="ID_1573087368" MODIFIED="1363012494275" TEXT="funziona!"/>
</node>
</node>
<node CREATED="1363012752101" ID="ID_1152256959" MODIFIED="1363013103004" TEXT="Naturalmente, se il programma Python viene interrotto, il server non esiste pi&#xf9;!"/>
</node>
</node>
</node>
<node CREATED="1356736455233" ID="ID_1882703059" MODIFIED="1411476025270" POSITION="right" TEXT="Creazione di una SD contenente un&apos;immagine &quot;campione&quot;, da clonare">
<node CREATED="1411315083032" ID="ID_141303431" MODIFIED="1411315160395" TEXT="Quando il sistema &#xe8; configurato ed operativo, lo si pu&#xf2; &quot;fotografare&quot;, come backup, o per poterlo replicare uguale su altre Raspberry"/>
<node CREATED="1370678921723" ID="ID_216955398" MODIFIED="1411476025301" TEXT="In Windows">
<node CREATED="1370678939933" ID="ID_582349069" MODIFIED="1370678958465" TEXT="Installare il programma &quot;Win32 disk imager&quot;"/>
<node CREATED="1370678958847" ID="ID_568791065" MODIFIED="1370679038942" TEXT="Se il lettore SDcard viene riconosciuto, si pu&#xf2; scegliere in alto a destra"/>
<node CREATED="1370679040296" ID="ID_926689978" MODIFIED="1370679109046" TEXT="Se non viene riconosciuto vuol dire che non &#xe8; standard, e non funzioner&#xe0; con questo programma"/>
<node CREATED="1370679109500" ID="ID_1124810961" MODIFIED="1370679193330" TEXT="Si pu&#xf2; acquistare un lettore SD su USB. Di solito i lettori su USB, non interfacciandosi direttamente al bus di sistema, vengono letti senza problemi dal programma &quot;win32 disk imager&quot;"/>
<node CREATED="1370679200270" ID="ID_1547920742" MODIFIED="1411313416618" TEXT="Una volta scelta l&apos;SD card su cui leggere | scrivere, l&apos;immagine ed il nome del file, il resto non richiede spiegazioni.."/>
</node>
<node CREATED="1358181924030" ID="ID_489184865" MODIFIED="1411476025301" TEXT="In Linux">
<node CREATED="1358181919351" ID="ID_161220202" MODIFIED="1358181935875" TEXT="Inserire la SD card"/>
<node CREATED="1358181936396" ID="ID_1208581100" MODIFIED="1411476025317" TEXT="Se Linux monta automaticamente la SD card">
<node CREATED="1358181957529" ID="ID_722946934" MODIFIED="1411476025333" TEXT="per sapere il nome del device che si deve &quot;clonare&quot;">
<node CREATED="1358182028136" ID="ID_84675390" MODIFIED="1411476025333" TEXT="df -h">
<node CREATED="1358182374967" ID="ID_591950855" MODIFIED="1358183807318" TEXT="-h per mostrare tutti i dati delle partizioni attualmente montate (h = human readable)"/>
</node>
<node CREATED="1358182050385" ID="ID_1132438074" MODIFIED="1411476025333" TEXT="se &#xe8; una raspbian potrebbero esserci due partizioni montate">
<node CREATED="1358184045760" ID="ID_357308472" MODIFIED="1358184047150" TEXT="(una per il boot e l&apos;altra per il resto)"/>
</node>
<node CREATED="1358182075728" ID="ID_405530660" MODIFIED="1411476025333" TEXT="se sono montate, per es.">
<node CREATED="1358184124938" ID="ID_713384179" MODIFIED="1358184241974" TEXT="/dev/sda1 montata come /media/Windows"/>
<node CREATED="1358184185254" ID="ID_91589634" MODIFIED="1358184248044" TEXT=" /dev/sda5 montata come /">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1358182094236" ID="ID_1667460709" MODIFIED="1358182109285" TEXT="allora il device dal clonare &#xe8; /dev/sda"/>
</node>
<node CREATED="1358182111072" ID="ID_1964445964" MODIFIED="1411476025348" TEXT="se sono montate, per es.">
<node CREATED="1358182249447" ID="ID_1943197678" MODIFIED="1358182305578" TEXT="/dev/mmcblk0p1 montata come /media/8b12-9122"/>
<node CREATED="1358182249447" ID="ID_89060648" MODIFIED="1358182326833" TEXT="/dev/mmcblk0p2 montata come /media/2098432-2344"/>
<node CREATED="1358182339543" ID="ID_1737947764" MODIFIED="1358182367054" TEXT="allora il device dal clonare &#xe8; /dev/mmcblk0"/>
</node>
</node>
</node>
<node CREATED="1358182447450" ID="ID_269196713" MODIFIED="1411476025348" TEXT="Se Linux non monta la SDcard">
<node CREATED="1358182513999" ID="ID_1854252690" MODIFIED="1411476025348" TEXT="eseguire">
<node CREATED="1358183537803" ID="ID_1812644700" MODIFIED="1411476025364" TEXT="fdisk -l">
<node CREATED="1358183545935" ID="ID_398583903" MODIFIED="1358183674380" TEXT="se il sistema riesce ad identificare le partizioni presenti, la SDcard si dovrebbe riuscire ad individuare digitande questo comando. Se non si vede provare con il seguente."/>
</node>
</node>
<node CREATED="1358183681105" ID="ID_888273898" MODIFIED="1358183689247" TEXT="togliere la SDcard"/>
<node CREATED="1358182513999" ID="ID_98642556" MODIFIED="1411476025364" TEXT="eseguire">
<node CREATED="1358182555063" ID="ID_71117157" MODIFIED="1358182572284" TEXT="dmesg | tail"/>
<node CREATED="1358182573321" ID="ID_954891196" MODIFIED="1358182649185" TEXT="fra gli ultimi messaggi, ce n&#xe8; uno che indica l&apos;inserzione della SD card, specificando il nome del device"/>
</node>
</node>
<node CREATED="1358182664386" ID="ID_481672728" MODIFIED="1411476025364" TEXT="Una volta noto il nome del device, fare la clonazione">
<node CREATED="1358182710025" ID="ID_896693328" MODIFIED="1358182781046" TEXT="sudo if=&lt;nome di device della SDcard&gt; of=&lt;path e nome del file in cui copiare l&apos;immagine&gt;"/>
</node>
</node>
</node>
<node CREATED="1411329798715" ID="ID_1255864763" MODIFIED="1411330008597" POSITION="right" TEXT="I/O I2C con Python"/>
<node CREATED="1411329807301" ID="ID_1354649442" MODIFIED="1411476025379" POSITION="right" TEXT="I/O I2C con Mono">
<node CREATED="1411329845388" ID="ID_1562983729" MODIFIED="1411476025379" TEXT="libreria provata">
<node CREATED="1411329853627" ID="ID_1835795870" MODIFIED="1411329854799" TEXT="https://github.com/raspberry-sharp/raspberry-sharp-io"/>
</node>
<node CREATED="1411329861472" ID="ID_1083189930" MODIFIED="1411476025379" TEXT="LANCIARE I PROGRAMMI CON sudo!">
<node CREATED="1411329895209" ID="ID_29807637" MODIFIED="1411476025379" TEXT="es.">
<node CREATED="1411329897681" ID="ID_295429417" MODIFIED="1411329898869" TEXT="sudo mono Test.Gpio.Chaser.exe"/>
</node>
</node>
</node>
</node>
</map>
