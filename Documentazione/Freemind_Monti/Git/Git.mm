<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1398707595865" ID="ID_1821350601" MODIFIED="1417124887539" TEXT="Git">
<node CREATED="1417126108581" FOLDED="true" ID="ID_1793920691" MODIFIED="1417126476434" POSITION="right" TEXT="Installazione">
<node CREATED="1417126118488" ID="ID_84236090" MODIFIED="1417126119843" TEXT="da">
<node CREATED="1417126120495" ID="ID_1145066663" LINK="http://git-scm.com/downloads" MODIFIED="1417126169822" TEXT="http://git-scm.com/downloads">
<arrowlink DESTINATION="ID_1145066663" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_2677284" STARTARROW="None" STARTINCLINATION="0;0;"/>
<arrowlink DESTINATION="ID_1145066663" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_1708693095" STARTARROW="None" STARTINCLINATION="0;0;"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_1145066663" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_2677284" SOURCE="ID_1145066663" STARTARROW="None" STARTINCLINATION="0;0;"/>
<linktarget COLOR="#b0b0b0" DESTINATION="ID_1145066663" ENDARROW="Default" ENDINCLINATION="0;0;" ID="Arrow_ID_1708693095" SOURCE="ID_1145066663" STARTARROW="None" STARTINCLINATION="0;0;"/>
</node>
<node CREATED="1417126229906" ID="ID_998961095" MODIFIED="1417126438959" TEXT="In Windows installa">
<node CREATED="1417126300304" ID="ID_438984822" MODIFIED="1417126301594" TEXT="il software Git che rimane sempre attivo e guarda tutte le modifiche nelle cartelle"/>
<node CREATED="1417126302135" ID="ID_1952345223" MODIFIED="1417126312073" TEXT="Git bash">
<node CREATED="1417126312914" ID="ID_1765800797" MODIFIED="1417126349314" TEXT="una shell per i comandi git da linea di comando"/>
</node>
<node CREATED="1417126395345" ID="ID_1222085740" MODIFIED="1417126398602" TEXT="Git Gui">
<node CREATED="1417126399697" ID="ID_1342093307" MODIFIED="1417126452293" TEXT="un programma grafico per la gestione di Git"/>
</node>
</node>
</node>
</node>
<node CREATED="1398848740427" FOLDED="true" ID="ID_1595509161" MODIFIED="1417126482227" POSITION="right" TEXT="Sistema distribuito">
<node CREATED="1398848750569" ID="ID_693427104" MODIFIED="1417080745679" STYLE="fork" TEXT="Non &#xe8; necessaria una copia di lavoro centrale, sul server remoto"/>
<node CREATED="1398848842334" ID="ID_1683126351" MODIFIED="1398848863961" TEXT="In Git la copia di lavoro &#xe8; in ogni computer">
<node CREATED="1398848986099" ID="ID_126622978" MODIFIED="1398849011195" TEXT="E&apos; la cartella che si &#xe8; deciso di assegnare al progetto"/>
</node>
<node CREATED="1398707655174" ID="ID_1516480046" MODIFIED="1398707656256" TEXT="Snapshots, Not Differences">
<node CREATED="1398707704342" ID="ID_258390782" MODIFIED="1398707705424" TEXT="other systems store information as a list of file-based changes"/>
<node CREATED="1398707733299" ID="ID_1338782470" MODIFIED="1398707733856" TEXT="Git thinks of its data more like a set of snapshots of a mini filesystem">
<node CREATED="1398707751081" ID="ID_1449507059" MODIFIED="1398707752773" TEXT="Every time you commit"/>
<node CREATED="1398707774664" ID="ID_1122179389" MODIFIED="1398707775136" TEXT="if files have not changed, Git doesn&#x2019;t store the file again"/>
<node CREATED="1398713668397" ID="ID_373670305" MODIFIED="1398713669353" TEXT="you have the entire history of the project right there on your local disk"/>
<node CREATED="1398713730395" ID="ID_1169473935" MODIFIED="1398713730830" TEXT="you see the project history almost instantly"/>
</node>
<node CREATED="1398713940959" ID="ID_860098235" MODIFIED="1398713941355" TEXT="Everything in Git is check-summed ">
<node CREATED="1398713950717" ID="ID_651013865" MODIFIED="1398713951577" TEXT="it&#x2019;s impossible to change the contents of any file or directory without Git knowing about it"/>
<node CREATED="1398713973090" ID="ID_230874594" MODIFIED="1398713981693" TEXT="Git uses for this checksumming is SHA-1 hash"/>
<node CREATED="1398714128653" ID="ID_322575261" MODIFIED="1398714128653">
<richcontent TYPE="NODE"><html>
  <head>
    
  </head>
  <body>
    Git stores everything not by file name but in the Git database addressable by the hash value of its contents.
  </body>
