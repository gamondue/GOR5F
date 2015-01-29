<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1416404522135" ID="ID_1200117218" MODIFIED="1416404547716" TEXT="Corso Git">
<node CREATED="1416404548747" ID="ID_388350786" MODIFIED="1416582441462" POSITION="right" TEXT="2014-11-19">
<node CREATED="1417081136477" ID="ID_1588703433" MODIFIED="1417081307428" STYLE="fork" TEXT="Relatore: Ali Servet Donmez"/>
</node>
<node CREATED="1416404584611" ID="ID_589720759" MODIFIED="1417081016761" POSITION="right" TEXT="Casi in cui non ha senso usare Git">
<node CREATED="1416404666416" ID="ID_1661877664" MODIFIED="1416404686517" TEXT="Per il backup"/>
<node CREATED="1416404695239" ID="ID_76217922" MODIFIED="1416404752481" TEXT="Il controllo di revisione si pu&#xf2; fare anche da DropBox">
<node CREATED="1416404839846" ID="ID_1264764081" MODIFIED="1417081028986" TEXT="oppure Pixelapps"/>
</node>
<node CREATED="1416404761381" ID="ID_200929003" MODIFIED="1416404783748" TEXT="Serve per esplorare percorsi alternativi"/>
<node CREATED="1416404800320" ID="ID_819856664" MODIFIED="1416404817568" TEXT="Meglio non usare con file troppo grandi">
<node CREATED="1417081045609" ID="ID_1768986052" MODIFIED="1417081055347" TEXT="es. audio, video"/>
<node CREATED="1417081056560" ID="ID_1407528722" MODIFIED="1417081787002" TEXT="perch&#xe8; sono compressi, Git non riesce a trovare le differenze e memorizza sempre tutto, ad ogni minima modifica. L&apos;ccupazione di memoria di massa diventa enorme. "/>
</node>
</node>
<node CREATED="1416404890088" ID="ID_1510538761" MODIFIED="1416404901325" POSITION="right" TEXT="Caso ideale">
<node CREATED="1416404903056" ID="ID_1231019056" MODIFIED="1416404907617" TEXT="programmatori">
<node CREATED="1416404908232" ID="ID_32132744" MODIFIED="1416404911904" TEXT="collaborano"/>
<node CREATED="1416404915952" ID="ID_812128494" MODIFIED="1416404929092" TEXT="possono prendere strade diverse"/>
</node>
</node>
<node CREATED="1416405008705" ID="ID_230355879" MODIFIED="1416405010799" POSITION="right" TEXT="Git">
<node CREATED="1416405013233" ID="ID_1631388028" MODIFIED="1416405017280" TEXT="disconnesso"/>
<node CREATED="1416405017741" ID="ID_122899453" MODIFIED="1416405023601" TEXT="distribuito"/>
<node CREATED="1416405024261" ID="ID_803376975" MODIFIED="1416405031652" TEXT="non lineare"/>
</node>
<node CREATED="1416405040732" ID="ID_573132531" MODIFIED="1417081808550" POSITION="right" TEXT="Esistono client grafici, ma &#xe8; meglio imparare prima da terminale"/>
<node CREATED="1416405289686" ID="ID_172060207" MODIFIED="1416405302764" POSITION="right" TEXT="controllo a linea di comando"/>
<node CREATED="1416405346277" ID="ID_1395742288" MODIFIED="1416405701474" POSITION="right" TEXT="$ git">
<node CREATED="1417125742183" ID="ID_982181781" MODIFIED="1417125769712" TEXT="al prompt della shell ($, in Linux e Mac)"/>
<node CREATED="1417125770234" ID="ID_1985226093" MODIFIED="1417125844327" TEXT="l&apos;installazione Windows installa anche una gitbash, che &#xe8; una shell fatta apposta per Git. Funziona come bash, ma va in Windows"/>
</node>
<node CREATED="1416405346277" ID="ID_1906145169" MODIFIED="1416405373855" POSITION="right" TEXT="$ git help &lt;command&gt;">
<node CREATED="1417125041840" ID="ID_1786334970" MODIFIED="1417125047827" TEXT="per avere aiuto"/>
<node CREATED="1417125048443" ID="ID_150871705" MODIFIED="1417125143827" TEXT="(in Windows fa partire un help HTML da file)"/>
</node>
<node CREATED="1416405346277" ID="ID_1701225401" MODIFIED="1416406027864" POSITION="right" TEXT="$ git  init">
<node CREATED="1416406069257" ID="ID_742256077" MODIFIED="1417125882162" TEXT="crea una nuova repository nella cartella in cui mi trovo">
<node CREATED="1417125952860" ID="ID_1300013941" MODIFIED="1417125994524" TEXT="&#xe8; il &quot;bidone&quot; che si tiene sincronizzato e che contiene tutto, variazioni comprese"/>
<node CREATED="1416406226159" ID="ID_1103205669" MODIFIED="1416406231231" TEXT="repository">
<node CREATED="1416406234908" ID="ID_375313557" MODIFIED="1417127302482" TEXT="file e TUTTE le modifiche &quot;committate&quot; in passato"/>
</node>
</node>
<node CREATED="1416406126573" ID="ID_748580874" MODIFIED="1417125895745" TEXT="crea una cartella .git nascosta che serve per la memorizzazione di tutte le differenze di tutte le versioni che vengono &quot;committate&quot;"/>
</node>
<node CREATED="1416405346277" ID="ID_1351681490" MODIFIED="1416406319160" POSITION="right" TEXT="$ git add &lt;file&gt;">
<node CREATED="1416406395543" ID="ID_501031118" MODIFIED="1417126547158" TEXT="aggiunge ai file da mettere, in seguito, fra le versioni memorizzate"/>
<node CREATED="1416406445657" ID="ID_1200876889" MODIFIED="1417125655245" TEXT="&#xe8; necessario farlo SOLO PER LE COSE NUOVE">
<node CREATED="1417125659399" ID="ID_161086727" MODIFIED="1422555532209" TEXT="git si ricorda dei file che sono gi&#xe0; state &quot;aggiunti&quot;"/>
</node>
</node>
<node CREATED="1416405346277" ID="ID_1824382994" MODIFIED="1416406830887" POSITION="right" TEXT="$ git commit -m &quot;&lt;descrizione&gt;&quot;">
<node CREATED="1417126579595" ID="ID_41123655" MODIFIED="1417126602123" TEXT="memorizza permanentemente tutti i file che sono stati &quot;aggiunti&quot;"/>
</node>
<node CREATED="1416405346277" ID="ID_1905087078" MODIFIED="1416407063939" POSITION="right" TEXT="$ git log">
<node CREATED="1416407066663" ID="ID_26488116" MODIFIED="1416407090851" TEXT="si vede lo storico che c&apos;&#xe8; nel bidone"/>
<node CREATED="1417126042112" ID="ID_656050048" MODIFIED="1417126046352" TEXT="tutti i commit"/>
</node>
<node CREATED="1416407250663" ID="ID_1074380447" MODIFIED="1416407264388" POSITION="right" TEXT="$ git status">
<node CREATED="1416407268971" ID="ID_1404696412" MODIFIED="1416407291722" TEXT="guardare come stanno le cose"/>
<node CREATED="1416407292351" ID="ID_740467882" MODIFIED="1417126759215" TEXT="i file che sono cambiati rispetto alla versione corrente che abbiamo &quot;committato&quot;"/>
<node CREATED="1416407301831" ID="ID_709414085" MODIFIED="1416407319503" TEXT="cosa &#xe8; stato cancellato"/>
</node>
<node CREATED="1416405346277" ID="ID_1675836365" MODIFIED="1416407684120" POSITION="right" TEXT="$ git branch">
<node CREATED="1416407989566" ID="ID_858191636" MODIFIED="1416408029685" TEXT="senza parametri: elenco dei branch esistenti"/>
</node>
<node CREATED="1416405346277" ID="ID_300547336" MODIFIED="1417126835794" POSITION="right" TEXT="$ git branch &lt;nome del branch&gt;">
<node CREATED="1417126840823" ID="ID_455330431" MODIFIED="1417126952505" TEXT="crea un nuovo &quot;ramo&quot; nell&apos;albero delle versioni facendolo partire dal repository corrente"/>
</node>
<node CREATED="1416405346277" ID="ID_1092466675" MODIFIED="1417126891471" POSITION="right" TEXT="$ git branch &lt;nome del branch&gt; &lt;nome del punto da cui si vuole partire&gt;">
<node CREATED="1417126840823" ID="ID_81241456" MODIFIED="1417126935687" TEXT="crea un nuovo ramo nell&apos;albero delle versioni, facendolo partire dal branch il cui nome &#xe8; stato indicato"/>
</node>
<node CREATED="1416405346277" ID="ID_1886515873" MODIFIED="1417127018183" POSITION="right" TEXT="$ git branch -d">
<node CREATED="1416407878552" ID="ID_1241096944" MODIFIED="1417127004678" TEXT="l&apos;opzione -d (delete) cancella un branch"/>
</node>
<node CREATED="1416407952543" ID="ID_1357404541" MODIFIED="1416408727228" POSITION="right" TEXT="$ git checkout &lt;nome del branch&gt;">
<node CREATED="1417127030385" ID="ID_1137424898" MODIFIED="1417127086818" TEXT="ripristina tutti i file del repository alla condizione che avevano al momento del commit del branch indicato"/>
</node>
<node CREATED="1416407952543" ID="ID_1341112570" MODIFIED="1416409055237" POSITION="right" TEXT="$ git diff &lt;commit&gt;">
<node CREATED="1417127107893" ID="ID_1449340457" MODIFIED="1417127138130" TEXT="fa vedere le differenze fra il commit indicato e la situazione corrente del repository"/>
</node>
<node CREATED="1416407952543" ID="ID_290271875" MODIFIED="1416409086638" POSITION="right" TEXT="$ git diff &lt;commit&gt; &lt;commit&gt;">
<node CREATED="1417127107893" ID="ID_1936245316" MODIFIED="1417127158523" TEXT="fa vedere le differenze fra i due commit indicati"/>
</node>
<node CREATED="1416407952543" ID="ID_893909459" MODIFIED="1416409558592" POSITION="right" TEXT="$ git merge &lt;branch&gt;">
<node CREATED="1416409586543" ID="ID_1634098584" MODIFIED="1416409595433" TEXT="unisce due branch"/>
<node CREATED="1417127164748" ID="ID_8467671" MODIFIED="1417127192302" TEXT="le modifiche &quot;lontane&quot; e non &quot;pericolose&quot; sono &quot;fuse&quot;">
<node CREATED="1417127192825" ID="ID_1170700271" MODIFIED="1417127254017" TEXT="si mettono insieme le parti di file che sono solo su uno dei due branche"/>
</node>
</node>
<node CREATED="1416582491619" ID="ID_334392418" MODIFIED="1416582502011" POSITION="right" TEXT="2014-11-21"/>
<node CREATED="1416580013778" ID="ID_304103959" MODIFIED="1416580031760" POSITION="right" TEXT="creazione utenti con git config"/>
<node CREATED="1416405346277" ID="ID_457790415" MODIFIED="1416405778670" POSITION="right" TEXT="$ git config --global user --global user .name &quot;..&quot;">
<node CREATED="1416405796165" ID="ID_1156633978" MODIFIED="1417127328057" TEXT="global = configurazione valida per tutto il sistema"/>
</node>
<node CREATED="1416580615262" ID="ID_1811138032" MODIFIED="1417128400892" POSITION="right" TEXT="$ git clone">
<node CREATED="1416579938833" ID="ID_1604381611" MODIFIED="1422548669907" TEXT="clone del progetto git su una cartella &quot;radice&quot; diversa"/>
</node>
<node CREATED="1416580574689" ID="ID_896636482" MODIFIED="1417129407015" POSITION="right" TEXT="git remote add &lt;nome locale&gt; &lt;repository remoto&gt;">
<node CREATED="1416580712151" ID="ID_571419912" MODIFIED="1417129423584" TEXT="dopo add, i &quot;bidoni&quot; si &quot;conoscono&quot; e si possono comunicare le modifiche"/>
<node CREATED="1416580890098" ID="ID_686783729" MODIFIED="1416580896708" TEXT="nome = utente"/>
<node CREATED="1416580898978" ID="ID_1449548142" MODIFIED="1417129665466" TEXT="&lt;repository remoto&gt;">
<node CREATED="1417129666609" ID="ID_573623982" MODIFIED="1417129674478" TEXT="es.">
<node CREATED="1417129675567" ID="ID_647310782" MODIFIED="1417129732303" TEXT="gabriele@172.16.46.2:/d/Git/Linux"/>
<node CREATED="1422549754915" ID="ID_1398129288" MODIFIED="1422549771570" TEXT="oppure una URL di un repository Internet"/>
</node>
</node>
</node>
<node CREATED="1416580598057" ID="ID_1532173748" MODIFIED="1417130686523" POSITION="right" TEXT="$ git remote remove &lt;nome del remote da cancellare&gt;"/>
<node CREATED="1416580939388" ID="ID_1803244953" MODIFIED="1417128519664" POSITION="right" TEXT="$ git fetch &lt;remote&gt;">
<node CREATED="1416580959827" ID="ID_1414731241" MODIFIED="1416581050458" TEXT="aggiorna dal remoto tutti i branch dal remote e li porta in pancia del nostro repository"/>
<node CREATED="1416581114341" ID="ID_1926841564" MODIFIED="1416581243352" TEXT="remote &#xe8; il nome"/>
</node>
<node CREATED="1416580751707" ID="ID_674518836" MODIFIED="1417128406105" POSITION="right" TEXT="$ git remote ">
<node CREATED="1416580770136" ID="ID_1534003025" MODIFIED="1416580807842" TEXT="senza parametri fa vedere tutti i remote che sono stati definiti per quell&apos;utente"/>
<node CREATED="1422549556266" ID="ID_534005180" MODIFIED="1422549564464" TEXT="git remote -v ">
<node CREATED="1422549565469" ID="ID_1780121508" MODIFIED="1422550173136" TEXT="fa vedere i &quot;remote&quot; e la configurazione data loro">
<node CREATED="1422550110346" ID="ID_1591926513" MODIFIED="1422550128237" TEXT="la cartella"/>
<node CREATED="1422550119843" ID="ID_1969501584" MODIFIED="1422550122242" TEXT="oppure"/>
<node CREATED="1422550122509" ID="ID_728499711" MODIFIED="1422550137099" TEXT="la URL"/>
</node>
</node>
</node>
<node CREATED="1416582293378" ID="ID_659695805" MODIFIED="1416582307627" POSITION="right" TEXT="pull">
<node CREATED="1416582258862" ID="ID_1837097417" MODIFIED="1416582290913" TEXT="fetch + merge = pull"/>
<node CREATED="1416582311850" ID="ID_1844185070" MODIFIED="1416582371676" TEXT="git pull ">
<node CREATED="1416582320977" ID="ID_1589719931" MODIFIED="1416582342691" TEXT="se il banch corrente corrisponde in remote"/>
</node>
<node CREATED="1416582352125" ID="ID_759798772" MODIFIED="1416582361569" TEXT="git pull remote"/>
</node>
<node CREATED="1416582669166" ID="ID_432560962" MODIFIED="1422550615536" POSITION="right" TEXT="le azioni di push sono bloccate in git, perch&#xe8; si possono fare danni"/>
<node CREATED="1416527405660" ID="ID_410111599" MODIFIED="1416582531702" POSITION="right" TEXT="GitHub">
<node CREATED="1416582733511" ID="ID_1184025998" MODIFIED="1416582802811" TEXT="si pu&#xf2; farci push"/>
</node>
<node CREATED="1416584173076" ID="ID_811762818" MODIFIED="1416584185671" POSITION="right" TEXT="education.github.com"/>
<node CREATED="1416584364882" ID="ID_115662795" MODIFIED="1416584371755" POSITION="right" TEXT="HEAD">
<node CREATED="1416584434533" ID="ID_256447065" MODIFIED="1422550498245" TEXT="puntatore a dove mi trovo io in un certo momento"/>
<node CREATED="1416584475713" ID="ID_1833015739" MODIFIED="1422550502798" TEXT="&#xe8; un un file nella cartella .git"/>
</node>
</node>
</map>
