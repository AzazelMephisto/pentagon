<%@ Page Title="" Language="C#" MasterPageFile="~/pentago_theme.Master" AutoEventWireup="true" CodeBehind="dash-vos.aspx.cs" Inherits="pentagono.dash_vos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    <h3><asp:Label ID="Label1" runat="server" Text="Reporte Observaciones VOS"></asp:Label></h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contenido" runat="server">
    <div style="background-color:#FEFEFE">

   <div style="overflow: auto; height:30%; Width:100%">
       <asp:GridView ID="dgv_vos1" runat="server" AutoGenerateColumns="False" CssClass="table" DataSourceID="sds_vosreport" ClientIDMode="Static" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="5">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Identificador" InsertVisible="False" SortExpression="v_id">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("v_id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="V_ID1" runat="server" Text='<%# Bind("v_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="area_id" HeaderText="area_id" SortExpression="area_id" Visible="False" />
            <asp:BoundField DataField="usr_id" HeaderText="usr_id" SortExpression="usr_id" Visible="False" />
            <asp:BoundField DataField="v_date" HeaderText="Fecha" SortExpression="v_date" />
            <asp:BoundField DataField="vp_id" HeaderText="vp_id" SortExpression="vp_id" Visible="False" />
            <asp:BoundField DataField="usr_username" HeaderText="Usuario" SortExpression="usr_username" />
            <asp:BoundField DataField="v_place" HeaderText="Lugar" SortExpression="v_place" />
            <asp:BoundField DataField="vp_desc" HeaderText="Proceso" SortExpression="vp_desc" />
            <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" Visible="False" />
            <asp:BoundField DataField="Expr2" HeaderText="Expr2" SortExpression="Expr2" Visible="False" />
            <asp:BoundField DataField="Expr3" HeaderText="Expr3" InsertVisible="False" ReadOnly="True" SortExpression="Expr3" Visible="False" />
            <asp:BoundField DataField="area_name" HeaderText="Area" SortExpression="area_name" />
            <asp:TemplateField HeaderText="Detalle">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click1">Detalle</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
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
   </div>



    <asp:SqlDataSource ID="sds_vosreport" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_vos.v_id, tbl_vos.area_id, tbl_vos.usr_id, tbl_vos.v_date, tbl_vos.vp_id, tbl_vos.v_place, tbl_vosproc.vp_desc, tbl_vos.usr_id AS Expr1, tbl_user.usr_id AS Expr2, tbl_user.usr_username, tbl_areas.area_id AS Expr3, tbl_areas.area_name FROM tbl_vos INNER JOIN tbl_vosproc ON tbl_vos.vp_id = tbl_vosproc.vp_id INNER JOIN tbl_areas ON tbl_vos.area_id = tbl_areas.area_id INNER JOIN tbl_user ON tbl_vos.usr_id = tbl_user.usr_id order by tbl_vos.v_id desc"></asp:SqlDataSource>
        <div style="overflow: auto; height:30%; max-height :30% ; Width:100%">
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="v_id,vd_id,Expr1,Expr2" DataSourceID="SqlDataSource1" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="v_id" HeaderText="v_id" InsertVisible="False" ReadOnly="True" SortExpression="v_id" Visible="False" />
                <asp:BoundField DataField="b_id" HeaderText="b_id" SortExpression="b_id" Visible="False" />
                <asp:BoundField DataField="b_name" HeaderText="Pregunta" SortExpression="b_name" />
                <asp:CheckBoxField DataField="b_active" HeaderText="b_active" SortExpression="b_active" Visible="False" />
                <asp:BoundField DataField="vd_retro" HeaderText="vd_retro" SortExpression="vd_retro" Visible="False" />
                <asp:BoundField DataField="vd_id" HeaderText="vd_id" SortExpression="vd_id" InsertVisible="False" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="Expr1" HeaderText="Expr1" InsertVisible="False" ReadOnly="True" SortExpression="Expr1" Visible="False" />
                <asp:BoundField DataField="vo_id" HeaderText="vo_id" SortExpression="vo_id" Visible="False" />
                <asp:BoundField DataField="vo_desc" HeaderText="observación" SortExpression="vo_desc" />
                <asp:BoundField DataField="Expr2" HeaderText="Expr2" InsertVisible="False" ReadOnly="True" SortExpression="Expr2" Visible="False" />
                <asp:TemplateField HeaderText="Si/No">
                    <ItemTemplate>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Enabled="False" RepeatDirection="Horizontal" SelectedValue='<%# Bind("vd_retro") %>'>
                            <asp:ListItem Value="1">SI</asp:ListItem>
                            <asp:ListItem Value="0">No</asp:ListItem>
                        </asp:RadioButtonList>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="vd_commet" HeaderText="Comentario" SortExpression="vd_commet" />
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
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_vos.v_id, tbl_vosdtl.vd_commet, tbl_vosdtl.b_id, tbl_behavior.b_name, tbl_behavior.b_active, tbl_vosdtl.vd_retro, tbl_vosdtl.vd_id, tbl_behavior.b_id AS Expr1, tbl_vosdtl.vo_id, tbl_vosobs.vo_desc, tbl_vosobs.vo_id AS Expr2 FROM tbl_behavior INNER JOIN tbl_vosdtl ON tbl_behavior.b_id = tbl_vosdtl.b_id INNER JOIN tbl_vos ON tbl_vosdtl.v_id = tbl_vos.v_id INNER JOIN tbl_vosobs ON tbl_vosdtl.vo_id = tbl_vosobs.vo_id WHERE (tbl_vos.v_id = @vosId)">
            <SelectParameters>
                <asp:Parameter DefaultValue="" Name="vosId" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>


</asp:Content>
