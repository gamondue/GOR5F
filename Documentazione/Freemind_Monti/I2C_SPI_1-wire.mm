<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1411075396149" ID="ID_1745755674" MODIFIED="1420227355109" TEXT="I2C_SPI_1-wire">
<node CREATED="1415008271495" FOLDED="true" ID="ID_1667123754" MODIFIED="1420227451872" POSITION="right" TEXT="&quot;Bus&quot; di sensori">
<node CREATED="1415008287001" ID="ID_835334362" MODIFIED="1415008289302" TEXT="seriale"/>
<node CREATED="1415008296987" ID="ID_1777308397" MODIFIED="1415008301959" TEXT="address">
<node CREATED="1415008303915" ID="ID_346266830" MODIFIED="1415008305992" TEXT="7 bit"/>
</node>
<node CREATED="1415008382052" ID="ID_1736392858" MODIFIED="1415008403122" TEXT="topologia lineare"/>
<node CREATED="1415008444955" ID="ID_329790641" MODIFIED="1415008452072" TEXT="mezzo di trasmissione condiviso">
<node CREATED="1415008459421" ID="ID_379500011" MODIFIED="1420227192366" TEXT="2 fili">
<node CREATED="1415008465493" ID="ID_1615843457" MODIFIED="1415008475970" TEXT="I2C">
<node CREATED="1415008497217" ID="ID_1331853075" MODIFIED="1415061232750" TEXT="barometro giardino"/>
<node CREATED="1415061308123" ID="ID_1698032054" MODIFIED="1415061324052" TEXT="da 100 kbit/s a 3.4 Mbit/s"/>
</node>
</node>
<node CREATED="1415008453172" ID="ID_29534702" MODIFIED="1420227192381" TEXT="1 filo">
<node CREATED="1412242382273" ID="ID_844456939" MODIFIED="1415061337666" TEXT="1-Wire">
<node CREATED="1415008493400" ID="ID_483488647" MODIFIED="1415061229953" TEXT="termometri giardino"/>
<node CREATED="1412242385573" ID="ID_1089209134" MODIFIED="1412242412998" TEXT="Standard fatto dalla Dallas per le &quot;chiavi elettroniche&quot;"/>
<node CREATED="1412242444574" ID="ID_81384389" MODIFIED="1412242453536" TEXT="Similar in concept to I&#xb2;C, but with lower data rates and longer range. "/>
<node CREATED="1412242476304" ID="ID_1402324189" MODIFIED="1412242487205" TEXT="possibility of using only two wires: data and ground. ">
<node CREATED="1412242488376" ID="ID_1723952602" MODIFIED="1412242506467" TEXT="devices include an 800 pF capacitor to store charge and power the device during periods when the data line is active."/>
</node>
<node CREATED="1412242568422" ID="ID_279518910" MODIFIED="1412242577143" TEXT="connected using cables with modular connectors or with CAT-5 cable">
<node CREATED="1412242612427" ID="ID_222317587" MODIFIED="1412242616272" TEXT=" RJ11 connectors"/>
</node>
<node CREATED="1412242662329" ID="ID_160102230" MODIFIED="1412242663199" TEXT="Each 1-Wire chip has a unique ID code"/>
<node CREATED="1412245203091" ID="ID_1775142315" MODIFIED="1415061447291" TEXT="Sul Raspi c&apos;&#xe8; Sw che lo fa funzionare, ma su un solo pin GPIO, difficile da cambiare"/>
</node>
</node>
<node CREATED="1415008622262" ID="ID_1469949066" MODIFIED="1420227192381" TEXT="4 fili">
<node CREATED="1415008626071" ID="ID_601975839" MODIFIED="1420227192381" TEXT="SPI">
<node CREATED="1415061241699" ID="ID_1440317998" MODIFIED="1415061278652" TEXT="Esiste un buon convertitore AD, con software in C#"/>
<node CREATED="1411078829356" ID="ID_169763846" MODIFIED="1411078831346" TEXT="Serial Peripheral Interface"/>
<node CREATED="1411078808148" ID="ID_881777699" MODIFIED="1411081545279" TEXT="&quot;4-wire&quot; bus"/>
<node CREATED="1411078832065" ID="ID_684749989" MODIFIED="1411078859673" TEXT="pi&#xf9; alta velocit&#xe0;">
<node CREATED="1411078861444" ID="ID_63325423" MODIFIED="1411081588038" TEXT="centinaia di Mbit/s"/>
<node CREATED="1411081569828" ID="ID_1179833036" MODIFIED="1411081599106" TEXT="Usato anche con le SDcard"/>
</node>
<node CREATED="1411078842740" ID="ID_156596011" MODIFIED="1411078846226" TEXT="sincrono"/>
<node CREATED="1411078912299" ID="ID_923487220" MODIFIED="1411078925545" TEXT="c&apos;&#xe8; nel RaspPI"/>
</node>
</node>
<node CREATED="1415008307356" ID="ID_1305425281" MODIFIED="1420227415606" TEXT="Ci dev&apos;essere un MAC">
<node CREATED="1415008362113" ID="ID_1272971188" MODIFIED="1415008369038" TEXT="Medium Access Control"/>
<node CREATED="1415008311460" ID="ID_301782600" MODIFIED="1415008321137" TEXT="master - slave">
<node CREATED="1415008661739" ID="ID_1518637987" MODIFIED="1415008686498" TEXT="La MCU &#xe8; il master"/>
<node CREATED="1415008743795" ID="ID_1745569000" MODIFIED="1415008750121" TEXT="I sensori slave."/>
</node>
<node CREATED="1415008592452" ID="ID_1632155283" MODIFIED="1420227192397" TEXT="MAC a contesa">
<node CREATED="1415060915415" ID="ID_1999909943" MODIFIED="1415061493484" TEXT="(NON c&apos;entra con questi, solo per ripasso)"/>
<node CREATED="1415008524539" ID="ID_1322402866" MODIFIED="1415008766010" TEXT="Ricordate il CSMA/CD?">
<node CREATED="1415008537357" ID="ID_950179865" MODIFIED="1415008550675" TEXT="MAC Ethernet"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1412242382273" FOLDED="true" ID="ID_1511684153" MODIFIED="1420227689342" POSITION="right" TEXT="1-wire">
<node CREATED="1412242385573" ID="ID_319302706" MODIFIED="1412242412998" TEXT="Standard fatto dalla Dallas per le &quot;chiavi elettroniche&quot;"/>
<node CREATED="1412242444574" ID="ID_311818729" MODIFIED="1412242453536" TEXT="Similar in concept to I&#xb2;C, but with lower data rates and longer range. "/>
<node CREATED="1412242476304" ID="ID_707754410" MODIFIED="1412242487205" TEXT="possibility of using only two wires: data and ground. ">
<node CREATED="1412242488376" ID="ID_540280993" MODIFIED="1412242506467" TEXT="devices include an 800 pF capacitor to store charge and power the device during periods when the data line is active."/>
</node>
<node CREATED="1412242568422" ID="ID_1303140275" MODIFIED="1412242577143" TEXT="connected using cables with modular connectors or with CAT-5 cable">
<node CREATED="1412242612427" ID="ID_830640197" MODIFIED="1412242616272" TEXT=" RJ11 connectors"/>
</node>
<node CREATED="1412242662329" ID="ID_1914118348" MODIFIED="1412242663199" TEXT="Each 1-Wire chip has a unique ID code"/>
<node CREATED="1412245226561" ID="ID_1087857362" MODIFIED="1420226541907" STYLE="fork" TEXT="Nel Raspi c&apos;&#xe8; un driver Sw che lo fa funzionare, ma su un solo pin GPIO, difficile da cambiare (ricompilando il kernel)"/>
</node>
<node CREATED="1411077626722" FOLDED="true" ID="ID_1228527641" MODIFIED="1421620633887" POSITION="right" TEXT="I2C">
<node CREATED="1411077910806" ID="ID_660763352" MODIFIED="1411077911891" TEXT="I2C is a communication bus designed by Philips, for chips to communicate with each other">
<node CREATED="1411079035414" ID="ID_460777986" MODIFIED="1411079047634" TEXT="inventato da Philips per le TV"/>
<node CREATED="1411079496029" ID="ID_1685754510" MODIFIED="1411079498569" TEXT="1980"/>
</node>
<node CREATED="1411077959374" ID="ID_1157702562" MODIFIED="1411077976652" TEXT="I2C = Inter-Integrated Circuit">
<node CREATED="1420228066128" ID="ID_1171010893" MODIFIED="1420228125793" STYLE="fork" TEXT="detto anche IIC o  I&#xb2;C (&quot;I squared C&quot;)"/>
<node CREATED="1415010032030" ID="ID_1074822715" MODIFIED="1420228093321" TEXT="&#xe8; simile a">
<node CREATED="1415010038630" ID="ID_368473658" MODIFIED="1415010041628" TEXT="SMBus">
<node CREATED="1411078091162" ID="ID_882431432" MODIFIED="1420227667037" TEXT="I2C != SMBus">
<node CREATED="1411078107647" ID="ID_1118280982" MODIFIED="1411078118137" TEXT="are essentially compatible with each other"/>
</node>
<node CREATED="1411077630377" ID="ID_780171510" MODIFIED="1411077636065" TEXT="is the System Management Bus defined by Intel&#xae; Corporation in 1995"/>
<node CREATED="1411081377201" ID="ID_208800446" MODIFIED="1411081383973" TEXT="is a subset of I&#xb2;C that defines the protocols more strictly"/>
<node CREATED="1411077674807" ID="ID_1214111485" MODIFIED="1411077675398" TEXT="used in personal computers and servers for low-speed system management communications"/>
</node>
<node CREATED="1415009136039" ID="ID_196757086" MODIFIED="1415061024958" TEXT="&quot;2 wire bus&quot;">
<node CREATED="1415060994539" ID="ID_926125390" MODIFIED="1420228006722" TEXT="Se il nome i2C non viene usato &#xe8; per non pagare royalties. Spesso in questo caso i device non sono completamenti compatibili con I2C ufficiale. "/>
</node>
</node>
</node>
<node CREATED="1411078280361" ID="ID_1564820952" MODIFIED="1411078281096" TEXT="low speed data transmission">
<node CREATED="1411079716582" ID="ID_317643347" MODIFIED="1411079739780" TEXT="100 kbit/s : Standard mode"/>
<node CREATED="1411079165674" ID="ID_998408929" MODIFIED="1411079743324" TEXT="400 kbit/s : Fast mode"/>
<node CREATED="1411079757904" ID="ID_1188145104" MODIFIED="1411079766383" TEXT="3.4 Mbps : High-Speed mode"/>
</node>
<node CREATED="1411078122333" ID="ID_294091061" MODIFIED="1420227918281" TEXT="&quot;Multi Master&quot; Serial Bus (&quot;2-wire bus&quot;)">
<node CREATED="1415061083775" ID="ID_1988505319" MODIFIED="1420228181089" TEXT="sistema &quot;a 2 fili&quot; per i dati">
<node CREATED="1420228184060" ID="ID_220739695" MODIFIED="1420228196727" TEXT="usa 3 o 4 fili fisici"/>
</node>
<node CREATED="1411079064143" ID="ID_333703693" MODIFIED="1420227803786" TEXT="2 active wires and a ground connection">
<node CREATED="1411078342418" ID="ID_887393474" MODIFIED="1411078349070">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <img src="I2C_bus_connection.gif" />
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1411078413165" ID="ID_865845926" MODIFIED="1411078435237" TEXT="only two bi-directional lines">
<node CREATED="1411078442818" ID="ID_1704944467" MODIFIED="1411078448005" TEXT="serial data systems">
<node CREATED="1411079105113" ID="ID_1712524143" MODIFIED="1411079106553" TEXT="SDA"/>
</node>
<node CREATED="1411078436259" ID="ID_988311401" MODIFIED="1411078442408" TEXT="serial clock">
<node CREATED="1411079108771" ID="ID_388719780" MODIFIED="1411079112446" TEXT="SCL"/>
</node>
</node>
<node CREATED="1415008989799" ID="ID_748467471" MODIFIED="1420227561801" TEXT="max 4 fili">
<node CREATED="1415009002048" ID="ID_352073807" MODIFIED="1415009008302" TEXT="1 - Vcc">
<node CREATED="1420227701384" ID="ID_1953983082" MODIFIED="1420227723471" TEXT="non serve se lo slave consuma poco e basta il segnale per alimentarlo"/>
</node>
<node CREATED="1415009026851" ID="ID_695219596" MODIFIED="1415009033360" TEXT="2 - GND">
<node CREATED="1420227726703" ID="ID_1438834197" MODIFIED="1420227731511" TEXT="serve sempre"/>
</node>
<node CREATED="1415009036940" ID="ID_1113355803" MODIFIED="1415009043410" TEXT="SCL">
<node CREATED="1415009049054" ID="ID_1372190117" MODIFIED="1415009050931" TEXT="clock"/>
<node CREATED="1415009062336" ID="ID_289309867" MODIFIED="1415009071437" TEXT="controllato solo dal master"/>
</node>
<node CREATED="1415009044558" ID="ID_1498694335" MODIFIED="1415009403803" TEXT="SDA">
<node CREATED="1415009097300" ID="ID_1003011894" MODIFIED="1415009099104" TEXT="data"/>
<node CREATED="1415009099580" ID="ID_1912790339" MODIFIED="1415009114298" TEXT="bidirezionale">
<node CREATED="1415009120695" ID="ID_59925272" MODIFIED="1415009125508" TEXT="lettura"/>
<node CREATED="1415009125879" ID="ID_1229039168" MODIFIED="1415009132532" TEXT="scrittura"/>
</node>
</node>
</node>
<node CREATED="1411078249938" ID="ID_1921825042" MODIFIED="1420227911996" TEXT="">
<node CREATED="1411078525614" ID="ID_1115233141" MODIFIED="1411078539642" TEXT="one must be the master and the others must act as the slaves">
<node CREATED="1411079591657" ID="ID_930794795" MODIFIED="1411079602531" TEXT="master = microcontrollore"/>
<node CREATED="1411079602934" ID="ID_1957274069" MODIFIED="1411079609997" TEXT="slave = sensore"/>
</node>
<node CREATED="1411079200441" ID="ID_451626035" MODIFIED="1411079202082" TEXT=" each IC on the bus has a unique address"/>
<node CREATED="1411079468501" ID="ID_842548787" MODIFIED="1411079479657" TEXT="I2C bus supports more than one master connected to one bus"/>
</node>
</node>
<node CREATED="1411078249938" ID="ID_173151102" MODIFIED="1411078264084" TEXT="&quot;Multi Master&quot; Serial Bus">
<node CREATED="1411079200441" ID="ID_1686181862" MODIFIED="1411079202082" TEXT=" each IC on the bus has a unique address"/>
<node CREATED="1411079468501" ID="ID_316875842" MODIFIED="1411079479657" TEXT="I2C bus supports more than one master connected to one bus"/>
<node CREATED="1411079267114" ID="ID_1110022893" MODIFIED="1411079294953" TEXT="features">
<node CREATED="1411079283138" ID="ID_1941518914" MODIFIED="1411079284211" TEXT=" hand-shaking for multi-master systems"/>
<node CREATED="1411079284823" ID="ID_620662907" MODIFIED="1411079290818" TEXT="clock synchronization "/>
</node>
<node CREATED="1411079321301" ID="ID_1637946839" MODIFIED="1411079322477" TEXT=" clock is always generated by the master">
<node CREATED="1411079331628" ID="ID_1795207067" MODIFIED="1411079333744" TEXT="the slave may hold it low to generate a wait state"/>
<node CREATED="1411079430829" ID="ID_1458587084" MODIFIED="1411079431610" TEXT="The master can transmit or receive signals to or from a slave, respectively, or control signal transfers between two slaves"/>
</node>
<node CREATED="1411079573860" ID="ID_1919040482" MODIFIED="1411079582851" TEXT="To begin communication, the bus master places the address of the device with which it intends to communicate (the slave) on the bus">
<node CREATED="1411079638624" ID="ID_1240694966" MODIFIED="1411079667089" TEXT="only the device with the correct address will communicate"/>
</node>
</node>
<node CREATED="1420228247983" ID="ID_973530048" MODIFIED="1420228254093" TEXT="MAC master slave">
<node CREATED="1411078525614" ID="ID_1415860934" MODIFIED="1411078539642" TEXT="one must be the master and the others must act as the slaves">
<node CREATED="1411079591657" ID="ID_1762721994" MODIFIED="1411079602531" TEXT="master = microcontrollore"/>
<node CREATED="1411079602934" ID="ID_868272468" MODIFIED="1411079609997" TEXT="slave = sensore"/>
</node>
<node CREATED="1411079271556" ID="ID_40306956" MODIFIED="1411079272585" TEXT="collision detection"/>
</node>
<node CREATED="1420228260248" ID="ID_1121905755" MODIFIED="1420228277294" TEXT="Caratteristiche elettriche">
<node CREATED="1411079843850" ID="ID_1658423580" MODIFIED="1411079844907" TEXT="I2C by definition is 5V">
<node CREATED="1411079855196" ID="ID_1820079243" MODIFIED="1411079865442" TEXT="There are hacks to make I2C to work also on other voltages than 5V"/>
</node>
</node>
<node CREATED="1415009196447" ID="ID_1278891713" MODIFIED="1421590404164" TEXT="Raspberry I2C">
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
<node CREATED="1411260038962" ID="ID_1050908276" MODIFIED="1411260059096" TEXT="far ripartire il raspberry">
<node CREATED="1411987458905" ID="ID_1716478077" MODIFIED="1411987485264" TEXT="sudo restart -i"/>
</node>
<node CREATED="1411260068245" ID="ID_1318291141" MODIFIED="1412037865613" TEXT="dopo la ripartenza si dovrebbero vedere i device I2C collegati">
<node CREATED="1411317767039" ID="ID_1535383111" MODIFIED="1411317802776" TEXT="programma che trova i device I2C che sono attualmente collegati al RasPI"/>
<node CREATED="1411260278101" FOLDED="true" ID="ID_240501922" MODIFIED="1412038221845" TEXT="sudo i2cdetect -y 1">
<node CREATED="1411260244793" FOLDED="true" ID="ID_135503867" MODIFIED="1412038107581" TEXT="oppure (se RaspPI vecchia (rev.1))">
<node CREATED="1411260271836" ID="ID_1526765265" MODIFIED="1411260288185" TEXT="sudo i2cdetect -y 0"/>
</node>
</node>
</node>
<node CREATED="1415009726243" ID="ID_1059306118" MODIFIED="1420227192428" TEXT="Hw, pinout">
<node CREATED="1415009200256" ID="ID_1118811843" MODIFIED="1415009217190" TEXT="2 pin del connettore GPIO">
<node CREATED="1415009276705" ID="ID_463354680" MODIFIED="1415009281422" TEXT="SCL">
<node CREATED="1415009643698" ID="ID_916342186" MODIFIED="1420229259218" TEXT="pin 5 del connettore GPIO"/>
</node>
<node CREATED="1415009281689" ID="ID_258260318" MODIFIED="1415009406460" TEXT="SDA">
<node CREATED="1415009649187" ID="ID_431258173" MODIFIED="1420229264509" TEXT="pin 3 del connettore GPIO"/>
</node>
</node>
<node CREATED="1415009653467" ID="ID_842783032" MODIFIED="1415009660536" TEXT="Vcc 3.3 V">
<node CREATED="1415009661348" ID="ID_1974556098" MODIFIED="1420229271203" TEXT="pin 1 del connettore GPIO"/>
<node CREATED="1420228436541" ID="ID_804061570" MODIFIED="1420228524295" TEXT="meglio usare 3.3 V. Se si usa il pin da 5 V poi bisogna mettere un partitore od un traslatore di livello, per portare i segnali a 3.3 V max. "/>
</node>
<node CREATED="1415009674189" ID="ID_339675042" MODIFIED="1415009675649" TEXT="GND">
<node CREATED="1415009679101" ID="ID_775814215" MODIFIED="1420229249802" TEXT="pin 6 del connettore GPIO"/>
</node>
</node>
<node CREATED="1415009737836" ID="ID_1698551920" MODIFIED="1420229627790" TEXT="Sw di sistema">
<node CREATED="1415009743613" ID="ID_466205488" MODIFIED="1415009748033" TEXT="i2cdetect">
<node CREATED="1415009895653" FOLDED="true" ID="ID_1292553773" MODIFIED="1420229463050" TEXT="per trovare i dispositivi sul bus">
<node CREATED="1411324115977" ID="ID_336730065" MODIFIED="1411324146317" TEXT="permette di vedere a quali indirizzi si trovano device I2C"/>
</node>
<node CREATED="1415009768672" ID="ID_1362917301" MODIFIED="1415009769707" TEXT="[-y] [-a] [-q|-r] I2CBUS [FIRST LAST]"/>
<node CREATED="1415009772584" ID="ID_404684823" MODIFIED="1415009775556" TEXT="-y 1">
<node CREATED="1415009780721" ID="ID_1966838237" MODIFIED="1415009788278" TEXT="canale 0">
<node CREATED="1415009789178" ID="ID_173963677" MODIFIED="1420229349965" TEXT="per display non si pu&#xf2; usare perch&#xe8; i pin della CPU NON sono portati sul connettore GPIO"/>
</node>
<node CREATED="1415009806620" ID="ID_878679367" MODIFIED="1415009810553" TEXT="canale 1">
<node CREATED="1415009811301" ID="ID_200161793" MODIFIED="1415009814121" TEXT="IL NOSTRO"/>
</node>
</node>
<node CREATED="1415009827086" ID="ID_1787896761" MODIFIED="1415009832890" TEXT="-a">
<node CREATED="1415009833359" ID="ID_94902447" MODIFIED="1415009838811" TEXT="address "/>
<node CREATED="1415009840000" ID="ID_323721200" MODIFIED="1415009842236" TEXT="opzionale"/>
</node>
<node CREATED="1415009844529" ID="ID_1277377872" MODIFIED="1415009849669" TEXT="es.">
<node CREATED="1415009850377" ID="ID_206740753" MODIFIED="1415009861606" TEXT="i2c -y 1"/>
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
<node CREATED="1415009961997" ID="ID_57554989" MODIFIED="1415009966058" TEXT="i2cget">
<node CREATED="1415009966566" ID="ID_627232187" MODIFIED="1415009971162" TEXT="legge dal chip">
<node CREATED="1411318959125" ID="ID_1637430695" MODIFIED="1411468681373" TEXT="legge i registri dei dispositivi I2C collegati al raspberry"/>
<node CREATED="1411322917636" ID="ID_457703465" MODIFIED="1420229559027" TEXT="legge un Byte od una Word dal registro indicato"/>
</node>
<node CREATED="1415010112245" ID="ID_925331058" MODIFIED="1415010135988" TEXT="[-f] [-y] i2cbus chip-address [data-address [mode]] "/>
<node CREATED="1415010140538" ID="ID_1994749842" MODIFIED="1415010142429" TEXT="-f">
<node CREATED="1415010142954" ID="ID_710331366" MODIFIED="1415010145389" TEXT="non usare"/>
</node>
<node CREATED="1415010154483" ID="ID_1073934967" MODIFIED="1415010158439" TEXT="-y">
<node CREATED="1415010159171" ID="ID_1767381375" MODIFIED="1415010165488" TEXT="1, come prima"/>
</node>
<node CREATED="1415010169412" ID="ID_536873942" MODIFIED="1415010176697" TEXT="chip-address">
<node CREATED="1415010230803" ID="ID_133231499" MODIFIED="1415010240840" TEXT="indirizzo di 7 bit sul bus"/>
<node CREATED="1415010251501" ID="ID_1365505347" MODIFIED="1415010256458" TEXT="es. RTC">
<node CREATED="1415010257062" ID="ID_386820654" MODIFIED="1415010263267" TEXT="0x51"/>
<node CREATED="1415010263639" ID="ID_950340579" MODIFIED="1415010299879" TEXT="0x = &#xe8; esadecimale"/>
</node>
</node>
<node CREATED="1415010311180" ID="ID_778917" MODIFIED="1415010315369" TEXT="data-address"/>
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
<node CREATED="1415011259151" ID="ID_1243906236" MODIFIED="1415011772311" TEXT="i2cset">
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
</node>
<node CREATED="1420229689061" ID="ID_285055418" MODIFIED="1420229703845" TEXT="Sw d&apos;utente">
<node CREATED="1420229801946" ID="ID_1611005591" MODIFIED="1420229803306" TEXT="C">
<node CREATED="1420229804580" ID="ID_1485476742" MODIFIED="1420229832805" TEXT="E&apos; il metodo pi&#xf9; veloce, se si devono installare dispositivi veloci"/>
</node>
<node CREATED="1411329798715" ID="ID_1255864763" MODIFIED="1411330008597" TEXT="I/O I2C con Python">
<node CREATED="1420229704951" ID="ID_618054143" MODIFIED="1420229723951" TEXT="Esistono molti programmi gi&#xf9; fatti in Python"/>
<node CREATED="1420229738643" ID="ID_148738200" MODIFIED="1420229762867" TEXT="Funzionano con un modulo non installato di default in Raspbian">
<node CREATED="1411260446980" ID="ID_716212828" MODIFIED="1411987604817" TEXT="Installazione del modulo Python per I2C (SMBus)"/>
<node CREATED="1411260484176" ID="ID_1783172640" MODIFIED="1411260487177" TEXT="sudo apt-get install python-smbus"/>
</node>
</node>
<node CREATED="1411329807301" ID="ID_1354649442" MODIFIED="1420230278533" TEXT="I/O I2C con Mono">
<node CREATED="1411329845388" ID="ID_1562983729" MODIFIED="1418337605972" TEXT="libreria provata">
<node CREATED="1411329853627" ID="ID_1835795870" MODIFIED="1411329854799" TEXT="https://github.com/raspberry-sharp/raspberry-sharp-io"/>
</node>
<node CREATED="1415011157231" ID="ID_280243586" MODIFIED="1415011162483" TEXT="mono e C#">
<node CREATED="1420229843070" ID="ID_1131388980" MODIFIED="1420230117291" TEXT="esiste poco software gi&#xe0; fatto, molti device vanno &quot;convertiti&quot; a C#"/>
<node CREATED="1420230119458" ID="ID_21887477" MODIFIED="1420230158346" TEXT="per eseguire &#xe8; necessario installare il framework &quot;mono&quot; sul Raspberry"/>
<node CREATED="1415011199394" ID="ID_1100312030" MODIFIED="1415011212719" TEXT="scrittura del codice">
<node CREATED="1415011213507" ID="ID_674258975" MODIFIED="1420229999122" TEXT="con VisualStudio, si sviluppa e si compila; non si prova!">
<node CREATED="1420230041017" ID="ID_1923771230" MODIFIED="1420230081762" TEXT="nella cartella &quot;bin&quot; della soluzione c&apos;&#xe8; il file eseguibile (&lt;nome exe&gt;)"/>
</node>
<node CREATED="1420229928569" ID="ID_152640742" MODIFIED="1420230037420" TEXT="Il file eseguibile &lt;nome exe&gt; viene messo nella cartella dove verr&#xe0; eseguito (p.es. con FTP)"/>
</node>
<node CREATED="1415011163655" ID="ID_84091232" MODIFIED="1415011175061" TEXT="esecuzione">
<node CREATED="1415011177929" ID="ID_1898744486" MODIFIED="1415011188142" TEXT="mono &lt;nome exe&gt;">
<node CREATED="1420230096160" ID="ID_43892271" MODIFIED="1420230102174" TEXT="nella cartella in cui "/>
</node>
</node>
</node>
<node CREATED="1411329861472" ID="ID_1083189930" MODIFIED="1420230339940" TEXT="Per l&apos;I/O LANCIARE I PROGRAMMI CON sudo!">
<node CREATED="1411329895209" ID="ID_29807637" MODIFIED="1418337610267" TEXT="es.">
<node CREATED="1411329897681" ID="ID_295429417" MODIFIED="1411329898869" TEXT="sudo mono Test.Gpio.Chaser.exe"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1411078814435" FOLDED="true" ID="ID_1131675095" MODIFIED="1421620636707" POSITION="right" TEXT="SPI">
<node CREATED="1411078829356" ID="ID_1763141390" MODIFIED="1411078831346" TEXT="Serial Peripheral Interface"/>
<node CREATED="1411078808148" ID="ID_1154698468" MODIFIED="1420230909444" TEXT="&quot;4-wire&quot; bus">
<node CREATED="1417044124259" ID="ID_670219721" MODIFIED="1417044137931" TEXT="4 segnali + Vdd + GND">
<node CREATED="1417044225498" ID="ID_925638369" MODIFIED="1417044226989" TEXT="SCLK">
<node CREATED="1417044248859" ID="ID_1851223538" MODIFIED="1417044248859" TEXT="Serial Clock (output from master)."/>
<node CREATED="1417044230670" ID="ID_938374236" MODIFIED="1417044239293" TEXT="&#xe8; una seriale SINCRONA"/>
</node>
<node CREATED="1417044139210" ID="ID_1437840822" MODIFIED="1417044143038" TEXT="MISO">
<node CREATED="1417044270265" ID="ID_1742863648" MODIFIED="1417044277358" TEXT="Master Output, Slave Input (coming from master)."/>
</node>
<node CREATED="1417044143434" ID="ID_720744311" MODIFIED="1417044144674" TEXT="MOSI">
<node CREATED="1417044290178" ID="ID_737125213" MODIFIED="1417044308208" TEXT="Master Input, Slave Output (coming from slave)."/>
</node>
<node CREATED="1417044319902" ID="ID_643435183" MODIFIED="1417044327895" TEXT="SS">
<node CREATED="1417044328829" ID="ID_1137834593" MODIFIED="1417044340740" TEXT="Slave Select (active low, controlled by master)."/>
<node CREATED="1420230913524" ID="ID_1960606218" MODIFIED="1420230934563" TEXT="una linea digitale che controlla il dispositivo che deve comunicare"/>
<node CREATED="1420230942212" ID="ID_602919542" MODIFIED="1420231062316" TEXT="NON c&apos;&#xe8; un indirizzo per distinguere i device slave, c&apos;&#xe8; una linea fisica DIVERSA per ogni device, che viene abilitata dal master, una alla volta, quando il master vuole che il device comunichi. "/>
</node>
</node>
<node CREATED="1420230827616" ID="ID_518178851" MODIFIED="1420230865049" TEXT="si usano fino a 6 fili, includendo alimentazione e massa"/>
<node CREATED="1411078842740" ID="ID_184179186" MODIFIED="1420231115773" TEXT="comunicazioni sincrone: richichiedono un segnale di clock su uno dei quattro pin che costituiscono il &quot;bus&quot;. "/>
</node>
<node CREATED="1411078832065" FOLDED="true" ID="ID_874920533" MODIFIED="1420231152513" TEXT="Pi&#xf9; alta velocit&#xe0; rispetto algi altri bus">
<node CREATED="1411078861444" ID="ID_1990619711" MODIFIED="1411081588038" TEXT="centinaia di Mbit/s"/>
<node CREATED="1411081569828" ID="ID_370272803" MODIFIED="1411081599106" TEXT="Usato anche con le SDcard"/>
</node>
<node CREATED="1417044121571" ID="ID_1256389528" MODIFIED="1417044176394" TEXT="Devices communicate in master/slave mode where the master device initiates the data frame"/>
<node CREATED="1417044191667" ID="ID_1462964850" MODIFIED="1417044195179" TEXT="Multiple slave devices are allowed with individual slave select lines"/>
<node CREATED="1417044213254" ID="ID_417996081" MODIFIED="1417044213802" TEXT="SPI is often referred to as SSI (Synchronous Serial Interface)."/>
<node CREATED="1417044389114" ID="ID_1380897258" MODIFIED="1420231174296" TEXT="Raspberry SPI">
<node CREATED="1420232309763" ID="ID_844691653" MODIFIED="1420232342570" TEXT="Il supporto c&apos;&#xe8;, ma non &#xe8; abilitato">
<node CREATED="1417044430518" ID="ID_776181361" MODIFIED="1420232308210" TEXT="Abilitare SPI sul Raspberry PI">
<node CREATED="1417044461041" ID="ID_793942625" MODIFIED="1417044490863" TEXT="la cosa pi&#xf9; facile &#xe8; farlo dal programma raspiconfig">
<node CREATED="1417047637044" ID="ID_930600769" MODIFIED="1417047640126" TEXT=" sudo raspi-config">
<node CREATED="1417047641503" ID="ID_873440531" MODIFIED="1417047651370" TEXT="opzione 8 Avanzate"/>
<node CREATED="1417047672125" ID="ID_1615984993" MODIFIED="1417047691060" TEXT="opzione A5 SPI">
<node CREATED="1417047691878" ID="ID_161299040" MODIFIED="1417047698189" TEXT="scegliere S&#xec;"/>
</node>
<node CREATED="1417048108735" ID="ID_1336351698" MODIFIED="1417048112558" TEXT="reboot">
<node CREATED="1417048113341" ID="ID_132338336" MODIFIED="1417048116212" TEXT="sudo reboot"/>
</node>
<node CREATED="1417048117317" ID="ID_653661700" MODIFIED="1417048145319" TEXT="verifica che il modulo driver del kernel sia caricato">
<node CREATED="1417048146398" ID="ID_1191646979" MODIFIED="1417048191115" TEXT="lsmod"/>
<node CREATED="1417048210517" ID="ID_1473360023" MODIFIED="1417048225556" TEXT="deve essere presente una linea simile a questa">
<node CREATED="1417048226180" ID="ID_1548883981" MODIFIED="1417048227395" TEXT="spi_bcm2708             4960  0 "/>
</node>
</node>
</node>
</node>
<node CREATED="1420232150486" ID="ID_50813041" MODIFIED="1420232252150" TEXT="altrimenti si pu&#xf2; scrivere direttamente nel file balcklist (vedi)"/>
</node>
</node>
<node CREATED="1417049071308" ID="ID_1608044484" MODIFIED="1417049084232" TEXT="prova programma Python">
<node CREATED="1417049337337" ID="ID_1125251469" MODIFIED="1417049345201" TEXT="uno che funziona &#xe8; qui">
<node CREATED="1417049346344" ID="ID_623511066" MODIFIED="1417049349831" TEXT="http://pi.gids.nl:81/adc/"/>
<node CREATED="1417049353063" ID="ID_969699490" MODIFIED="1417049372786" TEXT="con convertitore ADC MCP3208"/>
<node CREATED="1417049374071" ID="ID_1576367118" MODIFIED="1417049423983" TEXT="nel mio Raspi non c&apos;&#xe8; stato bisogno di scaricare ed installare il sw di supporto per Python che viene indicato in questa pagina Web."/>
</node>
</node>
</node>
</node>
<node CREATED="1412245292196" FOLDED="true" ID="ID_99050688" MODIFIED="1421620653530" POSITION="right" TEXT="Sensori analogici">
<node CREATED="1412245305613" ID="ID_262722793" MODIFIED="1420226408902" TEXT="ADC collegato via SPI (non pi&#xf9; I2C)"/>
</node>
</node>
</map>
