<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1416339916007" ID="ID_1225470188" MODIFIED="1416351779512" TEXT="Librerie C# per I/O Raspberry">
<node CREATED="1416345126825" ID="ID_1072178255" MODIFIED="1416345128075" POSITION="right" TEXT="RaspberrySharp.IO">
<node CREATED="1416339948276" ID="ID_1984936357" MODIFIED="1416339957714" TEXT="si basa sulla libreria">
<node CREATED="1416339969263" ID="ID_561905485" MODIFIED="1416339970748" TEXT="libc.so.6"/>
<node CREATED="1416339996229" ID="ID_365273081" MODIFIED="1416340014137" TEXT="legge direttamente in memoria la configurazione dei pin di I/O"/>
<node CREATED="1416340026464" ID="ID_27944036" MODIFIED="1416340144825" STYLE="fork" TEXT="Metodi mappati in C# (Interop.cs)">
<node CREATED="1416340047983" ID="ID_1044083650" MODIFIED="1416340138964" TEXT="IntPtr open(string fileName, int mode)"/>
<node CREATED="1416340038201" ID="ID_592353541" MODIFIED="1416340138964" TEXT="close(IntPtr file)"/>
<node CREATED="1416340069050" ID="ID_1955144028" MODIFIED="1416340138964" TEXT="IntPtr mmap(IntPtr address, uint size, int protect, int flags, IntPtr file, uint offset)"/>
<node CREATED="1416340078935" ID="ID_337772391" MODIFIED="1416340138964" TEXT="IntPtr munmap(IntPtr address, uint size)"/>
</node>
</node>
</node>
<node CREATED="1416345144814" ID="ID_1375690462" MODIFIED="1416345146283" POSITION="right" TEXT="RPi.I2C.Net">
<node CREATED="1416345148092" ID="ID_1154244006" MODIFIED="1416345165984" TEXT="ha una libreria interna, con codice sorgente">
<node CREATED="1416345201924" ID="ID_89995336" MODIFIED="1416345232054" TEXT="il sorgente &#xe8; in">
<node CREATED="1416345208332" ID="ID_1099268669" MODIFIED="1416345223568" TEXT="RPi.I2C.Net-master\Lib\LibNativeI2C\src"/>
</node>
<node CREATED="1416345528746" ID="ID_683039334" MODIFIED="1416345574369" TEXT="il compilato &#xe8; libnativei2c.so ">
<node CREATED="1416345532583" ID="ID_1897570618" MODIFIED="1416345542814" TEXT="&#xe8; una shared library"/>
</node>
</node>
<node CREATED="1416345178480" ID="ID_196413728" MODIFIED="1416345186684" TEXT="su Raspbian &#xe8; da compilare">
<node CREATED="1416345817875" ID="ID_460835755" MODIFIED="1416345818754" TEXT="compile libNativeI2C by &quot;make&quot; command (on raspberry pi, linux)"/>
</node>
</node>
</node>
</map>
