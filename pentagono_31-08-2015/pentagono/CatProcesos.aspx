<%@ Page Title="" Language="C#" MasterPageFile="~/pentago_theme.Master" AutoEventWireup="true" CodeBehind="CatProcesos.aspx.cs" Inherits="pentagono.CatProcesos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    <h1>Catálogo Procesos</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contenido" runat="server">


      <div style="overflow: auto; height:200px; Width:98%">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="97%" AutoGenerateColumns="False" DataKeyNames="vp_id,Expr1" DataSourceID="SqlDataSource1">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="No° Proceso" InsertVisible="False" SortExpression="vp_id" Visible="False">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("vp_id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="VP_ID" runat="server" Text='<%# Bind("vp_id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Proceso" SortExpression="vp_desc">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("vp_desc") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Desc" runat="server" Text='<%# Bind("vp_desc") %>'></asp:Label>
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
                    <asp:TemplateField HeaderText="Activo" SortExpression="vp_active">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("vp_active") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="Activo" runat="server" Checked='<%# Bind("vp_active") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Expr1" HeaderText="Expr1" InsertVisible="False" ReadOnly="True" SortExpression="Expr1" Visible="False" />
                    <asp:BoundField DataField="area_name" HeaderText="Área" SortExpression="area_name" />
                    <asp:CheckBoxField DataField="area_active" HeaderText="area_active" SortExpression="area_active" Visible="False" />
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Edita</asp:LinkButton>
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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_vosproc.vp_id, tbl_vosproc.vp_desc, tbl_vosproc.area_id, tbl_vosproc.vp_active, tbl_areas.area_id AS Expr1, tbl_areas.area_name, tbl_areas.area_active FROM tbl_vosproc INNER JOIN tbl_areas ON tbl_vosproc.area_id = tbl_areas.area_id WHERE  (tbl_vosproc.vp_active = 1) and (tbl_areas.area_active=1)  order by vp_id desc"></asp:SqlDataSource>
          </div>



      <asp:Button ID="Button1" runat="server" Text="Nuevo" CssClass="btn btn-primary" OnClick="Button1_Click" />
        <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" Value="0" />
        <div id="PanelDatos" >
          <table style=" Width:98%">
               
                <tr>
                    <td>no°:</td>
                    <td>
                        <asp:Label ID="ProcesID" runat="server" ClientIDMode="Static"></asp:Label>
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
                    <td>Área</td>
                    <td >
                        <div id="AsignaArea">
                        <asp:DropDownList ID="AreaFun" runat="server" Width="35%" DataSourceID="SqlDataSource2" DataTextField="area_name" DataValueField="area_id" AppendDataBoundItems="True" ClientIDMode="Static">
                            <asp:ListItem Value="0">seleccione un valor</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="AreaFun" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[1-9][0-9]*$" ValidationGroup="Usuario">seleccione un elemento</asp:RegularExpressionValidator>
                   </div>
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
            var aux = $("#ProcesID").text();
            //alert(aux);
            if (aux != "") {
                $("#AsignaArea").prop('disabled', true);
            } else {
                $("#AsignaArea").prop('disabled', false);
            }


        } else {
            $("#PanelDatos").css("visibility", "hidden");
        }

 });

 $("#Button2").click(function () {
     //alert("The paragraph was clicked.");
     $("#AsignaArea").prop('disabled', false);
 });

</script>

</asp:Content>
