﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Configuration.aspx.cs" Inherits="ConfigPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body style="background-image: url('Image/Sfondo.jpg'); height: 397px; width: 1207px;">
    <form id="form1" runat="server">
    <div style="height: 320px; width: 1201px;">
    
       
        <table>
            <tr>
               <td>
                   <asp:Label ID="Label1" runat="server" Text="Id Circuito Integrato" Font-Size="Large"></asp:Label>
               </td> 
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Numero Canale" Font-Size="Large"></asp:Label>
                </td>
                <td>
                     <asp:Label ID="Label3" runat="server" Text="Id database" Font-Size="Large"></asp:Label>
                </td>
            </tr>
            <tr>
                <td><asp:CheckBox ID="chkInSim" runat="server" Text="In Simulazione" Font-Size="Large" /></td>
            </tr>
            <tr>
                 <td><asp:CheckBox ID="chkTemperature" runat="server" Text="Temperatura" Font-Size="Large" /></td>
                 <td> <asp:TextBox ID="txtIdCircuitoIntegrato" runat="server" Font-Size="Large" Width="176px"></asp:TextBox></td>
                 <td> <asp:TextBox ID="txtIdDatabase" runat="server" Font-Size="Large" Width="192px"></asp:TextBox></td>
            </tr>
            <tr>
                 <td> <asp:CheckBox ID="chkAirHumidity" runat="server" Text="Umidità Dell Aria" Font-Size="Large" /></td>
                 <td> <asp:TextBox ID="txtIdDatabase0" runat="server" Font-Size="Large" Width="175px"></asp:TextBox></td>   
            </tr>
            <tr>
                 <td> <asp:CheckBox ID="chkGroundHumidity" runat="server" Text="Umidità Terrena" Font-Size="Large" /></td>
                 <td><asp:TextBox ID="txtNCUT" runat="server" style="margin-left: 3px" Width="172px" Font-Size="Large"></asp:TextBox></td>
                 <td><asp:TextBox ID="txtIdDatabase2" runat="server" Width="192px" Font-Size="Large"></asp:TextBox></td>
            </tr>
            <tr>
                 <td> <asp:CheckBox ID="chkLux" runat="server" Text="Luminosità" Font-Size="Large" /></td>
                 <td> <asp:TextBox ID="txtNCLux" runat="server" Font-Size="Large" Width="176px"></asp:TextBox> </td>
                 <td><asp:TextBox ID="txtIdDatabase1" runat="server" Font-Size="Large" Width="194px"></asp:TextBox></td>

            </tr>
           
          
        </table>
        
            
        
    
    </div>
        <p style="height: 45px; width: 1199px;">
        <asp:Button ID="btnSalva" runat="server" Text="Salva " OnClick="btnSalva_Click" Width="128px" Font-Size="Large" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="BtnTornaMenu" runat="server" Font-Size="Large" OnClick="BtnTornaMenu_Click" style="margin-top: 0px" Text="Torna Menu" />
        </p>
    </form>
</body>
</html>