</html></richcontent>
</node>
</node>
<node CREATED="1398714285066" ID="ID_1670624940" MODIFIED="1398714287301" TEXT="Three States">
<node CREATED="1398714322744" ID="ID_1544901064" MODIFIED="1398714326544" TEXT="committed">
<node CREATED="1398714357535" ID="ID_79199172" MODIFIED="1398714362872" TEXT="safely stored in local database"/>
</node>
<node CREATED="1398714330612" ID="ID_1216676889" MODIFIED="1398714333240" TEXT="staged">
<node CREATED="1398714404216" ID="ID_1170878421" MODIFIED="1398714417987" TEXT="marked to go into your next commit"/>
</node>
<node CREATED="1398714326957" ID="ID_1209806885" MODIFIED="1398714330245" TEXT="modified">
<node CREATED="1398714375381" ID="ID_1617450982" MODIFIED="1398714383021" TEXT="changed but not committed"/>
</node>
</node>
<node CREATED="1398714726839" ID="ID_517422474" MODIFIED="1398714728242" TEXT="main sections of a Git project">
<node CREATED="1398714716615" ID="ID_1854250637" MODIFIED="1398714734051" TEXT="Git directory">
<node CREATED="1398715219838" ID="ID_1639429298" MODIFIED="1398715222449" TEXT="where Git stores the metadata and object database for your project"/>
</node>
<node CREATED="1398714735419" ID="ID_867659566" MODIFIED="1398714746626" TEXT="working directory">
<node CREATED="1398715124202" ID="ID_1809433385" MODIFIED="1398715125832" TEXT="a single checkout of one version of the project"/>
</node>
<node CREATED="1398714739286" ID="ID_323697855" MODIFIED="1398714743131" TEXT="staging area">
<node CREATED="1398715360285" ID="ID_1027249508" MODIFIED="1398715372055" TEXT="a file that stores information about what will go into your next commit"/>
</node>
</node>
</node>
</node>
<node CREATED="1398848876199" ID="ID_1219439933" MODIFIED="1398848885684" POSITION="right" TEXT="Modalit&#xe0; operative di lavoro">
<node CREATED="1398848924289" ID="ID_891003907" MODIFIED="1398849201160" TEXT="Ci pu&#xf2; essere un server centrale da cui scaricare la versione iniziale della copia di lavoro (ma anche no!)">
<node CREATED="1398849209723" ID="ID_1733097732" MODIFIED="1398849225631" TEXT="copia di lavoro = &quot;working copy&quot;"/>
<node CREATED="1398849099651" ID="ID_507066253" MODIFIED="1398849245746" TEXT="versione iniziale = the &quot;origin&quot;">
<node CREATED="1417080793009" ID="ID_553583025" MODIFIED="1417080806778" TEXT="nome convenzionale, che si pu&#xf2; cambiare"/>
</node>
</node>
<node CREATED="1398849135747" ID="ID_1477043347" MODIFIED="1398849197957" TEXT="Prima si &quot;clona&quot; la &quot;origin&quot; e si ottiene una &quot;working copy&quot;"/>
<node CREATED="1398849419352" ID="ID_106018940" MODIFIED="1398849438384" TEXT="Si lavora localmente sulla &quot;working copy&quot;"/>
<node CREATED="1398849440963" ID="ID_97472360" MODIFIED="1398849493967" TEXT="Si controllano le modifiche della working copy rispetto allo stato corrente della &quot;origin&quot;"/>
<node CREATED="1398849494505" ID="ID_655124547" MODIFIED="1414047279034" TEXT="Staging: si preparano per la &quot;emissione&quot; in nuova versione le parti della &quot;working&quot; copy che si vogliono cambiare sulla &quot;origin&quot;"/>
<node CREATED="1398849573054" ID="ID_1647866268" MODIFIED="1398849726370" TEXT="Commit: si aggiorna una nuova versione della &quot;working copy&quot; (IN LOCALE!)">
<node CREATED="1398849766567" ID="ID_1496246603" MODIFIED="1398849811463" TEXT="L&apos;OPERAZIONE DI COMMIT NON HA NESSUN EFFETTO SULLE COPIE REMOTE!">
<node CREATED="1414047290907" ID="ID_1057017540" MODIFIED="1414049955285" TEXT="In tutti gli altri sistemi di versioning il commit corrisponde alla scrittura delle modifiche sul server"/>
</node>
<node CREATED="1398849860188" ID="ID_607681692" MODIFIED="1414047856385" TEXT="Il commit potrebbe fallire, quando le modifiche portassero le copia locale a diventare inconsistente (incoerente)">
<node CREATED="1414047859073" ID="ID_1687639506" MODIFIED="1414047909770" TEXT="In tal caso Git individua quali file causano il conflitto e li pu&#xf2; evidenziare. "/>
<node CREATED="1414047339515" ID="ID_1302025702" MODIFIED="1414047770846" TEXT="Per potere fare il commit bisogna risolvere i conflitti."/>
<node CREATED="1414047383326" ID="ID_1167934023" MODIFIED="1414047576972" TEXT="Git ed i client Git danno strumenti, pi&#xf9; o meno facili e sofisticati, per risolvere i conflitti">
<node CREATED="1414047446913" ID="ID_1007293466" MODIFIED="1414047478946" TEXT="evidenziazione dei file che impediscono il commit"/>
<node CREATED="1414047434814" ID="ID_200334425" MODIFIED="1414047446541" TEXT="visualizzazione delle differenze"/>
<node CREATED="1414047484869" ID="ID_501733914" MODIFIED="1414047562910" TEXT="Trasferimenti facilitati delle differenze da un file all&apos;altro, per rendere le versioni di nuovo coerenti"/>
</node>
</node>
</node>
<node CREATED="1414047583048" ID="ID_1493860967" MODIFIED="1414047634858" TEXT="Per operare sul server remoto dunque non si usa il commit, ma push e pull. ">
<node CREATED="1398849941903" ID="ID_334632900" MODIFIED="1398849985555" TEXT="Push: scrive nel repository remoto (&quot;origin&quot;) tutte le modifiche fatte con il precedente Commit"/>
<node CREATED="1398849998462" ID="ID_1749325017" MODIFIED="1407278376775" TEXT="Pull: altri utenti che hanno bisogno delle modifiche fatte da noi possono fare un pull dal server remoto per ottenere la versione che vogliono del progetto. Con una Pull possiamo ottenere le modificahe fatte dagli altri. "/>
<node CREATED="1414047655200" ID="ID_1088800159" MODIFIED="1414047965469" TEXT="Push o pull potrebbero fallire in caso di conflitti fra le copie online a quelle locali. ">
<node CREATED="1414047725885" ID="ID_954736777" MODIFIED="1414047976721" TEXT="Anche in tal caso sar&#xe0; necessario risolvere i conflitti"/>
</node>
</node>
</node>
<node CREATED="1407278770613" ID="ID_1411252280" MODIFIED="1414048084581" POSITION="right" TEXT="Repository">
<node CREATED="1414048085906" ID="ID_1269806161" MODIFIED="1414048130333" TEXT="E&apos; il database condiviso remoto di tutte le versioni del progetto che sono state spedite (pushed) da tutti gli sviluppatori. "/>
<node CREATED="1407278652800" ID="ID_788127584" MODIFIED="1414048174205" TEXT="&#xe8; ci&#xf2; che viene (parzialmente) replicato su tutti i computer che accedono al sistema di controllo delle revisioni"/>
<node CREATED="1407278784772" ID="ID_62008259" MODIFIED="1414048149995" TEXT="Per iniziare un progetto si pu&#xf2; &quot;clonare&quot; un repository remoto"/>
</node>
<node CREATED="1407278551098" ID="ID_467474887" MODIFIED="1407278595542" POSITION="right" STYLE="fork" TEXT="Working tree">
<node CREATED="1407278601575" ID="ID_1169769216" MODIFIED="1414048230553" TEXT="E&apos; la cartella locale che contiene tutte le cartelle e tutti i file tenuti sotto controllo di revisione, nell&apos;attuale versione.">
<node CREATED="1407278741832" ID="ID_1279074333" MODIFIED="1414048259495" TEXT="Contiene tutti i file da editare del progetto, nella versione corrente. "/>
<node CREATED="1414048259780" ID="ID_1126411603" MODIFIED="1414048309413" TEXT="Per cambiare in locale la versione corrente bisogna fare l&apos;operazione di &quot;checkout&quot;"/>
</node>
<node CREATED="1414048397180" ID="ID_14772367" MODIFIED="1414048430717" TEXT="Per cambiare il working tree bisiogna fare un commit."/>
</node>
<node CREATED="1399934966043" ID="ID_892452" MODIFIED="1399934973998" POSITION="right" TEXT="The Index">
<node CREATED="1414048695366" ID="ID_1134452123" MODIFIED="1414048769195" TEXT="E&apos; un insieme selezionato di modifiche al working tree che &#xe8; stato preparato per il prossimo commit. "/>
<node CREATED="1414048727250" ID="ID_1514258008" MODIFIED="1414048774472" TEXT="E&apos; l&apos;insieme dei file che &#xe8; stato messo in stato di &quot;staging&quot;. "/>
<node CREATED="1414048334758" ID="ID_319258259" MODIFIED="1414048810489" TEXT="E&apos; qualcosa di intermedio fra la versione corrente di sviluppo, della quale si possono vedere le differenze rispetto al &quot;working tree&quot;, ed il &quot;working tree&quot;, nel quale si mettono solo le modifiche consolidate. "/>
<node CREATED="1414048479284" ID="ID_126333965" MODIFIED="1414048520969" TEXT="E&apos; un insieme di files che &#xe8; stato messo nello stato di &quot;staging&quot;, e che &#xe8; prescelto per entrare nel prossimo commit. ">
<node CREATED="1414048527767" ID="ID_1814079463" MODIFIED="1414048617765" TEXT="Con Git &#xe8; possibile scegliere un insieme di modifiche che vanno sulla working tree."/>
<node CREATED="1414048618132" ID="ID_415086251" MODIFIED="1414048687548" TEXT="Se non faccio lo &quot;staging&quot; di alcuni file, le corrispondenti modifiche non vanno nella working tree e di conseguenza neppure nel repository remoto "/>
<node CREATED="1414048554833" ID="ID_406790163" MODIFIED="1414048595395" TEXT="Con altri sistemi di revisione il commit manda sul server tutte le modifiche, sneza selezionare. "/>
</node>
</node>
<node CREATED="1407278944595" ID="ID_1414723898" MODIFIED="1407278946546" POSITION="right" TEXT="HEAD">
<node CREATED="1407279043697" ID="ID_1048232836" MODIFIED="1407279090651" TEXT="In un singolo repository si pu&#xf2; tenere traccia di molte branch"/>
<node CREATED="1407279100498" ID="ID_74532650" MODIFIED="1407279139100" TEXT="Un HEAD tiene traccia dell&apos;ultimo commit di una branch"/>
<node CREATED="1407279168164" ID="ID_1318212116" MODIFIED="1407279200795" TEXT="Un repository appena clonato ha un solo head, detto &quot;master&quot;"/>
</node>
<node CREATED="1416405289686" ID="ID_172060207" MODIFIED="1417125006431" POSITION="right" TEXT="controllo a linea di comando">
<node CREATED="1416405346277" ID="ID_1906145169" MODIFIED="1416405373855" TEXT="$ git help &lt;command&gt;">
<node CREATED="1417125041840" ID="ID_1786334970" MODIFIED="1417125047827" TEXT="per avere aiuto"/>
<node CREATED="1417125048443" ID="ID_150871705" MODIFIED="1417125143827" TEXT="(in Windows fa partire un help HTML da file)"/>
</node>
<node CREATED="1416405346277" ID="ID_457790415" MODIFIED="1417125108889" TEXT="$ git config --global user --global user .name &quot;..&quot;">
<node CREATED="1416405796165" ID="ID_1156633978" MODIFIED="1417124945647" TEXT="global = configurazione valida per tutto il sistema"/>
</node>
<node CREATED="1416405346277" ID="ID_1701225401" MODIFIED="1416406027864" TEXT="$ git  init">
<node CREATED="1416406069257" ID="ID_742256077" MODIFIED="1416406097872" TEXT="nuova repository nella cartella in cui mi trovo"/>
<node CREATED="1416406126573" ID="ID_748580874" MODIFIED="1416406143653" TEXT="crea una cartella .git nascosta"/>
</node>
<node CREATED="1416405346277" ID="ID_1351681490" MODIFIED="1416406319160" TEXT="$ git add &lt;file&gt;">
<node CREATED="1416406395543" ID="ID_501031118" MODIFIED="1416406412481" TEXT="aggiunge alla staging area"/>
<node CREATED="1416406445657" ID="ID_1200876889" MODIFIED="1416406519533" TEXT="farlo SOLO PER LE COSE NUOVE"/>
</node>
<node CREATED="1416405346277" ID="ID_1824382994" MODIFIED="1416406830887" TEXT="$ git commit -m &quot;&lt;descrizione&gt;&quot;"/>
<node CREATED="1416405346277" ID="ID_1905087078" MODIFIED="1416407063939" TEXT="$ git log">
<node CREATED="1416407066663" ID="ID_26488116" MODIFIED="1416407090851" TEXT="si vede lo storico che c&apos;&#xe8; nel bidone"/>
</node>
<node CREATED="1416407250663" ID="ID_1074380447" MODIFIED="1416407264388" TEXT="$ git status">
<node CREATED="1416407268971" ID="ID_1404696412" MODIFIED="1416407291722" TEXT="guardare come stanno le cose"/>
<node CREATED="1416407292351" ID="ID_740467882" MODIFIED="1416407300461" TEXT="cos &#xe8; cambiato"/>
<node CREATED="1416407301831" ID="ID_709414085" MODIFIED="1416407319503" TEXT="cosa &#xe8; stato cancellato"/>
</node>
<node CREATED="1416405346277" ID="ID_1675836365" MODIFIED="1416407684120" TEXT="$ git branch">
<node CREATED="1416407989566" ID="ID_858191636" MODIFIED="1416408029685" TEXT="senza parametri: elenco dei branch esistenti"/>
<node CREATED="1416407878552" ID="ID_1691107340" MODIFIED="1416407883240" TEXT="-d cancella"/>
<node CREATED="1416407952543" ID="ID_1424859726" MODIFIED="1416407960872" TEXT="&lt;nome del branch&gt;">
<node CREATED="1416407965119" ID="ID_1262467796" MODIFIED="1416407965119" TEXT=""/>
</node>
<node CREATED="1416407952543" ID="ID_1667139957" MODIFIED="1416408213139" TEXT="&lt;nome del branch&gt; &lt;nome del punto da cui si vuole partire&gt;">
<node CREATED="1416407965119" ID="ID_723604870" MODIFIED="1416407965119" TEXT=""/>
</node>
</node>
<node CREATED="1416407952543" ID="ID_1357404541" MODIFIED="1416408727228" TEXT="$ git checkout &lt;nome del branch&gt;"/>
<node CREATED="1416407952543" ID="ID_1341112570" MODIFIED="1416409055237" TEXT="$ git diff &lt;commit&gt;">
<node CREATED="1416407952543" ID="ID_290271875" MODIFIED="1416409086638" TEXT="$ git diff &lt;commit&gt; &lt;commit&gt;"/>
</node>
<node CREATED="1416407952543" ID="ID_893909459" MODIFIED="1416409558592" TEXT="$ git merge &lt;branch&gt;">
<node CREATED="1416409586543" ID="ID_1634098584" MODIFIED="1416409595433" TEXT="unisce due branch"/>
</node>
</node>
<node CREATED="1398984157639" FOLDED="true" ID="ID_770359403" MODIFIED="1417125012117" POSITION="right" TEXT="Stash">
<node CREATED="1399934809188" ID="ID_105157766" MODIFIED="1399934811272" TEXT="Stashing takes the dirty state of your working directory &#x2014; that is, your modified tracked files and staged changes &#x2014; and saves it on a stack of unfinished changes"/>
</node>
<node CREATED="1414049003590" ID="ID_814733572" MODIFIED="1417125021152" POSITION="right" TEXT="Operazioni sui file">
<node CREATED="1414048866719" ID="ID_1248388801" MODIFIED="1414048907625" TEXT="Stage">
<node CREATED="1414048909584" ID="ID_1130556251" MODIFIED="1414048915366" TEXT="mette un file nell&apos;index."/>
<node CREATED="1414048968035" ID="ID_296218091" MODIFIED="1414049189209" TEXT="al prossimo commit le modifiche di questo file verranno incluse nel working tree"/>
</node>
<node CREATED="1399935247638" ID="ID_436364612" MODIFIED="1414049034978" TEXT="Unstage">
<node CREATED="1399935251142" ID="ID_792622373" MODIFIED="1414048899679" TEXT="toglie un file dall&apos;Index"/>
<node CREATED="1414048968035" ID="ID_733259043" MODIFIED="1414049076671" TEXT="al prossimo commit le modifiche di questo file non verranno incluse nel working tree"/>
</node>
<node CREATED="1414048866719" ID="ID_1192145671" MODIFIED="1414049084409" TEXT="Remove">
<node CREATED="1414048909584" ID="ID_1278342512" MODIFIED="1414049342753" TEXT="toglie un file dal working tree. "/>
<node CREATED="1414049108365" ID="ID_1463398032" MODIFIED="1414049340610" TEXT="questo implica che quel file non &#xe8; pi&#xf9; in controllo di revisione. "/>
<node CREATED="1414049343682" ID="ID_1255344703" MODIFIED="1414049571624" TEXT="Le modifiche a quel file verranno viste da Git, ma da ora in poi Git lo considerer&#xe0; &quot;untracked&quot;, come se fosse un file nuovo. Per averlo di nuovo nel working tree e nel repository sar&#xe0; necessario metterlo di nuovo in staging. "/>
</node>
<node CREATED="1414049247658" ID="ID_1774512876" MODIFIED="1414049249743" TEXT="Discard">
<node CREATED="1414049267673" ID="ID_216676360" MODIFIED="1414049298366" TEXT="Riporta un file alla condizione memorizzata nel working tree"/>
<node CREATED="1414049581083" ID="ID_1298117850" MODIFIED="1414049637859" TEXT="Il file che abbiamo nella cartella di lavoro viene sovrascritto con quello presente nel working tree. "/>
</node>
<node CREATED="1399935295899" ID="ID_805853154" MODIFIED="1399935300688" TEXT="Commit">
<node CREATED="1414049646334" ID="ID_821077818" MODIFIED="1414049691162" TEXT="Copia nel working tree tutte le modifiche dei file che sono in fase di staging (nell&apos;Index)">
<node CREATED="1399935401602" ID="ID_793310938" MODIFIED="1414049706751" TEXT="E&apos; un&apos;operazione LOCALE"/>
<node CREATED="1414049707125" ID="ID_1065481252" MODIFIED="1414049730743" TEXT="Nel repository remoto non succede niente. "/>
</node>
</node>
<node CREATED="1398850165001" ID="ID_437269643" MODIFIED="1398850378913" TEXT="Branch">
<node CREATED="1398850400493" ID="ID_1982159325" MODIFIED="1398850479061" TEXT="Biforcazioni del progetto che possono essere sviluppate separatemente, avendo strumenti per rimetterele insieme, in tutto od in parte, se necessario."/>
</node>
<node CREATED="1414049732563" ID="ID_924992994" MODIFIED="1414049736257" TEXT="Clone"/>
<node CREATED="1414049736646" ID="ID_407451423" MODIFIED="1414049752187" TEXT="Checkout"/>
<node CREATED="1398986440594" ID="ID_866403141" MODIFIED="1398986443600" TEXT="Cherry pick"/>
<node CREATED="1414049160465" ID="ID_1468243786" MODIFIED="1414049161918" TEXT="Merge"/>
<node CREATED="1398969958330" ID="ID_258488560" MODIFIED="1398969974596" TEXT="Rebase HEAD"/>
</node>
<node CREATED="1398962266615" FOLDED="true" ID="ID_1658306564" MODIFIED="1414049166403" POSITION="right" TEXT="Uso di SmartGit/Hg">
<node CREATED="1398962280911" ID="ID_1706072830" MODIFIED="1398962347265" TEXT="Client per Windows"/>
<node CREATED="1398962347697" ID="ID_124908249" MODIFIED="1398962374055" TEXT="Per collegarsi ad un cloud (repository Internet)">
<node CREATED="1398962375197" ID="ID_1197945192" MODIFIED="1398962776797" TEXT="La versione a pagamento facilita le operazioni di generazione e gestione delle chiavi"/>
<node CREATED="1398962389427" ID="ID_779720096" MODIFIED="1398962416077" TEXT="La versione gratuita richiede di configurare manualmente">
<node CREATED="1398962470664" ID="ID_104475320" MODIFIED="1398983183078" TEXT="1 - sul server che si usa (GitHub, bitbucket ..): la chiave pubblica che identifica l&apos;utente"/>
<node CREATED="1398962416931" ID="ID_689984146" MODIFIED="1398983159733" TEXT="2 - sul programma client (SmartGit): la chiave privata dell&apos;utente, quella che corrisponde alla chiave pubblica. Anch&apos;essa generata con PuTTYgen. "/>
</node>
<node CREATED="1398962882714" ID="ID_1761664476" MODIFIED="1398983168459" TEXT="La prima cosa da fare &#xe8; generare le chiavi">
<node CREATED="1398962787958" ID="ID_1511119736" MODIFIED="1398962937701" TEXT="si pu&#xf2; usare il programma puttygen.exe">
<node CREATED="1398962938591" ID="ID_347792349" MODIFIED="1398968448450" TEXT="&#xe8; un programma &quot;della serie&quot; di PuTTY, si scarica dalla stessa pagina di PuTTY"/>
</node>
<node CREATED="1398963265830" ID="ID_1490791142" MODIFIED="1398963273690" TEXT="1 - lanciare puttygen.exe"/>
<node CREATED="1398963288684" ID="ID_1227169713" MODIFIED="1398963360743" TEXT="2 - premere &quot;generate&quot; e muovere il mouse in modo casuale nello spazio vuoto della finestra "/>
<node CREATED="1398963365664" ID="ID_124900716" MODIFIED="1407152618580" TEXT="3 - quando ha finito la chiave viene scritta nella casella dove c&apos;&#xe8; scritto &quot;ssh-rsa AAAA ..&quot;">
<node CREATED="1398968239455" ID="ID_1190507728" MODIFIED="1398968249229" TEXT="Scrive la chiave pubblica"/>
<node CREATED="1398968197007" ID="ID_36734342" MODIFIED="1404717238295" TEXT="Dalla finestra si pu&#xf2; fare copia e incolla per metterlo ove viene richiesto (p.es. vedi oltre)"/>
</node>
<node CREATED="1398968504577" ID="ID_1568975560" MODIFIED="1398968589732" TEXT="4 - la forma &quot;ASCII&quot; della chiave privata vien creata con un&apos;altra chiave, la &quot;passphrase&quot;">
<node CREATED="1398968590841" ID="ID_445459058" MODIFIED="1398968658365" TEXT="la &quot;passphrase&quot; deve essere messa sotto il commento, che pu&#xf2; anche essere cambiato"/>
<node CREATED="1398968661993" ID="ID_636304296" MODIFIED="1398968690296" TEXT="viene messa due volte per controllare che sia giusta"/>
</node>
<node CREATED="1398968706682" ID="ID_121005223" MODIFIED="1398968836832" TEXT="5 - salvare la chiave pubblica cliccando il bottone &quot;Save public key&quot;"/>
<node CREATED="1398968706682" ID="ID_1336774716" MODIFIED="1398968892089" TEXT="6 - NON salvare la chiave privata cliccando il bottone &quot;Save private key&quot;">
<node CREATED="1398968892999" ID="ID_892330805" MODIFIED="1398968949511" TEXT="non serve, perch&#xe8; salva con un formato PuTTY, che non va bene per SmartGit"/>
</node>
<node CREATED="1398968958636" ID="ID_1397095606" MODIFIED="1398968991493" TEXT="7 - salvare la chiave privata in un file compatibile con OpenSSH">
<node CREATED="1398969009098" ID="ID_441383552" MODIFIED="1398969096863" TEXT="Usare il men&#xf9; &quot;Conversions&quot; di puttygen.exe, poi scegliere &quot;Export OpenSSH key&quot;"/>
<node CREATED="1398969097488" ID="ID_584666344" MODIFIED="1398969263695" TEXT="Dare il nome al file, che servir&#xe0; in seguito come chiave privata per le comunicazioni SSH che vorremo fare (in particolare fra il server Git ed il client SmartGit"/>
<node CREATED="1398969108282" ID="ID_1584170305" MODIFIED="1398969272641" TEXT="Occorre ricordare la passphrase, che servir&#xe0; quando la chiave privata dovr&#xe0; essere usata"/>
</node>
<node CREATED="1398963375228" ID="ID_249153878" MODIFIED="1398963376582" TEXT="puttygen.exe">
<node CREATED="1398963377491" ID="ID_773269454" MODIFIED="1398963392868" TEXT="pu&#xf2; anche leggere i file con le chiavi a convertirli"/>
<node CREATED="1398968730698" ID="ID_599549088" MODIFIED="1398968750932" TEXT="con il bottone &quot;Load&quot;"/>
</node>
</node>
<node CREATED="1398981489394" ID="ID_549038814" MODIFIED="1398981579147" TEXT="1 - configurazione del server del repository">
<node CREATED="1398981617532" ID="ID_460576761" MODIFIED="1398983191114" TEXT="bitbucket">
<node CREATED="1398981635663" ID="ID_594375083" MODIFIED="1398981639033" TEXT="Via Web">
<node CREATED="1398981625913" ID="ID_1985458323" MODIFIED="1398981675005" TEXT="Fare un account"/>
<node CREATED="1398981682642" ID="ID_1929119321" MODIFIED="1398981756404" TEXT="Con il bottone &quot;Create&quot; creare un nuovo repository, dargli un nome"/>
<node CREATED="1398982065474" ID="ID_1449807098" MODIFIED="1398982067665" TEXT="SSH">
<node CREATED="1398982069971" ID="ID_834778276" MODIFIED="1398982116278" TEXT="Il server comunicher&#xe0; con il client attraverso SSH."/>
<node CREATED="1398981947504" ID="ID_82237348" MODIFIED="1398982128081" TEXT="Bisogna impostare la chiave privata del client, con la quale esso si potr&#xe0; accreditare sul server"/>
<node CREATED="1398982161134" ID="ID_714740206" MODIFIED="1398982176840" TEXT="Sul sito Web, cercare &quot;SSH&quot; e cliccare"/>
<node CREATED="1398982177622" ID="ID_139660124" MODIFIED="1398982195247" TEXT="Premere il bottone &quot;Add key&quot;"/>
<node CREATED="1398982208940" ID="ID_416991436" MODIFIED="1398982336113" TEXT="Dare un nome alla chiave, ce ne possono essere molte. Meglio una chiave diversa per ogni persona che user&#xe0; il server. "/>
<node CREATED="1398982342623" ID="ID_1525835687" MODIFIED="1398983213480" TEXT="Incollare nella casella &quot;Key&quot; la chiave PUBBLICA ottenuta da PuTTYgen. Prenderla dalla casella dove esce in PuTTYgen o dal file che PuTTYgen genera. &#xa;Se si prende dal file il fine deve iniziare con &#xa;---- BEGIN SSH2 PUBLIC KEY ----&#xa;Comment: &quot;il commento indicato in PuTTYgen&quot;&#xa;poi segue la chiave, che deve iniziare con &#xa;AAAA e finire con ==&#xa;---- END SSH2 PUBLIC KEY ----&#xa;">
<node CREATED="1407153885818" ID="ID_603768111" MODIFIED="1407153917282" TEXT="int tal caso prima della chiave ci deve essere "/>
<node CREATED="1407153917892" ID="ID_1293748584" MODIFIED="1407153931362" TEXT="ssh-rsa "/>
<node CREATED="1407153933959" ID="ID_1736892898" MODIFIED="1407153992868" TEXT="poi, a capo, la chiave, che finisce con=="/>
<node CREATED="1407153974666" ID="ID_1422409765" MODIFIED="1407154004549" TEXT="poi"/>
<node CREATED="1407154004760" ID="ID_1672813668" MODIFIED="1407154012647" TEXT="  imported-openssh-key">
<node CREATED="1407154018529" ID="ID_133389599" MODIFIED="1407154036066" TEXT="con spazio prima e niente a capo"/>
</node>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1398983470465" ID="ID_1633410422" MODIFIED="1398983494038" TEXT="2 - Configurazione del client Git">
<node CREATED="1398969289145" ID="ID_1061713262" MODIFIED="1398983513864" TEXT="SmartGit">
<node CREATED="1398983516033" ID="ID_776168494" MODIFIED="1398983523383" TEXT="Scegliere"/>
<node CREATED="1398969322040" ID="ID_223245120" MODIFIED="1398969337609" TEXT="Men&#xf9; &quot;Remote&quot; | Add"/>
<node CREATED="1398969342362" ID="ID_1467705388" MODIFIED="1398969359259" TEXT="Combo URL or Path">
<node CREATED="1398969360285" ID="ID_766833700" MODIFIED="1398969440238" TEXT="Scrivere la URL, se ci si collega via HTTP, o la stringa identificativa dell&apos;utente e della path, con la sintassi richiesta dal servizio che si vuole utilizzare"/>
<node CREATED="1398969448705" ID="ID_1849408585" MODIFIED="1398981436613" TEXT="La sintassi va cercata nel sito del servizio, SmartGit conosce la sintassi dei servizi pi&#xf9; comuni (es. GitHub o bitbucket) e ci permette di fare un login di prova. Dai dati del login di prova prepara la stringa di accesso. "/>
</node>
<node CREATED="1404717402242" ID="ID_1087729947" MODIFIED="1404717476986" TEXT="La prima volta che si usa un servizio SmartGit/Hg deve sapere la chiave PRIVATA ssh con la quale deve crittare i dati rivolti al servizio">
<node CREATED="1404717478815" ID="ID_246096114" MODIFIED="1404717498301" TEXT="SmartGit chiede">
<node CREATED="1404717499552" ID="ID_1431321782" MODIFIED="1404717516378" TEXT="SSH credentials">
<node CREATED="1404717524786" ID="ID_1398267166" MODIFIED="1404717626738" TEXT="Provide the credentials to authenticate to .. &quot;bitbucket.org&quot; as user  XXXX"/>
<node CREATED="1404717627786" ID="ID_1913196706" MODIFIED="1404717642649" TEXT="Controllare che l&apos;utente indicato sia XXXX"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1403730732314" ID="ID_842999554" MODIFIED="1403730750953" TEXT="3 - prendere i file dal repository">
<node CREATED="1403730751846" ID="ID_547571806" MODIFIED="1403730755849" TEXT="pull"/>
</node>
</node>
</node>
<node CREATED="1399923738497" ID="ID_1128105696" MODIFIED="1399924589495" POSITION="left" TEXT="Git + Agile (da YouTube)">
<node CREATED="1399927275071" ID="ID_1586244289" MODIFIED="1399927343153" TEXT="Git Branching for Agile Teams (Webinar su Youtube)"/>
<node CREATED="1399923843678" ID="ID_1959083251" MODIFIED="1399923851076" TEXT="making releases a non event">
<node CREATED="1399923954073" ID="ID_1115750541" MODIFIED="1399923973615" TEXT="testing in codind changes from every team developer"/>
<node CREATED="1399923983622" ID="ID_257926230" MODIFIED="1399924003077" TEXT="frequent changes to be tested"/>
</node>
<node CREATED="1399924010147" ID="ID_628435112" MODIFIED="1399924011959" TEXT="Git">
<node CREATED="1399924026540" FOLDED="true" ID="ID_636889997" MODIFIED="1399927309206" TEXT="SVN">
<node CREATED="1399924016258" ID="ID_1749798585" MODIFIED="1399924048910" TEXT="Branching &amp; merging is hell"/>
<node CREATED="1399924063973" ID="ID_581343287" MODIFIED="1399924087348" TEXT="everybody stops until merge is done"/>
<node CREATED="1399924099119" ID="ID_1065898291" MODIFIED="1399924115060" TEXT="waiting until implementation is done"/>
</node>
<node CREATED="1399924122468" ID="ID_1339326495" MODIFIED="1399924175577" TEXT="store data as snapshots"/>
<node CREATED="1399924138590" ID="ID_1462239136" MODIFIED="1399924221744" TEXT="Git knows how the files in your branch are changed, in relation with the topology of branches"/>
<node CREATED="1399924222292" ID="ID_662543024" MODIFIED="1399924227667" TEXT="merge is quick">
<node CREATED="1399924241599" ID="ID_1426143260" MODIFIED="1399924243510" TEXT="trivial"/>
</node>
<node CREATED="1399924255891" FOLDED="true" ID="ID_1267422091" MODIFIED="1399927306463" TEXT="Branch per Issue Workflow">
<node CREATED="1399924455298" ID="ID_1601968014" MODIFIED="1399924472983" TEXT="master code line"/>
<node CREATED="1399924473501" ID="ID_1282824304" MODIFIED="1399924484964" TEXT="a branch per issue"/>
<node CREATED="1399924492855" ID="ID_848766308" MODIFIED="1399924502274" TEXT="issue NOT FEATURE">
<node CREATED="1399924503049" ID="ID_1181739193" MODIFIED="1399924516882" TEXT="a feature can contain more issue"/>
</node>
<node CREATED="1399924517799" ID="ID_453742539" MODIFIED="1399924534148" TEXT="useful if you use a issue tracker">
<node CREATED="1399924561200" ID="ID_566307101" MODIFIED="1399924576774" TEXT="the brach is the code in the issue tracker"/>
<node CREATED="1399924614528" ID="ID_915070460" MODIFIED="1399924626809" TEXT="the new branch is isolated"/>
<node CREATED="1399924628779" ID="ID_266437570" MODIFIED="1399924635167" TEXT="develop in isolation"/>
<node CREATED="1399924836169" ID="ID_478784647" MODIFIED="1399924852234" TEXT="make integration test on local branch"/>
<node CREATED="1399924638651" ID="ID_1142588780" MODIFIED="1399924656801" TEXT="alla fine: the branch is safe to merge in the master"/>
</node>
<node CREATED="1399924274310" ID="ID_882121735" MODIFIED="1399924812574" TEXT="Un branch per ogni &quot;user story&quot; che si implementa"/>
<node CREATED="1399924300623" ID="ID_754675469" MODIFIED="1399924312200" TEXT="dev branch = isolation chamber"/>
<node CREATED="1399924355498" ID="ID_135212157" MODIFIED="1399924366083" TEXT="select what comes into master"/>
<node CREATED="1399924392960" ID="ID_1046786260" MODIFIED="1399924418479" TEXT="is clear which issue is taken care in each branch"/>
</node>
<node CREATED="1399924777625" FOLDED="true" ID="ID_1295411721" MODIFIED="1399925052688" TEXT="Using an Integration Branch">
<node CREATED="1399924875146" ID="ID_859647359" MODIFIED="1399924894753" TEXT="oltre al master branch c&apos;&#xe8; un integration branch"/>
<node CREATED="1399924897696" ID="ID_833386498" MODIFIED="1399924919275" TEXT="le release si fanno nell&apos;integration branch ">
<node CREATED="1399924925325" ID="ID_1447162057" MODIFIED="1399924969602" TEXT="sull&apos;int. branch si fanno sull&apos;integration branch"/>
<node CREATED="1399924938894" ID="ID_1980584731" MODIFIED="1399924952280" TEXT="int. brach &quot;MANUALLY TRIGGERED &quot;"/>
<node CREATED="1399924975114" ID="ID_1954095975" MODIFIED="1399925044899" TEXT="una volta che l&apos;it. branch funziona, si fa il merge dal dev branch al MASTER direttamente, perch&#xe8; l&apos;integr. branch pu&#xf2; avere featurenon ancora pronte"/>
</node>
</node>
<node CREATED="1399925054047" FOLDED="true" ID="ID_1774294364" MODIFIED="1399925308724" TEXT="Branch per Issue">
<node CREATED="1399925076455" ID="ID_1992236185" MODIFIED="1399925094582" TEXT="for installed app teams"/>
<node CREATED="1399925103754" ID="ID_307836325" MODIFIED="1399925119265" TEXT="mantain multiple versions of your application"/>
<node CREATED="1399925134289" ID="ID_1687930109" MODIFIED="1399925253696" TEXT="uguale a prima, una integration branch di ogni versione, che rimane vivo fino a che la versione rimae supportata"/>
<node CREATED="1399925254242" ID="ID_1175031622" MODIFIED="1399925267818" TEXT="es. bugfix version">
<node CREATED="1399925277674" ID="ID_13858080" MODIFIED="1399925292119" TEXT="merging in ogni versione ancora mantenuta"/>
</node>
</node>
<node CREATED="1399925310889" FOLDED="true" ID="ID_608075" MODIFIED="1399927305042" TEXT="Continuos integration (CI) and peer review">
<node CREATED="1399925376000" ID="ID_443915981" MODIFIED="1399925403227" TEXT="automated test applied frequently"/>
<node CREATED="1399925489887" ID="ID_80993489" MODIFIED="1399925499767" TEXT="running CI on dev branches"/>
<node CREATED="1399925719897" ID="ID_1116401515" MODIFIED="1399925726657" TEXT="peer code review">
<node CREATED="1399925794764" ID="ID_1357907602" MODIFIED="1399925812173" TEXT="create a request of peer review"/>
<node CREATED="1399925813380" ID="ID_400003532" MODIFIED="1399925827469" TEXT="review, revise, rinse &amp; report"/>
<node CREATED="1399925835530" ID="ID_70990174" MODIFIED="1399925843310" TEXT="approve &amp; merge"/>
</node>
</node>
<node CREATED="1399926740694" ID="ID_19978568" MODIFIED="1399926752219" TEXT="merge versus rebase">
<node CREATED="1399926753486" ID="ID_1028993593" MODIFIED="1399926757544" TEXT="da guardare"/>
</node>
</node>
</node>
<node CREATED="1399932711241" ID="ID_1601211509" MODIFIED="1399932712409" POSITION="left" TEXT="http://www.kdgregory.com/index.php?page=scm.git">
<node CREATED="1399932700865" ID="ID_753868058" MODIFIED="1399932703453" TEXT="integration czar ">
<node CREATED="1399932718159" ID="ID_1289355568" MODIFIED="1399932735436" TEXT="unico responsabile per i push nel repository comune"/>
<node CREATED="1399932749312" ID="ID_1172194660" MODIFIED="1399932750439" TEXT="This person ensures that everything merges cleanly, and works with the other team members when it doesn&apos;t."/>
<node CREATED="1399932770243" ID="ID_1684931872" MODIFIED="1399932776360" TEXT="the integration czar can change"/>
</node>
<node CREATED="1399932840226" ID="ID_1612094891" MODIFIED="1399932924607" TEXT="Each Separately-releasable Codebase Gets Its Own Repository">
<node CREATED="1399932931745" ID="ID_1837644652" MODIFIED="1399932933194" TEXT="how to integrate these separate repositories."/>
</node>
<node CREATED="1399933081920" ID="ID_234895465" MODIFIED="1399933083070" TEXT="Master is for Integration, not Development">
<node CREATED="1399933144815" ID="ID_142625915" MODIFIED="1399933145952" TEXT="master holds all commits between your current revision and the point where you forked. "/>
<node CREATED="1399933161157" ID="ID_925807370" MODIFIED="1399933162208" TEXT="create a branch for each piece of functionality, and merge completed pieces into master "/>
<node CREATED="1399933218859" ID="ID_761924637" MODIFIED="1399933220012" TEXT="the central repository&apos;s copy of master only holds commits for completed work">
<node CREATED="1399933238105" ID="ID_995332208" MODIFIED="1399933239269" TEXT="it is always in a &#x201c;potentially shippable&#x201d; state"/>
</node>
</node>
<node CREATED="1399934299171" ID="ID_1828504116" MODIFIED="1399934301052" TEXT="GitHub">
<node CREATED="1399934302325" ID="ID_1843597985" MODIFIED="1399934303334" TEXT="One interesting feature of GitHub is the &#x201c;pull request&#x201d; "/>
<node CREATED="1399934327067" ID="ID_1206520708" MODIFIED="1399934328954" TEXT="you make some changes, push them to your repository, and submit a pull request. The owner of the base repository gets notified of your changes, and can easily review them"/>
</node>
</node>
</node>
</map>
