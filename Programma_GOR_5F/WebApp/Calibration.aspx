<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Calibration.aspx.cs" Inherits="Taratura" %>
<!--Babbi Targhini 5F 13-02-15 -->
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridViewSensore" runat="server" AutoGenerateColumns="False" 
            OnSelectedIndexChanged="GridViewSensore_SelectedIndexChanged"
            DataSourceID="SqlSensori"
            DataKeyName="Id_Sensore" Height="124px" Width="843px" DataKeyNames="Id_Sensore" 
            >
          <Columns>
              <asp:BoundField DataField="Id_Sensore" HeaderText="Id_Sensore" ReadOnly="true" Visible="true" SortExpression="Id_Sensore" />
              <asp:BoundField DataField="Nome" HeaderText="Nome" Visible="true" SortExpression="Nome" />
              <asp:BoundField DataField="Tipo" HeaderText="Tipo" Visible="true" SortExpression="Tipo" />
              <asp:BoundField DataField="Marca" HeaderText="Marca" Visible="true" SortExpression="Marca" />
              <asp:BoundField DataField="GrandezzaFisica" HeaderText="GrandezzaFisica" Visible="true" SortExpression="GrandezzaFisica" />
              <asp:BoundField DataField="Interfaccia" HeaderText="Interfaccia" Visible="true" SortExpression="Interfaccia" />
              <asp:BoundField DataField="CostoUnitario" HeaderText="CostoUnitario" Visible="true" SortExpression="CostoUnitario" />
          </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlSensori" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Table]"></asp:SqlDataSource>
           
    </div>
        <hr style="height: 1px" />
        
        Primo punto: <asp:TextBox ID="txtPrimo" runat="server" Height="16px" style="margin-left: 43px" Width="150px"></asp:TextBox>
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnInizio" runat="server" Text="Inizia taratura" Width="188px" OnClick="btnInizio_Click" />
        
        <br />
        <br />
        Secondo Punto
        <asp:TextBox ID="txtSecondo" runat="server" style="margin-left: 23px" Width="152px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnPunto" runat="server" Text="Punto di calibrazione" Width="189px" OnClick="btnPunto_Click" />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnTermina" runat="server" Text="Termina taratura" Width="186px" OnClick="btnTermina_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnChiudi" runat="server" Text="Chiudi tutto" Width="184px" OnClick="btnChiudi_Click" />
        <br />
        <p>
            &nbsp;</p>
        
    </form>
</body>
</html>
