<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Configuration.aspx.cs" Inherits="ConfigPage" %>

<!DOCTYPE html>
<!-- Foschini Lucia 24-03-15 -->
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
<body style="height: 410px; width: 1186px">
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="IdTermometro | Canale ADC | PinIoRaspi"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="ID Database"></asp:Label>
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
                        <asp:TextBox ID="txtIdCircuitoIntegratoTemp" runat="server" Width="246px"></asp:TextBox>
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
                        <asp:TextBox ID="txtCanaleHIH" runat="server" Width="246px"></asp:TextBox>
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
                        <asp:TextBox ID="txtPinDht" runat="server" Width="246px"></asp:TextBox>
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
                        <asp:TextBox ID="txtCanaleTerrain" runat="server" Width="246px"></asp:TextBox>
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
                        <asp:TextBox ID="txtCanaleLux" runat="server" Width="246px"></asp:TextBox>
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
        <asp:Button ID="btnCalibration" runat="server" Text="Calibration" OnClick="btnCalibration_Click" Width="128px" /> 
        <asp:Button ID="btnRuntime" runat="server" Text="RunTime" OnClick="btnRuntime_Click" Width="128px" />
        </p>
        <div>
            <asp:GridView runat="server" ID="GridInformazioni" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="IDTermometro" HeaderText="IDTermometro" Visible="true" />
                    <asp:BoundField DataField="CanaleADC" HeaderText="Canale ADC" Visible="true" />
                    <asp:BoundField DataField="PinIoRaspi" HeaderText="Pin IO Raspi" Visible="true" />
                    <asp:BoundField DataField="IDDatabaseGot" HeaderText="ID Database GOT" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceSensori" runat="server"
                 ConnectionString=""
                 ProviderName="System.Data.SqlClient"
                 DeleteCommand=""
                 InsertCommand="">

                <DeleteParameters>
                    <asp:Parameter Name="" Type="Int32" />
                    <asp:Parameter Name="" Type="Int32"/>
                    <asp:Parameter  Name="" Type="Int32"/>
                    <asp:Parameter Name="" Type="Int32" />
                </DeleteParameters>

                <InsertParameters>
                    <asp:Parameter Name="" Type="Int32" />
                    <asp:Parameter Name="" Type="Int32" />
                    <asp:Parameter Name="" Type="Int32" />
                    <asp:Parameter Name="" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
