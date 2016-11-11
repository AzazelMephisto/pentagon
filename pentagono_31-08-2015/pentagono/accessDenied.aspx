<%@ Page Title="Acceso Denegado" Language="C#" MasterPageFile="~/pentagonoPage.Master" AutoEventWireup="true" CodeBehind="accessDenied.aspx.cs" Inherits="pentagono.accessDenied" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <div class="col-12" style="background-color:#FEFEFE;margin-left:auto; margin-right:auto;">
    <asp:Label ID="Label1" runat="server" Text="Lo sentimos, usted no tiene permiso para acceder a esta pantalla" Font-Bold="True" Font-Size="Large"></asp:Label>
    <br /><br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="javascript:history.back()">Regresar</asp:HyperLink>
    </div>
</asp:Content>
