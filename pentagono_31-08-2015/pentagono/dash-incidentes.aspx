<%@ Page Title="" Language="C#" MasterPageFile="~/pentago_theme.Master" AutoEventWireup="true" CodeBehind="dash-incidentes.aspx.cs" Inherits="pentagono.dash_incidentes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="titulo" runat="server">
    <h1>Reportes</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <div style="background-color:#FEFEFE;">
    <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
    <asp:GridView ID="grv_incidents" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True" style="margin-bottom: 3px" DataSourceID="dashReportsData" CssClass="table table-bordered table-hover dataTable">
        <Columns>
            <asp:TemplateField HeaderText="Folio" InsertVisible="False" SortExpression="incident_id">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("incident_id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("incident_id", "incidDetail.aspx?folio={0}") %>' Text='<%# Eval("incident_id") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="usrInfo_name" HeaderText="Usuario" SortExpression="usrInfo_name" />
            <asp:BoundField DataField="incident_desc" HeaderText="Descripción" SortExpression="incident_desc" />
            <asp:BoundField DataField="incident_date" HeaderText="Fecha de evento" SortExpression="incident_date" />
            <asp:BoundField DataField="turn_desc" HeaderText="Turno" SortExpression="turn_desc" />
            <asp:BoundField DataField="gec_desc" HeaderText="Acc / Inc" SortExpression="gec_desc" />
            <asp:BoundField DataField="evClass_name" HeaderText="Clasificación" SortExpression="evClass_name" />
            <asp:BoundField DataField="evPlace_name" HeaderText="Ubicación" SortExpression="evPlace_name" />
            <asp:TemplateField HeaderText="Estatus" SortExpression="stat_desc">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("stat_desc") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" CssClass='<%# formatoEstatus(Convert.ToInt32( Eval("stat_id") )) %>' Text='<%# Bind("stat_desc") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <RowStyle Font-Size="Small" />
    </asp:GridView>
        <asp:ObjectDataSource ID="incidentesData" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByUserResp" TypeName="pentagono.DataSet1TableAdapters.view_incidentesTableAdapter">
            <SelectParameters>
                <asp:Parameter Name="Param1" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:GridView ID="grv_incidents0" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-bordered table-hover dataTable" DataSourceID="incidentData" style="margin-bottom: 3px" Width="100%">
            <Columns>
                <asp:TemplateField HeaderText="Folio" InsertVisible="False" SortExpression="incident_id">
                    <EditItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("incident_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("incident_id", "incidDetail.aspx?folio={0}") %>' Text='<%# Eval("incident_id") %>'></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="usrInfo_name" HeaderText="Usuario" SortExpression="usrInfo_name" />
                <asp:BoundField DataField="incident_desc" HeaderText="Descripción" SortExpression="incident_desc" />
                <asp:BoundField DataField="incident_date" HeaderText="Fecha de evento" SortExpression="incident_date" />
                <asp:BoundField DataField="turn_desc" HeaderText="Turno" SortExpression="turn_desc" />
                <asp:BoundField DataField="gec_desc" HeaderText="Acc / Inc" SortExpression="gec_desc" />
                <asp:BoundField DataField="evClass_name" HeaderText="Clasificación" SortExpression="evClass_name" />
                <asp:BoundField DataField="evPlace_name" HeaderText="Ubicación" SortExpression="evPlace_name" />
                <asp:TemplateField HeaderText="Estatus" SortExpression="stat_desc">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("stat_desc") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" CssClass='<%# formatoEstatus(Convert.ToInt32( Eval("stat_id") )) %>' Text='<%# Bind("stat_desc") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <RowStyle Font-Size="Small" />
        </asp:GridView>

        <asp:SqlDataSource ID="dashReportsData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_incident.incident_id, tbl_incident.incident_desc, tbl_incident.incident_date, tbl_turn.turn_desc, tbl_globalEventClass.gec_desc, tbl_eventClass.evClass_name, tbl_eventPlace.evPlace_name, tbl_userInfo.usrInfo_name, tbl_user.resp_id, tbl_user.usr_id, tbl_incident.stat_id, tbl_status_1.stat_desc FROM tbl_incident INNER JOIN tbl_eventClass ON tbl_incident.evClass_id = tbl_eventClass.evClass_id INNER JOIN tbl_eventPlace ON tbl_incident.evPlace_id = tbl_eventPlace.evPlace_id INNER JOIN tbl_eventType ON tbl_incident.event_id = tbl_eventType.event_id INNER JOIN tbl_globalEventClass ON tbl_incident.gec_id = tbl_globalEventClass.gec_id INNER JOIN tbl_turn ON tbl_incident.turn_id = tbl_turn.turn_id INNER JOIN tbl_status ON tbl_incident.stat_id = tbl_status.stat_id INNER JOIN tbl_user ON tbl_incident.usr_id = tbl_user.usr_id INNER JOIN tbl_userInfo ON tbl_user.usrInfo_id = tbl_userInfo.usrInfo_id INNER JOIN tbl_status AS tbl_status_1 ON tbl_incident.stat_id = tbl_status_1.stat_id WHERE (tbl_user.resp_id = @resp_id) ORDER BY tbl_incident.incident_id DESC">
            <SelectParameters>
                <asp:SessionParameter Name="resp_id" SessionField="userID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="incidentData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_incident.incident_id, tbl_incident.incident_desc, tbl_incident.incident_date, tbl_turn.turn_desc, tbl_globalEventClass.gec_desc, tbl_eventClass.evClass_name, tbl_eventPlace.evPlace_name, tbl_userInfo.usrInfo_name, tbl_user.resp_id, tbl_user.usr_id, tbl_incident.stat_id, tbl_status_1.stat_desc FROM tbl_incident INNER JOIN tbl_eventClass ON tbl_incident.evClass_id = tbl_eventClass.evClass_id INNER JOIN tbl_eventPlace ON tbl_incident.evPlace_id = tbl_eventPlace.evPlace_id INNER JOIN tbl_eventType ON tbl_incident.event_id = tbl_eventType.event_id INNER JOIN tbl_globalEventClass ON tbl_incident.gec_id = tbl_globalEventClass.gec_id INNER JOIN tbl_turn ON tbl_incident.turn_id = tbl_turn.turn_id INNER JOIN tbl_status ON tbl_incident.stat_id = tbl_status.stat_id INNER JOIN tbl_user ON tbl_incident.usr_id = tbl_user.usr_id INNER JOIN tbl_userInfo ON tbl_user.usrInfo_id = tbl_userInfo.usrInfo_id INNER JOIN tbl_status AS tbl_status_1 ON tbl_incident.stat_id = tbl_status_1.stat_id ORDER BY tbl_incident.incident_id DESC">
        </asp:SqlDataSource>
    </asp:Panel>
    </div>
</asp:Content>
