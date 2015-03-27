<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
    <div>
    
        <asp:LinkButton ID="lnkConfigurazione" runat="server" OnClick="lnkConfigurazione_Click">Configurazione</asp:LinkButton>
        <br />
        <asp:LinkButton ID="lnkCalibrazione" runat="server" OnClick="lnkCalibrazione_Click">Calibrazione</asp:LinkButton>
        <br />
        <asp:LinkButton ID="lnkRuntime" runat="server" OnClick="lnkRuntime_Click">Runtime</asp:LinkButton>
        <br />
    </div>
    </form>
</body>
</html>
