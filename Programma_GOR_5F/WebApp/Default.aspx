﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
    <div>
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Pagina Principale"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnConfig" runat="server" Text="Configuration" OnClick="btnConfig_Click" />
        <asp:Button ID="btnCalibration" runat="server" Text="Calibration" OnClick="btnCalibration_Click"/>
        <asp:Button ID="btnRuntime" runat="server" Text="Esecuzione" OnClick="btnRuntime_Click"/>
    </div>
    </form>
</body>
</html>
