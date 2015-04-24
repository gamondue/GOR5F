<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="HomePage" %>

<!--Beatrice Bartoloni 5F-->

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
    <div>
    
        <br />
        <asp:Label ID="lblBenvenuto" runat="server" Text="Benvenuto!!" ></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnConfig" runat="server" Text="Configuration" OnClick="btnConfig_Click" />
        &nbsp; &nbsp; 
        <asp:Button ID="btnCalibration" runat="server" Text="Calibration" OnClick="btnCalibration_Click"/>
        &nbsp; &nbsp; 
        <asp:Button ID="btnRuntime" runat="server" Text="Esecuzione" OnClick="btnRuntime_Click"/>
        <br />
        <br />
    </div>
    </form>
</body>
</html>
