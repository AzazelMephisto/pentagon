<%@ Page Title="" Language="C#" MasterPageFile="~/pentagonoPage.Master" AutoEventWireup="true" CodeBehind="incid.aspx.cs" Inherits="pentagono.incid" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <div class="col-12" style="background-color:#FEFEFE;">
    <h1>Generar reporte de accidente / incidente</h1>
    <p></p>
    <cc1:TabContainer ID="tbcInfoAcc" runat="server" ActiveTabIndex="0" Width="447px">
        <cc1:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
            <HeaderTemplate>
                1.- Información sobre el accidente o incidente
            </HeaderTemplate>
        </cc1:TabPanel>
    </cc1:TabContainer>
        </div>
</asp:Content>
