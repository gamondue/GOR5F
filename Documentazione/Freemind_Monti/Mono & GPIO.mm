<map version="0.9.0">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1364030632703" ID="ID_404158232" MODIFIED="1364224106916" TEXT="Raspberry Mono &amp; GPIO">
<node CREATED="1361741917086" ID="ID_1196626461" MODIFIED="1364029071559" POSITION="right" TEXT="Installazione mono">
<node CREATED="1363024044206" ID="ID_649619303" MODIFIED="1363024048551" TEXT="Installare il runtime">
<node CREATED="1361742013686" ID="ID_986879669" MODIFIED="1361742014796" TEXT="sudo apt-get install mono-runtime">
<node CREATED="1361743556756" ID="ID_735940847" MODIFIED="1361743569878" TEXT="in verit&#xe0; &#xe8; gi&#xe0; installato"/>
</node>
</node>
<node CREATED="1363024052901" ID="ID_623580605" MODIFIED="1363024099287" TEXT="Installare la shell Csharp, che pu&#xf2; essere utile">
<node CREATED="1363024100355" ID="ID_355092763" MODIFIED="1363024101669" TEXT="sudo apt-get install mono-csharp-shell"/>
<node CREATED="1363024184974" ID="ID_815771471" MODIFIED="1363024197960" TEXT="lanciare la shell da un terminale">
<node CREATED="1363024199169" ID="ID_1551796077" MODIFIED="1363024200545" TEXT="$ csharp"/>
<node CREATED="1363024217554" ID="ID_606253695" MODIFIED="1363024230228" TEXT="si entra nella shell remota di c#"/>
</node>
</node>
<node CREATED="1363023914348" ID="ID_1199244725" MODIFIED="1363023934097" TEXT="per far girare programmi in GUI">
<node CREATED="1361742021615" ID="ID_513020400" MODIFIED="1361742023647" TEXT="sudo apt-get install gtk-sharp2">
<node CREATED="1361743601293" ID="ID_1965328013" MODIFIED="1361743618910" TEXT="ha dato un sacco di errori nel corso dell&apos;installazione"/>
</node>
<node CREATED="1361742003116" ID="ID_1865402486" MODIFIED="1361742005133" TEXT="sudo apt-get install libmono-winforms2.0-cil"/>
<node CREATED="1361742738257" ID="ID_762883401" MODIFIED="1361742739382" TEXT="sudo apt-get install libxtst-dev"/>
</node>
<node CREATED="1361742725985" ID="ID_408401039" MODIFIED="1361743896969" TEXT="per provare se mono gira mono -V"/>
</node>
<node CREATED="1363032718569" ID="ID_403742342" MODIFIED="1364029078197" POSITION="right" TEXT="GPIO">
<node CREATED="1363032722544" ID="ID_881356669" MODIFIED="1363032727093" TEXT="con mono e C#">
<node CREATED="1363033779815" ID="ID_1541830426" MODIFIED="1363033864602" TEXT="installare in /lib la libreria lpigpio ">
<node CREATED="1363032728755" ID="ID_694078933" MODIFIED="1363032729944" TEXT="sudo cp libpigpio.so /lib"/>
<node CREATED="1363032732356" ID="ID_1098182590" MODIFIED="1363032748702" TEXT="scaricare libpigpio">
<node CREATED="1363032766663" ID="ID_1286308089" MODIFIED="1363032769320" TEXT="da: http://www.codehosting.net/blog/files/libpigpio.zip"/>
</node>
<node CREATED="1363032779717" ID="ID_1930013283" MODIFIED="1364029289794" TEXT="copiare libpigpio.so su /lib nel raspberry">
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
</node>
</map>
