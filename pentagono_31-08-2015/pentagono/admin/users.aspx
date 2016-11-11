<%@ Page Title="" Language="C#" MasterPageFile="~/pentago_theme.Master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="pentagono.admin.users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    <h1>Administración de usuarios</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contenido" runat="server">
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10">
           <div class="box box-primary">
               <div class="box-header with-border">
                    <h3 class="box-title">
                        <asp:Label ID="lbl_title" runat="server" Text="Agregar nuevo usuario"></asp:Label>
                    </h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                    </div>
                </div>
            <div class="box-body">
                <asp:FormView ID="frv_users" runat="server" DataSourceID="sds_users" DefaultMode="Insert" OnItemInserting="frv_users_ItemInserting">
                    <EditItemTemplate>
                        usr_username:
                        <asp:TextBox ID="usr_usernameTextBox" runat="server" Text='<%# Bind("usr_username") %>' />
                        <br />
                        usr_lastAccess:
                        <asp:TextBox ID="usr_lastAccessTextBox" runat="server" Text='<%# Bind("usr_lastAccess") %>' />
                        <br />
                        rol_name:
                        <asp:TextBox ID="rol_nameTextBox" runat="server" Text='<%# Bind("rol_name") %>' />
                        <br />
                        usrInfo_name:
                        <asp:TextBox ID="usrInfo_nameTextBox" runat="server" Text='<%# Bind("usrInfo_name") %>' />
                        <br />
                        usrInfo_email:
                        <asp:TextBox ID="usrInfo_emailTextBox" runat="server" Text='<%# Bind("usrInfo_email") %>' />
                        <br />
                        usr_active:
                        <asp:CheckBox ID="usr_activeCheckBox" runat="server" Checked='<%# Bind("usr_active") %>' />
                        <br />
                        rol_id:
                        <asp:TextBox ID="rol_idTextBox" runat="server" Text='<%# Bind("rol_id") %>' />
                        <br />
                        usrInfo_id:
                        <asp:TextBox ID="usrInfo_idTextBox" runat="server" Text='<%# Bind("usrInfo_id") %>' />
                        <br />
                        usr_respUsername:
                        <asp:TextBox ID="usr_respUsernameTextBox" runat="server" Text='<%# Bind("usr_respUsername") %>' />
                        <br />
                        sup_username:
                        <asp:TextBox ID="sup_usernameTextBox" runat="server" Text='<%# Bind("sup_username") %>' />
                        <br />
                        area_name:
                        <asp:TextBox ID="area_nameTextBox" runat="server" Text='<%# Bind("area_name") %>' />
                        <br />
                        perArea_name:
                        <asp:TextBox ID="perArea_nameTextBox" runat="server" Text='<%# Bind("perArea_name") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        usr_username:
                        <asp:TextBox ID="usr_usernameTextBox" runat="server" Text='<%# Bind("usr_username") %>' />
                        <br />
                        usr_lastAccess:
                        <asp:TextBox ID="usr_lastAccessTextBox" runat="server" Text='<%# Bind("usr_lastAccess") %>' />
                        <br />
                        rol_name:
                        <asp:TextBox ID="rol_nameTextBox" runat="server" Text='<%# Bind("rol_name") %>' />
                        <br />
                        usrInfo_name:
                        <asp:TextBox ID="usrInfo_nameTextBox" runat="server" Text='<%# Bind("usrInfo_name") %>' />
                        <br />
                        usrInfo_email:
                        <asp:TextBox ID="usrInfo_emailTextBox" runat="server" Text='<%# Bind("usrInfo_email") %>' />
                        <br />
                        usr_active:
                        <asp:CheckBox ID="usr_activeCheckBox" runat="server" Checked='<%# Bind("usr_active") %>' />
                        <br />
                        rol_id:
                        <asp:TextBox ID="rol_idTextBox" runat="server" Text='<%# Bind("rol_id") %>' />
                        <br />
                        usrInfo_id:
                        <asp:TextBox ID="usrInfo_idTextBox" runat="server" Text='<%# Bind("usrInfo_id") %>' />
                        <br />
                        usr_respUsername:
                        <asp:TextBox ID="usr_respUsernameTextBox" runat="server" Text='<%# Bind("usr_respUsername") %>' />
                        <br />
                        sup_username:
                        <asp:TextBox ID="sup_usernameTextBox" runat="server" Text='<%# Bind("sup_username") %>' />
                        <br />
                        area_name:
                        <asp:TextBox ID="area_nameTextBox" runat="server" Text='<%# Bind("area_name") %>' />
                        <br />
                        perArea_name:
                        <asp:TextBox ID="perArea_nameTextBox" runat="server" Text='<%# Bind("perArea_name") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        usr_username:
                        <asp:Label ID="usr_usernameLabel" runat="server" Text='<%# Bind("usr_username") %>' />
                        <br />
                        usr_lastAccess:
                        <asp:Label ID="usr_lastAccessLabel" runat="server" Text='<%# Bind("usr_lastAccess") %>' />
                        <br />
                        rol_name:
                        <asp:Label ID="rol_nameLabel" runat="server" Text='<%# Bind("rol_name") %>' />
                        <br />
                        usrInfo_name:
                        <asp:Label ID="usrInfo_nameLabel" runat="server" Text='<%# Bind("usrInfo_name") %>' />
                        <br />
                        usrInfo_email:
                        <asp:Label ID="usrInfo_emailLabel" runat="server" Text='<%# Bind("usrInfo_email") %>' />
                        <br />
                        usr_active:
                        <asp:CheckBox ID="usr_activeCheckBox" runat="server" Checked='<%# Bind("usr_active") %>' Enabled="false" />
                        <br />
                        rol_id:
                        <asp:Label ID="rol_idLabel" runat="server" Text='<%# Bind("rol_id") %>' />
                        <br />
                        usrInfo_id:
                        <asp:Label ID="usrInfo_idLabel" runat="server" Text='<%# Bind("usrInfo_id") %>' />
                        <br />
                        usr_respUsername:
                        <asp:Label ID="usr_respUsernameLabel" runat="server" Text='<%# Bind("usr_respUsername") %>' />
                        <br />
                        sup_username:
                        <asp:Label ID="sup_usernameLabel" runat="server" Text='<%# Bind("sup_username") %>' />
                        <br />
                        area_name:
                        <asp:Label ID="area_nameLabel" runat="server" Text='<%# Bind("area_name") %>' />
                        <br />
                        perArea_name:
                        <asp:Label ID="perArea_nameLabel" runat="server" Text='<%# Bind("perArea_name") %>' />
                        <br />

                    </ItemTemplate>
                </asp:FormView>
            </div>
            </div>
          </div>
        <div class="col-md-1"></div>
        <div class="col-md-1"></div>
        <div class="col-md-10">
           <div class="box box-primary">
               <div class="box-header with-border">
                    <h3 class="box-title">
                        <asp:Label ID="Label1" runat="server" Text="Listado de usuarios"></asp:Label>
                    </h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                    </div>
                </div>
            <div class="box-body">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="sds_users">
                    <Columns>
                        <asp:BoundField DataField="usr_username" HeaderText="Usuario" SortExpression="usr_username" />
                        <asp:BoundField DataField="usrInfo_name" HeaderText="Nombre" SortExpression="usrInfo_name" />
                        <asp:BoundField DataField="usrInfo_email" HeaderText="Correo electronico" SortExpression="usrInfo_email" />
                        <asp:BoundField DataField="rol_name" HeaderText="Rol" SortExpression="rol_name" />
                        <asp:CheckBoxField DataField="usr_active" HeaderText="usr_active" SortExpression="usr_active" />
                        <asp:BoundField DataField="area_name" HeaderText="Area" SortExpression="area_name" />
                        <asp:BoundField DataField="perArea_name" HeaderText="Area pertenece" SortExpression="perArea_name" Visible="False" />
                        <asp:BoundField DataField="sup_username" HeaderText="Supervisor" SortExpression="sup_username" />
                        <asp:BoundField DataField="usr_lastAccess" HeaderText="usr_lastAccess" SortExpression="usr_lastAccess" />
                        <asp:BoundField DataField="usr_respUsername" HeaderText="usr_respUsername" SortExpression="usr_respUsername" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="sds_users" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" InsertCommand="INSERT INTO tbl_user(usr_username, usr_pass, rol_id, usrInfo_id, usr_active, usr_respUsername, sup_username) VALUES (@usr_username, @usr_pass, @rol_id, @usrInfo_id, @usr_active, @usr_respUsername, @sup_username)" SelectCommand="SELECT tbl_user.usr_username, tbl_user.usr_lastAccess, tbl_roles.rol_name, tbl_userInfo.usrInfo_name, tbl_userInfo.usrInfo_email, tbl_user.usr_active, tbl_user.rol_id, tbl_user.usrInfo_id, tbl_user.usr_respUsername, tbl_user.sup_username, tbl_areas.area_name, tbl_personArea.perArea_name FROM tbl_user INNER JOIN tbl_userInfo ON tbl_user.usrInfo_id = tbl_userInfo.usrInfo_id INNER JOIN tbl_areas ON tbl_userInfo.area_id = tbl_areas.area_id INNER JOIN tbl_personArea ON tbl_userInfo.perArea_id = tbl_personArea.perArea_id INNER JOIN tbl_roles ON tbl_user.rol_id = tbl_roles.rol_id WHERE  tbl_user.usr_active=1">
                    <InsertParameters>
                        <asp:Parameter Name="usr_username" />
                        <asp:Parameter Name="usr_pass" />
                        <asp:Parameter Name="rol_id" />
                        <asp:Parameter Name="usrInfo_id" />
                        <asp:Parameter Name="usr_active" />
                        <asp:Parameter Name="usr_respUsername" />
                        <asp:Parameter Name="sup_username" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </div>
            </div>
          </div>
        <div class="col-md-1"></div>
        </div>
</asp:Content>
