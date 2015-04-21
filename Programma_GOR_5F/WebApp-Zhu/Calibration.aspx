<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calibration.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="background-image: url('Image/Sfondo.jpg'); height: 389px; width: 999px;">
    <form id="form1" runat="server">
    <div style="height: 395px; width: 1001px">
           

        <asp:DropDownList ID="DropDownList1" runat="server" style="position:absolute; left:50px; top:50px; right: 1470px;" Font-Size="Large">
            <asp:ListItem>Temperatura</asp:ListItem>
            <asp:ListItem>Umidità Aria</asp:ListItem>
            <asp:ListItem>Umidità Terreno</asp:ListItem>
            <asp:ListItem>Luce</asp:ListItem>
        </asp:DropDownList>
    
        <hr style="position:absolute; left:10px; top:141px; height: 0px; width: 1649px;"/>
    
        <asp:Label ID="lblNomeSensore" runat="server" style="position:absolute; left:290px; top:56px; width: 143px; height: 19px;" Font-Size="Large"></asp:Label>  
            
        <asp:Label ID="lblInterfaccia" runat="server" style="position:absolute; left:550px; top:56px; width: 84px; height: 19px;" Font-Size="Large"></asp:Label>
        
        <asp:Label ID="lblUnitàDiMisura" runat="server" style="position:absolute; left:290px; top:106px; width: 84px; height: 19px; right: 1301px;" Font-Size="Large"></asp:Label>
        <asp:Label ID="lblPendenza" runat="server" style="position:absolute; left:436px; top:106px; width: 84px; height: 19px; right: 1155px;" Font-Size="Large"></asp:Label>
        <asp:Label ID="lblValoraZero" runat="server" style="position:absolute; left:550px; top:106px; width: 84px; height: 19px;" Font-Size="Large"></asp:Label>
        <asp:Label ID="Label1" runat="server" style="position:absolute; left:420px; top:250px; width: 84px; height: 19px;" Font-Size="Large"></asp:Label>
        <asp:Label ID="Label2" runat="server" style="position:absolute; left:420px; top:300px; width: 84px; height: 19px;" Font-Size="Large"></asp:Label>


        <asp:Button ID="btnAvvia" runat="server" Text="Avvia Taratura" style="position:absolute; left:50px; top:200px; width: 145px; height: 24px;" OnClick="btnAvvia_Click" Font-Size="Large" />
        <asp:Button ID="btnPunto" runat="server" Text="Punto Taratura" style="position:absolute; left:50px; top:250px; width: 141px; height: 24px; bottom: 588px;" OnClick="btnPunto_Click" Font-Size="Large" />
        <asp:Button ID="btnChiusura" runat="server" Text="Fine Taratura" style="position:absolute; left:50px; top:300px; width: 136px; height: 24px;" OnClick="btnChiusura_Click" Font-Size="Large" />
        <asp:Button ID="btnAbort" runat="server" Text="Abort All" style="position:absolute; left:600px; top:300px; width: 107px; height: 24px;" OnClick="btnAbort_Click" Font-Size="Large" />
         <asp:Button ID="btnSeleziona" runat="server" Text="Seleziona" style="position:absolute; left:50px; top:100px; width: 107px; height: 24px;" OnClick="btnSeleziona_Click" Font-Size="Large" />

        <asp:TextBox ID="txtPuntoInput" runat="server" style="position:absolute; left:290px; top:250px; width: 107px; height: 24px;" Font-Size="Large"></asp:TextBox>
        <asp:TextBox ID="txtOutput" runat="server" style="position:absolute; left:290px; top:300px; width: 107px; height: 24px;" Font-Size="Large"></asp:TextBox>      
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="BtnTornaMenu" runat="server" Font-Size="Large" OnClick="BtnTornaMenu_Click" style="margin-top: 0px" Text="Torna Menu" />
    </div>
    </form>
</body>
</html>

