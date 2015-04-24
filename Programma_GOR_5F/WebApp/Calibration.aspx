<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calibration.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<!-- Foschini Lucia 5F 24-03-15 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 341px; width: 838px">
    
        <asp:DropDownList ID="DropDownList1" runat="server" style="position:absolute; left:50px; top:50px">
            <asp:ListItem>Temperatura</asp:ListItem>
            <asp:ListItem>Umidità Aria</asp:ListItem>
            <asp:ListItem>Umidità Terreno</asp:ListItem>
            <asp:ListItem>Luce</asp:ListItem>
        </asp:DropDownList>
    
        <asp:Label ID="lblUnitàDiMisura" runat="server" Text="UmiditàDiMisura" style="position:absolute; left:287px; top:105px; width: 109px; height: 19px;"></asp:Label>
        
        <hr style="position:absolute; left:10px; top:141px; height: 0px;"/>
    
        <asp:Label ID="lblNomeSensore" runat="server" Text="NomeSensore" style="position:absolute; left:290px; top:56px; width: 143px; height: 19px;"></asp:Label>  
            
        <asp:Label ID="lblInterfaccia" runat="server" Text="Interfaccia" style="position:absolute; left:550px; top:56px; width: 84px; height: 19px;"></asp:Label>
        
        <asp:Label ID="lblValoraZero" runat="server" Text="ValoreZero" style="position:absolute; left:550px; top:106px; width: 84px; height: 19px;"></asp:Label>
        <asp:Label ID="lblUnitàDiMisura1" runat="server" Text="UnitàDiMisura" style="position:absolute; left:420px; top:250px; width: 84px; height: 19px;"></asp:Label>
        <asp:Label ID="lblUnitàDiMisura2" runat="server" Text="UnitàDiMisura" style="position:absolute; left:420px; top:300px; width: 84px; height: 19px;"></asp:Label>


        <asp:Button ID="btnAvvia" runat="server" Text="Avvia Taratura" style="position:absolute; left:50px; top:200px; width: 107px; height: 24px;" OnClick="btnAvvia_Click" />
        <asp:Button ID="btnPunto" runat="server" Text="Punto Taratura" style="position:absolute; left:50px; top:250px; width: 107px; height: 24px;" OnClick="btnPunto_Click" />
        <asp:Button ID="btnChiusura" runat="server" Text="Fine Taratura" style="position:absolute; left:50px; top:300px; width: 107px; height: 24px;" OnClick="btnChiusura_Click" />
        <asp:Button ID="btnAbort" runat="server" Text="Abort All" style="position:absolute; left:600px; top:300px; width: 107px; height: 24px; right: 714px;" OnClick="btnAbort_Click" />
         <asp:Button ID="btnSeleziona" runat="server" Text="Seleziona" style="position:absolute; left:50px; top:100px; width: 107px; height: 24px;" OnClick="btnSeleziona_Click" />

        <asp:TextBox ID="txtPuntoInput" runat="server" style="position:absolute; left:290px; top:250px; width: 107px; height: 24px;"></asp:TextBox>
        <asp:TextBox ID="txtOutput" runat="server" style="position:absolute; left:290px; top:300px; width: 107px; height: 24px;"></asp:TextBox>

        <asp:Button ID="btnAbort0" runat="server" Text="Abort All" style="position:absolute; left:600px; top:300px; width: 107px; height: 24px;" OnClick="btnAbort_Click" />
        <asp:Button ID="btnConfiguration" runat="server" Text="Configuration" style="position:absolute; left:723px; top:300px; width: 107px; height: 24px;" OnClick="btnConfiguration_Click" />



        <asp:Label ID="lblPendenza" runat="server" Text="Pendenza" style="position:absolute; left:435px; top:106px; width: 72px; height: 19px;"></asp:Label>



    </div>
    </form>
</body>
</html>

