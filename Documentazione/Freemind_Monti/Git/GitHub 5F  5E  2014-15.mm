<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1414658884907" ID="ID_1953988544" MODIFIED="1414659120564" TEXT="GitHub 5F &amp; 5E  2014-15">
<node CREATED="1414658947752" ID="ID_617665734" LINK="https:/github.com" MODIFIED="1414702933258" POSITION="right" TEXT="https://github.com/"/>
<node CREATED="1414658997976" ID="ID_1433955064" MODIFIED="1414659013923" POSITION="right" TEXT="Account prof. Monti">
<node CREATED="1414659015048" ID="ID_299445114" MODIFIED="1414659017023" TEXT="gamondue"/>
</node>
<node CREATED="1414659049396" ID="ID_669116960" MODIFIED="1414659616686" POSITION="right" TEXT="Fare la normale registrazione"/>
<node CREATED="1414659183471" ID="ID_1362025721" MODIFIED="1414659460759" POSITION="right" TEXT="Il repository si pu&#xf2; usare gratis solo con progetti pubblici, visibili a tutto il mondo, di solito con licenza open source">
<node CREATED="1414659219996" ID="ID_6545769" MODIFIED="1414659484790" TEXT=" Per i repository privati si paga"/>
</node>
<node CREATED="1414659257424" ID="ID_1102052196" MODIFIED="1414659261788" POSITION="right" TEXT="Creare un progetto">
<node CREATED="1414659337371" ID="ID_317224811" MODIFIED="1414659354764" TEXT="Gi&#xe0; fatto da Monti per i &quot;gardens&quot;"/>
<node CREATED="1414659618754" ID="ID_1389611907" MODIFIED="1414659623982" TEXT="Da Web">
<node CREATED="1414658947752" ID="ID_831832299" MODIFIED="1414658948718" TEXT="https://github.com/"/>
</node>
<node CREATED="1414659624349" ID="ID_1219905665" MODIFIED="1414659628358" TEXT="Accedere">
<node CREATED="1414659646378" ID="ID_76420838" MODIFIED="1414659673777" TEXT="con l&apos;account fatto prima"/>
</node>
<node CREATED="1414659264459" ID="ID_577764149" MODIFIED="1414659501888" TEXT="Click su immagine grossa &quot;create repositories&quot;"/>
<node CREATED="1414659393694" ID="ID_1474407782" MODIFIED="1414659408030" TEXT="+ in una pagina, in alto a destra"/>
<node CREATED="1414659539088" ID="ID_1494543244" MODIFIED="1414659590436" TEXT="Inizializzare il repository scrivendo un file README (un mini Project Charter!)">
<node CREATED="1414659785046" ID="ID_1224975638" MODIFIED="1421928044399" TEXT="Questo file viene mostrato come prima cosa su Web, nella prima pagina del progetto. "/>
</node>
<node CREATED="1414659684492" ID="ID_1798195695" MODIFIED="1414659994223" TEXT="Progetto creato, si pu&#xf2; fare il primo Commit"/>
<node CREATED="1414662224848" ID="ID_1929158787" MODIFIED="1414688465054" TEXT="Il progetto &#xe8; accessibile via web da">
<node CREATED="1414688471677" ID="ID_83706815" LINK="https:/github.com/gamondue/GOR5X" MODIFIED="1414688580949" TEXT="https://github.com/gamondue/GOR5X"/>
</node>
</node>
<node CREATED="1421928111596" ID="ID_159245322" MODIFIED="1421928130711" POSITION="right" TEXT="Usare GitHib da scuola">
<node CREATED="1421928131560" ID="ID_1467624621" MODIFIED="1421928157032" TEXT="E&apos; necessario &quot;uscire&quot; dalla rete della scuola e raggiungere GitHub"/>
<node CREATED="1421928157338" ID="ID_1405628946" MODIFIED="1421928177769" TEXT="Il modo consigliato &#xe8; usare SSH, ma &#xe8; bloccato dal firewall"/>
<node CREATED="1421928179541" ID="ID_1446200548" MODIFIED="1421928203802" TEXT="Utilizziamo http (insicuro) o https">
<node CREATED="1421928226385" ID="ID_769389078" MODIFIED="1421928259085" TEXT="A scuola http e https non possono uscire liberamente, devono passare attraverso il proxy di hagrid"/>
<node CREATED="1421662477454" ID="ID_471239406" MODIFIED="1422008546080" TEXT="Configurare git per usare hagrid come proxy e uscire su internet per raggiungere github">
<node CREATED="1421662671809" ID="ID_1980082213" MODIFIED="1421662855642" TEXT="Aprire la shell di git (git bash)"/>
<node CREATED="1421662857102" ID="ID_1792912735" MODIFIED="1421662962878" TEXT="Configurare per usare il proxi hagrid, sia in http che https"/>
<node CREATED="1422013222530" ID="ID_1348470912" MODIFIED="1422013241687" TEXT="1 - provare senza configurare il proxy http"/>
<node CREATED="1422013243055" ID="ID_643659637" MODIFIED="1422013257087" TEXT="2 - se non va, provare con la seguente configurazione">
<node CREATED="1421926826199" ID="ID_1024028376" MODIFIED="1421926930444" TEXT="git config --global http.proxy http://&lt;utente ActiveDirectory in Hagrid &gt;:&lt;password che si usa in laboratorio per entrare sui computer&gt;@hagrid:8080 ">
<node CREATED="1422000372982" ID="ID_829291878" MODIFIED="1422000380190" TEXT="farlo anche per https"/>
<node CREATED="1421926947131" ID="ID_479874018" MODIFIED="1421926949052" TEXT="es.">
<node CREATED="1421662886193" ID="ID_1673159573" MODIFIED="1421663041471" TEXT="git config --global http.proxy http://gabriele.monti:PasswordDiMontiInChiaro@hagrid:8080"/>
<node CREATED="1421662886193" ID="ID_1293508131" MODIFIED="1421668453514" TEXT="git config --global https.proxy https://gabriele.monti:PasswordDiMontiInChiaro@hagrid:8080">
<node CREATED="1421663055038" ID="ID_1058035785" MODIFIED="1422000419271" TEXT="uguale a prima, solo che https sostituisce http (in DUE punti)"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1421663669313" ID="ID_50118487" MODIFIED="1421926959452" TEXT="Collegarsi ad un repository GitHub">
<node CREATED="1421663697878" ID="ID_1804814716" MODIFIED="1421663709042" TEXT="Fare un account GitHub">
<node CREATED="1421666130518" ID="ID_1667157794" MODIFIED="1421666162287" TEXT="es. username: allievoitt"/>
</node>
<node CREATED="1421663839781" ID="ID_1743234747" MODIFIED="1421668964163" TEXT="Clonare un repository">
<node CREATED="1421664410490" ID="ID_1325088705" MODIFIED="1421664439329" TEXT="es. in git bash">
<node CREATED="1421664440508" ID="ID_254815426" MODIFIED="1421924288121" TEXT="git clone &lt;URL del repository Internet&gt;">
<node CREATED="1421926491371" ID="ID_22271993" MODIFIED="1421926495005" TEXT="es.">
<node CREATED="1421926508923" ID="ID_1479424917" MODIFIED="1421926517866" TEXT="git clone https://github.com/gamondue/GOR5F"/>
</node>
</node>
<node CREATED="1421668812373" ID="ID_1866975437" MODIFIED="1421668895187" TEXT="spostarsi con cd nella cartella in cui vogliamo tenere le cartelle sincronizzate con git"/>
<node CREATED="1421668765136" ID="ID_613626347" MODIFIED="1421924087390" TEXT="lo mette in una nuova cartella con il nome GOR5F all&apos;interno della cartella CORRENTE"/>
</node>
<node CREATED="1421924297436" ID="ID_1574764291" MODIFIED="1421924351529" TEXT="Se si vuole clonare in una specifica cartella, bisogna indicarlo dopo la URL del repository">
<node CREATED="1421664440508" ID="ID_499310830" MODIFIED="1421924382419" TEXT="git clone &lt;URL del repository Internet&gt; &lt;path e file della cartella in cui finisce il clone&gt;"/>
</node>
</node>
<node CREATED="1421924391429" ID="ID_1227034263" MODIFIED="1421924933730" TEXT="Il clone copia da Internet TUTTO il contenuto della cartella del repository"/>
<node CREATED="1421668978664" ID="ID_1053245804" MODIFIED="1421924957485" TEXT="Se nel repository c&apos;&#xe8; molta roba, a scuola  &#xe8; meglio non scaricarla da Internet con un comando di clone (buttiamo gi&#xf9; l&apos;Internet della scuola). "/>
<node CREATED="1421924146698" ID="ID_395327245" MODIFIED="1421999798349" TEXT="Dobbiamo copiare dalla chiavetta e sincronizzare in seguito solo le differenze. ">
<node CREATED="1421925115317" ID="ID_1154999860" MODIFIED="1421925150042" TEXT="Copiare sulla propria cartella su Hagrid il contenuto del repository da usare">
<node CREATED="1421925671959" ID="ID_107924348" MODIFIED="1421925685021" TEXT="da SHELL WINDOWS!"/>
<node CREATED="1421925169352" ID="ID_439608485" MODIFIED="1421925701436" TEXT="xcopy &lt;cartella sorgente&gt; &lt;cartella destinazione&gt; -E">
<node CREATED="1421925446589" ID="ID_416092296" MODIFIED="1421925713321" TEXT="opzione -E per fare copia ricorsiva dentro le cartelle"/>
</node>
</node>
<node CREATED="1421925612037" FOLDED="true" ID="ID_31930675" MODIFIED="1422000350163" TEXT="Sincronizzare il git remoto (su GitHub) al git locale (sul computer su cui si lavora)">
<node CREATED="1421925725430" ID="ID_283262848" MODIFIED="1421925737450" TEXT="da Git bash"/>
<node CREATED="1421926990085" ID="ID_908772270" MODIFIED="1421926990085" TEXT=""/>
</node>
</node>
</node>
<node CREATED="1421926726908" ID="ID_417979093" MODIFIED="1421927196844" TEXT="Uso di Git Bash">
<node CREATED="1421926734074" ID="ID_1074658518" MODIFIED="1421926752433" TEXT="Incolla il contenuto della clipboard">
<node CREATED="1421926753954" ID="ID_129399850" MODIFIED="1421926785216" TEXT="click destro sulla barra superiore del programma "/>
<node CREATED="1421926785536" ID="ID_74285735" MODIFIED="1421926799107" TEXT="Modifica"/>
<node CREATED="1421926799386" ID="ID_1291842943" MODIFIED="1421926801247" TEXT="Incolla"/>
</node>
<node CREATED="1421927205604" ID="ID_1420204618" MODIFIED="1421927221606" TEXT="Configurare l&apos;indirizzo email">
<node CREATED="1421927198064" ID="ID_1672943403" MODIFIED="1421927318786" TEXT="$ git config --global user.email &quot;&lt;indirizzo email dell&apos;utente&gt;&quot;"/>
</node>
</node>
</node>
</node>
<node CREATED="1421663669313" ID="ID_584465807" MODIFIED="1421926959452" POSITION="right" TEXT="Collegarsi ad un repository GitHub">
<node CREATED="1421663697878" ID="ID_1344452249" MODIFIED="1421663709042" TEXT="Fare un account GitHub">
<node CREATED="1421666130518" ID="ID_1175877836" MODIFIED="1421666162287" TEXT="es. username: allievoitt"/>
</node>
<node CREATED="1421663839781" FOLDED="true" ID="ID_1646885420" MODIFIED="1422013437786" TEXT="Clonare un repository">
<node CREATED="1421664410490" ID="ID_1133734708" MODIFIED="1421664439329" TEXT="es. in git bash">
<node CREATED="1421664440508" ID="ID_494020726" MODIFIED="1421924288121" TEXT="git clone &lt;URL del repository Internet&gt;">
<node CREATED="1421926491371" ID="ID_941337022" MODIFIED="1421926495005" TEXT="es.">
<node CREATED="1421926508923" ID="ID_1707622720" MODIFIED="1421926517866" TEXT="git clone https://github.com/gamondue/GOR5F"/>
</node>
</node>
<node CREATED="1421668812373" ID="ID_1422267741" MODIFIED="1421668895187" TEXT="spostarsi con cd nella cartella in cui vogliamo tenere le cartelle sincronizzate con git"/>
<node CREATED="1421668765136" ID="ID_1222440917" MODIFIED="1421924087390" TEXT="lo mette in una nuova cartella con il nome GOR5F all&apos;interno della cartella CORRENTE"/>
</node>
<node CREATED="1421924297436" ID="ID_1523349404" MODIFIED="1421924351529" TEXT="Se si vuole clonare in una specifica cartella, bisogna indicarlo dopo la URL del repository">
<node CREATED="1421664440508" ID="ID_1338232430" MODIFIED="1421924382419" TEXT="git clone &lt;URL del repository Internet&gt; &lt;path e file della cartella in cui finisce il clone&gt;"/>
</node>
</node>
<node CREATED="1421924391429" ID="ID_219276353" MODIFIED="1421924933730" TEXT="Il clone copia da Internet TUTTO il contenuto della cartella del repository"/>
<node CREATED="1421668978664" ID="ID_968326948" MODIFIED="1421924957485" TEXT="Se nel repository c&apos;&#xe8; molta roba, a scuola  &#xe8; meglio non scaricarla da Internet con un comando di clone (buttiamo gi&#xf9; l&apos;Internet della scuola). "/>
<node CREATED="1421924146698" ID="ID_1058836499" MODIFIED="1422015138169" TEXT="Dobbiamo copiare dalla chiavetta e sincronizzare in seguito solo le differenze. ">
<node CREATED="1421925115317" ID="ID_464096550" MODIFIED="1421925150042" TEXT="Copiare sulla propria cartella su Hagrid il contenuto del repository da usare">
<node CREATED="1421925671959" ID="ID_1930922424" MODIFIED="1421925685021" TEXT="da SHELL WINDOWS!"/>
<node CREATED="1421925169352" ID="ID_268618067" MODIFIED="1421925701436" TEXT="xcopy &lt;cartella sorgente&gt; &lt;cartella destinazione&gt; -E">
<node CREATED="1421925446589" ID="ID_606241484" MODIFIED="1421925713321" TEXT="opzione -E per fare copia ricorsiva dentro le cartelle"/>
</node>
</node>
<node CREATED="1422013457716" ID="ID_1975767693" MODIFIED="1422013480017" TEXT="Ora il repository &#xe8; pronto e funzionante in Git">
<node CREATED="1422013519031" ID="ID_4454768" MODIFIED="1422013642772" TEXT="la cartella git si &quot;porta dietro&quot; tutto, per cui e gi&#xe0; pronta"/>
</node>
<node CREATED="1422014614083" ID="ID_1725732513" MODIFIED="1422014755948" TEXT="Se si vogliono leggere le modifiche apporate nel frattempo, da altri, sul repository remoto">
<node CREATED="1422014761867" ID="ID_404590384" MODIFIED="1422014853943" TEXT="git fetch https://github.com/gamondue/GOR5F/">
<node CREATED="1422016833169" ID="ID_1910745585" MODIFIED="1422016852623">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre class="content"><em>git fetch</em>&#160;[&lt;options&gt;] [&lt;repository&gt;]</pre>
  </body>
