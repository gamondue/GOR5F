﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WebSample.aspx.cs" Inherits="WebSample" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>WebSample</title>
<%--    <script runat="server" type="text/c#">
        protected void Timer_Tick(object sender, EventArgs e)
        {
            //pagina.Text = "Panel refreshed at: " +
            //DateTime.Now.ToLongTimeString();
        }
    </script>--%>
</head>
<body>
    <form id="form1" runat="server">
<%--    <asp:ScriptManager runat="server" id="ScriptManager1">
    </asp:ScriptManager>
    <asp:Timer runat="server" ID="Timer" Interval="2000" />--%>
    <div>
        <asp:Label ID="pagina" runat="server" Text=""></asp:Label>
    </div>
    </form>
</body>
</html>