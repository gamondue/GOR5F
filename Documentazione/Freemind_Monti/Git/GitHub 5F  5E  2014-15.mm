<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1414658884907" ID="ID_1953988544" MODIFIED="1423094074879" TEXT="Git e GitHub per 5F &amp; 5E  2014-15">
<node CREATED="1422528007376" ID="ID_385274705" MODIFIED="1423094076826" POSITION="right" TEXT="Git non &#xe8; una sigla">
<node CREATED="1422536306689" ID="ID_86706914" MODIFIED="1422536313515" TEXT="&quot;The stupid content tracker&quot;"/>
<node CREATED="1422528175182" ID="ID_38897748" MODIFIED="1422528744348" STYLE="fork" TEXT="E&apos; una parola di slang &quot;British&quot; che significa &quot;persona sgradevole&quot; o anche &quot;idiota&quot;."/>
<node CREATED="1422528283096" ID="ID_1382192693" MODIFIED="1422528596696" STYLE="fork" TEXT="E&apos; un progetto di Linus Torvalds, che d&#xe0; nome ai propri progetti ispirandosi a s&#xe8; stesso (vedi &quot;Linux&quot;)."/>
<node CREATED="1422528826325" ID="ID_1990672836" MODIFIED="1423094076827" TEXT="E&apos; un programma di tipo VCS (Version Control System), detti anche SCM (Source Control Management))">
<node CREATED="1422541346296" ID="ID_1270573701" MODIFIED="1422541377342" TEXT="E&apos; un DVCS: Distributed VCS."/>
<node CREATED="1422541731582" ID="ID_257794820" MODIFIED="1423094076827" TEXT="slogan">
<node CREATED="1422541735315" ID="ID_540712300" MODIFIED="1422541745126" TEXT="Git --everything-is-local"/>
</node>
</node>
</node>
<node CREATED="1422527907034" ID="ID_1077894334" MODIFIED="1423094076830" POSITION="right" TEXT="Glossario di git">
<node CREATED="1422535395444" ID="ID_300386133" MODIFIED="1422535434985" TEXT="Queste definizioni sono per riferimento, possono contenere concetti che verranno definiti in seguito"/>
<node CREATED="1422529133174" ID="ID_1403880510" MODIFIED="1423094076833" TEXT="Workspace o Working Area o Working Directory">
<node CREATED="1422529342159" ID="ID_519427407" MODIFIED="1422536249526" STYLE="fork" TEXT="In Git Gui &quot;archivio&quot; ????"/>
<node CREATED="1407278601575" ID="ID_1169769216" MODIFIED="1423094076833" TEXT="E&apos; il contenuto &quot;non nascosto&quot; della cartella locale. Contiene l&apos;attuale versione tutte le cartelle e tutti i file tenuti sotto controllo di revisione.">
<node CREATED="1407278741832" ID="ID_1279074333" MODIFIED="1414048259495" TEXT="Contiene tutti i file da editare del progetto, nella versione corrente. "/>
</node>
<node CREATED="1414048259780" ID="ID_1126411603" MODIFIED="1422535866863" TEXT="Per riportare tutti i file alla condizione in cui erano in passato bisogna fare l&apos;operazione di &quot;checkout&quot;. "/>
<node CREATED="1414048397180" ID="ID_14772367" MODIFIED="1422535864338" TEXT="Per rendere definitive le modifiche del working tree bisogna fare un &quot;commit&quot;. "/>
<node CREATED="1422541976360" ID="ID_421047048" MODIFIED="1422541984264" TEXT="Anche &quot;working directory&quot;"/>
</node>
<node CREATED="1422559166322" ID="ID_1390663216" MODIFIED="1423094076836" TEXT="&quot;Working tree&quot;">
<node CREATED="1422559171290" ID="ID_1923860125" MODIFIED="1422559244280" TEXT="L&apos;insieme corrente dei file che vengono mantenuti in controllo di revisione, cio&#xe8; quelli che, quando modificati, possono finire in un commit (se prima messi in staging). "/>
<node CREATED="1422921065520" ID="ID_1552893394" MODIFIED="1422921104993" TEXT="E&apos; insieme dei file che sono nello stato di &quot;tracked&quot;"/>
</node>
<node CREATED="1422529315928" ID="ID_56998175" MODIFIED="1423094076838" TEXT="Stage">
<node CREATED="1422529342159" ID="ID_1494571680" MODIFIED="1422529362999" TEXT="In Git Gui &quot;preparazione&quot;"/>
<node CREATED="1422539004430" ID="ID_1118655707" MODIFIED="1422539153667" TEXT="L&apos;operazione che permette di scegliere uno o pi&#xf9; file per far parte di quei file che saranno scritti permanentemente nella prossima versione salvata (con commit)"/>
<node CREATED="1422539016818" ID="ID_882154738" MODIFIED="1422539055568" TEXT="Per &quot;aggiungere&quot; un file alla staging area bisogna usare il comando add"/>
</node>
<node CREATED="1422529192649" ID="ID_975585309" MODIFIED="1423094076841" TEXT="Index">
<node CREATED="1422529342159" ID="ID_232005264" MODIFIED="1422548281085" TEXT="In Git Gui &quot;????&quot;"/>
<node CREATED="1414048695366" ID="ID_1134452123" MODIFIED="1422559281795" TEXT="E&apos; l&apos;insieme selezionato delle modifiche al working tree che &#xe8; stato preparato per il prossimo commit."/>
<node CREATED="1422539172502" ID="ID_1268750241" MODIFIED="1422539186833" TEXT="Viene anche chiamata &quot;staging area&quot;"/>
<node CREATED="1414048479284" ID="ID_126333965" MODIFIED="1423094076844" TEXT="E&apos; un insieme di files che &#xe8; stato messo nello stato di &quot;staging&quot;, e che &#xe8; prescelto per entrare nel prossimo commit. ">
<node CREATED="1414048527767" ID="ID_1814079463" MODIFIED="1422539216778" TEXT="Con Git &#xe8; possibile scegliere un insieme di modifiche che vanno dal working tree all."/>
<node CREATED="1414048618132" ID="ID_415086251" MODIFIED="1414048687548" TEXT="Se non faccio lo &quot;staging&quot; di alcuni file, le corrispondenti modifiche non vanno nella working tree e di conseguenza neppure nel repository remoto "/>
<node CREATED="1414048554833" ID="ID_406790163" MODIFIED="1414048595395" TEXT="Con altri sistemi di revisione il commit manda sul server tutte le modifiche, sneza selezionare. "/>
</node>
<node CREATED="1422540835526" ID="ID_1342054114" MODIFIED="1422540847087" TEXT="E&apos; lo stato del prossimo commit. "/>
</node>
<node CREATED="1407278770613" ID="ID_1411252280" MODIFIED="1423094076852" TEXT="Repository (.git directory)">
<node CREATED="1422529342159" ID="ID_1775680789" MODIFIED="1422548281085" TEXT="In Git Gui &quot;????&quot;"/>
<node CREATED="1416406234908" ID="ID_375313557" MODIFIED="1422535354747" TEXT="La versione attuale di tutti i file e di TUTTE le modifiche &quot;committate&quot; in passato"/>
<node CREATED="1407278652800" ID="ID_788127584" MODIFIED="1422535513130" TEXT="E&apos; ci&#xf2; che viene (?parzialmente?) replicato su tutti i computer che accedono al sistema di controllo delle revisioni"/>
<node CREATED="1422535502924" ID="ID_1836670370" MODIFIED="1422542493234" TEXT="E&apos; tutto contenuto in una cartella principale git"/>
<node CREATED="1422535552964" ID="ID_816535597" MODIFIED="1422535559495" TEXT="Repository locale"/>
<node CREATED="1422535384107" ID="ID_530801329" MODIFIED="1423094076854" TEXT="Repository remoto">
<node CREATED="1414048085906" ID="ID_1269806161" MODIFIED="1414048130333" TEXT="E&apos; il database condiviso remoto di tutte le versioni del progetto che sono state spedite (pushed) da tutti gli sviluppatori. "/>
</node>
<node CREATED="1407278784772" ID="ID_62008259" MODIFIED="1414048149995" TEXT="Per iniziare un progetto si pu&#xf2; &quot;clonare&quot; un repository remoto"/>
</node>
<node CREATED="1422529319169" ID="ID_733627035" MODIFIED="1423094076857" TEXT="Stash">
<node CREATED="1422529342159" ID="ID_695328177" MODIFIED="1422548281085" TEXT="In Git Gui &quot;????&quot;"/>
<node CREATED="1422554150944" ID="ID_1766841506" MODIFIED="1422554281183" TEXT="un salvataggio &quot;temporaneo&quot; dello stato attuale del workspace, che ne riporta lo stato a quello dell&apos;ultimo commit"/>
</node>
<node CREATED="1422529441982" ID="ID_1837729960" MODIFIED="1423094076858" TEXT="Merge">
<node CREATED="1422529342159" ID="ID_372457791" MODIFIED="1422529457500" TEXT="In Git Gui &quot;fusione&quot;"/>
</node>
<node CREATED="1422534607356" ID="ID_536174850" MODIFIED="1423094076860" TEXT="Branch">
<node CREATED="1422529342159" ID="ID_64008489" MODIFIED="1422534781797" TEXT="In Git Gui &quot;ramo&quot;"/>
<node CREATED="1422534613774" ID="ID_751702905" MODIFIED="1422534669711" TEXT="Un branch &#xe8; uno dei rami dell&apos;albero delle versioni che viene gestito da git. Ogni branch ha vita autonoma rispetto agli altri."/>
</node>
<node CREATED="1422529160684" ID="ID_132009652" MODIFIED="1423094076862" TEXT="Head">
<node CREATED="1422529342159" ID="ID_753095378" MODIFIED="1422548281085" TEXT="In Git Gui &quot;????&quot;"/>
<node CREATED="1407279100498" ID="ID_74532650" MODIFIED="1407279139100" TEXT="Un HEAD tiene traccia dell&apos;ultimo commit di una branch"/>
</node>
</node>
<node CREATED="1422921239988" ID="ID_153698760" MODIFIED="1423094076864" POSITION="right" TEXT="Stato di modifica dei file in un directory Git">
<node CREATED="1422921276915" ID="ID_258131940" MODIFIED="1423094076865" TEXT="modified (modificato)">
<node CREATED="1422921521460" ID="ID_1095208702" MODIFIED="1422922028094" TEXT="il file &#xe8; stato cambiato, ma non finir&#xe0; nella prossima memorizzazione (commit, revisione)"/>
</node>
<node CREATED="1422921301795" ID="ID_1070813497" MODIFIED="1423094076866" TEXT="staged (&quot;preparato&quot;)">
<node CREATED="1422921985170" ID="ID_461710674" MODIFIED="1422922037606" TEXT="il file &#xe8; stato scelto per finire nella prossima memorizzazione (commit, revisione)"/>
</node>
<node CREATED="1422921311863" ID="ID_160302264" MODIFIED="1423094076867" TEXT="committed (&quot;nuova revisione&quot;)">
<node CREATED="1422922396812" ID="ID_1379183816" MODIFIED="1422922460052" TEXT="appena fatto un commit, tutti i file che sono stati inclusi nel commit diventano &quot;non modificati&quot; e non si vedono pi&#xf9; fra quelli modificati"/>
</node>
</node>
<node CREATED="1422921239988" ID="ID_292051975" MODIFIED="1423094076870" POSITION="right" TEXT="Stato di memorizzazione dei file in un directory Git">
<node CREATED="1422922525104" ID="ID_941460670" MODIFIED="1423094076871" TEXT="untracked">
<node CREATED="1422922966037" ID="ID_348720349" MODIFIED="1422922973991" TEXT="un file di cui non si tiene traccia"/>
<node CREATED="1422922845420" ID="ID_681557769" MODIFIED="1422922896925" TEXT="un file che non era nell&apos;ultimo commit e non &#xe8; stato messo nell&apos;area di staging"/>
<node CREATED="1422922897412" ID="ID_252403814" MODIFIED="1423094076872" TEXT="es.">
<node CREATED="1422922900830" ID="ID_367838914" MODIFIED="1422922908534" TEXT="un file appena creato"/>
<node CREATED="1422922909057" ID="ID_1216213847" MODIFIED="1422922964382" TEXT="un file che &#xe8; stato cancellato e tolto dall&apos;elenco dei file di cui si tiene traccia"/>
</node>
</node>
<node CREATED="1422922521943" ID="ID_633575389" MODIFIED="1423094076873" TEXT="tracked">
<node CREATED="1422922597409" ID="ID_1187629679" MODIFIED="1422922612035" TEXT="file che erano nell&apos;ultimo commit"/>
<node CREATED="1422922613725" ID="ID_324734755" MODIFIED="1423094076874" TEXT="possono essere (o divenire)">
<node CREATED="1422922725168" ID="ID_1363338024" MODIFIED="1423094076875" TEXT="&quot;modified&quot;">
<node CREATED="1422922733278" ID="ID_462254919" MODIFIED="1422922751139" TEXT="se faccio delle modifiche rispetto all&apos;ultimo commit"/>
</node>
<node CREATED="1422922762935" ID="ID_1235258310" MODIFIED="1423094076878" TEXT="&quot;staged&quot;">
<node CREATED="1422922769744" ID="ID_1511542637" MODIFIED="1422922785152" TEXT="se preparo quel file per il successivo commit"/>
<node CREATED="1422923447598" ID="ID_91867594" MODIFIED="1422923535809" TEXT="se dopo aver &quot;aggiunto&quot; un file all&apos;area si stage lo modifico ancora, quello che &quot;va su&quot; con il commit &#xe8; la versione &quot;aggiunta&quot; NON la corrente, che contiene gli ultimi cambiamenti. "/>
</node>
<node CREATED="1422922627834" ID="ID_45292156" MODIFIED="1423094076880" TEXT="&quot;un-modified&quot;">
<node CREATED="1422922643803" ID="ID_1992068840" MODIFIED="1423094076882" TEXT="se faccio in modo che le modifiche fatte vengano eliminate e che si torni allo stato che il file aveva al momento dell&apos;ultimo commit">
<node CREATED="1422923314003" ID="ID_1276272789" MODIFIED="1422923329816" TEXT="comando git checkout"/>
</node>
</node>
</node>
</node>
<node CREATED="1422923098413" ID="ID_1475485164" MODIFIED="1422923120634" TEXT="questo stato pu&#xf2; essere visto con il comando git status"/>
<node CREATED="1422923211842" ID="ID_320480741" MODIFIED="1423094076884" TEXT="per mettere un file in commit bisogna esplicitamente cambiarne lo stato, mettendolo prima in &quot;staging&quot;">
<node CREATED="1422923248217" ID="ID_584222762" MODIFIED="1422923256551" TEXT="comando git add"/>
</node>
</node>
<node CREATED="1422533983218" ID="ID_1565648433" MODIFIED="1423094076889" POSITION="right" TEXT="GitHub">
<node CREATED="1414658947752" ID="ID_617665734" LINK="https:/github.com" MODIFIED="1414702933258" TEXT="https://github.com/"/>
<node CREATED="1414658997976" ID="ID_1433955064" MODIFIED="1423094076890" TEXT="Account prof. Monti">
<node CREATED="1414659015048" ID="ID_299445114" MODIFIED="1414659017023" TEXT="gamondue"/>
</node>
<node CREATED="1414659049396" ID="ID_669116960" MODIFIED="1414659616686" TEXT="Fare la normale registrazione"/>
<node CREATED="1414659183471" ID="ID_1362025721" MODIFIED="1423094076891" TEXT="Il repository si pu&#xf2; usare gratis solo con progetti pubblici, visibili a tutto il mondo, di solito con licenza open source">
<node CREATED="1414659219996" ID="ID_6545769" MODIFIED="1414659484790" TEXT=" Per i repository privati si paga"/>
</node>
<node CREATED="1414659257424" ID="ID_1102052196" MODIFIED="1423094076894" TEXT="Creare un progetto">
<node CREATED="1422533504955" ID="ID_13578988" MODIFIED="1423094076895" TEXT="Creare un progetto vuoto con Git">
<node CREATED="1422533701498" ID="ID_1521530517" MODIFIED="1422533712249" TEXT="Da Git bash"/>
<node CREATED="1416405346277" ID="ID_1701225401" MODIFIED="1423094076898" TEXT="$ git  init">
<node CREATED="1416406069257" ID="ID_742256077" MODIFIED="1423094076899" TEXT="crea una nuova repository nella cartella in cui mi trovo">
<node CREATED="1417125952860" ID="ID_1300013941" MODIFIED="1417125994524" TEXT="&#xe8; il &quot;bidone&quot; che si tiene sincronizzato e che contiene tutto, variazioni comprese"/>
</node>
<node CREATED="1416406126573" ID="ID_748580874" MODIFIED="1417125895745" TEXT="crea una cartella .git nascosta che serve per la memorizzazione di tutte le differenze di tutte le versioni che vengono &quot;committate&quot;"/>
<node CREATED="1422553294365" ID="ID_1183779817" MODIFIED="1422553453213" TEXT="In Unix tutte le cartelle che iniziano con . non vengono mostrate da ls (dir)"/>
<node CREATED="1422553369366" ID="ID_952356570" MODIFIED="1422553429182" TEXT="In Windows il programma git nasconde la cartella .git (si pu&#xf2; vedere facendo visualizzare i file nascosti)"/>
<node CREATED="1422553338545" ID="ID_827153078" MODIFIED="1422553364158" TEXT="Cos&#xec; non si pu&#xf2; cancellare per sbaglio la cartella .git"/>
</node>
<node CREATED="1422534047669" ID="ID_190622606" MODIFIED="1422534078703" TEXT="Una volta fatto in una nostra cartella locale, lo si pu&#xf2; &quot;clonare&quot; su GitHub"/>
</node>
<node CREATED="1422533504955" ID="ID_108802415" MODIFIED="1423094076902" TEXT="Creare un progetto vuoto con GitHub">
<node CREATED="1414659618754" ID="ID_1389611907" MODIFIED="1423094076903" TEXT="Da Web">
<node CREATED="1414658947752" ID="ID_831832299" MODIFIED="1414658948718" TEXT="https://github.com/"/>
</node>
<node CREATED="1414659624349" ID="ID_1219905665" MODIFIED="1423094076903" TEXT="Accedere">
<node CREATED="1414659646378" ID="ID_76420838" MODIFIED="1414659673777" TEXT="con l&apos;account fatto prima"/>
</node>
<node CREATED="1414659264459" ID="ID_577764149" MODIFIED="1414659501888" TEXT="Click su immagine grossa &quot;create repositories&quot;"/>
<node CREATED="1414659393694" ID="ID_1474407782" MODIFIED="1414659408030" TEXT="+ in una pagina, in alto a destra"/>
<node CREATED="1414659539088" ID="ID_1494543244" MODIFIED="1423094076904" TEXT="Inizializzare il repository scrivendo un file README (un mini Project Charter!)">
<node CREATED="1414659785046" ID="ID_1224975638" MODIFIED="1421928044399" TEXT="Questo file viene mostrato come prima cosa su Web, nella prima pagina del progetto. "/>
</node>
<node CREATED="1414659684492" ID="ID_1798195695" MODIFIED="1423094076904" TEXT="Progetto creato, si pu&#xf2; comiciare ad usarlo da Git">
<node CREATED="1422533653382" ID="ID_748670626" MODIFIED="1422533660258" TEXT="la sua URL &#xe8;:"/>
<node CREATED="1422533610436" ID="ID_1902355998" MODIFIED="1422533646115" TEXT="https://github.com/&lt;Nome dell&apos;utente GitHub&gt;/&lt;Nome del progetto in GitHub&gt;"/>
</node>
<node CREATED="1414659337371" ID="ID_317224811" MODIFIED="1414659354764" TEXT="Gi&#xe0; fatto da Monti per i &quot;gardens&quot;"/>
<node CREATED="1414662224848" ID="ID_1929158787" MODIFIED="1423094076906" TEXT="Il progetto &#xe8; accessibile via web da">
<node CREATED="1414688471677" ID="ID_83706815" LINK="https:/github.com/gamondue/GOR5X" MODIFIED="1423094076907" TEXT="https://github.com/gamondue/GOR5X">
<node CREATED="1422533541780" ID="ID_718860021" MODIFIED="1423094076908" TEXT="X =">
<node CREATED="1422533548040" ID="ID_324404106" MODIFIED="1422533549212" TEXT="F"/>
<node CREATED="1422533549708" ID="ID_561886086" MODIFIED="1422533550551" TEXT="E"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1421928111596" ID="ID_159245322" MODIFIED="1423094076909" POSITION="right" TEXT="Usare GitHub da scuola">
<node CREATED="1421928131560" ID="ID_1467624621" MODIFIED="1421928157032" TEXT="E&apos; necessario &quot;uscire&quot; dalla rete della scuola e raggiungere GitHub"/>
<node CREATED="1422526712865" ID="ID_1902241259" MODIFIED="1423094076911" TEXT="Il software git &#xe8; gi&#xe0; installato">
<node CREATED="1422526729985" ID="ID_1593815431" MODIFIED="1423094076911" TEXT="Git bash">
<node CREATED="1422526738215" ID="ID_956514674" MODIFIED="1422526747122" TEXT="interfaccia a carattere"/>
<node CREATED="1422526747514" ID="ID_1374356014" MODIFIED="1422526780719" TEXT="&#xe8; come avere una shell bash, un po&apos; limitata, su Windows. "/>
</node>
<node CREATED="1422526789465" ID="ID_1934399290" MODIFIED="1423094076912" TEXT="Git GUI">
<node CREATED="1422526795403" ID="ID_1682400579" MODIFIED="1422526828688" TEXT="un software per usare Git con interfaccia grafica"/>
<node CREATED="1422526829052" ID="ID_1043041717" MODIFIED="1422526839240" TEXT="non &#xe8; un granch&#xe8;, ma funziona"/>
</node>
</node>
<node CREATED="1421928157338" ID="ID_1405628946" MODIFIED="1421928177769" TEXT="Il modo consigliato &#xe8; usare SSH, ma &#xe8; bloccato dal firewall"/>
<node CREATED="1421928179541" ID="ID_1446200548" MODIFIED="1423094076914" TEXT="Utilizziamo http (insicuro) o https">
<node CREATED="1421928226385" ID="ID_769389078" MODIFIED="1421928259085" TEXT="A scuola http e https non possono uscire liberamente, devono passare attraverso il proxy di hagrid"/>
<node CREATED="1421662477454" ID="ID_471239406" MODIFIED="1423094076915" TEXT="Configurare git per usare hagrid come proxy e uscire su internet per raggiungere github">
<node CREATED="1421662671809" ID="ID_1980082213" MODIFIED="1421662855642" TEXT="Aprire la shell di git (git bash)"/>
<node CREATED="1421662857102" ID="ID_1792912735" MODIFIED="1421662962878" TEXT="Configurare per usare il proxi hagrid, sia in http che https"/>
<node CREATED="1422013222530" ID="ID_1348470912" MODIFIED="1422013241687" TEXT="1 - provare senza configurare il proxy http"/>
<node CREATED="1422013243055" ID="ID_643659637" MODIFIED="1423094076919" TEXT="2 - se non va, provare con la seguente configurazione">
<node CREATED="1421926826199" ID="ID_1024028376" MODIFIED="1423094076921" TEXT="git config --global http.proxy http://&lt;utente ActiveDirectory in Hagrid &gt;:&lt;password che si usa in laboratorio per entrare sui computer&gt;@hagrid:8080 ">
<node CREATED="1422000372982" ID="ID_829291878" MODIFIED="1422000380190" TEXT="farlo anche per https"/>
<node CREATED="1421926947131" ID="ID_479874018" MODIFIED="1423094076923" TEXT="es.">
<node CREATED="1421662886193" ID="ID_1673159573" MODIFIED="1421663041471" TEXT="git config --global http.proxy http://gabriele.monti:PasswordDiMontiInChiaro@hagrid:8080"/>
<node CREATED="1421662886193" ID="ID_1293508131" MODIFIED="1423094076924" TEXT="git config --global https.proxy https://gabriele.monti:PasswordDiMontiInChiaro@hagrid:8080">
<node CREATED="1421663055038" ID="ID_1058035785" MODIFIED="1422000419271" TEXT="uguale a prima, solo che https sostituisce http (in DUE punti)"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1421663669313" ID="ID_50118487" MODIFIED="1423094076928" TEXT="Collegarsi ad un repository GitHub">
<node CREATED="1421663697878" ID="ID_1804814716" MODIFIED="1423094076928" TEXT="Fare un account GitHub">
<node CREATED="1421666130518" ID="ID_1667157794" MODIFIED="1421666162287" TEXT="es. username: allievoitt"/>
</node>
<node CREATED="1421663839781" ID="ID_1743234747" MODIFIED="1423094076930" TEXT="Clonare un repository">
<node CREATED="1421664410490" ID="ID_1325088705" MODIFIED="1423094076931" TEXT="es. in git bash">
<node CREATED="1421664440508" ID="ID_254815426" MODIFIED="1423094076932" TEXT="git clone &lt;URL del repository Internet&gt;">
<node CREATED="1421926491371" ID="ID_22271993" MODIFIED="1423094076932" TEXT="es.">
<node CREATED="1421926508923" ID="ID_1479424917" MODIFIED="1421926517866" TEXT="git clone https://github.com/gamondue/GOR5F"/>
</node>
</node>
<node CREATED="1421668812373" ID="ID_1866975437" MODIFIED="1421668895187" TEXT="spostarsi con cd nella cartella in cui vogliamo tenere le cartelle sincronizzate con git"/>
<node CREATED="1421668765136" ID="ID_613626347" MODIFIED="1421924087390" TEXT="lo mette in una nuova cartella con il nome GOR5F all&apos;interno della cartella CORRENTE"/>
</node>
<node CREATED="1421924297436" ID="ID_1574764291" MODIFIED="1423094076933" TEXT="Se si vuole clonare in una specifica cartella, bisogna indicarlo dopo la URL del repository">
<node CREATED="1421664440508" ID="ID_499310830" MODIFIED="1421924382419" TEXT="git clone &lt;URL del repository Internet&gt; &lt;path e file della cartella in cui finisce il clone&gt;"/>
</node>
</node>
<node CREATED="1421924391429" ID="ID_1227034263" MODIFIED="1421924933730" TEXT="Il clone copia da Internet TUTTO il contenuto della cartella del repository"/>
<node CREATED="1421668978664" ID="ID_1053245804" MODIFIED="1421924957485" TEXT="Se nel repository c&apos;&#xe8; molta roba, a scuola  &#xe8; meglio non scaricarla da Internet con un comando di clone (buttiamo gi&#xf9; l&apos;Internet della scuola). "/>
<node CREATED="1421924146698" ID="ID_395327245" MODIFIED="1423094076934" TEXT="Dobbiamo copiare dalla chiavetta e sincronizzare in seguito solo le differenze. ">
<node CREATED="1421925115317" ID="ID_1154999860" MODIFIED="1423094076936" TEXT="Copiare sulla propria cartella su Hagrid il contenuto del repository da usare">
<node CREATED="1421925671959" ID="ID_107924348" MODIFIED="1421925685021" TEXT="da SHELL WINDOWS!"/>
<node CREATED="1421925169352" ID="ID_439608485" MODIFIED="1423094076936" TEXT="xcopy &lt;cartella sorgente&gt; &lt;cartella destinazione&gt; -E">
<node CREATED="1421925446589" ID="ID_416092296" MODIFIED="1421925713321" TEXT="opzione -E per fare copia ricorsiva dentro le cartelle"/>
</node>
</node>
<node CREATED="1421925612037" ID="ID_31930675" MODIFIED="1423094076937" TEXT="Sincronizzare il git remoto (su GitHub) al git locale (sul computer su cui si lavora)">
<node CREATED="1421925725430" ID="ID_283262848" MODIFIED="1421925737450" TEXT="da Git bash"/>
<node CREATED="1421926990085" ID="ID_908772270" MODIFIED="1421926990085" TEXT=""/>
</node>
</node>
</node>
<node CREATED="1421926726908" ID="ID_417979093" MODIFIED="1423094076938" TEXT="Uso di Git Bash">
<node CREATED="1421926734074" ID="ID_1074658518" MODIFIED="1423094076939" TEXT="Incolla il contenuto della clipboard">
<node CREATED="1421926753954" ID="ID_129399850" MODIFIED="1421926785216" TEXT="click destro sulla barra superiore del programma "/>
<node CREATED="1421926785536" ID="ID_74285735" MODIFIED="1421926799107" TEXT="Modifica"/>
<node CREATED="1421926799386" ID="ID_1291842943" MODIFIED="1421926801247" TEXT="Incolla"/>
</node>
<node CREATED="1421927205604" ID="ID_1420204618" MODIFIED="1423094076939" TEXT="Configurare l&apos;indirizzo email">
<node CREATED="1421927198064" ID="ID_1672943403" MODIFIED="1421927318786" TEXT="$ git config --global user.email &quot;&lt;indirizzo email dell&apos;utente&gt;&quot;"/>
</node>
</node>
</node>
</node>
<node CREATED="1421663669313" ID="ID_584465807" MODIFIED="1423094076940" POSITION="right" TEXT="Collegarsi ad un repository GitHub">
<node CREATED="1421663697878" ID="ID_1344452249" MODIFIED="1423094076940" TEXT="Fare un account GitHub">
<node CREATED="1421666130518" ID="ID_1175877836" MODIFIED="1421666162287" TEXT="es. username: allievoitt"/>
</node>
<node CREATED="1421663839781" ID="ID_1646885420" MODIFIED="1423094076941" TEXT="Clonare un repository">
<node CREATED="1421664410490" ID="ID_1133734708" MODIFIED="1423094076944" TEXT="es. in git bash">
<node CREATED="1421668812373" ID="ID_1422267741" MODIFIED="1422550737721" TEXT="Spostarsi con cd nella cartella in cui vogliamo tenere le cartelle sincronizzate con git"/>
<node CREATED="1421664440508" ID="ID_494020726" MODIFIED="1423094076945" TEXT="git clone &lt;URL del repository Internet&gt;">
<node CREATED="1421926491371" ID="ID_941337022" MODIFIED="1423094076946" TEXT="es.">
<node CREATED="1421926508923" ID="ID_1707622720" MODIFIED="1421926517866" TEXT="git clone https://github.com/gamondue/GOR5F"/>
</node>
</node>
<node CREATED="1421668765136" ID="ID_1222440917" MODIFIED="1422550756784" TEXT="Mette tutto il repositpry in una nuova cartella con il nome GOR5F all&apos;interno della cartella CORRENTE (dove ci eravamo spostati)"/>
</node>
<node CREATED="1421924297436" ID="ID_1523349404" MODIFIED="1423094076946" TEXT="Se si vuole clonare in una specifica cartella, bisogna indicarlo dopo la URL del repository">
<node CREATED="1421664440508" ID="ID_1338232430" MODIFIED="1421924382419" TEXT="git clone &lt;URL del repository Internet&gt; &lt;path e file della cartella in cui finisce il clone&gt;"/>
</node>
</node>
</node>
<node CREATED="1422526553544" ID="ID_517078947" MODIFIED="1423094076949" POSITION="right" TEXT="Particolarit&#xe0; per l&apos;uso a scuola">
<node CREATED="1421924391429" ID="ID_219276353" MODIFIED="1421924933730" TEXT="Il clone copia da Internet TUTTO il contenuto della cartella del repository"/>
<node CREATED="1421668978664" ID="ID_968326948" MODIFIED="1421924957485" TEXT="Se nel repository c&apos;&#xe8; molta roba, a scuola  &#xe8; meglio non scaricarla da Internet con un comando di clone (buttiamo gi&#xf9; l&apos;Internet della scuola). "/>
<node CREATED="1421924146698" ID="ID_1058836499" MODIFIED="1422526612046" TEXT="A scuola dobbiamo copiare dalla chiavetta e sincronizzare in seguito solo le differenze, con git. "/>
<node CREATED="1422525450241" ID="ID_1049361524" MODIFIED="1423094076953" TEXT="Per fare la chiavetta">
<node CREATED="1422525949311" ID="ID_668104402" MODIFIED="1422525955609" TEXT="A CASA, non a scuola"/>
<node CREATED="1422526951750" ID="ID_845014834" MODIFIED="1422526987191" TEXT="Installare Git e fare un clone con git clone, come spiegato prima"/>
<node CREATED="1422526987762" ID="ID_618246460" MODIFIED="1422526991762" TEXT="OPPURE"/>
<node CREATED="1422525463494" ID="ID_1222705669" MODIFIED="1423094076954" TEXT="Andare nel sito Web del progetto">
<node CREATED="1422525513351" ID="ID_58570636" MODIFIED="1422525514273" TEXT="https://github.com/gamondue/GOR5F"/>
</node>
<node CREATED="1422525518904" ID="ID_71674420" MODIFIED="1423094076958" TEXT="Ottenere i file con il bottone CLONE IN DESKTOP, o con ZIP">
<node CREATED="1422525162951" ID="ID_1319333051" MODIFIED="1422554077055" TEXT="lo ZIP fatto dal Web di GitHub NON copia la cartella .git, per cui in seguito la cartella NON &#xe8; vista come repository git"/>
<node CREATED="1422525981699" ID="ID_853121730" MODIFIED="1422554087006" TEXT="dunque meglio NON fare lo zip"/>
<node CREATED="1422525242710" ID="ID_1983294760" MODIFIED="1422554100689" TEXT="il CLONE fatto dal Web GitHub copia la cartella .git ed &#xe8; visto come repository git"/>
<node CREATED="1422525851624" ID="ID_117827614" MODIFIED="1422527120013" TEXT="Il bottone CLONE IN DESKTOP &#xe8; equivalente a Git clone, come destinazione usa autometicamente il desktop, per cui non &#xe8; da fare a scuola! "/>
<node CREATED="1422525928860" ID="ID_165417710" MODIFIED="1422525934580" TEXT="Si pu&#xf2; fare a casa"/>
</node>
<node CREATED="1422013519031" ID="ID_4454768" MODIFIED="1422527149597" TEXT="La cartella clonata, che contiene anche la cartella .git, si &quot;porta dietro&quot; tutto, per cui e gi&#xe0; pronta per essere usata in locale"/>
<node CREATED="1422013457716" ID="ID_1975767693" MODIFIED="1422525653039" TEXT="Ora il repository sul desktop &#xe8; pronto e funzionante in Git"/>
<node CREATED="1422526184301" ID="ID_1218966433" MODIFIED="1422526209038" TEXT="Comprimere la cartella sul desktop"/>
<node CREATED="1422526212498" ID="ID_1115856860" MODIFIED="1422526224030" TEXT="Copiare il compresso su chiavetta"/>
</node>
<node CREATED="1422526071049" ID="ID_316758828" MODIFIED="1422526119506" TEXT="Portare la chiavetta a scuola e decomprimerla nella cartella locale o nella propria cartella documenti"/>
<node CREATED="1422526238329" ID="ID_346462770" MODIFIED="1422526258440" TEXT="Il risultato della decompressione &#xe8; utilizzabile a scuola"/>
</node>
<node CREATED="1421926726908" ID="ID_1700669666" MODIFIED="1423094076968" POSITION="right" TEXT="Uso di Git Bash">
<node CREATED="1421926734074" ID="ID_365207755" MODIFIED="1423094076969" TEXT="Incolla il contenuto della clipboard">
<node CREATED="1421926753954" ID="ID_1090829920" MODIFIED="1421926785216" TEXT="click destro sulla barra superiore del programma "/>
<node CREATED="1421926785536" ID="ID_236794692" MODIFIED="1421926799107" TEXT="Modifica"/>
<node CREATED="1421926799386" ID="ID_411466637" MODIFIED="1421926801247" TEXT="Incolla"/>
</node>
<node CREATED="1422533214457" ID="ID_439062059" MODIFIED="1423094076970" TEXT="Copia nella clipboard qualcosa che &#xe8; in Git bash">
<node CREATED="1421926753954" ID="ID_1116203091" MODIFIED="1421926785216" TEXT="click destro sulla barra superiore del programma "/>
<node CREATED="1421926785536" ID="ID_740045805" MODIFIED="1421926799107" TEXT="Modifica"/>
<node CREATED="1421926799386" ID="ID_511741468" MODIFIED="1422533251045" TEXT="Seleziona"/>
<node CREATED="1422533290416" ID="ID_178745269" MODIFIED="1423094076971" TEXT="Selezionare un&apos;area di caratteri: click and drag con il mouse">
<node CREATED="1422533322361" ID="ID_426390206" MODIFIED="1422533332799" TEXT="la zona selezionata diventa bianca"/>
</node>
<node CREATED="1422533335183" ID="ID_1898669862" MODIFIED="1423094076971" TEXT="Click destro con il mouse">
<node CREATED="1422533344576" ID="ID_1880620658" MODIFIED="1422533364188" TEXT="la zona bianca viene copiata nella clipboard"/>
</node>
</node>
<node CREATED="1422533384536" ID="ID_837304496" MODIFIED="1422533387286" TEXT="comandi"/>
<node CREATED="1416405346277" ID="ID_1906145169" MODIFIED="1423094076972" TEXT="$ git help &lt;command&gt;">
<node CREATED="1417125041840" ID="ID_1786334970" MODIFIED="1417125047827" TEXT="per avere aiuto"/>
<node CREATED="1417125048443" ID="ID_150871705" MODIFIED="1417125143827" TEXT="(in Windows fa partire un help HTML da file)"/>
</node>
<node CREATED="1422621268358" ID="ID_1735731193" MODIFIED="1423094076974" TEXT="Identificarsi come utente">
<node CREATED="1422621276055" ID="ID_1105809874" MODIFIED="1423094076975" TEXT="per configurare l&apos;utente">
<node CREATED="1422621301463" ID="ID_879990608" MODIFIED="1422621435755" TEXT="git config --global user.name &quot;&lt;username che si vuole vedere nei log&gt;&quot;"/>
<node CREATED="1422622241355" ID="ID_375833293" MODIFIED="1422622260309" TEXT="senza parametro per vedere come &#xe8; configurto attualmente"/>
</node>
<node CREATED="1422621325112" ID="ID_389906844" MODIFIED="1423094076975" TEXT="per configurare la email">
<node CREATED="1422621337849" ID="ID_554053470" MODIFIED="1422621396933" TEXT=" git config --global user.email &lt;username email address&gt;@&lt;dominio provider email&gt;"/>
<node CREATED="1422622241355" ID="ID_910702786" MODIFIED="1422622260309" TEXT="senza parametro per vedere come &#xe8; configurto attualmente"/>
</node>
<node CREATED="1422921422786" ID="ID_1574323637" MODIFIED="1423094076976" TEXT="N.B. se il repository &#xe8; stato ottenuto come .zip della cartella Git di qualcun altro, il nome configurato sar&#xe0; quello dell&apos;altro!">
<node CREATED="1422921480014" ID="ID_1672217571" MODIFIED="1422921485217" TEXT="Cambiarlo!"/>
</node>
</node>
<node CREATED="1416407250663" ID="ID_1074380447" MODIFIED="1423094076978" TEXT="$ git status">
<node CREATED="1416407268971" ID="ID_1404696412" MODIFIED="1422534245123" TEXT="Permette di vedere come stanno le cose"/>
<node CREATED="1416407292351" ID="ID_740467882" MODIFIED="1423094076979" TEXT="Mostra le variazioni nella versione corrente rispetto a quella che abbiamo &quot;committato&quot; l&apos;ultima volta">
<node CREATED="1422534318172" ID="ID_1614865575" MODIFIED="1422534332353" TEXT="I file che sono cambiati "/>
<node CREATED="1422534347473" ID="ID_715689420" MODIFIED="1422534348707" TEXT="Cosa &#xe8; stato cancellato"/>
</node>
<node CREATED="1422545152026" ID="ID_345498098" MODIFIED="1423094076980" TEXT="Lo stato dei file pu&#xf2; essere uno dei seguenti">
<node CREATED="1422544184426" ID="ID_1546492813" MODIFIED="1423094076981" TEXT="Untracked">
<node CREATED="1422544189012" ID="ID_1934881535" MODIFIED="1422544276044" TEXT="stato di un file che non &#xe8; stato ancora &quot;trattato&quot; da git. Pu&#xf2; essere un file nuovo oppure un file che &#xe8; stato rimosso &quot;da git&quot; (dall&apos;&quot;index di git&quot;)"/>
</node>
<node CREATED="1422544320969" ID="ID_839063326" MODIFIED="1423094076983" TEXT="Not staged">
<node CREATED="1422544344869" ID="ID_114384967" MODIFIED="1422544447777" TEXT="File che &#xe8; stato trattato da git in passato (incluso in un commit), e nel workspace corrente ha modifiche rispetto all&apos;ultimo commit, ma NON &#xe8; stato selezionato per il prossimo commit (non &#xe8; nella Staging area). "/>
</node>
<node CREATED="1422544449598" ID="ID_1665555482" MODIFIED="1423094076984" TEXT="Staged">
<node CREATED="1422544456056" ID="ID_1813144592" MODIFIED="1422544502613" TEXT="File che ha modifiche che aggiorneranno il repository al prossimo commit. "/>
</node>
</node>
</node>
<node CREATED="1422525686715" ID="ID_181325251" MODIFIED="1423094076987" TEXT="$ git fetch">
<node CREATED="1422014614083" ID="ID_1725732513" MODIFIED="1422525671667" TEXT="Se si vogliono leggere le modifiche apportate nel frattempo, da altri, sul repository remoto"/>
<node CREATED="1422014761867" ID="ID_404590384" MODIFIED="1423094076989" TEXT="$ git fetch https://github.com/gamondue/GOR5F/">
<node CREATED="1422016833169" ID="ID_1910745585" MODIFIED="1422016852623">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    <pre class="content"><em>git fetch</em>&#160;[&lt;options&gt;] [&lt;repository&gt;]</pre>
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1422014771195" ID="ID_1614634778" MODIFIED="1422526298694" TEXT="porta la situazione attuale del (repo) remoto sul locale ma NON modifica nulla nelle cartelle del progetto. &#xa;Le modifiche che sono state prese da GitHub sono tenute pronte in locale, ma &quot;nascoste&quot;. "/>
<node CREATED="1422603777221" ID="ID_729932200" MODIFIED="1422603784379" TEXT="fetch = andare a prendere"/>
</node>
<node CREATED="1422015141514" ID="ID_1678559121" MODIFIED="1423094076995" TEXT="$ git merge">
<node CREATED="1422015010485" ID="ID_456485367" MODIFIED="1422015128177" TEXT="Se si vogliono mischiare al nostro repo locale le modifiche prese da Internet si pu&#xf2; usare merge"/>
<node CREATED="1422527273594" ID="ID_1148044129" MODIFIED="1422527354677" TEXT="git merge mette sull&apos;altro repository tutte le modifiche fatte localmente, e porta nel nostro tutte le modifiche che trova nell&apos;altro."/>
<node CREATED="1422527358064" ID="ID_754368896" MODIFIED="1422527387341" TEXT="Le modifiche &quot;lontane&quot; verranno applicate automaticamente e senza problemi. "/>
<node CREATED="1422527387902" ID="ID_1327564519" MODIFIED="1422527461175" TEXT="Modifiche &quot;vicine&quot; potranno creare conflitti. In tal caso il merge si BLOCCHERA&apos;, non verr&#xe0; applicato ed indicher&#xe0; quali sono i file in conflitto"/>
<node CREATED="1422527467083" ID="ID_1798184604" MODIFIED="1422527495696" TEXT="Bisogner&#xe0; risolvere i conflitti (a mano!) e riprovare il merge"/>
<node CREATED="1422015152810" ID="ID_1090455654" MODIFIED="1422015168343" TEXT="SINTASSI SPECIFICA DI QUESTO CASO DA PROVARE"/>
<node CREATED="1422016929466" ID="ID_1404625189" MODIFIED="1422553617244" TEXT="$ git merge  [-m &lt;msg&gt;]"/>
</node>
<node CREATED="1421926990085" ID="ID_80514614" MODIFIED="1423094077000" TEXT="$ git pull">
<node CREATED="1421925612037" ID="ID_193285669" MODIFIED="1423094077003" TEXT="Se si vuole riportare, con un solo comando, il repository locale (sul computer su cui si lavora) alla situazione attuale del repository su GitHub, si pu&#xf2; usare pull. ">
<node CREATED="1422014465040" ID="ID_241988794" MODIFIED="1423094077006" TEXT="pull (tira) prende le modifiche dal (repo) remoto e le applica al locale">
<node CREATED="1422014509569" ID="ID_592081310" MODIFIED="1422014523101" TEXT="fa quello che sarebbe fatto con "/>
<node CREATED="1422014523568" ID="ID_407068194" MODIFIED="1422014598307" TEXT="git fetch"/>
<node CREATED="1422014598898" ID="ID_87452213" MODIFIED="1423094077007" TEXT="git merge">
<node CREATED="1422015480548" ID="ID_1933028947" MODIFIED="1422015512274" TEXT="git merge  [-m &lt;msg&gt;]"/>
</node>
</node>
<node CREATED="1421925725430" ID="ID_548482024" MODIFIED="1421925737450" TEXT="da Git bash"/>
<node CREATED="1421926990085" ID="ID_1088595613" MODIFIED="1423094077009" TEXT="$ git pull https://github.com/gamondue/GOR5F/">
<node CREATED="1421926990085" ID="ID_1737714881" MODIFIED="1422014260658" TEXT="se non si &#xe8; definito precedentemente quale &#xe8; il repo remoto che si deve usare per questa cartella (repo locale)"/>
</node>
<node CREATED="1422013813054" ID="ID_365029905" MODIFIED="1422013824274" TEXT="oppure solo"/>
<node CREATED="1421926990085" ID="ID_1249926172" MODIFIED="1423094077010" TEXT="$ git pull">
<node CREATED="1422014269658" ID="ID_1396830500" MODIFIED="1422014298596" TEXT="se git sa gi&#xe0; dove andare per trovare il (repo) remoto"/>
</node>
</node>
<node CREATED="1422551296742" ID="ID_1905483113" MODIFIED="1423094077011" TEXT="$ git pull &lt;URL del repository remoto&gt;">
<node CREATED="1422551314933" ID="ID_1121580015" MODIFIED="1422551353347" TEXT="prende le modifiche che sono sate fatte nel rep remoto indicato"/>
</node>
<node CREATED="1422527511571" ID="ID_1648156215" MODIFIED="1423094077012" TEXT="$ git pull fa:">
<node CREATED="1422604964283" ID="ID_1388041398" MODIFIED="1422604979969" TEXT="fetch + merge = pull"/>
<node CREATED="1422527520613" ID="ID_201307521" MODIFIED="1422527530536" TEXT="git fetch"/>
<node CREATED="1422527531259" ID="ID_1732807351" MODIFIED="1422527534478" TEXT="git merge"/>
<node CREATED="1422527571338" ID="ID_1996812302" MODIFIED="1422527837422" TEXT="sul lato locale la situazione viene ad essere quella del remoto"/>
<node CREATED="1422527838322" ID="ID_148715532" MODIFIED="1422527881685" TEXT="se ci sono delle modifiche fatte in locale che non sono state messe nel remoto la cosa NON funziona"/>
</node>
<node CREATED="1422551501657" ID="ID_1460180269" MODIFIED="1423094077013" TEXT="$ git pull">
<node CREATED="1422551124213" ID="ID_468698679" MODIFIED="1422551516773" TEXT="Senza parametri usa i &quot;remote&quot; che sono stati definiti nel repository (vedi oltre per come fare)"/>
<node CREATED="1422551658916" ID="ID_1696586743" MODIFIED="1422551779384" TEXT="Per GOR, il remote giusto &#xe8; GIA&apos; definito dentro il repository che si copia nel file zip"/>
</node>
</node>
<node CREATED="1422014348701" ID="ID_1312003379" MODIFIED="1423094077016" TEXT="Ora facciamo delle modifiche sui file delle cartelle locali">
<node CREATED="1422533896483" ID="ID_967563891" MODIFIED="1422564109237" TEXT="Il software git si accorge automaticamente di ogni modifica che si fa a ciascuno del file che stanno nella cartella del repository, ed &#xe8; in grado di visualizzarle memorizzarle e trametterle ad altri repository (memorizza solo le variazioni, risparmiando molto in memoria di massa ed in trasferimenti via rete)."/>
<node CREATED="1422017355845" ID="ID_1646563579" MODIFIED="1423094077018" TEXT="Se vogliamo mettere le modifiche sul repo remoto (GitHub) dobbiamo fare tre operazioni">
<node CREATED="1422017474248" ID="ID_421372059" MODIFIED="1423094077023" TEXT="&quot;Staging&quot; (preparazione)">
<node CREATED="1422017547947" ID="ID_1021390278" MODIFIED="1422017584465" TEXT="Bisogna decidere quali file modificati vogliamo mettere nella prossima versione del nostro albero di cartelle"/>
<node CREATED="1422017664173" ID="ID_1110813780" MODIFIED="1422017727160" TEXT="Un file nello stato di &quot;staged&quot; significa che &#xe8; stato selezionato per finire nella prossima versione &quot;permanente&quot; del repository LOCALE"/>
<node CREATED="1422017585675" ID="ID_1030779372" MODIFIED="1423094077024" TEXT="Prima bisogna sapere quali sono i file modificati">
<node CREATED="1422017620525" ID="ID_975019268" MODIFIED="1422017624463" TEXT="git status"/>
<node CREATED="1422017748383" ID="ID_969383218" MODIFIED="1423094077025" TEXT="mostra">
<node CREATED="1422017625004" ID="ID_1337400184" MODIFIED="1422017775727" TEXT="in rosso i file modificati e non &quot;preparati&quot; (non staged)"/>
<node CREATED="1422017625004" ID="ID_1158648972" MODIFIED="1422017770996" TEXT="in verde i file modificati e staged"/>
</node>
</node>
<node CREATED="1422017787040" ID="ID_399692326" MODIFIED="1423094077026" TEXT="Per poter far passare un file da &quot;non staged&quot; a &quot;staged&quot;">
<node CREATED="1422017814449" ID="ID_1849866543" MODIFIED="1422017840987" TEXT="git add &lt;path relativa e nome del file&gt;"/>
<node CREATED="1422017820513" ID="ID_1455451655" MODIFIED="1422017855518" TEXT="aggiunge allo staged il file indicato"/>
<node CREATED="1422017863506" ID="ID_333747171" MODIFIED="1422017956600" TEXT="si possono usare i wildcard"/>
<node CREATED="1422017814449" ID="ID_465021993" MODIFIED="1423094077026" TEXT="git add *">
<node CREATED="1422017971333" ID="ID_811685448" MODIFIED="1422017994569" TEXT="mette in staged tutti i file modificati che gi&#xe0; non c&apos;erano"/>
</node>
<node CREATED="1422017997862" ID="ID_1434059680" MODIFIED="1423094077026" TEXT="git add *anno*">
<node CREATED="1422018026230" ID="ID_1572542839" MODIFIED="1422018049825" TEXT="mette in stage tutti i file modificati che contengono la parola anno"/>
</node>
</node>
<node CREATED="1416405346277" ID="ID_1351681490" MODIFIED="1423094077027" TEXT="$ git add &lt;file&gt;">
<node CREATED="1416406395543" ID="ID_501031118" MODIFIED="1417126547158" TEXT="aggiunge ai file da mettere, in seguito, fra le versioni memorizzate"/>
<node CREATED="1416406445657" ID="ID_1200876889" MODIFIED="1423094077027" TEXT="&#xe8; necessario farlo SOLO PER LE COSE NUOVE">
<node CREATED="1417125659399" ID="ID_161086727" MODIFIED="1417126571502" TEXT="git si ricorda dei file che sono gi&#xe0; state &quot;aggiunte&quot; (VERIFICARE!!!!)"/>
</node>
</node>
</node>
<node CREATED="1422017501881" ID="ID_1660354049" MODIFIED="1423094077027" TEXT="&quot;Commit&quot;">
<node CREATED="1422563832047" ID="ID_290090757" MODIFIED="1422563913893" TEXT="Rende definitive le modifiche che erano state messe in staging. "/>
</node>
<node CREATED="1422017515274" ID="ID_407451980" MODIFIED="1423094077028" TEXT="&quot;Push&quot; (spingi)">
<node CREATED="1422563904124" ID="ID_1460978395" MODIFIED="1422563973705" TEXT="Trasferisce il commit su un repository remoto."/>
</node>
</node>
</node>
<node CREATED="1422564478444" ID="ID_164505914" MODIFIED="1423094077028" TEXT="Staging">
<node CREATED="1422542115683" ID="ID_1754347389" MODIFIED="1423094077032" TEXT="$ git add">
<node CREATED="1422542158438" ID="ID_500237161" MODIFIED="1422559749640" TEXT="Mette in area di staging il file od i file indicati. "/>
<node CREATED="1414048334758" ID="ID_319258259" MODIFIED="1422559727959" TEXT="Lo staging &#xe8; qualcosa di intermedio fra la versione corrente di sviluppo (workspace), della quale si possono vedere le differenze rispetto al commit precedente, ed prossimo commit. In staging si mettono le modifiche che si vuole che possano essere memorizzate definitivamente. Se ho modifiche temporanee, che non voglio &quot;consolidare&quot;, non le metto in staging. "/>
<node CREATED="1414048618132" ID="ID_224227712" MODIFIED="1414048687548" TEXT="Se non faccio lo &quot;staging&quot; di alcuni file, le corrispondenti modifiche non vanno nella working tree e di conseguenza neppure nel repository remoto "/>
<node CREATED="1414048554833" ID="ID_348497599" MODIFIED="1422563616297" TEXT="Con altri sistemi di revisione il commit manda sul server tutte le modifiche, senza selezionare. "/>
<node CREATED="1422545015163" ID="ID_477701542" MODIFIED="1423094077033" TEXT="I file si possono indicare con il wildcard">
<node CREATED="1422545038223" ID="ID_1046858253" MODIFIED="1423094077034" TEXT="es.">
<node CREATED="1422545040819" ID="ID_1035018000" MODIFIED="1423094077034" TEXT="$ git add *">
<node CREATED="1422545049843" ID="ID_1549783904" MODIFIED="1422545089240" TEXT="mette in staging tutti i file modificati che non ci sono gi&#xe0;"/>
<node CREATED="1422545090869" ID="ID_1691487601" MODIFIED="1423094077035" TEXT="anche">
<node CREATED="1422545093996" ID="ID_788569796" MODIFIED="1422545099157" TEXT="git add ."/>
</node>
</node>
</node>
</node>
<node CREATED="1422542160813" ID="ID_327952581" MODIFIED="1422559761319" TEXT="Dopo che un file &#xe8; stato &quot;added&quot;, git si ricorder&#xe0; che &#xe8; fra i file sotto controllo di revisione e segnaler&#xe0; se manca, o se &#xe8; stato cambiato"/>
</node>
</node>
<node CREATED="1422564471134" ID="ID_73040714" MODIFIED="1423094077036" TEXT="Unstaging">
<node CREATED="1422564464117" ID="ID_1629155200" MODIFIED="1423094077036" TEXT="$ git reset &lt;file&gt;">
<node CREATED="1422564521746" ID="ID_1549512555" MODIFIED="1422567418818" TEXT="toglie dallo staging il file indicato"/>
</node>
<node CREATED="1422564464117" ID="ID_51540454" MODIFIED="1423094077037" TEXT="$ git reset">
<node CREATED="1422564521746" ID="ID_1989721736" MODIFIED="1422567413798" TEXT="toglie dallo staging tutti i file che ci sono"/>
</node>
</node>
<node CREATED="1422567027761" ID="ID_1522810804" MODIFIED="1423094077037" TEXT="Remove">
<node CREATED="1422567031626" ID="ID_314184887" MODIFIED="1422567060502" TEXT="Toglie dall&apos;index E dal working tree"/>
<node CREATED="1422542119576" ID="ID_1062620271" MODIFIED="1423094077039" TEXT="$ git rm">
<node CREATED="1422542160813" ID="ID_1538085758" MODIFIED="1422559769808" TEXT="Dopo che un file &#xe8; stato &quot;removed&quot; non verr&#xe0; pi&#xf9; tenuto sotto controllo di revisione. Se non verr&#xe0; messo fra i file da ignorare ogni sua modifica sar&#xe0; vista, ma non sar&#xe0; pi&#xf9; messa in un commit, a meno che non si faccia un nuovo &quot;add&quot; del file. Il suo stato sar&#xe0; sempre &quot;untracked&quot; come se fosse un file nuovo. "/>
</node>
</node>
<node CREATED="1422552215346" ID="ID_941439601" MODIFIED="1423094077041" TEXT="Commit">
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1422924264089" ID="ID_1051706669" MODIFIED="1423094077041" TEXT="Comando da preferire">
<node CREATED="1416405346277" ID="ID_1824382994" MODIFIED="1423094077042" TEXT="$ git commit -m &quot;&lt;descrizione&gt;&quot;">
<node CREATED="1417126579595" ID="ID_41123655" MODIFIED="1417126602123" TEXT="memorizza permanentemente tutti i file che sono stati &quot;aggiunti&quot;"/>
<node CREATED="1422552231577" ID="ID_1027832896" MODIFIED="1422573831593" TEXT="meglio mettere sempre l&apos;opzione .m con una descrizione"/>
<node CREATED="1422552249233" ID="ID_183010412" MODIFIED="1422553129140" TEXT="leggere bene cosa si scrive, perch&#xe8; PARE che si possa cambiare la descrizione, ma IO NON SO FARE!"/>
<node CREATED="1422924300699" ID="ID_487790856" MODIFIED="1422924304622" TEXT="-m = message"/>
</node>
</node>
<node CREATED="1422552341933" ID="ID_1036808357" MODIFIED="1423094077044" TEXT="La memorizzazione avviene LOCALMENTE, nel repository locale">
<node CREATED="1422552373328" ID="ID_575171782" MODIFIED="1422553146541" TEXT="le differenze rispetto alla versione precedente vengono memorizzate all&apos;interno della cartella .git"/>
<node CREATED="1422924317937" ID="ID_687229419" MODIFIED="1423094077044" TEXT="il commit viene identificato">
<node CREATED="1422924328923" ID="ID_423304672" MODIFIED="1423094077045" TEXT="con il suo hash SHA1">
<node CREATED="1422924352852" ID="ID_825823049" MODIFIED="1422924364821" TEXT="git lo distingue univocamente cos&#xec;"/>
<node CREATED="1422924418918" ID="ID_518753371" MODIFIED="1422924477827" TEXT="&#xe8; un numero di molti bit che &#xe8; il &quot;riassunto&quot; di ci&#xf2; che viene spedito nel repository"/>
<node CREATED="1422924445469" ID="ID_739228699" MODIFIED="1422924459595" TEXT="&#xe8; visualizzato in esadecimale"/>
</node>
<node CREATED="1422924339538" ID="ID_1390904731" MODIFIED="1423094077045" TEXT="con la sua stringa di descrizione">
<node CREATED="1422924366995" ID="ID_763058169" MODIFIED="1422924379982" TEXT="gli umani lo distinguono cos&#xec;. "/>
<node CREATED="1422924380401" ID="ID_1452812507" MODIFIED="1422924405997" TEXT="E&apos; opportuno mettere messaggi chiari ed esplicativi."/>
</node>
</node>
</node>
<node CREATED="1422551019597" ID="ID_54535377" MODIFIED="1423094077046" TEXT="$ git commit">
<node CREATED="1422552582618" ID="ID_154812829" MODIFIED="1423094077047" TEXT="se non si mette niente, per scrivere la descrizione, parte vim!">
<node CREATED="1422552805228" ID="ID_25005005" MODIFIED="1422552814982" TEXT="e dopo &#xe8; un problema uscire"/>
<node CREATED="1422552816061" ID="ID_632927873" MODIFIED="1422552838830" TEXT="1 - scrivere il messaggio di descrizione del commit"/>
<node CREATED="1422552839530" ID="ID_1550137881" MODIFIED="1423094077047" TEXT="2 - salvare">
<node CREATED="1422552939936" ID="ID_691023410" MODIFIED="1422552994789" TEXT="premere Esc , poi :, poi w"/>
</node>
<node CREATED="1422553020734" ID="ID_1295302679" MODIFIED="1423094077048" TEXT="3 - uscire da Vim">
<node CREATED="1422552939936" ID="ID_346243309" MODIFIED="1422553035100" TEXT="premere Esc , poi :, poi x"/>
</node>
</node>
</node>
<node CREATED="1422568238285" ID="ID_626295469" MODIFIED="1423094077050" TEXT="$ git commit --amend">
<node CREATED="1422568244293" ID="ID_1506169341" MODIFIED="1422568409383" TEXT="&quot;Aggiorna&quot; il commit precedente"/>
<node CREATED="1422568352680" ID="ID_881792738" MODIFIED="1422568413016" TEXT="Se mi ero dimenticato di mettere in stage qualcosa, che quindi non era andato in commit, posso rimediare con questo comando. "/>
<node CREATED="1422568257483" ID="ID_895116981" MODIFIED="1422568405068" TEXT="Funziona se nel frattempo non &#xe8; stato fatto alcun push. "/>
<node CREATED="1422573318977" ID="ID_1967839029" MODIFIED="1422573673408" TEXT="Se si fa $ git commit --amend da console dopo aver aver fatto una push possono succedere cose strane al momento della successiva push. Non facciamolo!"/>
</node>
</node>
<node CREATED="1416405346277" ID="ID_1905087078" MODIFIED="1423094077051" TEXT="$ git log">
<node CREATED="1416407066663" ID="ID_26488116" MODIFIED="1422561489819" TEXT="si vede lo storico che c&apos;&#xe8; nel repository"/>
<node CREATED="1417126042112" ID="ID_656050048" MODIFIED="1422534178934" TEXT="tutti i commit che sono stati fatti"/>
</node>
<node CREATED="1422553825042" ID="ID_609568033" MODIFIED="1423094077060" TEXT="$ git stash">
<node CREATED="1422554150944" ID="ID_1179298060" MODIFIED="1422554744297" TEXT="Salvataggio delle ultime modifiche del workspace in un tree &quot;temporaneo&quot;, e ritorno del workspace allo stato dell&apos;ultimo commit. "/>
<node CREATED="1422554283242" ID="ID_973263508" MODIFIED="1422554678841" TEXT="Serve riuscire a fare un pull con le modifiche da repo remoto, quando non ci si riesce per conflitti nelle nostre modifiche. &quot;Parcheggiando&quot; le modifiche fatte e tornando all&apos;ultimo commit, &#xe8; poi possibile fare pull o push. &#xa;Le modifiche memorizzate nello stash possono essere recuperate in seguito. "/>
<node CREATED="1422557377142" ID="ID_693903450" MODIFIED="1423094077061" TEXT="$ git stash [save] [&lt;messaggio&gt;]">
<node CREATED="1422557383420" ID="ID_1963739425" MODIFIED="1422557395902" TEXT="salva uno stash"/>
<node CREATED="1422557563975" ID="ID_941681372" MODIFIED="1422557576508" TEXT="sia save che il messaggio sono opzionali"/>
</node>
<node CREATED="1422555667579" ID="ID_1926883381" MODIFIED="1423094077061" TEXT="Gli stash sono memorizzati &quot;a stack&quot;">
<node CREATED="1422555688404" ID="ID_307209624" MODIFIED="1422555768072" TEXT="l&apos;ultimo stash salvato viene ripristinato per primo (se si vuole ripristinare..)"/>
</node>
<node CREATED="1422554784510" ID="ID_1172620231" MODIFIED="1423094077062" TEXT="$ git stash list">
<node CREATED="1422554792191" ID="ID_974462728" MODIFIED="1422554805651" TEXT="elenco degli stash presenti nel repository"/>
</node>
<node CREATED="1422555261033" ID="ID_1278117296" MODIFIED="1423094077062" STYLE="fork" TEXT="$ git stash show">
<node CREATED="1422555264439" ID="ID_1184571034" MODIFIED="1422557372598" TEXT="per ispezionare il contenuto della stash"/>
<node CREATED="1422555424185" ID="ID_185077561" MODIFIED="1422557372598" TEXT="uscire con q"/>
</node>
<node CREATED="1422555050060" ID="ID_984533903" MODIFIED="1423094077063" TEXT="per recuperare uno stash precedentemente salvato">
<node CREATED="1422555100106" ID="ID_1391122172" MODIFIED="1422555102835" TEXT="$ git stash apply"/>
<node CREATED="1422555111522" ID="ID_540101944" MODIFIED="1422555155347" TEXT="il workspace si riporta alla condizione che aveva al momento del comando stash"/>
</node>
</node>
<node CREATED="1422567895375" ID="ID_702328328" MODIFIED="1423094077065" TEXT="Push su altro repository">
<node CREATED="1422567988318" ID="ID_892818407" MODIFIED="1422568050669" TEXT="&quot;Spinge&quot; nel repository remoto tutte le modifiche fatte con dei commit."/>
<node CREATED="1422572494213" ID="ID_448106003" MODIFIED="1423094077065" TEXT="$ git push --repo=&lt;repository&gt;">
<node CREATED="1422572515515" ID="ID_1470474044" MODIFIED="1422572532200" TEXT="con la URL di pu&#xf2; fare il push &quot;dovunque&quot;"/>
<node CREATED="1422572553113" ID="ID_676722599" MODIFIED="1423094077066" TEXT="es.">
<node CREATED="1422572563299" ID="ID_257488833" MODIFIED="1422572586457" TEXT="$ git push --repo=https://github.com/gamondue/GOR5F/"/>
</node>
</node>
<node CREATED="1422572591021" ID="ID_1781717019" MODIFIED="1422573265438" TEXT="Se si vuole fare un push senza parametri bisogna configurare la strategia di default per il push"/>
<node CREATED="1422573268591" ID="ID_763964237" MODIFIED="1422573991249" TEXT="La strategia &quot;simple&quot; &#xe8; la meno complicata; per impostarla: "/>
<node CREATED="1422573992101" ID="ID_242023028" MODIFIED="1422621027111" TEXT=" git config --global push.default simple git config --global push.default simple"/>
<node CREATED="1422573993676" ID="ID_153438306" MODIFIED="1422574001260" TEXT="Poi si pu&#xf2; fare"/>
<node CREATED="1422574001787" ID="ID_1167099535" MODIFIED="1422574009171" TEXT="$ git push"/>
</node>
<node CREATED="1422534386835" ID="ID_930815933" MODIFIED="1423094077069" TEXT="Branch">
<node CREATED="1422534424482" ID="ID_1413276184" MODIFIED="1422534541859" TEXT="L&apos;operazione di &quot;branch&quot; permette di creare un ramo separato, che pu&#xf2; avere una versione autonoma rispetto al ramo principale"/>
<node CREATED="1422534480413" ID="ID_1409901320" MODIFIED="1422534491727" TEXT="In Inglese branch = ramo"/>
<node CREATED="1416405346277" ID="ID_1675836365" MODIFIED="1423094077069" TEXT="$ git branch">
<node CREATED="1416407989566" ID="ID_858191636" MODIFIED="1416408029685" TEXT="senza parametri: elenco dei branch esistenti"/>
</node>
<node CREATED="1416405346277" ID="ID_300547336" MODIFIED="1423094077069" TEXT="$ git branch &lt;nome del branch&gt;">
<node CREATED="1417126840823" ID="ID_455330431" MODIFIED="1417126952505" TEXT="crea un nuovo &quot;ramo&quot; nell&apos;albero delle versioni facendolo partire dal repository corrente"/>
</node>
<node CREATED="1416405346277" ID="ID_1092466675" MODIFIED="1423094077070" TEXT="$ git branch &lt;nome del branch&gt; &lt;nome del branch da cui si vuole partire&gt;">
<node CREATED="1417126840823" ID="ID_81241456" MODIFIED="1417126935687" TEXT="crea un nuovo ramo nell&apos;albero delle versioni, facendolo partire dal branch il cui nome &#xe8; stato indicato"/>
</node>
<node CREATED="1416405346277" ID="ID_1886515873" MODIFIED="1423094077070" TEXT="$ git branch -d">
<node CREATED="1416407878552" ID="ID_1241096944" MODIFIED="1417127004678" TEXT="l&apos;opzione -d (delete) cancella un branch"/>
</node>
</node>
<node CREATED="1422546531406" ID="ID_702548778" MODIFIED="1423094077071" TEXT="$ git checkout &lt;nome del branch&gt;">
<node CREATED="1422546694157" ID="ID_883242448" MODIFIED="1422546699896" TEXT="ripristina tutti i file del repository alla condizione che avevano al momento del commit del branch indicato"/>
</node>
<node CREATED="1422548555639" ID="ID_906017042" MODIFIED="1423094077072" TEXT="Differenze">
<node CREATED="1416407952543" ID="ID_1341112570" MODIFIED="1423094077073" TEXT="$ git diff &lt;commit&gt;">
<node CREATED="1417127107893" ID="ID_1449340457" MODIFIED="1422923748403" TEXT="fa vedere le differenze fra il commit indicato e la situazione corrente del directory (workspace)"/>
</node>
<node CREATED="1416407952543" ID="ID_290271875" MODIFIED="1423094077073" TEXT="$ git diff &lt;commit&gt; &lt;commit&gt;">
<node CREATED="1417127107893" ID="ID_1936245316" MODIFIED="1417127158523" TEXT="fa vedere le differenze fra i due commit indicati"/>
</node>
<node CREATED="1422548571915" ID="ID_1854044863" MODIFIED="1422549803200" TEXT="si vedono meglio con un client grafico"/>
</node>
<node CREATED="1422550213092" ID="ID_163206058" MODIFIED="1423094077075" TEXT="$ git remote">
<node CREATED="1422550218714" ID="ID_1458619511" MODIFIED="1423094077075" TEXT="Permette di configurare o vedere i repository remoti definiti per questo repository">
<node CREATED="1422550256765" ID="ID_13263860" MODIFIED="1423094077076" TEXT="possono essere">
<node CREATED="1422550322641" ID="ID_528118184" MODIFIED="1422550324195" TEXT="su cartelle diverse sullo stesso computer"/>
<node CREATED="1422550324969" ID="ID_1185748776" MODIFIED="1422550336412" TEXT="su cartelle in altri computer"/>
<node CREATED="1422550336917" ID="ID_1783305600" MODIFIED="1422550370095" TEXT="sul sito Web di un provider Git, accessibile via http"/>
</node>
</node>
<node CREATED="1416580770136" ID="ID_1534003025" MODIFIED="1422550402259" STYLE="fork" TEXT="senza parametri git remote fa vedere tutti i remote che sono stati definiti per quel repository"/>
<node CREATED="1422549556266" ID="ID_534005180" MODIFIED="1423094077077" TEXT="$ git remote -v ">
<node CREATED="1422549565469" ID="ID_1780121508" MODIFIED="1423094077078" TEXT="fa vedere i &quot;remote&quot; e la configurazione data loro">
<node CREATED="1422550110346" ID="ID_1591926513" MODIFIED="1422550128237" TEXT="la cartella"/>
<node CREATED="1422550119843" ID="ID_1969501584" MODIFIED="1422550122242" TEXT="oppure"/>
<node CREATED="1422550122509" ID="ID_728499711" MODIFIED="1422550137099" TEXT="la URL"/>
<node CREATED="1422550412010" ID="ID_186123050" MODIFIED="1422550468809" TEXT="visualizza come i remote possono essere raggiunti in download (fetch) od in upload (push)"/>
</node>
</node>
</node>
<node CREATED="1407278944595" ID="ID_1414723898" MODIFIED="1423094077080" TEXT="Head">
<node CREATED="1407279100498" ID="ID_585691006" MODIFIED="1407279139100" TEXT="Un HEAD tiene traccia dell&apos;ultimo commit di una branch"/>
<node CREATED="1407279043697" ID="ID_1048232836" MODIFIED="1407279090651" TEXT="In un singolo repository si pu&#xf2; tenere traccia di molte branch"/>
<node CREATED="1407279168164" ID="ID_1318212116" MODIFIED="1422551065730" TEXT="Un repository appena clonato ha un solo head, per default detto &quot;master&quot;"/>
<node CREATED="1416584434533" ID="ID_256447065" MODIFIED="1422563750632" TEXT="E&apos; il puntatore a dove mi trovo in un certo momento."/>
<node CREATED="1416584475713" ID="ID_1833015739" MODIFIED="1422563747743" TEXT="E&apos; un un file nella cartella .git. "/>
</node>
<node CREATED="1422562473189" ID="ID_1050317768" MODIFIED="1423094077081" TEXT="Utilit&#xe0; di configurazione">
<node CREATED="1416580013778" ID="ID_304103959" MODIFIED="1423094077082" TEXT="creazione utenti con git config">
<node CREATED="1422562549549" ID="ID_435219765" MODIFIED="1423094077083" TEXT="$ git shortlog -sn">
<node CREATED="1422562553835" ID="ID_1191324836" MODIFIED="1422562589281" TEXT="visualizza gli utenti che hanno fatto dei commit ed il numero dei commit che hanno fatto."/>
</node>
</node>
<node CREATED="1422562484115" ID="ID_1479343675" MODIFIED="1423094077084" TEXT="$ git config --list">
<node CREATED="1422562488645" ID="ID_1947202835" MODIFIED="1422562503007" TEXT="visualizza le opzioni correnti di configurazione"/>
</node>
</node>
</node>
<node CREATED="1422543440866" ID="ID_273311771" MODIFIED="1423094077088" POSITION="right" TEXT="File che git deve ignorare">
<node CREATED="1422543455266" ID="ID_928651384" MODIFIED="1422543524838" TEXT="il file .gitignore, che pu&#xf2; essere incluso in ogni cartella, contiene la lista dei file di cui git deve ignorare l&apos;esistenza"/>
<node CREATED="1422543525276" ID="ID_210522400" MODIFIED="1422545580508" TEXT="ogni variazione dei file che sono in .gitignore non verr&#xe0; vista, non si potr&#xe0; fare &quot;add&quot; di tali file, e quindi non potranno finire nei commit."/>
<node CREATED="1422545581037" ID="ID_1220312568" MODIFIED="1422545630412" TEXT="I file che sono in .gitignore non daranno pi&#xf9; fastidio anche se cambieranno o saranno cancellati"/>
<node CREATED="1422543603081" ID="ID_141969575" MODIFIED="1422543661224" TEXT="la specificazione dei file in .gitignore pu&#xf2; usare i wildcard (caratteri jolly: *, ..)"/>
</node>
<node CREATED="1414663226972" ID="ID_1700371987" MODIFIED="1423094077088" POSITION="right" TEXT="Collegarsi al repository con client grafico">
<node CREATED="1421931649233" ID="ID_769625169" MODIFIED="1423094077090" TEXT="es.">
<node CREATED="1421931666184" ID="ID_264596441" MODIFIED="1423094077090" TEXT="Git Gui">
<node CREATED="1421931673753" ID="ID_941630721" MODIFIED="1421931690373" TEXT="incluso nell&apos;installazione di Git per Windows"/>
</node>
<node CREATED="1421931646599" ID="ID_1069465191" MODIFIED="1423094077091" TEXT="SmartGit|Hg">
<node CREATED="1421931697181" ID="ID_14624430" MODIFIED="1421931702033" TEXT="programma commerciale"/>
<node CREATED="1422527925281" ID="ID_1996910058" MODIFIED="1422527946205" TEXT="uso gratuito per progetti non commerciali"/>
</node>
<node CREATED="1422527914871" ID="ID_1703892710" MODIFIED="1422527918043" TEXT="Molti altri"/>
</node>
</node>
</node>
</map>
