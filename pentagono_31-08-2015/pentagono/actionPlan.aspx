<%@ Page MaintainScrollPositionOnPostback="true" Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/pentagonoPage.Master" AutoEventWireup="true" CodeBehind="actionPlan.aspx.cs" Inherits="pentagono.actionPlan" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <div class="col-12" style="background-color:#FEFEFE;">
    <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal">
        <h1>Reporte de Incidentes / Accidentes</h1>
    <hr />
    <br />
    <asp:DropDownList ID="ddl_pager" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_pager_SelectedIndexChanged">
            <asp:ListItem Value="10">Seleccione un opcion</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>20</asp:ListItem>
            <asp:ListItem>25</asp:ListItem>
            <asp:ListItem>30</asp:ListItem>
            <asp:ListItem>35</asp:ListItem>
            <asp:ListItem>40</asp:ListItem>
            <asp:ListItem>45</asp:ListItem>
            <asp:ListItem>50</asp:ListItem>
        </asp:DropDownList>
        &nbsp;&nbsp;
        <asp:Button ID="btn_excel" runat="server" OnClick="btn_excel_Click" Text="Exportar a excel" />
        &nbsp;<asp:GridView ID="grv_actionPlan" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" DataSourceID="actionPlanData" AllowPaging="True" AllowSorting="True" DataKeyNames="inv_id">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="inv_id" HeaderText="Item" ReadOnly="True" SortExpression="inv_id" >
            <HeaderStyle Width="100px" />
            <ItemStyle Width="100px" />
            </asp:BoundField>
            <asp:HyperLinkField DataNavigateUrlFields="incident_serial" DataNavigateUrlFormatString="investigation.aspx?folio={0}" DataTextField="incident_serial" HeaderText="Folio" />
            <asp:BoundField DataField="proc_desc" HeaderText="Proceso" SortExpression="proc_desc" />
            <asp:BoundField DataField="area_name" HeaderText="Area" SortExpression="area_name" />
            <asp:BoundField DataField="evPlace_name" HeaderText="Ubicacion" SortExpression="evPlace_name" />
            <asp:BoundField DataField="incident_desc" HeaderText="Descricpión del Problema" SortExpression="incident_desc" />
            <asp:BoundField DataField="causeType_desc" HeaderText="Tipo de Causa" SortExpression="causeType_desc" />
            <asp:BoundField DataField="cause_desc" HeaderText="Causa" SortExpression="cause_desc" />
            <asp:BoundField DataField="inv_actions" HeaderText="Acciones" SortExpression="inv_actions" />
            <asp:BoundField DataField="actType_desc" HeaderText="Tipo de Accion" SortExpression="actType_desc" />
            <asp:BoundField DataField="ctrlType_desc" HeaderText="Tipo de Control" SortExpression="ctrlType_desc" />
            <asp:BoundField DataField="resp_name" HeaderText="Responsable" SortExpression="resp_name" />
            <asp:BoundField DataField="incident_date" HeaderText="Fecha de Inicio" SortExpression="incident_date" />
            <asp:BoundField DataField="inv_compromiseDate" HeaderText="Fecha Compromiso" SortExpression="inv_compromiseDate" />
            <asp:BoundField DataField="actPlan_comment" HeaderText="Comentarios" SortExpression="actPlan_comment" />
            <asp:BoundField DataField="stat_desc" HeaderText="Estatus" SortExpression="stat_desc" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle CssClass="gridHeader" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" Font-Size="Small" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
        <asp:SqlDataSource ID="actionPlanData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [view_actionPlan] WHERE ([causeType_desc] = @causeType_desc)">
            <SelectParameters>
                <asp:Parameter DefaultValue="Raíz" Name="causeType_desc" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    </div>
</asp:Content>
