<%@ Page Title="" Language="C#" MasterPageFile="~/pentago_theme.Master" AutoEventWireup="true" CodeBehind="dash-inspect.aspx.cs" Inherits="pentagono.dash_inspect" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contenido" runat="server">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
           <div class="box box-primary">
               <div class="box-header with-border">
                    <h3 class="box-title">
                        <asp:Label ID="lbl_title" runat="server" Text="Listado de Inspecciones"></asp:Label>
&nbsp;</h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                    </div>
                </div>
            <div class="box-body">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sds_inspects" CssClass="table table-bordered table-hover dataTable">
        <Columns>
            <asp:TemplateField HeaderText="Folio" InsertVisible="False" SortExpression="inspect_id">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("inspect_id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# String.Format("inspectRes.aspx?inspectID={0}&actPlanID={1}", Eval("inspect_id"), Eval("actPlan_id")) %>' Text='<%# Eval("inspect_id") %>'></asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="area_name" HeaderText="Area" SortExpression="area_name" />
            <asp:BoundField DataField="format_codigo" HeaderText="Formato" SortExpression="format_codigo" />
            <asp:BoundField DataField="inspect_date" HeaderText="Fecha" SortExpression="inspect_date" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="inspect_start" HeaderText="inspect_start" SortExpression="inspect_start" Visible="False" />
            <asp:BoundField DataField="usr_username" HeaderText="Usuario" SortExpression="usr_username" />
            <asp:BoundField DataField="actPlan_id" HeaderText="Plan de acción" SortExpression="actPlan_id" />
            <asp:TemplateField HeaderText="Estatus" SortExpression="stat_desc">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("stat_desc") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" CssClass='<%# formatoEstatus(Convert.ToInt32( Eval("stat_id") )) %>' Text='<%# Bind("stat_desc") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
                </div>
            <div class="box-footer">
            </div>
          </div>
        </div>
        <div class="col-md-1"></div>
    </div>
    <asp:SqlDataSource ID="sds_inspects" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_inspect.inspect_id, tbl_areas.area_name, tbl_formats.format_codigo, tbl_inspect.inspect_date, tbl_inspect.inspect_start, tbl_inspect.usr_username, tbl_actionPlan.actPlan_id, tbl_status.stat_id, tbl_status.stat_desc FROM tbl_inspect INNER JOIN tbl_formats ON tbl_inspect.format_id = tbl_formats.format_id INNER JOIN tbl_areas ON tbl_inspect.area_id = tbl_areas.area_id INNER JOIN tbl_actionPlan ON tbl_inspect.inspect_id = tbl_actionPlan.key1 INNER JOIN tbl_status ON tbl_inspect.stat_id = tbl_status.stat_id WHERE tbl_actionPlan.proc_id=7"></asp:SqlDataSource>
</asp:Content>
