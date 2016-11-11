<%@ Page Title="" Language="C#" MasterPageFile="~/pentagonoPage.Master" AutoEventWireup="true" CodeBehind="investig.aspx.cs" Inherits="pentagono.investig" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <div class="col-12" style="background-color:#FEFEFE;">

        <asp:FormView ID="FormView1" runat="server" DataKeyNames="evCause_id" DataSourceID="invetigCauseData" DefaultMode="Insert">
            <EditItemTemplate>
                evCause_id:
                <asp:Label ID="evCause_idLabel1" runat="server" Text='<%# Eval("evCause_id") %>' />
                <br />
                evCause_file:
                <asp:TextBox ID="evCause_fileTextBox" runat="server" Text='<%# Bind("evCause_file") %>' />
                <br />
                evCause_desc:
                <asp:TextBox ID="evCause_descTextBox" runat="server" Text='<%# Bind("evCause_desc") %>' />
                <br />
                cause_id:
                <asp:TextBox ID="cause_idTextBox" runat="server" Text='<%# Bind("cause_id") %>' />
                <br />
                causeType_id:
                <asp:TextBox ID="causeType_idTextBox" runat="server" Text='<%# Bind("causeType_id") %>' />
                <br />
                incident_id:
                <asp:TextBox ID="incident_idTextBox" runat="server" Text='<%# Bind("incident_id") %>' />
                <br />
                cause_desc:
                <asp:TextBox ID="cause_descTextBox" runat="server" Text='<%# Bind("cause_desc") %>' />
                <br />
                causeType_desc:
                <asp:TextBox ID="causeType_descTextBox" runat="server" Text='<%# Bind("causeType_desc") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                evCause_file:
                <asp:TextBox ID="evCause_fileTextBox" runat="server" Text='<%# Bind("evCause_file") %>' />
                <br />
                evCause_desc:
                <asp:TextBox ID="evCause_descTextBox" runat="server" Text='<%# Bind("evCause_desc") %>' />
                <br />
                cause_id:
                <asp:TextBox ID="cause_idTextBox" runat="server" Text='<%# Bind("cause_id") %>' />
                <br />
                causeType_id:
                <asp:TextBox ID="causeType_idTextBox" runat="server" Text='<%# Bind("causeType_id") %>' />
                <br />
                incident_id:
                <asp:TextBox ID="incident_idTextBox" runat="server" Text='<%# Bind("incident_id") %>' />
                <br />
                cause_desc:
                <asp:TextBox ID="cause_descTextBox" runat="server" Text='<%# Bind("cause_desc") %>' />
                <br />
                causeType_desc:
                <asp:TextBox ID="causeType_descTextBox" runat="server" Text='<%# Bind("causeType_desc") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                evCause_id:
                <asp:Label ID="evCause_idLabel" runat="server" Text='<%# Eval("evCause_id") %>' />
                <br />
                evCause_file:
                <asp:Label ID="evCause_fileLabel" runat="server" Text='<%# Bind("evCause_file") %>' />
                <br />
                evCause_desc:
                <asp:Label ID="evCause_descLabel" runat="server" Text='<%# Bind("evCause_desc") %>' />
                <br />
                cause_id:
                <asp:Label ID="cause_idLabel" runat="server" Text='<%# Bind("cause_id") %>' />
                <br />
                causeType_id:
                <asp:Label ID="causeType_idLabel" runat="server" Text='<%# Bind("causeType_id") %>' />
                <br />
                incident_id:
                <asp:Label ID="incident_idLabel" runat="server" Text='<%# Bind("incident_id") %>' />
                <br />
                cause_desc:
                <asp:Label ID="cause_descLabel" runat="server" Text='<%# Bind("cause_desc") %>' />
                <br />
                causeType_desc:
                <asp:Label ID="causeType_descLabel" runat="server" Text='<%# Bind("causeType_desc") %>' />
                <br />

            </ItemTemplate>
        </asp:FormView>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" Font-Size="Small" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="evCause_id" DataSourceID="invetigCauseData">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="evCause_id" HeaderText="evCause_id" InsertVisible="False" ReadOnly="True" SortExpression="evCause_id" />
                        <asp:BoundField DataField="evCause_file" HeaderText="evCause_file" SortExpression="evCause_file" />
                        <asp:BoundField DataField="evCause_desc" HeaderText="evCause_desc" SortExpression="evCause_desc" />
                        <asp:BoundField DataField="cause_id" HeaderText="cause_id" SortExpression="cause_id" />
                        <asp:BoundField DataField="causeType_id" HeaderText="causeType_id" SortExpression="causeType_id" />
                        <asp:BoundField DataField="incident_id" HeaderText="incident_id" SortExpression="incident_id" />
                        <asp:BoundField DataField="cause_desc" HeaderText="cause_desc" SortExpression="cause_desc" />
                        <asp:BoundField DataField="causeType_desc" HeaderText="causeType_desc" SortExpression="causeType_desc" />
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
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:SqlDataSource ID="invetigCauseData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_eventCause.evCause_id, tbl_eventCause.evCause_file, tbl_eventCause.evCause_desc, tbl_eventCause.cause_id, tbl_eventCause.causeType_id, tbl_eventCause.incident_id, tbl_causes.cause_desc, tbl_causeType.causeType_desc FROM tbl_eventCause INNER JOIN tbl_causes ON tbl_eventCause.cause_id = tbl_causes.cause_id INNER JOIN tbl_causeType ON tbl_eventCause.causeType_id = tbl_causeType.causeType_id INNER JOIN tbl_incident ON tbl_eventCause.incident_id = tbl_incident.incident_id
WHERE tbl_eventCause.incident_id = @incident_id" InsertCommand="INSERT INTO tbl_eventCause (evCause_file,evCause_desc,cause_id,causeType_id,incident_id) VALUES (@evCause_file,@evCause_desc,@cause_id,@causeType_id,@incident_id)">
            <InsertParameters>
                <asp:Parameter Name="evCause_file" />
                <asp:Parameter Name="evCause_desc" />
                <asp:Parameter Name="cause_id" />
                <asp:Parameter Name="causeType_id" />
                <asp:Parameter Name="incident_id" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="incident_id" QueryStringField="folio" />
            </SelectParameters>
        </asp:SqlDataSource>

    </div>
</asp:Content>
