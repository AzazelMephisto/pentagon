<%@ Page Title="" Language="C#" MasterPageFile="~/pentago_theme.Master" AutoEventWireup="true" CodeBehind="agendaInspec.aspx.cs" Inherits="pentagono.agendaInspec" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contenido" runat="server">

    <div class="col-md-1"></div>
        <div class="col-md-10">
           <div class="box box-primary">
               <div class="box-header with-border">
                    <h3 class="box-title">
                        <asp:Label ID="lbl_title" runat="server" Text="Titulo:"></asp:Label>
&nbsp;<asp:Label ID="lbl_titulo" runat="server" Text="Agendar Inspección"></asp:Label>
                    </h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                    </div>
                </div>
            <div class="box-body">

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="p_id" DataSourceID="sds_program" DefaultMode="Insert">
        <EditItemTemplate>
            p_id:
            <asp:Label ID="p_idLabel1" runat="server" Text='<%# Eval("p_id") %>' />
            <br />
            p_scheduleDay:
            <asp:TextBox ID="p_scheduleDayTextBox" runat="server" Text='<%# Bind("p_scheduleDay") %>' />
            <br />
            p_active:
            <asp:CheckBox ID="p_activeCheckBox" runat="server" Checked='<%# Bind("p_active") %>' />
            <br />
            p_date:
            <asp:TextBox ID="p_dateTextBox" runat="server" Text='<%# Bind("p_date") %>' />
            <br />
            format_id:
            <asp:TextBox ID="format_idTextBox" runat="server" Text='<%# Bind("format_id") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <asp:Label ID="lbl_formato" runat="server" Text="Formato"></asp:Label>
            <asp:TextBox ID="format_idTextBox" runat="server" Text='<%# Bind("format_id") %>' />
            <br />
            <asp:Label ID="lbl_inpDate" runat="server" Text="Día de la inspección: "></asp:Label>
&nbsp;<asp:TextBox ID="p_scheduleDayTextBox" runat="server" Text='<%# Bind("p_scheduleDay") %>' />
            <br />
            p_active:
            <asp:CheckBox ID="p_activeCheckBox" runat="server" />
            <br />
            p_date:
            <asp:TextBox ID="p_dateTextBox" runat="server" Text='<%# Bind("p_date") %>' />
            <br />
            &nbsp;<br />&nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            p_id:
            <asp:Label ID="p_idLabel" runat="server" Text='<%# Eval("p_id") %>' />
            <br />
            p_scheduleDay:
            <asp:Label ID="p_scheduleDayLabel" runat="server" Text='<%# Bind("p_scheduleDay") %>' />
            <br />
            p_active:
            <asp:CheckBox ID="p_activeCheckBox" runat="server" Checked='<%# Bind("p_active") %>' Enabled="false" />
            <br />
            p_date:
            <asp:Label ID="p_dateLabel" runat="server" Text='<%# Bind("p_date") %>' />
            <br />
            format_id:
            <asp:Label ID="format_idLabel" runat="server" Text='<%# Bind("format_id") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
            </div>
            <div class="box-footer">
            </div>
          </div>
        </div>

    <asp:SqlDataSource ID="sds_program" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT [p_id], [p_scheduleDay], [p_active], [p_date], [format_id] FROM [tbl_program]"></asp:SqlDataSource>
</asp:Content>
