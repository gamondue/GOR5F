<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Runtime.aspx.cs" Inherits="_Runtime" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="background-image: url('Image/Sfondo.jpg');">
    <form id="form1" runat="server">
    <div style="height: 368px; width: 676px;">
          <asp:Button ID="btnSpegni" runat="server" Text="SPEGNI" OnClick="btnSpegni_Click" Font-Size="Large" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Label ID="lblOrario" runat="server" Font-Size="Large"></asp:Label>
          <br />
          <br />
          <asp:DropDownList ID="DropDownList1" runat="server" Font-Size="Large">
              <asp:ListItem>Temperatura</asp:ListItem>
              <asp:ListItem>Umidità</asp:ListItem>
              <asp:ListItem>Umidità del terreno</asp:ListItem>
              <asp:ListItem>Pressione</asp:ListItem>
              <asp:ListItem>Luminosità</asp:ListItem>
          </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnAcquisisci" runat="server" Text="Acquisisci" OnClick="btnAcquisisci_Click" Font-Size="Large" />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:TextBox ID="txtMisura" runat="server" Height="16px" Font-Size="Large"></asp:TextBox>
          <br />
          <br />
          <asp:TextBox ID="txtPrendiNota" runat="server" Font-Size="Large"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Button ID="btnPrendiNota" runat="server" Text="Prendi nota" OnClick="btnPrendiNota_Click" Font-Size="Large" />
          <br />
          <br />
        <table>
            <tr>
                <td> <asp:Label ID="Label11" runat="server" Text="INFORMAZIONI" Font-Size="Large"></asp:Label> </td>
            </tr>
            <tr>
                 <td> <asp:Label ID="Label6" runat="server" Text="ID:" Font-Size="Large"></asp:Label> </td>
                 <td> <asp:Label ID="Label7" runat="server" Font-Size="Large"></asp:Label> </td>
            </tr>
            <tr>
                 <td>  <asp:Label ID="Label2" runat="server" Text="Nome:" Font-Size="Large"></asp:Label> </td>
                 <td> <asp:Label ID="Label8" runat="server" Font-Size="Large"></asp:Label> </td>
            </tr>
            <tr>
                 <td>  <asp:Label ID="Label3" runat="server" Text="Calibratura:" Font-Size="Large"></asp:Label> </td>
                 <td>  <asp:Label ID="Label9" runat="server" Font-Size="Large"></asp:Label> </td>
            </tr>
            <tr>
                 <td> <asp:Label ID="Label4" runat="server" Text="Misura:" Font-Size="Large"></asp:Label> </td>
                 <td>  <asp:Label ID="Label10" runat="server" Font-Size="Large"></asp:Label> </td>
            </tr>
        </table>
          
        
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Button ID="BtnTornaMenu" runat="server" Font-Size="Large" OnClick="BtnTornaMenu_Click" style="margin-top: 0px" Text="Torna Menu" />

    </div>
    </form>
    <div>
    </div>
</body>
</html>
