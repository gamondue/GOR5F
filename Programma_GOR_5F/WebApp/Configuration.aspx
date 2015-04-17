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
            <a href="Default.aspx"><asp:Image ID="Image1" runat="server" ImageUrl="~/Image/logo.PNG" /></a>
            <table>
                <tr>
                    <td>
                        
                    </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="IdTermometro | Canale ADC | PinIoRaspi"></asp:Label>
                        
                    &nbsp;GOT</td>
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
                        <asp:RadioButton ID="rdbTemperature" runat="server" Text="Temperatura" GroupName="Sensors" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtIdCircuitoIntegratoTemp" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox ID="txtIdDatabaseTemp" runat="server"></asp:TextBox>
                    </td>
                </tr>/
                <tr>
                    <td class="auto-style1">
                        <asp:RadioButton ID="rdbHIH4000" runat="server" Text="Umidità dell'aria (HIH4000)" GroupName="Sensors" />
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
                        <asp:RadioButton ID="rdbDHT22" runat="server" Text="Umidità dell'aria (DHT22)" GroupName="Sensors" />
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
                        <asp:RadioButton ID="rdbTerrainHumidity" runat="server" Text="Umidità del terreno" GroupName="Sensors"/>
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
                        <asp:RadioButton ID="rdbLux" runat="server" Text="Luminosità" GroupName="Sensors"/>
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
        <asp:Button ID="btnAggiungi" runat="server" Text="Aggiungi" Width="128px" OnClick="btnAggiungi_Click" />
        <asp:Button ID="btnEliminaSensore" runat="server" Text="Elimina sensore" OnClick="btnEliminaSensore_Click" Width="128px" />
        <asp:Button ID="btnSalva" runat="server" Text="Salva " OnClick="btnSalva_Click" Width="128px" />
        </p>
        <div>
            <asp:GridView ID="grdSensori" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField HeaderText="Grandezza Fisica"/>
                    <asp:CheckBoxField HeaderText="In Simulazione" />
                    <asp:BoundField HeaderText="IdTermometro|Canale ADC|PinIoRaspi" />
                    <asp:BoundField HeaderText="Id Database" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
