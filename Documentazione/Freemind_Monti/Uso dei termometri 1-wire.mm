<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1415611289505" ID="ID_209638130" MODIFIED="1415616978636" TEXT="Uso di termometri 1-wire">
<node CREATED="1415616980729" ID="ID_1122156504" MODIFIED="1415617008058" POSITION="right" TEXT="in Linux esiste un driver a livello di kernel che implementa il protocollo 1-wire"/>
<node CREATED="1415617012435" ID="ID_1853792029" MODIFIED="1416215934927" POSITION="right" TEXT="in Raspbian il driver viene installato all&apos;installazione, ma NON CARICATO al momento del boot"/>
<node CREATED="1415617044655" ID="ID_1495801896" MODIFIED="1415617298168" POSITION="right" TEXT="operazioni da fare per vedere la temperatura">
<node CREATED="1415611298447" ID="ID_1840656866" MODIFIED="1415617055568" TEXT="1 - caricare i driver 1-wire">
<node CREATED="1415611315831" ID="ID_1056722956" MODIFIED="1415617063958" TEXT="sudo modprobe w1-gpio"/>
<node CREATED="1415611315831" ID="ID_1050836990" MODIFIED="1415617069176" TEXT="sudo modprobe w1-therm"/>
</node>
<node CREATED="1415617124143" ID="ID_745119938" MODIFIED="1415617316201" TEXT="2 - andare nella cartella dei &quot;file del device&quot;">
<node CREATED="1415617285352" ID="ID_1059885987" MODIFIED="1415617286743" TEXT="cd /sys/bus/w1/devices/">
<node CREATED="1419780710975" MODIFIED="1419780710975" TEXT="#tempSonda1 = read_temperature(&quot;28-00042c643aff&quot;)"/>
<node CREATED="1419780717799" MODIFIED="1419780717799" TEXT="#tempSonda1 = read_temperature(&quot;28-00042c643aff&quot;)"/>
</node>
</node>
<node CREATED="1415617319595" ID="ID_1334621810" MODIFIED="1415617890388" TEXT="3 - ogni sensore presente viene rilevato dal kernel Linux. In questa cartella compare, per ogni sensore,una &quot;cartella&quot; che ha il nome 28-XXXXX. XXXXX &#xe8; il codice univoco &quot;bruciato&quot; nel termometro dal produttore all&apos;interno del chip quando &#xe8; stato creato.">
<node CREATED="1415617897177" ID="ID_540454559" MODIFIED="1415617910387" TEXT="ls -l ">
<node CREATED="1415617910722" ID="ID_1988773323" MODIFIED="1415618168521" TEXT="d&#xe0; l&apos;elenco delle cartelle &quot;dei sensori&quot; che sono nel sistema"/>
</node>
<node CREATED="1415618209985" ID="ID_558184543" MODIFIED="1415618211836" TEXT="es.">
<node CREATED="1415618475125" ID="ID_1353199802" MODIFIED="1415618479016" TEXT="ls -l"/>
<node CREATED="1415618213001" ID="ID_1627546761" MODIFIED="1415618311493" TEXT="totale 0 &#xa;lrwxrwxrwx 1 root root 0 nov  8 00:27 28-0000062196f0 -&gt; ../../../devices/w1_bus_master1/28-0000062196f0 lrwxrwxrwx 1 root root 0 nov  8 00:27 w1_bus_master1 -&gt; ../../../devices/w1_bus_master1 "/>
<node CREATED="1415618340735" ID="ID_1053106557" MODIFIED="1415618346095" TEXT="w1_bus_master1 ci sar&#xe0; sempre"/>
<node CREATED="1415618441474" ID="ID_1298712113" MODIFIED="1415618466139" TEXT="28-0000062196f0 e gli altri sono relativi a ciascuno dei sensori"/>
</node>
</node>
<node CREATED="1415618170717" ID="ID_1877043216" MODIFIED="1415618184850" TEXT="4 - passando nella cartella di un sensore">
<node CREATED="1415618186606" ID="ID_957679942" MODIFIED="1415618189875" TEXT="es.">
<node CREATED="1415638085244" ID="ID_1634296747" MODIFIED="1415638492696" TEXT="cd 28-0000062196f0"/>
</node>
<node CREATED="1415638109637" ID="ID_175016741" MODIFIED="1415638137721" TEXT="si vede un &quot;file&quot; w1-start "/>
<node CREATED="1415638139133" ID="ID_1225751565" MODIFIED="1415638160635" TEXT="visualizzare quel file equivale a leggere il termometro"/>
<node CREATED="1415638776117" ID="ID_1067425107" MODIFIED="1418568573324" TEXT="cat w1_slave"/>
<node CREATED="1415638787566" ID="ID_1034853621" MODIFIED="1415639108528" TEXT="appaiono due righe di testo, parte in esadecimale e parte in ASCII, in fondo alle quali c&apos;&#xe8; la scritta t=XXXXXXX">
<node CREATED="1415638896721" ID="ID_1054676568" MODIFIED="1415638898978" TEXT="es.">
<node CREATED="1415638899957" ID="ID_1516403711" MODIFIED="1415638921092" TEXT="t=23321"/>
<node CREATED="1415638934086" ID="ID_747877531" MODIFIED="1415639131956" TEXT="questa &#xe8; la temperatura in millesimi di grado misurata dal sensore"/>
<node CREATED="1415639132345" ID="ID_627103056" MODIFIED="1415639136527" TEXT="dividendo per 1000:"/>
<node CREATED="1415638921636" ID="ID_1192899751" MODIFIED="1415638925023" TEXT="23.321">
<node CREATED="1415638998345" ID="ID_1117216944" MODIFIED="1415639009070" TEXT="&#xe8; la temperatura in gradi Celsius"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1415638185265" ID="ID_1817098603" MODIFIED="1415638217031" POSITION="right" TEXT="per leggere la temperatura da un programma C#">
<node CREATED="1415638231205" ID="ID_307621522" MODIFIED="1415638245832" TEXT="in modo analogo al programma per I2C">
<node CREATED="1415638246646" ID="ID_145241226" MODIFIED="1415638720507" TEXT="se in I2C lanciavamo da C# il programma I2Cget"/>
<node CREATED="1415638396851" ID="ID_885053448" MODIFIED="1415638420431" TEXT="cos&#xec;, per 1-wire, lanciamo il programma">
<node CREATED="1415617285352" ID="ID_1424106676" MODIFIED="1415954777817" TEXT="/sys/bus/w1/devices/28-0000062196f0/w1_slave"/>
</node>
<node CREATED="1415638512718" ID="ID_1816722987" MODIFIED="1415638766966" TEXT="catturiamo il risultato del programma, come nel programma per I2C, andiamo ad estrarre la sottostringa della temperatura, la convertiamo in numero, dividiamo per 1000 ed il gioco &#xe8; fatto"/>
</node>
</node>
<node CREATED="1419689474787" ID="ID_427649680" MODIFIED="1419689506296" POSITION="right" TEXT="per caricare i moduli del driver al boot del sistema">
<node CREATED="1419689689252" ID="ID_1512574362" MODIFIED="1419689700493" TEXT="alternative">
<node CREATED="1419689507664" ID="ID_1369858656" MODIFIED="1419689580132" TEXT="aggiungere i moduli da caricare al file /etc/modules">
<node CREATED="1419689535294" ID="ID_1049918194" MODIFIED="1419689535294" TEXT="sudo nano /etc/modules"/>
<node CREATED="1419689581755" ID="ID_1485190792" MODIFIED="1419689594852" TEXT="aggiungere due righe in fondo">
<node CREATED="1419689586643" ID="ID_826154098" MODIFIED="1419689586643" TEXT="w1-gpio"/>
<node CREATED="1419689586643" ID="ID_1147154077" MODIFIED="1419689586643" TEXT="w1-therm"/>
</node>
</node>
<node CREATED="1419689728026" ID="ID_295265744" MODIFIED="1419689757892" TEXT="aggiungere i comandi di caricamento allo script &quot;di partenza&quot; rc.local">
<node CREATED="1419689765575" ID="ID_1145904163" MODIFIED="1419694323590" TEXT="sudo nano /etc/rc.local"/>
<node CREATED="1419690417244" ID="ID_64013964" MODIFIED="1419690422090" TEXT="aggiungere">
<node CREATED="1419690425924" ID="ID_1526328153" MODIFIED="1419690425924" TEXT="sudo modprobe w1-gpio &amp;"/>
<node CREATED="1419690425924" ID="ID_712111297" MODIFIED="1419690425924" TEXT="sudo modprobe w1-therm &amp;"/>
<node CREATED="1419690427869" ID="ID_872528185" MODIFIED="1419690535317" TEXT="se nello script ci sono delle if, esso si deve concludere con exit(0)"/>
</node>
</node>
<node CREATED="1419689649760" ID="ID_432484676" MODIFIED="1419689677666" TEXT="se si programma in Python &#xe8; possibile far caricare i driver dal programma stesso">
<node CREATED="1419689685243" MODIFIED="1419689685243" TEXT="os.system(&apos;modprobe w1-gpio&apos;)"/>
<node CREATED="1419689685243" MODIFIED="1419689685243" TEXT="os.system(&apos;modprobe w1-therm&apos;)"/>
</node>
</node>
</node>
</node>
</map>
