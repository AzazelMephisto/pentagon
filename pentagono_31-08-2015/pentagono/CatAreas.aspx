<%@ Page Title="" Language="C#" MasterPageFile="~/pentago_theme.Master" AutoEventWireup="true" CodeBehind="CatAreas.aspx.cs" Inherits="pentagono.CatAreas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    <h1>Catálogo Área</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contenido" runat="server">
    <div style="overflow: auto; height:200px; Width:98%">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="area_id" DataSourceID="SqlDataSource1" Width="98%" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="No° area" InsertVisible="False" SortExpression="area_id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("area_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Area1" runat="server" Text='<%# Bind("area_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nombre" SortExpression="area_name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("area_name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Nombre1" runat="server" Text='<%# Bind("area_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Activo" SortExpression="area_active">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("area_active") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="Activo1" runat="server" Checked='<%# Bind("area_active") %>' Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Detalle">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click1">Editar</asp:LinkButton>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_areas] order by area_id desc"></asp:SqlDataSource>
    </div>
    <p></p>
    &nbsp;<asp:Button ID="Button3" runat="server" Text="Nuevo" CssClass="btn btn-primary" OnClick="Button3_Click" />
    <asp:HiddenField ID="HiddenField1" runat="server" Value="0" ClientIDMode="Static" />
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
        <tr style="visibility:hidden">
            <td>No°:</td>
            <td>
                <asp:TextBox ID="NoArea" runat="server" Width="35%"></asp:TextBox>
            </td>
            <td></td>
        </tr>
        <tr>
            <td>Nombre:</td>
            <td>
                <asp:TextBox ID="Nombre" runat="server" Width="35%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Nombre" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="Usuario">favor de ingresar el dato</asp:RequiredFieldValidator>
            </td>
            <td></td>
        </tr>
   
        <tr>
            <td>Activo:</td>
            <td>
                <asp:RadioButtonList ID="RadioButtonList2" runat="server" Height="18px" RepeatDirection="Horizontal" Width="96px">
                    <asp:ListItem Value="1" Selected="True">SI</asp:ListItem>
                    <asp:ListItem Value="0">NO</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td></td>
        </tr>
       
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" OnClick="Button2_Click" Text="Guardar" ValidationGroup="Usuario" Width="25%" />
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
