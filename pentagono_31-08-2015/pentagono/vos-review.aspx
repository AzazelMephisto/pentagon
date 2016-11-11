<%@ Page Title="" Language="C#" MasterPageFile="~/pentago_theme.Master" AutoEventWireup="true" CodeBehind="vos-review.aspx.cs" Inherits="pentagono.vos_review" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contenido" runat="server">
    <div style="background-color:#FEFEFE;">
        <div class="box box-primary">
               <div class="box-header with-border">
                    <h3 class="box-title"><asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                    </h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                    </div>
                </div>
        <div class="box-body">
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="v_id" DataSourceID="sds_vosHead">
        <EditItemTemplate>
            v_id:
            <asp:Label ID="v_idLabel1" runat="server" Text='<%# Eval("v_id") %>' />
            <br />
            area_id:
            <asp:TextBox ID="area_idTextBox" runat="server" Text='<%# Bind("area_id") %>' />
            <br />
            v_viewer:
            <asp:TextBox ID="v_viewerTextBox" runat="server" Text='<%# Bind("v_viewer") %>' />
            <br />
            v_date:
            <asp:TextBox ID="v_dateTextBox" runat="server" Text='<%# Bind("v_date") %>' />
            <br />
            vp_id:
            <asp:TextBox ID="vp_idTextBox" runat="server" Text='<%# Bind("vp_id") %>' />
            <br />
            v_place:
            <asp:TextBox ID="v_placeTextBox" runat="server" Text='<%# Bind("v_place") %>' />
            <br />
            area_name:
            <asp:TextBox ID="area_nameTextBox" runat="server" Text='<%# Bind("area_name") %>' />
            <br />
            vp_desc:
            <asp:TextBox ID="vp_descTextBox" runat="server" Text='<%# Bind("vp_desc") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            area_id:
            <asp:TextBox ID="area_idTextBox" runat="server" Text='<%# Bind("area_id") %>' />
            <br />
            v_viewer:
            <asp:TextBox ID="v_viewerTextBox" runat="server" Text='<%# Bind("v_viewer") %>' />
            <br />
            v_date:
            <asp:TextBox ID="v_dateTextBox" runat="server" Text='<%# Bind("v_date") %>' />
            <br />
            vp_id:
            <asp:TextBox ID="vp_idTextBox" runat="server" Text='<%# Bind("vp_id") %>' />
            <br />
            v_place:
            <asp:TextBox ID="v_placeTextBox" runat="server" Text='<%# Bind("v_place") %>' />
            <br />
            area_name:
            <asp:TextBox ID="area_nameTextBox" runat="server" Text='<%# Bind("area_name") %>' />
            <br />
            vp_desc:
            <asp:TextBox ID="vp_descTextBox" runat="server" Text='<%# Bind("vp_desc") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <strong>Area</strong>:
            <asp:Label ID="area_nameLabel" runat="server" Text='<%# Bind("area_name") %>' />
            <br />
            <strong>Observador</strong>:
            <asp:Label ID="v_viewerLabel" runat="server" Text='<%# Bind("v_viewer") %>' />
            <br />
            <strong>Fecha de revisión</strong>:
            <asp:Label ID="v_dateLabel" runat="server" Text='<%# Bind("v_date") %>' />
            <br />
            <strong>Proceso</strong>:
            <asp:Label ID="vp_descLabel" runat="server" Text='<%# Bind("vp_desc") %>' />
            <br />
            <strong>Lugar</strong>:
            <asp:Label ID="v_placeLabel" runat="server" Text='<%# Bind("v_place") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
        </div>
        <div class="box-footer">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="vd_id" DataSourceID="sds_vosdtl">
                <Columns>
                    <asp:BoundField DataField="b_num" HeaderText="No" SortExpression="b_num" />
                    <asp:BoundField DataField="b_name" HeaderText="Comportamiento" SortExpression="b_name" />
                    <asp:BoundField DataField="vo_desc" HeaderText="Observación" SortExpression="vo_desc" />
                    <asp:BoundField DataField="vd_retro" HeaderText="Retroalimentación" SortExpression="vd_retro" />
                    <asp:BoundField DataField="b_id" HeaderText="b_id" SortExpression="b_id" Visible="False" />
                    <asp:BoundField DataField="vo_id" HeaderText="vo_id" SortExpression="vo_id" Visible="False" />
                    <asp:BoundField DataField="vd_id" HeaderText="vd_id" InsertVisible="False" ReadOnly="True" SortExpression="vd_id" Visible="False" />
                    <asp:BoundField DataField="v_id" HeaderText="v_id" SortExpression="v_id" Visible="False" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sds_vosdtl" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_behavior.b_num, tbl_behavior.b_name, tbl_obs.vo_desc, tbl_vosdtl.vd_retro, tbl_vosdtl.b_id, tbl_vosdtl.vo_id, tbl_vosdtl.vd_id, tbl_vosdtl.v_id FROM tbl_vosdtl INNER JOIN tbl_obs ON tbl_vosdtl.vo_id = tbl_obs.vo_id INNER JOIN tbl_behavior ON tbl_vosdtl.b_id = tbl_behavior.b_id WHERE (tbl_vosdtl.v_id = @v_id)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="v_id" QueryStringField="vId" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    
    <asp:SqlDataSource ID="sds_vosHead" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_vos.v_id, tbl_vos.area_id, tbl_vos.v_viewer, tbl_vos.v_date, tbl_vos.vp_id, tbl_vos.v_place, tbl_areas.area_name, vos_proc.vp_desc FROM tbl_vos INNER JOIN vos_proc ON tbl_vos.vp_id = vos_proc.vp_id LEFT OUTER JOIN tbl_areas ON tbl_vos.area_id = tbl_areas.area_id WHERE (tbl_vos.v_id = @v_id)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="0" Name="v_id" QueryStringField="vId" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    
   </div>
</asp:Content>
