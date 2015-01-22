<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1419633369549" ID="ID_251475954" MODIFIED="1419633393634" TEXT="pigpio Libreria generale per GPIO">
<node CREATED="1419635047523" ID="ID_1680570164" MODIFIED="1419635059354" POSITION="right" TEXT="Libreria pigpio">
<node CREATED="1419635060487" ID="ID_1742278435" MODIFIED="1419635067799" TEXT="in http://abyz.co.uk/rpi/pigpio"/>
<node CREATED="1419633412174" ID="ID_140053181" MODIFIED="1419633424759" TEXT="caricamento, compilazione ed installazione">
<node CREATED="1419633426625" ID="ID_317780691" MODIFIED="1419633465014" TEXT="wget abyz.co.uk/rpi/pigpio/pigpio.zip">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1419633437767" ID="ID_1277834169" MODIFIED="1419633444911" TEXT="unzip pigpio.zip "/>
<node CREATED="1419633445393" ID="ID_1380278023" MODIFIED="1419633450535" TEXT="cd PIGPIO "/>
<node CREATED="1419633450999" ID="ID_1301439630" MODIFIED="1419633454265" TEXT="make "/>
<node CREATED="1419633454704" ID="ID_627071015" MODIFIED="1419633455939" TEXT="make install"/>
</node>
<node CREATED="1419633540927" ID="ID_1875895895" MODIFIED="1419633548726" TEXT="verifica della libreria">
<node CREATED="1419633552501" ID="ID_1581174871" MODIFIED="1419633552501" TEXT="sudo ./x_pigpio # check C I/F"/>
<node CREATED="1419633552501" ID="ID_743119647" MODIFIED="1419633941954" STYLE="fork" TEXT="sudo ./pigpiod    # start daemon"/>
<node CREATED="1419633552501" ID="ID_571545517" MODIFIED="1419633552501" TEXT="./x_pigpiod_if  # check C      I/F to daemon"/>
<node CREATED="1419633552501" ID="ID_985762688" MODIFIED="1419633552501" TEXT="./x_pigpio.py   # check Python I/F to daemon"/>
<node CREATED="1419633552501" ID="ID_1843850029" MODIFIED="1419633552501" TEXT="./x_pigs        # check pigs   I/F to daemon"/>
<node CREATED="1419633552501" ID="ID_67625029" MODIFIED="1419633552501" TEXT="./x_pipe        # check pipe   I/F to daemon"/>
</node>
<node CREATED="1419633597938" ID="ID_1558801803" MODIFIED="1419633674204" TEXT="compilare un (eventuale..) programma in C che usa pigpio e si chiama yourprog">
<node CREATED="1419633655113" ID="ID_1481037541" MODIFIED="1419633655113" TEXT="gcc -o yourprog yourprog.c -lpigpio -lrt -lpthread"/>
<node CREATED="1419633655113" ID="ID_1346647843" MODIFIED="1419633655113" TEXT="sudo ./yourprog"/>
</node>
</node>
<node CREATED="1419634486791" ID="ID_975064788" MODIFIED="1419634518313" POSITION="right" TEXT="per eseguire il programma Python che legge il sensore di umidit&#xe0; e temperatura DHT22">
<node CREATED="1419634519598" ID="ID_506653770" MODIFIED="1419635177462" TEXT="lanciare il demone di pigpio (se non lo si &#xe8; fatto lanciare al boot)">
<node CREATED="1419634584921" ID="ID_1552829149" MODIFIED="1419634605791" TEXT="se &#xe8; nella stessa cartella dello script Python da eseguire">
<node CREATED="1419634576091" ID="ID_465997104" MODIFIED="1419635190582" TEXT="sudo ./pigpiod">
<node CREATED="1419779844372" ID="ID_1513180950" MODIFIED="1419779867662" TEXT="se non va, ci si &#xe8; dimenticato di rendere eseguibile il file pigpiod"/>
</node>
<node CREATED="1419634610818" ID="ID_1285713122" MODIFIED="1419634627477" TEXT="altrimenti sostituire ./ con la path della cartella dove c&apos;&#xe8; il demone"/>
</node>
</node>
<node CREATED="1419634636534" ID="ID_318929619" MODIFIED="1419634658698" TEXT="eseguire lo script del sensore di umidit&#xe0;">
<node CREATED="1419634659429" ID="ID_620303832" MODIFIED="1419634796345" TEXT="sudo python DHT22.py"/>
<node CREATED="1419634796842" ID="ID_1429141011" MODIFIED="1419634865869" TEXT="per eseguire deve esserci, nella stessa cartella di questo script, il file pigpio.py, che si era ottenuto con la compilazione della libreria"/>
</node>
<node CREATED="1419634659429" ID="ID_999086466" MODIFIED="1419635430382" TEXT="Lo script DHT22.py inizializza la classe che usa il sensore accettando come parametri">
<node CREATED="1419635927531" ID="ID_1495339419" MODIFIED="1419635928815" TEXT="(self, pi, gpio, LED=None, power=None)"/>
</node>
</node>
<node CREATED="1419690660314" ID="ID_1484798558" MODIFIED="1419690698746" POSITION="right" TEXT="per lanciare il demone pigpiod al boot">
<node CREATED="1419695211045" ID="ID_618867099" MODIFIED="1419704476991" TEXT="metterlo in /etc/rc.local"/>
<node CREATED="1419689765575" ID="ID_1145904163" MODIFIED="1419694323590" TEXT="sudo nano /etc/rc.local">
<node CREATED="1419779367660" ID="ID_614233295" MODIFIED="1419779464002" TEXT="aggiungere la riga"/>
<node CREATED="1419779406587" ID="ID_778231440" MODIFIED="1419779453887" TEXT="sudo /&lt;path della cartella del demone&gt;/pigpiod">
<node CREATED="1419779465650" ID="ID_1278509999" MODIFIED="1419779692277" TEXT="Mettere la riga al posto giusto nel file! (p.es. prima del programma che la usa, se lo si lancia da rc.local)"/>
</node>
</node>
</node>
</node>
</map>
