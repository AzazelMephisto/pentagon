<%@ Page Title="" Language="C#" MasterPageFile="~/pentago_theme.Master" AutoEventWireup="true" CodeBehind="CatFormatos.aspx.cs" Inherits="pentagono.CatFormatos" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    <h1>Catálogo Formatos</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contenido" runat="server">
  <div style="overflow: auto; height:200px; Width:98%">
        <asp:GridView ID="GridView1" runat="server" Width="98%" AutoGenerateColumns="False" DataKeyNames="format_id" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="No° formato" InsertVisible="False" SortExpression="format_id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("format_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="FormatId" runat="server" Text='<%# Bind("format_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Codigo" SortExpression="format_codigo">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("format_codigo") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Codigo" runat="server" Text='<%# Bind("format_codigo") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Version" SortExpression="format_version">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("format_version") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="version" runat="server" Text='<%# Bind("format_version") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Revision" SortExpression="format_rev">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("format_rev") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="FormRev" runat="server" Text='<%# Bind("format_rev") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="format_nextRev" HeaderText="format_nextRev" SortExpression="format_nextRev" Visible="False" />
                <asp:TemplateField HeaderText="Nombre" SortExpression="format_name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("format_name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Name" runat="server" Text='<%# Bind("format_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Norma" SortExpression="format_norma">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("format_norma") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Norma" runat="server" Text='<%# Bind("format_norma") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Selecciona">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton" runat="server" OnClick="LinkButton_Click">Selecciona</asp:LinkButton>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_formats]  order by format_id desc"></asp:SqlDataSource>
  </div>
  <asp:Button ID="Button1" runat="server" Text="Nuevo" CssClass="btn btn-primary" OnClick="Button1_Click" />
         <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />
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
                <tr>
                    <td>No°Formato:</td>
                    <td>
                        <asp:Label ID="FormatID" runat="server" ClientIDMode="Static"></asp:Label>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style1">Formato Codigo:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="FrmCodigo" runat="server" Width="35%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="FrmCodigo" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="Usuario">favor de ingresar el dato</asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style1"></td>
                </tr>

                <tr>
                    <td class="auto-style1">versión:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="FrmVersion" runat="server" Width="35%" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="FrmVersion" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="Usuario">favor de ingresar el dato</asp:RequiredFieldValidator>
              
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="FrmVersion" ErrorMessage="verifique el formato del campo " ForeColor="Red" ValidationExpression="^[0-9]+\.?([0-9]{1,2})?$" ValidationGroup="Usuario"></asp:RegularExpressionValidator>
              
                   </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td>Revisión:</td>
                    <td>
                        <asp:TextBox ID="FrmRev" runat="server" Width="35%" ValidationExpression="^\d{2}/\d{2}/\d{4}$"></asp:TextBox>
                
                        <cc1:CalendarExtender ID="FrmRev_CalendarExtender" runat="server" TargetControlID="FrmRev" Format="dd/MM/yyyy" />
                
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="FrmRev" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="Usuario">favor de ingresar el dato</asp:RequiredFieldValidator>
              
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="FrmRev" ErrorMessage="verifique el formato del campo " ForeColor="Red" ValidationExpression="^\d{2}/\d{2}/\d{4}$" ValidationGroup="Usuario"></asp:RegularExpressionValidator>
              
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Nombre:</td>
                    <td>
                        <asp:TextBox ID="FrmNombre" runat="server" Width="35%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FrmRev" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="Usuario">favor de ingresar el dato</asp:RequiredFieldValidator>
                </td>
                    <td></td>
                </tr>              
                <tr>
                    <td>Norma:</td>
                    <td>
                        <asp:TextBox ID="FrmNorma" runat="server" Width="35%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="FrmNorma" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="Usuario">favor de ingresar el dato</asp:RequiredFieldValidator>
                    </td>
                    <td></td>
               </tr>

                 <tr>
                    <td>&nbsp;</td>
                    <td>  
                        <asp:Button ID="Button2" Width="25%" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="Button2_Click" ValidationGroup="Usuario" ClientIDMode="Static" />
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

 });


</script>   
</asp:Content>
