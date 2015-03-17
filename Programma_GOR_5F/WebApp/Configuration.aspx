<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Configuration.aspx.cs" Inherits="ConfigPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        table { table-layout: fixed; }
        td { width: 25%; height: 14%}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td></td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Id Circuito Integrato"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Numero Canale"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Id database"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBox ID="chkInSim" runat="server" Text="In Simulazione" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBox ID="chkTemperature" runat="server" Text="Temperatura" />
                </td>
                <td>
                    <asp:TextBox ID="txtIdCircuitoIntegratoTemp" runat="server"></asp:TextBox>
                </td>
                <td></td>
                <td>
                    <asp:TextBox ID="txtIdDatabaseTemp" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBox ID="chkAirHumidity" runat="server" Text="Umidità dell' aria" />
                </td>
                <td></td>
                <td>
                    <asp:TextBox ID="txtCanaleHIH" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtIdDatabaseHIH" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBox ID="chkGroundHumidity" runat="server" Text="Umidità dell' terreno" />
                </td>
                <td>
                    <asp:TextBox ID="txtCanaleGround" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtIdDatabaseGround" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:CheckBox ID="chkLux" runat="server" Text="Luminosità" />
                </td>
                <td>
                    <asp:TextBox ID="txtCanaleLux" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="txtIdDatabaseLux" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        

        

    
    </div>
        <p>
        <asp:Button ID="btnSalva" runat="server" Text="Salva " OnClick="btnSalva_Click" Width="128px" />
        </p>
    </form>
</body>
</html>
