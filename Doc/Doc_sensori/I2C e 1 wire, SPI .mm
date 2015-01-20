<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1415008258856" ID="ID_1162977441" MODIFIED="1415058299618" TEXT="I2C e 1 wire, SPI ">
<node CREATED="1415008271495" ID="ID_1667123754" MODIFIED="1415008285821" POSITION="right" TEXT="&quot;bus&quot;">
<node CREATED="1415008287001" ID="ID_835334362" MODIFIED="1415008289302" TEXT="seriale"/>
<node CREATED="1415008296987" ID="ID_1777308397" MODIFIED="1415008301959" TEXT="address">
<node CREATED="1415008303915" ID="ID_346266830" MODIFIED="1415008305992" TEXT="7 bit"/>
</node>
<node CREATED="1415008382052" ID="ID_1736392858" MODIFIED="1415008403122" TEXT="topologia lineare"/>
<node CREATED="1415008444955" ID="ID_329790641" MODIFIED="1415008452072" TEXT="mezzo di trasmissione condiviso">
<node CREATED="1415008459421" FOLDED="true" ID="ID_379500011" MODIFIED="1415061508405" TEXT="2 fili">
<node CREATED="1415008465493" ID="ID_1615843457" MODIFIED="1415008475970" TEXT="I2C">
<node CREATED="1415008497217" ID="ID_1331853075" MODIFIED="1415061232750" TEXT="barometro giardino"/>
<node CREATED="1415061308123" ID="ID_1698032054" MODIFIED="1415061324052" TEXT="da 100 kbit/s a 3.4 Mbit/s"/>
</node>
</node>
<node CREATED="1415008453172" FOLDED="true" ID="ID_29534702" MODIFIED="1415061506590" TEXT="1 filo">
<node CREATED="1412242382273" ID="ID_1511684153" MODIFIED="1415061337666" TEXT="1-Wire">
<node CREATED="1415008493400" ID="ID_483488647" MODIFIED="1415061229953" TEXT="termometri giardino"/>
<node CREATED="1412242385573" ID="ID_319302706" MODIFIED="1412242412998" TEXT="Standard fatto dalla Dallas per le &quot;chiavi elettroniche&quot;"/>
<node CREATED="1412242444574" ID="ID_311818729" MODIFIED="1412242453536" TEXT="Similar in concept to I&#xb2;C, but with lower data rates and longer range. "/>
<node CREATED="1412242476304" ID="ID_707754410" MODIFIED="1412242487205" TEXT="possibility of using only two wires: data and ground. ">
<node CREATED="1412242488376" ID="ID_540280993" MODIFIED="1412242506467" TEXT="devices include an 800 pF capacitor to store charge and power the device during periods when the data line is active."/>
</node>
<node CREATED="1412242568422" ID="ID_1303140275" MODIFIED="1412242577143" TEXT="connected using cables with modular connectors or with CAT-5 cable">
<node CREATED="1412242612427" ID="ID_830640197" MODIFIED="1412242616272" TEXT=" RJ11 connectors"/>
</node>
<node CREATED="1412242662329" ID="ID_1914118348" MODIFIED="1412242663199" TEXT="Each 1-Wire chip has a unique ID code"/>
<node CREATED="1412245203091" ID="ID_1775142315" MODIFIED="1415061447291" TEXT="Sul Raspi c&apos;&#xe8; Sw che lo fa funzionare, ma su un solo pin GPIO, difficile da cambiare"/>
</node>
</node>
<node CREATED="1415008622262" FOLDED="true" ID="ID_1469949066" MODIFIED="1415061505247" TEXT="4 fili">
<node CREATED="1415008626071" FOLDED="true" ID="ID_601975839" MODIFIED="1415061504135" TEXT="SPI">
<node CREATED="1415061241699" ID="ID_1440317998" MODIFIED="1415061278652" TEXT="Esiste un buon convertitore AD, con software in C#"/>
<node CREATED="1411078829356" ID="ID_1763141390" MODIFIED="1411078831346" TEXT="Serial Peripheral Interface"/>
<node CREATED="1411078808148" ID="ID_1154698468" MODIFIED="1411081545279" TEXT="&quot;4-wire&quot; bus"/>
<node CREATED="1411078832065" ID="ID_874920533" MODIFIED="1411078859673" TEXT="pi&#xf9; alta velocit&#xe0;">
<node CREATED="1411078861444" ID="ID_1990619711" MODIFIED="1411081588038" TEXT="centinaia di Mbit/s"/>
<node CREATED="1411081569828" ID="ID_370272803" MODIFIED="1411081599106" TEXT="Usato anche con le SDcard"/>
</node>
<node CREATED="1411078842740" ID="ID_184179186" MODIFIED="1411078846226" TEXT="sincrono"/>
<node CREATED="1411078912299" ID="ID_1588458636" MODIFIED="1411078925545" TEXT="c&apos;&#xe8; nel RaspPI"/>
</node>
</node>
<node CREATED="1415008307356" FOLDED="true" ID="ID_1305425281" MODIFIED="1415061503014" TEXT="MAC">
<node CREATED="1415008362113" ID="ID_1272971188" MODIFIED="1415008369038" TEXT="Medium Access Control"/>
<node CREATED="1415008311460" ID="ID_301782600" MODIFIED="1415008321137" TEXT="master - slave">
<node CREATED="1415008661739" ID="ID_1518637987" MODIFIED="1415008686498" TEXT="La MCU &#xe8; il master"/>
<node CREATED="1415008743795" ID="ID_1745569000" MODIFIED="1415008750121" TEXT="I sensori slave."/>
</node>
<node CREATED="1415008592452" FOLDED="true" ID="ID_1632155283" MODIFIED="1415061501694" TEXT="MAC a contesa">
<node CREATED="1415060915415" ID="ID_1999909943" MODIFIED="1415061493484" TEXT="(NON c&apos;entra con questi, solo per ripasso)"/>
<node CREATED="1415008524539" ID="ID_1322402866" MODIFIED="1415008766010" TEXT="Ricordate il CSMA/CD?">
<node CREATED="1415008537357" ID="ID_950179865" MODIFIED="1415008550675" TEXT="MAC Ethernet"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1415008876418" ID="ID_580476025" MODIFIED="1415008988691" POSITION="right" TEXT="I2C">
<node CREATED="1415061083775" ID="ID_1988505319" MODIFIED="1415061094392" TEXT="sistema a 2 fili per i dati"/>
<node CREATED="1415008989799" ID="ID_748467471" MODIFIED="1415061107956" TEXT="max 4 file">
<node CREATED="1415010032030" ID="ID_1074822715" MODIFIED="1415010037545" TEXT="si chiama anche">
<node CREATED="1415010038630" ID="ID_368473658" MODIFIED="1415010041628" TEXT="SMBus">
<node CREATED="1411078091162" FOLDED="true" ID="ID_1377956017" MODIFIED="1415060990044" TEXT="I2C != SMBus ?">
<node CREATED="1411078107647" ID="ID_414393731" MODIFIED="1411078118137" TEXT="are essentially compatible with each other"/>
</node>
</node>
<node CREATED="1415009136039" ID="ID_196757086" MODIFIED="1415061024958" TEXT="&quot;2 wire bus&quot;">
<node CREATED="1415060994539" ID="ID_926125390" MODIFIED="1415061013962" TEXT="nome i2C non usato per non pagare royalties"/>
</node>
</node>
<node CREATED="1415009002048" ID="ID_352073807" MODIFIED="1415009008302" TEXT="1 - Vcc"/>
<node CREATED="1415009026851" ID="ID_695219596" MODIFIED="1415009033360" TEXT="2 - GND"/>
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
<node CREATED="1411077626722" FOLDED="true" ID="ID_1228527641" MODIFIED="1415061050041" TEXT="Dettagli">
<node CREATED="1411077910806" ID="ID_660763352" MODIFIED="1411077911891" TEXT="I2C is a communication bus designed by Philips, for chips to communicate with each other">
<node CREATED="1411079035414" ID="ID_460777986" MODIFIED="1411079047634" TEXT="inventato da Philips per le TV"/>
<node CREATED="1411079496029" ID="ID_1685754510" MODIFIED="1411079498569" TEXT="1980"/>
</node>
<node CREATED="1411077959374" ID="ID_1157702562" MODIFIED="1411077976652" TEXT="I2C = Inter-Integrated Circuit"/>
<node CREATED="1411078122333" ID="ID_294091061" MODIFIED="1411078362338" TEXT="&quot;2-wire bus&quot;">
<node CREATED="1411079064143" FOLDED="true" ID="ID_333703693" MODIFIED="1415056176528" TEXT="2 active wires and a ground connection">
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
</node>
<node CREATED="1411078280361" ID="ID_1201846667" MODIFIED="1411078281096" TEXT="low speed data transmission">
<node CREATED="1411079716582" ID="ID_1547017279" MODIFIED="1411079739780" TEXT="100 kbit/s : Standard mode"/>
<node CREATED="1411079165674" ID="ID_1877601145" MODIFIED="1411079743324" TEXT="400 kbit/s : Fast mode"/>
<node CREATED="1411079757904" ID="ID_786921973" MODIFIED="1411079766383" TEXT="3.4 Mbps : High-Speed mode"/>
</node>
<node CREATED="1411078249938" ID="ID_173151102" MODIFIED="1411078264084" TEXT="&quot;Multi Master&quot; Serial Bus">
<node CREATED="1411078525614" ID="ID_1415860934" MODIFIED="1411078539642" TEXT="one must be the master and the others must act as the slaves">
<node CREATED="1411079591657" ID="ID_1762721994" MODIFIED="1411079602531" TEXT="master = microcontrollore"/>
<node CREATED="1411079602934" ID="ID_868272468" MODIFIED="1411079609997" TEXT="slave = sensore"/>
</node>
<node CREATED="1411079200441" ID="ID_1686181862" MODIFIED="1411079202082" TEXT=" each IC on the bus has a unique address"/>
<node CREATED="1411079468501" ID="ID_316875842" MODIFIED="1411079479657" TEXT="I2C bus supports more than one master connected to one bus"/>
</node>
<node CREATED="1411079321301" ID="ID_665722479" MODIFIED="1411079322477" TEXT=" clock is always generated by the master">
<node CREATED="1411079331628" ID="ID_1636278849" MODIFIED="1411079333744" TEXT="the slave may hold it low to generate a wait state"/>
<node CREATED="1411079430829" ID="ID_1342848161" MODIFIED="1411079431610" TEXT="The master can transmit or receive signals to or from a slave, respectively, or control signal transfers between two slaves"/>
</node>
<node CREATED="1411079573860" ID="ID_109574956" MODIFIED="1411079582851" TEXT="To begin communication, the bus master places the address of the device with which it intends to communicate (the slave) on the bus">
<node CREATED="1411079638624" ID="ID_1438507722" MODIFIED="1411079667089" TEXT="only the device with the correct address will communicate"/>
</node>
<node CREATED="1411079267114" ID="ID_1071965040" MODIFIED="1411079294953" TEXT="features">
<node CREATED="1411079271556" ID="ID_736292193" MODIFIED="1411079272585" TEXT="collision detection"/>
<node CREATED="1411079283138" ID="ID_1580920621" MODIFIED="1411079284211" TEXT=" hand-shaking for multi-master systems"/>
<node CREATED="1411079284823" ID="ID_386935697" MODIFIED="1411079290818" TEXT="clock synchronization "/>
</node>
<node CREATED="1411079843850" ID="ID_1646851929" MODIFIED="1411079844907" TEXT="I2C by definition is 5V">
<node CREATED="1411079855196" ID="ID_1338091859" MODIFIED="1411079865442" TEXT="There are hacks to make I2C to work also on other voltages than 5V"/>
</node>
<node CREATED="1411077636562" ID="ID_535189175" MODIFIED="1411081618081" TEXT="SMBus">
<node CREATED="1411077630377" ID="ID_1484567967" MODIFIED="1411077636065" TEXT="is the System Management Bus defined by Intel&#xae; Corporation in 1995"/>
<node CREATED="1411081377201" ID="ID_635607278" MODIFIED="1411081383973" TEXT="is a subset of I&#xb2;C that defines the protocols more strictly"/>
<node CREATED="1411077674807" ID="ID_828578646" MODIFIED="1411077675398" TEXT="used in personal computers and servers for low-speed system management communications"/>
</node>
<node CREATED="1411078091162" FOLDED="true" ID="ID_981119932" MODIFIED="1411081616104" TEXT="I2C != SMBus ?">
<node CREATED="1411078107647" ID="ID_1549823198" MODIFIED="1411078118137" TEXT="are essentially compatible with each other"/>
</node>
</node>
<node CREATED="1415009196447" ID="ID_1278891713" MODIFIED="1415009198771" TEXT="Raspberry">
<node CREATED="1415009726243" FOLDED="true" ID="ID_1059306118" MODIFIED="1415061060218" TEXT="Hw, pinout">
<node CREATED="1415009200256" ID="ID_1118811843" MODIFIED="1415009217190" TEXT="2 pin del connettore GPIO">
<node CREATED="1415009276705" ID="ID_463354680" MODIFIED="1415009281422" TEXT="SCL">
<node CREATED="1415009643698" ID="ID_916342186" MODIFIED="1415009645814" TEXT="pin 5"/>
</node>
<node CREATED="1415009281689" ID="ID_258260318" MODIFIED="1415009406460" TEXT="SDA">
<node CREATED="1415009649187" ID="ID_431258173" MODIFIED="1415009651519" TEXT="pin 3"/>
</node>
</node>
<node CREATED="1415009653467" ID="ID_842783032" MODIFIED="1415009660536" TEXT="Vcc 3.3 V">
<node CREATED="1415009661348" ID="ID_1974556098" MODIFIED="1415009663688" TEXT="pin 1"/>
</node>
<node CREATED="1415009674189" ID="ID_339675042" MODIFIED="1415009675649" TEXT="GND">
<node CREATED="1415009679101" ID="ID_775814215" MODIFIED="1415009681114" TEXT="pin 6"/>
</node>
</node>
<node CREATED="1415009737836" ID="ID_1698551920" MODIFIED="1415009742649" TEXT="Sw di sistema">
<node CREATED="1415009743613" ID="ID_466205488" MODIFIED="1415009748033" TEXT="i2cdetect">
<node CREATED="1415009895653" ID="ID_1292553773" MODIFIED="1415009904306" TEXT="per trovare i dispositivi sul bus"/>
<node CREATED="1415009768672" ID="ID_1362917301" MODIFIED="1415009769707" TEXT="[-y] [-a] [-q|-r] I2CBUS [FIRST LAST]"/>
<node CREATED="1415009772584" ID="ID_404684823" MODIFIED="1415009775556" TEXT="-y 1">
<node CREATED="1415009780721" ID="ID_1966838237" MODIFIED="1415009788278" TEXT="canale 0">
<node CREATED="1415009789178" ID="ID_173963677" MODIFIED="1415009805808" TEXT="per display"/>
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
</node>
<node CREATED="1415009961997" ID="ID_57554989" MODIFIED="1415009966058" TEXT="i2cget">
<node CREATED="1415009966566" ID="ID_627232187" MODIFIED="1415009971162" TEXT="legge dal chip"/>
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
</node>
<node CREATED="1415011259151" ID="ID_1243906236" MODIFIED="1415011772311" TEXT="i2cset"/>
<node CREATED="1415011157231" ID="ID_280243586" MODIFIED="1415011162483" TEXT="mono e C#">
<node CREATED="1415011163655" ID="ID_84091232" MODIFIED="1415011175061" TEXT="esecuzione">
<node CREATED="1415011177929" ID="ID_1898744486" MODIFIED="1415011188142" TEXT="mono &lt;nome exe&gt;"/>
</node>
<node CREATED="1415011199394" ID="ID_1100312030" MODIFIED="1415011212719" TEXT="scrittura del codice">
<node CREATED="1415011213507" ID="ID_674258975" MODIFIED="1415011226513" TEXT="V.S., anche per compilare"/>
</node>
</node>
</node>
</node>
</node>
</node>
</map>