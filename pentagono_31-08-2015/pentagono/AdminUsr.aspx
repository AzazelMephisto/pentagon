<%@ Page Title="" Language="C#" MasterPageFile="~/pentago_theme.Master" AutoEventWireup="true" CodeBehind="AdminUsr.aspx.cs" Inherits="pentagono.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
 
<style>
td {
 
    padding-top: 5px;
    padding-right: 5px;
    padding-bottom: 5px;
    padding-left: 5px;
}
    .auto-style1 {
        height: 29px;
    }
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contenido" runat="server">



    <div style="overflow: auto; height:300px; Width:98%">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="usr_id,usrInfo_id,rol_id,Expr3" DataSourceID="SqlDataSource1" style="Width:98%" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="usr_username" HeaderText="Usuario" SortExpression="usr_username" />
                <asp:TemplateField HeaderText="No° usuario" SortExpression="usr_id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("usr_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Nuser" runat="server" Text='<%# Bind("usr_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="usrInfo_id" HeaderText="usrInfo_id" InsertVisible="False" ReadOnly="True" SortExpression="usrInfo_id" Visible="False" />
                <asp:BoundField DataField="usr_pass" HeaderText="usr_pass" SortExpression="usr_pass" Visible="False" />
                <asp:BoundField DataField="rol_id" HeaderText="rol_id" SortExpression="rol_id" InsertVisible="False" ReadOnly="True" Visible="False" />
                <asp:BoundField DataField="rol_name" HeaderText="Rol" SortExpression="rol_name" />
                <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" Visible="False" />
                <asp:BoundField DataField="Expr2" HeaderText="Expr2" SortExpression="Expr2" Visible="False" />
                <asp:CheckBoxField DataField="usr_active" HeaderText="Activo" SortExpression="usr_active" ReadOnly="True" />
                <asp:BoundField DataField="usrInfo_name" HeaderText="Nombre" SortExpression="usrInfo_name" />
                <asp:BoundField DataField="usrInfo_email" HeaderText="Correo" SortExpression="usrInfo_email" />
                <asp:BoundField DataField="usrInfo_company" HeaderText="Compañia" SortExpression="usrInfo_company" />
                <asp:BoundField DataField="area_id" HeaderText="area_id" SortExpression="area_id" Visible="False" />
                <asp:BoundField DataField="perArea_id" HeaderText="perArea_id" SortExpression="perArea_id" Visible="False" />
                <asp:BoundField DataField="area_name" HeaderText="Area" SortExpression="area_name" />
                <asp:BoundField DataField="Expr3" HeaderText="Expr3" InsertVisible="False" ReadOnly="True" SortExpression="Expr3" Visible="False" />
                <asp:CheckBoxField DataField="rol_active" HeaderText="rol_active" SortExpression="rol_active" Visible="False" />
                <asp:BoundField DataField="resp_id" HeaderText="resp_id" SortExpression="resp_id" Visible="False" />
                <asp:BoundField DataField="usr_respUsername" HeaderText="usr_respUsername" SortExpression="usr_respUsername" Visible="False" />
                <asp:BoundField DataField="sup_username" HeaderText="sup_username" SortExpression="sup_username" Visible="False" />
                <asp:BoundField DataField="usrInfo_noEmpleado" HeaderText="usrInfo_noEmpleado" SortExpression="usrInfo_noEmpleado" Visible="False" />
                <asp:CheckBoxField DataField="area_active" HeaderText="area_active" SortExpression="area_active" Visible="False" />
                <asp:TemplateField HeaderText="Detalle">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="myClass">Editar</asp:LinkButton>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_user.usr_username, tbl_user.usr_id, tbl_userInfo.usrInfo_id, tbl_user.usr_pass, tbl_roles.rol_id, tbl_roles.rol_name, tbl_user.rol_id AS Expr1, tbl_user.usrInfo_id AS Expr2, tbl_user.usr_active, tbl_userInfo.usrInfo_name, tbl_userInfo.usrInfo_email, tbl_userInfo.usrInfo_company, tbl_userInfo.area_id, tbl_userInfo.perArea_id, tbl_areas.area_name, tbl_areas.area_id AS Expr3, tbl_roles.rol_active, tbl_user.resp_id, tbl_user.usr_respUsername, tbl_user.sup_username, tbl_userInfo.usrInfo_noEmpleado, tbl_areas.area_active FROM tbl_user INNER JOIN tbl_userInfo ON tbl_user.usrInfo_id = tbl_userInfo.usrInfo_id INNER JOIN tbl_roles ON tbl_user.rol_id = tbl_roles.rol_id INNER JOIN tbl_areas ON tbl_userInfo.area_id = tbl_areas.area_id order by tbl_user.usr_id desc"></asp:SqlDataSource>
        <br />
        
     </div>
    <p></p>
    <p></p>
     <asp:Button ID="Button1" runat="server" Text="Nuevo" CssClass="btn btn-primary" OnClick="Button1_Click1" />

     &nbsp;&nbsp;
    
     <asp:HiddenField ID="HiddenField1" runat="server" ClientIDMode="Static" Value="0" />

     <br />
    <p></p>

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
                    <td>Nombre:</td>
                    <td>
                        <asp:TextBox ID="NameUsr" runat="server" Width="35%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameUsr" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="Usuario">favor de ingresar el dato</asp:RequiredFieldValidator>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>
                        <asp:TextBox ID="Email" runat="server" Width="35%"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[A-Za-z0-9._-]+@(?:[A-Za-z0-9])+(\.[A-Za-z]{2,})+$" ValidationGroup="Usuario">verifique el formato del campo</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Email" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="Usuario">favor de ingresar el dato</asp:RequiredFieldValidator>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td class="auto-style1">Compañia:</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="Comp" runat="server" Width="35%"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Comp" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[A-Za-z 'ÑñáéíóúÁÉÍÓÚ,.]{1,}$" ValidationGroup="Usuario">verifique el formato del campo</asp:RegularExpressionValidator>
                    &nbsp;</td>
                    <td class="auto-style1"></td>
                </tr>
                <tr>
                    <td>Area Funcional:</td>
                    <td>
                        <asp:DropDownList ID="AreaFun" runat="server" Width="35%" DataSourceID="SqlDataSource4" DataTextField="perArea_name" DataValueField="perArea_id" AppendDataBoundItems="True">
                            <asp:ListItem Value="0">seleccione un valor</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="AreaFun" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[1-9][0-9]*$" ValidationGroup="Usuario">seleccione un elemento</asp:RegularExpressionValidator>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Area:</td>
                    <td>
                        <asp:DropDownList ID="AreaReal" runat="server" Width="35%" DataSourceID="SqlDataSource2" DataTextField="area_name" DataValueField="area_id" AppendDataBoundItems="True">
                            <asp:ListItem Value="0">seleccione un valor</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="AreaReal" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[1-9][0-9]*$" ValidationGroup="Usuario">seleccione un elemento</asp:RegularExpressionValidator>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Usuario:</td>
                    <td>
                        <asp:TextBox ID="User" runat="server" Width="35%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="User" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="Usuario">favor de ingresar el dato</asp:RequiredFieldValidator>
                    </td>
                    <td></td>
                </tr>
                    <tr>
                    <td>Contraseña:</td>
                    <td>
                        <asp:TextBox ID="Cont" runat="server" Width="35%"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Cont" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ValidationGroup="Usuario">favor de ingresar el dato</asp:RequiredFieldValidator>
                    </td>
                    <td></td>
                </tr>
                 <tr>
                    <td>Rol:</td>
                    <td>
                        <asp:DropDownList ID="Rol" runat="server" Width="35%" DataSourceID="SqlDataSource3" DataTextField="rol_name" DataValueField="rol_id" AppendDataBoundItems="True">
                            <asp:ListItem Value="0">seleccione un valor</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="Rol" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[1-9][0-9]*$" ValidationGroup="Usuario">seleccione un elemento</asp:RegularExpressionValidator>
                     </td>
                     <td></td>
                </tr>
                <tr>
                    <td>Activo:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="35%" RepeatDirection="Horizontal" AppendDataBoundItems="True">
                            <asp:ListItem Value="1" Selected="True">SI</asp:ListItem>
                            <asp:ListItem Value="0">NO</asp:ListItem>
                        </asp:RadioButtonList>
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_areas] where area_active=1"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="select * from tbl_roles where rol_active=1"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="select * from tbl_personArea where perArea_active=1"></asp:SqlDataSource>
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
