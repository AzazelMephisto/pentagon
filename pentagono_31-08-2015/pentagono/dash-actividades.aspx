<%@ Page Title="" Language="C#" MasterPageFile="~/pentago_theme.Master" AutoEventWireup="true" CodeBehind="dash-actividades.aspx.cs" Inherits="pentagono.dash_actividades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    Actividades
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contenido" runat="server">
    <div class="box box-primary">
        <div class="box-header">
            <h3 class="box-title">Actividades</h3>
        </div>
        <div class="box-body">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" />
            <br />
            <fieldset>
                <legend>Filtros</legend>

            </fieldset>
        </div>
        <div class="box-footer">

            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover dataTable" AutoGenerateColumns="False" DataKeyNames="evAction_id" DataSourceID="actividadesData">
                    <Columns>
                        <asp:BoundField DataField="actType_desc" HeaderText="Tipo de Acción" SortExpression="actType_desc" />
                        <asp:BoundField DataField="evAction_actions" HeaderText="Acciones" SortExpression="evAction_actions" />
                        <asp:BoundField DataField="ctrlType_desc" HeaderText="Tipo de Control" SortExpression="ctrlType_desc" />
                        <asp:BoundField DataField="usrInfo_name" HeaderText="Responsable" SortExpression="usrInfo_name" />
                        <asp:BoundField DataField="evAction_date" HeaderText="Fecha Compromiso" SortExpression="evAction_date" />
                        <asp:BoundField DataField="evAction_closeDate" HeaderText="Fecha cierre" SortExpression="evAction_closeDate" />
                        <asp:BoundField DataField="evAction_fileEvidence" HeaderText="Evidencia" SortExpression="evAction_fileEvidence" />
                        <asp:BoundField DataField="stat_desc" HeaderText="Estatus" SortExpression="stat_desc" />
                        <asp:BoundField DataField="incident_id" HeaderText="Folio" SortExpression="incident_id" />
                    </Columns>
                </asp:GridView>
            </asp:Panel>
            <asp:SqlDataSource ID="actividadesData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_eventActions.evAction_id, tbl_eventActions.actType_id, tbl_eventActions.evAction_actions, tbl_eventActions.crtlType_id, tbl_eventActions.resp_id, tbl_eventActions.evAction_date, tbl_eventActions.evAction_closeDate, tbl_eventActions.evAction_fileEvidence, tbl_eventActions.stat_id, tbl_eventActions.incident_id, tbl_actionType.actType_desc, tbl_controlType.ctrlType_desc, tbl_userInfo.usrInfo_name, tbl_status.stat_desc FROM tbl_controlType INNER JOIN tbl_eventActions INNER JOIN tbl_actionType ON tbl_eventActions.actType_id = tbl_actionType.actType_id INNER JOIN tbl_status ON tbl_eventActions.stat_id = tbl_status.stat_id INNER JOIN tbl_userInfo INNER JOIN tbl_user ON tbl_userInfo.usrInfo_id = tbl_user.usrInfo_id ON tbl_eventActions.resp_id = tbl_user.usr_id ON tbl_controlType.ctrlType_id = tbl_eventActions.crtlType_id"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
