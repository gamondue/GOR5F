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
            <table>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="IdTermometro | Canale ADC | PinIoRaspi"></asp:Label>
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
                        <asp:RadioButton ID="rdbTemperature" runat="server" Text="Temperatura" GroupName="Sensors" />
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
        <asp:Button ID="btnAggiungi" runat="server" Text="Aggiungi" OnClick="btnAggiungi_Click" Width="128px" />
        <asp:Button ID="btnEliminaSensore" runat="server" Text="Elimina sensore" OnClick="btnEliminaSensore_Click" Width="128px" />
        <asp:Button ID="btnSalva" runat="server" Text="Salva " OnClick="btnSalva_Click" Width="128px" />
        <br/>
        <br/>
        <asp:Button ID="btnRuntime" runat="server" Text="Runtime" OnClick="btnRuntime_Click" />
        <br/>
        <asp:Button ID="btnCalibration" runat="server" Text="Calibration" OnClick="btnCalibration_Click" />
        <br/>
        <asp:Button ID="btnDefault" runat="server" Text="Default" OnClick="btnDefault_Click" />
        <br/> 
        </p>
        <div>
            <asp:Table ID="Table1" runat="server">
                
            </asp:Table>
        </div>
    </form>
</body>
</html>
