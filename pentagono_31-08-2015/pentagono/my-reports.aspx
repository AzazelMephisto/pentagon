<%@ Page Title="" Language="C#" MasterPageFile="~/pentago_theme.Master" AutoEventWireup="true" CodeBehind="my-reports.aspx.cs" Inherits="pentagono.my_reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="titulo" runat="server">
    <h1>Mis reportes</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <div class="col-12" style="background-color:#FEFEFE;">
    <asp:Panel ID="Panel1" runat="server" ScrollBars="Horizontal">
    <asp:GridView ID="grv_incidents" runat="server" AutoGenerateColumns="False" Width="100%" DataSourceID="sds_reportesUser" AllowPaging="True" Font-Size="Smaller" CssClass="table table-bordered table-hover dataTable" DataKeyNames="incident_id">
        <Columns>
            <asp:TemplateField HeaderText="Folio" InsertVisible="False" SortExpression="incident_id">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("incident_id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("incident_id", "incidentes.aspx?folio={0}") %>' Text='<%# Eval("incident_id") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="gec_desc" HeaderText="Acc / Incid" SortExpression="gec_desc" />
            <asp:BoundField DataField="incident_desc" HeaderText="Descripción" SortExpression="incident_desc" />
            <asp:BoundField DataField="incident_date" HeaderText="Fecha" SortExpression="incident_date" />
            <asp:BoundField DataField="turn_desc" HeaderText="Turno" SortExpression="turn_desc" />
            <asp:BoundField DataField="area_name" HeaderText="Area" SortExpression="area_name" />
            <asp:BoundField DataField="event_desc" HeaderText="Event" SortExpression="event_desc" />
            <asp:BoundField DataField="evPlace_name" HeaderText="Ubicación" SortExpression="evPlace_name" />
            <asp:TemplateField HeaderText="Estatus" SortExpression="stat_desc">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("stat_desc") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" CssClass='<%# GetImageUrl(Convert.ToInt32(Eval("stat_id")))  %>' Text='<%# Bind("stat_desc") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="incident_serial" HeaderText="incident_serial" SortExpression="incident_serial" Visible="False" />
            <asp:BoundField DataField="usr_id" HeaderText="usr_id" SortExpression="usr_id" Visible="False" />
            <asp:BoundField DataField="usr_username" HeaderText="usr_username" SortExpression="usr_username" Visible="False" />
            <asp:BoundField DataField="stat_id" HeaderText="stat_id" SortExpression="stat_id" Visible="False" />
        </Columns>
        <PagerStyle CssClass="table table-bordered" />
        <RowStyle Font-Size="Small" />
    </asp:GridView>

        <asp:ObjectDataSource ID="userReports" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByUser" TypeName="pentagono.DataSet1TableAdapters.view_incidentesTableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="Param1" SessionField="userID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:SqlDataSource ID="sds_reportesUser" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_incident.incident_desc, tbl_incident.incident_date, tbl_turn.turn_desc, tbl_areas.area_name, tbl_eventType.event_desc, tbl_eventPlace.evPlace_name, tbl_incident.incident_serial, tbl_globalEventClass.gec_desc, tbl_incident.usr_id, tbl_user.usr_username, tbl_status.stat_desc, tbl_incident.stat_id, tbl_incident.incident_id FROM tbl_globalEventClass INNER JOIN tbl_incident ON tbl_globalEventClass.gec_id = tbl_incident.gec_id INNER JOIN tbl_eventPlace ON tbl_incident.evPlace_id = tbl_eventPlace.evPlace_id INNER JOIN tbl_turn ON tbl_incident.turn_id = tbl_turn.turn_id INNER JOIN tbl_areas ON tbl_incident.area_id = tbl_areas.area_id INNER JOIN tbl_status ON tbl_incident.stat_id = tbl_status.stat_id INNER JOIN tbl_user ON tbl_incident.usr_username = tbl_user.usr_username LEFT OUTER JOIN tbl_eventType ON tbl_incident.event_id = tbl_eventType.event_id WHERE (tbl_user.usr_username = @usr_username) ORDER BY tbl_incident.incident_id DESC">
            <SelectParameters>
                <asp:SessionParameter Name="usr_username" SessionField="userName" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    </div>
</asp:Content>
