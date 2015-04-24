<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Runtime.aspx.cs" Inherits="_Runtime" %>

<!DOCTYPE html>
<!-- Foschini Lucia 24-03-15 -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 342px; width: 706px">
          <asp:Image ID="imgLed" runat="server" ImageUrl="~/GOR5F/Programma_GOR_5F/WebApp/Image/led.png" />
&nbsp;
          <asp:Label ID="lblOrario" runat="server" style="position:absolute; left:190px; top:25px; width: 81px; height: 17px;"></asp:Label>
          &nbsp;
          <asp:Button ID="btnControllo" runat="server" Text="Controlla" OnClick="btnControllo_Click" style="position:absolute; top:20px; width: 67px; height: 26px; left: 297px;" />
          <asp:Button ID="btnSpegni" runat="server" Text="SPEGNI" OnClick="btnSpegni_Click" style="position:absolute; top:19px; width: 67px; height: 26px; left: 61px; right: 1382px;"/>
          <br />
          <br />
          <asp:DropDownList ID="DropDownList1" runat="server">
              <asp:ListItem>Temperatura</asp:ListItem>
              <asp:ListItem>Umidità</asp:ListItem>
              <asp:ListItem>Umidità del terreno</asp:ListItem>
              <asp:ListItem>Pressione</asp:ListItem>
              <asp:ListItem>Luminosità</asp:ListItem>
          </asp:DropDownList><asp:Button ID="btnAcquisisci" runat="server" Text="Acquisisci" OnClick="btnAcquisisci_Click" style="position:absolute; top:66px; width: 67px; height: 26px; left: 308px;" />
          <asp:Label ID="lblMisurazione" runat="server" style="position:absolute; top:63px; width: 102px; height: 26px; left: 180px;" />
          <br />
          <br />
          <asp:TextBox ID="txtPrendiNota" runat="server" Width="126px"></asp:TextBox>
          <asp:Button ID="btnPrendiNota" runat="server" Text="Prendi nota" OnClick="btnPrendiNota_Click" style="position:absolute; top:103px; width: 88px; height: 26px; left: 184px;"/>
          <br />
            <hr style="position:absolute; left:10px; top:141px; height: 0px;"/>
          <br />
          <asp:Label ID="lblInformazioni" runat="server" Text="INFORMAZIONI:" style="position:absolute; top:162px; width: 144px; height: 26px; left: 11px;"></asp:Label>
          <br />
          <br />
          <asp:GridView ID="GridInformazioni" runat="server" AutoGenerateColumns="false" Width="479px" >
              <Columns>
                  <asp:BoundField DataField="ID" HeaderText="ID" Visible="true" />
                  <asp:BoundField DataField="Nome" HeaderText="Nome" Visible="true" />
                  <asp:BoundField DataField="Taratura" HeaderText="Taratura" Visible="true" />
                  <asp:BoundField DataField="Misura" HeaderText="Misura" Visible="true" />
              </Columns>
          </asp:GridView>
          <asp:Button ID ="btnConfigurazione" runat="server" Text="Configurazione" OnClick="btnConfigurazione_Click" style="position:absolute; top:238px; width: 128px; height: 29px; left: 537px;" />
           

    </div>
    </form>
</body>
</html>
