<%@ Page Title="" Language="C#" MasterPageFile="~/pentago_theme.Master" AutoEventWireup="true" CodeBehind="CatAspects.aspx.cs" Inherits="pentagono.CatAspects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    <h2>Catálogo Aspectos</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contenido" runat="server">
         <div style="overflow: auto; height:200px; Width:98%">
            <asp:GridView ID="GridView1" runat="server" Width="98%" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="aspect_id,Expr1" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="No° Aspecto" InsertVisible="False" SortExpression="aspect_id">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("aspect_id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="AspectId" runat="server" Text='<%# Bind("aspect_id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="format_id" SortExpression="format_id" Visible="False">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("format_id") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="FormatId" runat="server" Text='<%# Bind("format_id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="format_name" HeaderText="Formato" SortExpression="format_name" />
                    <asp:TemplateField HeaderText="Secuencia" SortExpression="aspect_sec">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("aspect_sec") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Secuen" runat="server" Text='<%# Bind("aspect_sec") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Elemento" SortExpression="aspect_element">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("aspect_element") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Aspec" runat="server" Text='<%# Bind("aspect_element") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Aspecto" SortExpression="aspect_review">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("aspect_review") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="AspectRev" runat="server" Text='<%# Bind("aspect_review") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Activo" SortExpression="aspect_active">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("aspect_active") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="Activo" runat="server" Checked='<%# Bind("aspect_active") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Expr1" HeaderText="Expr1" InsertVisible="False" ReadOnly="True" SortExpression="Expr1" Visible="False" />
                    <asp:TemplateField HeaderText="Selecciona">
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
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_aspect.*, tbl_formats.format_id AS Expr1, tbl_formats.format_name FROM tbl_aspect INNER JOIN tbl_formats ON tbl_aspect.format_id = tbl_formats.format_id order by aspect_id desc"></asp:SqlDataSource>
         </div>
    <asp:Button ID="Button3" runat="server" Text="Nueva" CssClass="btn btn-primary" OnClick="Button3_Click" />
&nbsp;<asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" />
         <div id="PanelDatos" >
            <table style=" Width:98%">
                <tr style="visibility:hidden">
                    <td>No°: UsrInfo</td>
                    <td>
                        <asp:TextBox ID="NumUsr" runat="server" Width="50%"></asp:TextBox>
                        &nbsp;
                        <asp:TextBox ID="usrinfo" runat="server" Width="144px"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>No°Aspecto:</td>
                    <td>
                        <asp:Label ID="AspectID" runat="server" ClientIDMode="Static"></asp:Label>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>No°</td>
                    <td>
                        <asp:Label ID="AspSec" runat="server"></asp:Label>
                    </td>
                    <td></td>
                </tr>

                <tr>
                    <td class="auto-style1">Formato:</td>
                    <td class="auto-style1">
                              <asp:DropDownList ID="Formatos" runat="server" Width="50%" DataSourceID="SqlDataSource2" DataTextField="format_name" DataValueField="format_id" AppendDataBoundItems="True" ClientIDMode="Static" >
                            <asp:ListItem Value="0">seleccione un valor</asp:ListItem>
                        </asp:DropDownList>
                              <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT [format_id], [format_name] FROM [tbl_formats]"></asp:SqlDataSource>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Formatos" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[1-9][0-9]*$" ValidationGroup="Usuario">seleccione un elemento</asp:RegularExpressionValidator>
                   </td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td>Elemento:</td>
                    <td>
                        <asp:TextBox ID="Elemento" runat="server"  Width="50%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Elemento" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="Usuario">favor de ingresar el dato</asp:RequiredFieldValidator>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Aspecto a verificar:</td>
                    <td>
                        <asp:TextBox ID="AspectRev" runat="server"  Width="50%" Height="150px" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="AspectRev" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="Usuario">favor de ingresar el dato</asp:RequiredFieldValidator>
                </td>
                    <td></td>
                </tr>              
                <tr>
                    <td>Activo:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="50%" RepeatDirection="Horizontal"  AppendDataBoundItems="True">
                            <asp:ListItem Value="1" Selected="True">SI</asp:ListItem>
                            <asp:ListItem Value="0">NO</asp:ListItem>
                        </asp:RadioButtonList>
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

            var aux = $("#AspectID").text();
            //alert(aux);
            if (aux != "") {
                $("#Formatos").prop('disabled', true);
            } else {
                $("#Formatos").prop('disabled', false);
            }


        } else {
            $("#PanelDatos").css("visibility", "hidden");
        }

 });

 $("#Button2").click(function () {
     //alert("The paragraph was clicked.");
     $("#Formatos").prop('disabled', false);
 });
</script>
</asp:Content>
