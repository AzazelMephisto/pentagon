<%@ Page Title="" Language="C#" MasterPageFile="~/pentago_theme.Master" AutoEventWireup="true" CodeBehind="CatBehavior.aspx.cs" Inherits="pentagono.CatBehavior" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 340px
        }
        .auto-style2 {
            width: 340px;
            height: 22px;
        }
        .auto-style3 {
            width: 396px
        }
        .auto-style4 {
            width: 396px;
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    <h1>Catálogo Comportamientos </h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contenido" runat="server">
    <p></p>
    <table class="nav-justified">
        <tr>
             <td class="auto-style1">Área:</td>
             <td>    <asp:DropDownList ID="DropDownList1" runat="server" style="width:50%" DataSourceID="SqlDataSource1" DataTextField="area_name" DataValueField="area_id" AppendDataBoundItems="True" AutoPostBack="True" ClientIDMode="Static" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                 <asp:ListItem Value="0">Selecciona</asp:ListItem>
                     </asp:DropDownList>   

             </td>
        </tr>
    </table>
 <div style="overflow: auto; height:200px; Width:98%">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM tbl_areas where area_active=1"></asp:SqlDataSource>
            &nbsp;<asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="98%" AutoGenerateColumns="False" DataKeyNames="vp_id" DataSourceID="SqlDataSource2">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="No° Proceso" InsertVisible="False" SortExpression="vp_id">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("vp_id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="VpId" runat="server" Text='<%# Bind("vp_id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Proceso" SortExpression="vp_desc">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("vp_desc") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("vp_desc") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CheckBoxField DataField="vp_active" HeaderText="Activo" SortExpression="vp_active" />
                    <asp:TemplateField HeaderText="No Área" SortExpression="area_id">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("area_id") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("area_id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Seleccionar">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Selecciona</asp:LinkButton>
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_vosproc] WHERE ([area_id] = @area_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="area_id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
     </div>
    <p></p>
    <asp:Button ID="Button3" runat="server" Text="Nueva" CssClass="btn btn-primary" Visible="False" OnClick="Button3_Click" />
    <asp:HiddenField ID="HiddenField2" runat="server" ClientIDMode="Static" />
    <div style="overflow: auto; height:200px; Width:98%">
        <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"  Width="98%" AutoGenerateColumns="False" DataKeyNames="b_id" DataSourceID="SqlDataSource3">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="No" InsertVisible="False" SortExpression="b_id" Visible="False">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("b_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="b_id" runat="server" Text='<%# Bind("b_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Numero" SortExpression="b_num">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("b_num") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="BNum" runat="server" Text='<%# Bind("b_num") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Pregunta" SortExpression="b_name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("b_name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Pregunta" runat="server" Text='<%# Bind("b_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Activo" SortExpression="b_active">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("b_active") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="Activo" runat="server" Checked='<%# Bind("b_active") %>' Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="No°Proceso " SortExpression="vp_id">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("vp_id") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="ProcesoId" runat="server" Text='<%# Bind("vp_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Editar">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">Editar</asp:LinkButton>
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_behavior] WHERE ([vp_id] = @vp_id)">
            <SelectParameters>
                <asp:Parameter Name="vp_id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <br />
        <br />
    </div>

    <p> 
        <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" Value="0" />
    </p>

     <div id="PanelPregunta" >
          <table style=" Width:98%">
               <tr>
                    <td>no° Pregunta:</td>
                    <td class="auto-style3">
                        <asp:Label ID="NoPregunta" runat="server" ClientIDMode="Static"></asp:Label>
                    </td>
                
                </tr>
                <tr>
                    <td>no° Proceso:</td>
                    <td class="auto-style3">
                        <asp:Label ID="ProcesID" runat="server" ClientIDMode="Static"></asp:Label>
                    </td>
              
                </tr>
                <tr>
                    <td>Pregunta:</td>
                    <td class="auto-style3">
                        <asp:TextBox ID="Nombre" runat="server" Width="50%"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Nombre" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="Usuario">favor de ingresar el dato</asp:RequiredFieldValidator>
                    </td>
             
                </tr>
                <tr>
                    <td class="auto-style2">Activa</td>
                    <td class="auto-style4">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="50%" RepeatDirection="Horizontal" AppendDataBoundItems="True">
                            <asp:ListItem Value="1" Selected="True">SI</asp:ListItem>
                            <asp:ListItem Value="0">NO</asp:ListItem>
                        </asp:RadioButtonList>
                    &nbsp;</td>
                
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style3" >
                        &nbsp;</td>
               
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style3">
                        &nbsp;</td>
             
                </tr>
             
                 <tr>
                    <td>&nbsp;</td>
                    <td class="auto-style3">  
                        <asp:Button ID="Button2" Width="25%" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="Button2_Click" ValidationGroup="Usuario" ClientIDMode="Static" />
                     </td>
               
                </tr>
            </table>
     </div>
    <script>
 $(document).ready(function () {

        var val = $("#HiddenField1").val();
        //alert(val);
        if (val == '1') {
            //alert("click de la clase ");
            $("#PanelPregunta").css("visibility", "visible");
        } else {
            $("#PanelPregunta").css("visibility", "hidden");
        }

       
});
</script>

    <script>
        $("#DropDownList1").change(function () {
            $("#HiddenField1").val("0");
        //alert(valor);
    });

</script>

</asp:Content>
