<%@ Page Title="" Language="C#" MasterPageFile="~/pentago_theme.Master" AutoEventWireup="true" CodeBehind="CatAreaFicica.aspx.cs" Inherits="pentagono.CatAreaFicica" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
 <h1>Catálogo Área Física</h1>   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contenido" runat="server">
      <div style="overflow: auto; height:200px; Width:98%">
          <asp:GridView ID="GridView1" Width="98%" runat="server" AutoGenerateColumns="False" DataKeyNames="areaF_id,Expr1" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
              <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="No°Área Física" InsertVisible="False" SortExpression="areaF_id">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("areaF_id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="NoAreaFis" runat="server" Text='<%# Bind("areaF_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nombre Área Física" SortExpression="areaF_name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("areaF_name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="NomArea" runat="server" Text='<%# Bind("areaF_name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Activo" SortExpression="areaF_active">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("areaF_active") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="Activo" runat="server" Checked='<%# Bind("areaF_active") %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="area_id" SortExpression="area_id" Visible="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("area_id") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="AreaId" runat="server" Text='<%# Bind("area_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="area_name" HeaderText="Área" SortExpression="area_name" />
            <asp:BoundField DataField="Expr1" HeaderText="Expr1" InsertVisible="False" ReadOnly="True" SortExpression="Expr1" Visible="False" />
            <asp:TemplateField HeaderText="Editar">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Editar</asp:LinkButton>
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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_areasFisicas.areaF_id, tbl_areasFisicas.areaF_name, tbl_areasFisicas.areaF_active, tbl_areasFisicas.area_id, tbl_areas.area_name, tbl_areas.area_id AS Expr1 FROM tbl_areasFisicas INNER JOIN tbl_areas ON tbl_areasFisicas.area_id = tbl_areas.area_id order by areaF_id desc"></asp:SqlDataSource>
    <p>
        <asp:Button ID="Button3" runat="server" Text="Nuevo"  CssClass="btn btn-primary" OnClick="Button3_Click" />
        <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" Value="0" />
      </p>
    <div id="PanelDatos" >
          <table style=" Width:98%">
                <tr style="visibility:hidden">
                    <td>No°: UsrInfo</td>
                    <td>
                        <asp:TextBox ID="NumUsr" runat="server" Width="35%"></asp:TextBox>
                        &nbsp;
                        <asp:TextBox ID="usrinfo" runat="server" Width="144px"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <tr style="visibility:hidden"">
                    <td>No° AreaFisica:</td>
                    <td>
                        <asp:TextBox ID="NoAreaFi" runat="server" Width="35%"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td>
                        <asp:TextBox ID="Nombre" runat="server" Width="35%"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Nombre" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="Usuario">favor de ingresar el dato</asp:RequiredFieldValidator>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style1">Activa</td>
                    <td class="auto-style1">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="35%" RepeatDirection="Horizontal" AppendDataBoundItems="True">
                            <asp:ListItem Value="1" Selected="True">SI</asp:ListItem>
                            <asp:ListItem Value="0">NO</asp:ListItem>
                        </asp:RadioButtonList>
                    &nbsp;</td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td>Area</td>
                    <td>
                        <asp:DropDownList ID="AreaFun" runat="server" Width="35%" DataSourceID="SqlDataSource2" DataTextField="area_name" DataValueField="area_id" AppendDataBoundItems="True">
                            <asp:ListItem Value="0">seleccione un valor</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="AreaFun" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[1-9][0-9]*$" ValidationGroup="Usuario">seleccione un elemento</asp:RegularExpressionValidator>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_areas.* FROM tbl_areas where area_active=1"></asp:SqlDataSource>
                    </td>
                    <td></td>
                </tr>
             
                 <tr>
                    <td>&nbsp;</td>
                    <td>  
                        <asp:Button ID="Button2" Width="25%" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="Button2_Click" ValidationGroup="Usuario" />
                     </td>
                    <td></td>
                </tr>
            </table>
     </div>

    <script>
 $(document).ready(function () {

        var val = $("#HiddenField1").val();
        //alert(val);
        if (val == '1') {
            //alert("click de la clase ");
            $("#PanelDatos").css("visibility", "visible");
        } else {
            $("#PanelDatos").css("visibility", "hidden");
        }

        //var aux = $("#HiddenField2").val();
        //alert(aux);
        //if (aux == "1") {
        //    alert("Guardado correctamente!");
        //    $("#HiddenField2").val("0");
        //}
});
</script>

</asp:Content>
