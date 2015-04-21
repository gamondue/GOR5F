<!--Giorgetti Samuele 5F -->
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Runtime.aspx.cs" Inherits="_Runtime" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 269px">
          <asp:Image ID="imgLed" runat="server" ImageUrl="~/GOR5F/Programma_GOR_5F/WebApp/Image/led.png" />
&nbsp;
          <asp:Button ID="btnSpegni" runat="server" Text="SPEGNI" OnClick="btnSpegni_Click" />
          &nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Label ID="lblOrario" runat="server"></asp:Label>
          &nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Button ID="btnControllo" runat="server" Text="Controlla" OnClick="btnControllo_Click" />
          <br />
          <br />
          <asp:DropDownList ID="DropDownList1" runat="server">
              <asp:ListItem>Temperatura</asp:ListItem>
              <asp:ListItem>Umidità</asp:ListItem>
              <asp:ListItem>Umidità del terreno</asp:ListItem>
              <asp:ListItem>Pressione</asp:ListItem>
              <asp:ListItem>Luminosità</asp:ListItem>
          </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Button ID="btnAcquisisci" runat="server" Text="Acquisisci" OnClick="btnAcquisisci_Click" />
          &nbsp;&nbsp;
          <asp:Label ID="lblMisurazione" runat="server" />
          <br />
          <br />
          <asp:TextBox ID="txtPrendiNota" runat="server"></asp:TextBox>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Button ID="btnPrendiNota" runat="server" Text="Prendi nota" OnClick="btnPrendiNota_Click" Height="26px" />
          <br />
          <br />
          <asp:Label ID="Label11" runat="server" Text="INFORMAZIONI"></asp:Label>
          :<br />
          <br />
          <asp:Label ID="Label6" runat="server" Text="ID:"></asp:Label>
          &nbsp;<asp:Label ID="lblId" runat="server"></asp:Label>
          <br />
          <asp:Label ID="Label2" runat="server" Text="Nome:"></asp:Label>
          &nbsp;<asp:Label ID="lblNome" runat="server"></asp:Label>
          <br />
          <asp:Label ID="Label3" runat="server" Text="Taratura:"></asp:Label>
          &nbsp;<asp:Label ID="lblTaratura" runat="server"></asp:Label>
          <br />
          <asp:Label ID="Label4" runat="server" Text="Misura:"></asp:Label>
          &nbsp;<asp:Label ID="lblMisura" runat="server"></asp:Label>
          <br />

    </div>
    </form>
</body>
</html>
