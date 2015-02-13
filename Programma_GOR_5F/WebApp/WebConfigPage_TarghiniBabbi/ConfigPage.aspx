<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConfigPage.aspx.cs" Inherits="ConfigPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:CheckBox ID="chkTemperature" runat="server" Text="Temperatura" />
        <br />
        <asp:CheckBox ID="chkAirHumidity" runat="server" Text="Umidità" />
        &nbsp;Dell&#39;Aria<br />
        <asp:CheckBox ID="chkGroundHumidity" runat="server" Text="Umidità Terrena" />
        <br />
        <asp:CheckBox ID="chkPressure" runat="server" Text="Pressione" />
        <br />
        <asp:CheckBox ID="chkLux" runat="server" Text="Luminosità" />
    
    </div>
        <p>
        <asp:Button ID="btnSalva" runat="server" Text="Salva " OnClick="btnSalva_Click" Width="128px" />
        </p>
    </form>
</body>
</html>
