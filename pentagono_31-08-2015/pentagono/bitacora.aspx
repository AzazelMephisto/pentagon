<%@ Page Title="" Language="C#" MasterPageFile="~/pentagonoPage.Master" AutoEventWireup="true" CodeBehind="bitacora.aspx.cs" Inherits="pentagono.bitacora" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <div style="background-color:#FEFEFE; padding:8px;">
        <asp:GridView ID="GridView1" runat="server" Width="385px" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="bitac_id" DataSourceID="bitacoraData" ForeColor="#333333" GridLines="None" Font-Size="Small">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="bitac_id" HeaderText="bitac_id" InsertVisible="False" ReadOnly="True" SortExpression="bitac_id" />
                <asp:BoundField DataField="bitac_date" HeaderText="Fecha" SortExpression="bitac_date" />
                <asp:BoundField DataField="bitac_action" SortExpression="bitac_action" />
                <asp:BoundField DataField="bitac_desc" HeaderText="Descripción" SortExpression="bitac_desc" />
                <asp:BoundField DataField="bitac_module" HeaderText="Modulo" SortExpression="bitac_module" />
                <asp:BoundField DataField="bitac_key1" HeaderText="No. Evento" SortExpression="bitac_key1" />
                <asp:BoundField DataField="bitac_key2" SortExpression="bitac_key2" />
                <asp:BoundField DataField="usr_username" HeaderText="Usuario" SortExpression="usr_username" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="bitacoraData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_bitacora] WHERE ([bitac_key1] = @bitac_key1)">
            <SelectParameters>
                <asp:QueryStringParameter Name="bitac_key1" QueryStringField="folio" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>