</html>
</richcontent>
</node>
</node>
<node CREATED="1422014771195" ID="ID_1614634778" MODIFIED="1422015002871" TEXT="porta la situazione attuale del (repo) remoto sul locale ma NON modifica nulla nelle cartelle del progetto. Le modifiche che sono state prese da GitHub sono tenute pronte in locale, ma &quot;nascoste&quot;. "/>
</node>
<node CREATED="1422015010485" ID="ID_456485367" MODIFIED="1422015128177" TEXT="Se si vogliono mischiare al nostro repo locale le modifiche prese da Internet si pu&#xf2; usare merge">
<node CREATED="1422015141514" ID="ID_1678559121" MODIFIED="1422015151342" TEXT="git merge">
<node CREATED="1422015152810" ID="ID_1090455654" MODIFIED="1422015168343" TEXT="SINTASSI SPECIFICA DI QUESTO CASO DA PROVARE"/>
<node CREATED="1422016929466" ID="ID_1404625189" MODIFIED="1422017030969" TEXT="git merge  [-m &lt;msg&gt;]"/>
</node>
</node>
<node CREATED="1421925612037" ID="ID_193285669" MODIFIED="1422015207697" TEXT="Se ci si vuole riportare con un solo comando il repository locale (sul computer su cui si lavora) alla situazione attuale del repository su GitHub, si pu&#xf2; usare pull">
<node CREATED="1422014465040" ID="ID_241988794" MODIFIED="1422014507819" TEXT="pull (tira) prende le modifiche dal (repo) remoto e le applica al locale">
<node CREATED="1422014509569" ID="ID_592081310" MODIFIED="1422014523101" TEXT="fa quello che sarebbe fatto con "/>
<node CREATED="1422014523568" ID="ID_407068194" MODIFIED="1422014598307" TEXT="git fetch"/>
<node CREATED="1422014598898" ID="ID_87452213" MODIFIED="1422014604107" TEXT="git merge">
<node CREATED="1422015480548" ID="ID_1933028947" MODIFIED="1422015512274" TEXT="git merge  [-m &lt;msg&gt;]"/>
</node>
</node>
<node CREATED="1421925725430" ID="ID_548482024" MODIFIED="1421925737450" TEXT="da Git bash"/>
<node CREATED="1421926990085" ID="ID_1088595613" MODIFIED="1422013926714" TEXT="git pull https://github.com/gamondue/GOR5F/">
<node CREATED="1421926990085" ID="ID_1737714881" MODIFIED="1422014260658" TEXT="se non si &#xe8; definito precedentemente quale &#xe8; il repo remoto che si deve usare per questa cartella (repo locale)"/>
</node>
<node CREATED="1422013813054" ID="ID_365029905" MODIFIED="1422013824274" TEXT="oppure solo"/>
<node CREATED="1421926990085" ID="ID_1249926172" MODIFIED="1422013812629" TEXT="git pull">
<node CREATED="1422014269658" ID="ID_1396830500" MODIFIED="1422014298596" TEXT="se git sa gi&#xe0; dove andare per trovare il (repo) remoto"/>
</node>
</node>
</node>
<node CREATED="1422014348701" ID="ID_1312003379" MODIFIED="1422017265651" TEXT="Ora facciamo delle modifiche sulle cartelle ">
<node CREATED="1422017355845" ID="ID_1646563579" MODIFIED="1422017514118" TEXT="se vogliamo mettere le modifiche sul remoto (GitHub) dobbiamo fare tre operazioni">
<node CREATED="1422017474248" ID="ID_421372059" MODIFIED="1422017546604" TEXT="Staging (preparazione)">
<node CREATED="1422017547947" ID="ID_1021390278" MODIFIED="1422017584465" TEXT="Bisogna decidere quali file modificati vogliamo mettere nella prossima versione del nostro albero di cartelle"/>
<node CREATED="1422017664173" ID="ID_1110813780" MODIFIED="1422017727160" TEXT="Un file nello stato di &quot;staged&quot; significa che &#xe8; stato selezionato per finire nella prossima versione &quot;permanente&quot; del repository LOCALE"/>
<node CREATED="1422017585675" ID="ID_1030779372" MODIFIED="1422017612108" TEXT="Prima bisogna sapere quali sono i file modificati">
<node CREATED="1422017620525" ID="ID_975019268" MODIFIED="1422017624463" TEXT="git status"/>
<node CREATED="1422017748383" ID="ID_969383218" MODIFIED="1422017750211" TEXT="mostra">
<node CREATED="1422017625004" ID="ID_1337400184" MODIFIED="1422017775727" TEXT="in rosso i file modificati e non &quot;preparati&quot; (non staged)"/>
<node CREATED="1422017625004" ID="ID_1158648972" MODIFIED="1422017770996" TEXT="in verde i file modificati e staged"/>
</node>
</node>
<node CREATED="1422017787040" ID="ID_399692326" MODIFIED="1422017812245" TEXT="Per poter far passare un file da &quot;non staged&quot; a &quot;staged&quot;">
<node CREATED="1422017814449" ID="ID_1849866543" MODIFIED="1422017840987" TEXT="git add &lt;path relativa e nome del file&gt;"/>
<node CREATED="1422017820513" ID="ID_1455451655" MODIFIED="1422017855518" TEXT="aggiunge allo staged il file indicato"/>
<node CREATED="1422017863506" ID="ID_333747171" MODIFIED="1422017956600" TEXT="si possono usare i wildcard"/>
<node CREATED="1422017814449" ID="ID_465021993" MODIFIED="1422017968694" TEXT="git add *">
<node CREATED="1422017971333" ID="ID_811685448" MODIFIED="1422017994569" TEXT="mette in staged tutti i file modificati che gi&#xe0; non c&apos;erano"/>
</node>
<node CREATED="1422017997862" ID="ID_1434059680" MODIFIED="1422018024693" TEXT="git add *anno*">
<node CREATED="1422018026230" ID="ID_1572542839" MODIFIED="1422018049825" TEXT="mette in stage tutti i file modificati che contengono la parola anno"/>
</node>
</node>
</node>
<node CREATED="1422017501881" ID="ID_1660354049" MODIFIED="1422017509459" TEXT="&quot;Commit&quot;"/>
<node CREATED="1422017515274" ID="ID_407451980" MODIFIED="1422017528665" TEXT="&quot;Push&quot; (spingi)"/>
</node>
</node>
</node>
<node CREATED="1421926726908" ID="ID_1700669666" MODIFIED="1421927196844" POSITION="right" TEXT="Uso di Git Bash">
<node CREATED="1421926734074" ID="ID_365207755" MODIFIED="1421926752433" TEXT="Incolla il contenuto della clipboard">
<node CREATED="1421926753954" ID="ID_1090829920" MODIFIED="1421926785216" TEXT="click destro sulla barra superiore del programma "/>
<node CREATED="1421926785536" ID="ID_236794692" MODIFIED="1421926799107" TEXT="Modifica"/>
<node CREATED="1421926799386" ID="ID_411466637" MODIFIED="1421926801247" TEXT="Incolla"/>
</node>
<node CREATED="1421927205604" ID="ID_477062038" MODIFIED="1421927221606" TEXT="Configurare l&apos;indirizzo email">
<node CREATED="1421927198064" ID="ID_906706834" MODIFIED="1421927318786" TEXT="$ git config --global user.email &quot;&lt;indirizzo email dell&apos;utente&gt;&quot;"/>
</node>
</node>
<node CREATED="1414663226972" ID="ID_1700371987" MODIFIED="1421931645209" POSITION="right" TEXT="Collegarsi al progetto con client grafico">
<node CREATED="1421931649233" ID="ID_769625169" MODIFIED="1421931650953" TEXT="es.">
<node CREATED="1421931666184" ID="ID_264596441" MODIFIED="1421931672253" TEXT="Git Gui">
<node CREATED="1421931673753" ID="ID_941630721" MODIFIED="1421931690373" TEXT="incluso nell&apos;installazione di Git per Windows"/>
</node>
<node CREATED="1421931646599" ID="ID_1069465191" MODIFIED="1421931647931" TEXT="SmartGit|Hg">
<node CREATED="1421931697181" ID="ID_14624430" MODIFIED="1421931702033" TEXT="programma commerciale"/>
</node>
</node>
</node>
</node>
</map>
