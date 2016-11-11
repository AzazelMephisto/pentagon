<%@ Page Title="" Language="C#" MasterPageFile="~/pentago_theme.Master" AutoEventWireup="true" CodeBehind="Graficas.aspx.cs" Inherits="pentagono.Graficas" %>


<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contenido" runat="server">

    <p></p>
    <table style="width:100%; ">
        <tr>
            <td>Area:</td>
            <td>    
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="area_name" DataValueField="area_id" AppendDataBoundItems="True" AutoPostBack="True" ClientIDMode="Static" style="width:30%; ">
                    <asp:ListItem Value="0">-Selecciona-</asp:ListItem>
                </asp:DropDownList>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="DropDownList1" ErrorMessage="seleccione un elemento" ForeColor="Red" ValidationExpression="^[1-9][0-9]*$" ValidationGroup="NAccion"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
        <td>Proceso:</td>
            <td>    
              
                <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" DataSourceID="SqlDataSource2" DataTextField="vp_desc" DataValueField="vp_id" ClientIDMode="Static" style="width:30%; ">
                    <asp:ListItem Value="0">-Selecciona-</asp:ListItem>
                </asp:DropDownList>
              
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="DropDownList2" ErrorMessage="seleccione un elemento" ForeColor="Red" ValidationExpression="^[1-9][0-9]*$" ValidationGroup="NAccion"></asp:RegularExpressionValidator>
              
            </td>
        </tr>
        <tr>
        <td>Desde:</td>
            <td>    
              
                <asp:TextBox ID="TextBox1" runat="server" style="width:30%;" ValidationExpression="^\d{2}/\d{2}/\d{4}$"></asp:TextBox>

              
                                                <cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" BehaviorID="TextBox1_CalendarExtender" TargetControlID="TextBox1"  Format="dd/MM/yyyy">
                </cc1:CalendarExtender>

              
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="favor de ingresar el dato" ForeColor="Red" ValidationGroup="NAccion"></asp:RequiredFieldValidator>
              
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TextBox1" ErrorMessage="verifique el formato del campo " ForeColor="Red" ValidationExpression="^\d{2}/\d{2}/\d{4}$" ValidationGroup="NAccion"></asp:RegularExpressionValidator>
              
            </td>
        </tr>
        <tr>
        <td>Hasta:</td>
            <td>    
              
                <asp:TextBox ID="TextBox2" runat="server" style="width:30%;"></asp:TextBox>
              
                                                <cc1:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" BehaviorID="TextBox2_CalendarExtender" TargetControlID="TextBox2"  Format="dd/MM/yyyy">
                </cc1:CalendarExtender>
              
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="favor de ingresar el dato" ForeColor="Red" ValidationGroup="NAccion"></asp:RequiredFieldValidator>
              
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="TextBox2" ErrorMessage="verifique el formato del campo " ForeColor="Red" ValidationExpression="^\d{2}/\d{2}/\d{4}$" ValidationGroup="NAccion"></asp:RegularExpressionValidator>
              
            </td>
        </tr>
         <tr>
        <td></td>
            <td>    
              <p></p>              
                <asp:Button ID="Consultar" runat="server" Text="Button" ValidationGroup="NAccion" CssClass="btn btn-primary" OnClick="Consultar_Click" />   
            </td>
        </tr>
    </table>




&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="
SELECT * FROM [tbl_areas] where area_active=1"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_vosproc] WHERE ([area_id] = @area_id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="area_id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div id="columnchart_material" style="width:100%; height: 500px;"></div>
      <p></p>
      <asp:Literal ID="tabla" runat="server"></asp:Literal>
     <div>
        <asp:Literal ID="lt" runat="server"></asp:Literal>  
       
    </div>
<script>
    $("#DropDownList1").change(function () {
        var valor = $("#DropDownList1").val();
        if (valor != 0) {
            $("#DropDownList2").prop("disabled", false);
        }
        else {
            $("#DropDownList2").prop("disabled", true);
        }
        //alert(valor);
    });

</script>

</asp:Content>

