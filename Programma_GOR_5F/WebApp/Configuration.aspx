<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Configuration.aspx.cs" Inherits="ConfigPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        table { table-layout: fixed; }
        td { width: 25%; height: 14%}
        .auto-style1 {
            height: 14%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:LinkButton ID="lkbtnDefault" runat="server" OnClick="lkbtnDefault_Click">Pagina di Default</asp:LinkButton>
            <table>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="lblScelta" runat="server" Text="IdTermometro | Canale ADC | PinIoRaspi"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Id database"></asp:Label>
                    &nbsp;GOT</td>
                </tr>
                <tr>
                    <td>
                        <asp:CheckBox ID="chkInSim" runat="server" Text="In Simulazione" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButton ID="rdbTemperature" runat="server" Text="Temperatura" GroupName="Sensors" OnCheckedChanged="rdbTemperature_CheckedChanged" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtIdCircuitoIntegratoTemp" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtIdDatabaseTemp" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:RadioButton ID="rdbHIH4000" runat="server" Text="Umidità dell'aria (HIH4000)" GroupName="Sensors" OnCheckedChanged="rdbHIH4000_CheckedChanged" />
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtCanaleHIH" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtIdDatabaseHIH" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:RadioButton ID="rdbDHT22" runat="server" Text="Umidità dell'aria (DHT22)" GroupName="Sensors" OnCheckedChanged="rdbDHT22_CheckedChanged" />
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtPinDht" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtIdDatabaseDht" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:RadioButton ID="rdbTerrainHumidity" runat="server" Text="Umidità del terreno" GroupName="Sensors" OnCheckedChanged="rdbTerrainHumidity_CheckedChanged"/>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtCanaleTerrain" runat="server"></asp:TextBox>
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtIdDatabaseTerrain" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:RadioButton ID="rdbLux" runat="server" Text="Luminosità" GroupName="Sensors" OnCheckedChanged="rdbLux_CheckedChanged"/>
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
        <asp:Button ID="btnAggiungi" runat="server" Text="Aggiungi" OnClick="btnSalva_Click" Width="128px" />
        <asp:Button ID="btnEliminaSensore" runat="server" Text="Elimina sensore" OnClick="btnEliminaSensore_Click" Width="128px" />
        </p>
        <p>
            <asp:GridView ID="GrdVSensori" runat="server">
                <Columns>
                    
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceAnimali" runat="server"></asp:SqlDataSource>
        </p>
    </form>
</body>
</html>
