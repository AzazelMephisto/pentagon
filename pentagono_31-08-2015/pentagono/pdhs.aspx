<%@ Page Title="" Language="C#" MasterPageFile="~/pentagonoIpad.Master" AutoEventWireup="true" CodeBehind="pdhs.aspx.cs" Inherits="pentagono.pdhs" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    <h1>Programa Departamental de Higiene y Salud</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contenido" runat="server">
    <asp:Panel ID="pnl_agendaInspect" runat="server">
           <div class="box box-primary box-solid">
               <div class="box-header with-border">
                    <h3 class="box-title"><asp:Label ID="lbl_titulo" runat="server" Text="Agendar Inspeccion"></asp:Label>
                    </h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                    </div>
                </div>
                <div class="box-body">
                <asp:FormView ID="frv_pdhs" runat="server" DataSourceID="sds_program" DefaultMode="Insert" OnItemInserting="frv_pdhs_ItemInserting" Width="100%">
                    <EditItemTemplate>
                        format_codigo:
                        <asp:TextBox ID="format_codigoTextBox" runat="server" Text='<%# Bind("format_codigo") %>' />
                        <br />
                        format_name:
                        <asp:TextBox ID="format_nameTextBox" runat="server" Text='<%# Bind("format_name") %>' />
                        <br />
                        p_scheduleDay:
                        <asp:TextBox ID="p_scheduleDayTextBox" runat="server" Text='<%# Bind("p_scheduleDay") %>' />
                        <br />
                        format_norma:
                        <asp:TextBox ID="format_normaTextBox" runat="server" Text='<%# Bind("format_norma") %>' />
                        <br />
                        format_id:
                        <asp:TextBox ID="format_idTextBox" runat="server" Text='<%# Bind("format_id") %>' />
                        <br />
                        p_active:
                        <asp:CheckBox ID="p_activeCheckBox" runat="server" Checked='<%# Bind("p_active") %>' />
                        <br />
                        p_date:
                        <asp:TextBox ID="p_dateTextBox" runat="server" Text='<%# Bind("p_date") %>' />
                        <br />
                        p_endDate:
                        <asp:TextBox ID="p_endDateTextBox" runat="server" Text='<%# Bind("p_endDate") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <div class="col-md-4">
                            Código:
                            <asp:DropDownList ID="ddl_formats" runat="server" CssClass="form-control" DataSourceID="sds_formatos" DataTextField="format_name" DataValueField="format_id" SelectedValue='<%# Bind("format_id") %>' AppendDataBoundItems="True">
                                <asp:ListItem Value="0">seleccione un elemento</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="ddl_formats" ErrorMessage="Seleccione una opción" ForeColor="#CC0000" ValidationExpression="^[1-9][0-9]*$" ValidationGroup="addInps"></asp:RegularExpressionValidator>
                        </div>
                        <div class="col-md-4">
                            Area:
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="sds_area" DataTextField="area_name" DataValueField="area_id" SelectedValue='<%# Bind("area_id") %>' AppendDataBoundItems="True">
                                <asp:ListItem Value="0">seleccione un elemento</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Seleccione una opción" ForeColor="#CC0000" ValidationExpression="^[1-9][0-9]*$" ValidationGroup="addInps"></asp:RegularExpressionValidator>
                            <asp:SqlDataSource ID="sds_area" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT [area_id], [area_name], [area_active] FROM [tbl_areas] WHERE ([area_active] = @area_active)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="True" Name="area_active" Type="Boolean" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="col-md-4">
                            Fecha estimada de inicio: 
                            <asp:TextBox ID="p_scheduleDayTextBox" runat="server" CssClass="form-control" Text='<%# Bind("p_scheduleDay", "{0:d}") %>' />
                            <asp:RequiredFieldValidator ID="rfv_inicio" runat="server" ControlToValidate="p_scheduleDayTextBox" ErrorMessage="Campo obligatorio" ForeColor="Red" ValidationGroup="addInps"></asp:RequiredFieldValidator>
                            <cc1:CalendarExtender ID="p_scheduleDayTextBox_CalendarExtender" runat="server" BehaviorID="p_scheduleDayTextBox_CalendarExtender" Format="dd-MM-yyyy" TargetControlID="p_scheduleDayTextBox" CssClass="MyCalendar" />
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="p_scheduleDayTextBox" ForeColor="Red" ValidationGroup="addInps">verifique el formato del campo </asp:RegularExpressionValidator>
                        </div>
                        <div class="col-md-4">
                            Fecha de finalización:<asp:TextBox ID="p_endDateTextBox" runat="server" CssClass="form-control" OnTextChanged="p_endDateTextBox_TextChanged" Text='<%# Bind("p_endDate", "{0:d}") %>' />
                            <asp:RequiredFieldValidator ID="rfv_dateEnd" runat="server" ControlToValidate="p_endDateTextBox" ErrorMessage="Campo obligatorio" ForeColor="Red" ValidationGroup="addInps"></asp:RequiredFieldValidator>
                            <cc1:CalendarExtender ID="p_endDateTextBox_CalendarExtender" runat="server" BehaviorID="p_endDateTextBox_CalendarExtender" Format="dd-MM-yyyy" TargetControlID="p_endDateTextBox" CssClass="MyCalendar" />
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="p_scheduleDayTextBox" ForeColor="Red" ValidationGroup="addInps">verifique el formato del campo </asp:RegularExpressionValidator>
                        </div>
                       
                        <br />
                        &nbsp;<br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Agendar Inspección" ValidationGroup="addInps" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" Visible="False" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        format_codigo:
                        <asp:Label ID="format_codigoLabel" runat="server" Text='<%# Bind("format_codigo") %>' />
                        <br />
                        format_name:
                        <asp:Label ID="format_nameLabel" runat="server" Text='<%# Bind("format_name") %>' />
                        <br />
                        p_scheduleDay:
                        <asp:Label ID="p_scheduleDayLabel" runat="server" Text='<%# Bind("p_scheduleDay") %>' />
                        <br />
                        format_norma:
                        <asp:Label ID="format_normaLabel" runat="server" Text='<%# Bind("format_norma") %>' />
                        <br />
                        format_id:
                        <asp:Label ID="format_idLabel" runat="server" Text='<%# Bind("format_id") %>' />
                        <br />
                        p_active:
                        <asp:CheckBox ID="p_activeCheckBox" runat="server" Checked='<%# Bind("p_active") %>' Enabled="false" />
                        <br />
                        p_date:
                        <asp:Label ID="p_dateLabel" runat="server" Text='<%# Bind("p_date") %>' />
                        <br />
                        p_endDate:
                        <asp:Label ID="p_endDateLabel" runat="server" Text='<%# Bind("p_endDate") %>' />
                        <br />
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
            </div>
            <div class="box-footer">
            </div>
          </div>
        
        <asp:SqlDataSource ID="sds_formatos" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT [format_id], [format_version], [format_codigo], [format_rev], [format_name], [format_nextRev], [format_norma] FROM [tbl_formats]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="sds_program" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_formats.format_codigo, tbl_formats.format_name, tbl_program.p_scheduleDay, tbl_formats.format_norma, tbl_program.format_id, tbl_program.p_active, tbl_program.p_date, tbl_program.p_endDate, tbl_program.p_id, tbl_user.usr_username, tbl_program.area_id FROM tbl_user INNER JOIN tbl_userInfo ON tbl_user.usrInfo_id = tbl_userInfo.usrInfo_id INNER JOIN tbl_program INNER JOIN tbl_formats ON tbl_program.format_id = tbl_formats.format_id ON tbl_userInfo.area_id = tbl_program.area_id WHERE (tbl_program.p_active = 1) AND (tbl_user.usr_username = @usr_username)" InsertCommand="INSERT INTO tbl_program(p_scheduleDay, p_active, p_date, format_id, area_id) VALUES (@p_scheduleDay, @p_active, @p_date, @format_id, @area_id)" DeleteCommand="DELETE FROM tbl_program WHERE (p_id = @p_id)">
                <DeleteParameters>
                    <asp:Parameter Name="p_id" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="p_scheduleDay" />
                    <asp:Parameter Name="p_active" />
                    <asp:Parameter Name="p_date" />
                    <asp:Parameter Name="format_id" />
                    <asp:Parameter Name="area_id" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="usr_username" SessionField="userName" />
                </SelectParameters>
            </asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server">
        <div class="box box-primary">
               <div class="box-header with-border">
                    <h3 class="box-title">
&nbsp;<asp:Label ID="Label2" runat="server" Text="Inspecciónes Disponibles"></asp:Label>
                    </h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                    </div>
                </div>
            <div class="box-body">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:GridView ID="grv_inspec" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover dataTable" DataKeyNames="p_id" DataSourceID="sds_program" OnRowDeleting="grv_inspec_RowDeleting">
                            <Columns>
                                <asp:TemplateField HeaderText="Código" SortExpression="format_codigo">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("format_codigo") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# String.Format("inspects.aspx?formatID={0}&pID={1}", Eval("format_id"), Eval("p_id")) %>' Text='<%# Eval("format_codigo") %>'></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="format_name" HeaderText="Inspección" SortExpression="format_name" />
                                <asp:BoundField DataField="p_scheduleDay" DataFormatString="{0:d}" HeaderText="Agendado" SortExpression="p_scheduleDay" />
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this event?');" Text="Eliminar"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:GridView>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="frv_pdhs" EventName="ItemInserted" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
          </div>
    </asp:Panel>
    <asp:Panel ID="Panel3" runat="server">
        <div class="box box-primary">
               <div class="box-header with-border">
                    <h3 class="box-title">
&nbsp;<asp:Label ID="lbl_insClosed" runat="server" Text="Inspecciónes Cerradas"></asp:Label>
                    </h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                    </div>
                </div>
                <div class="box-body">
                    <asp:Panel ID="pnl_inspClosed" runat="server">
                        <asp:GridView ID="grv_inspClosed" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover dataTable" DataKeyNames="p_id" DataSourceID="sds_inspClosed">
                            <Columns>
                                <asp:BoundField DataField="format_codigo" HeaderText="Código" SortExpression="format_codigo" />
                                <asp:BoundField DataField="format_name" HeaderText="Nombre" SortExpression="format_name" />
                                <asp:BoundField DataField="p_scheduleDay" HeaderText="Fecha agendada" SortExpression="p_scheduleDay" DataFormatString="{0:d}" />
                                <asp:BoundField DataField="p_endDate" HeaderText="Fecha de cierre" SortExpression="p_endDate" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="sds_inspClosed" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_formats.format_codigo, tbl_formats.format_name, tbl_program.p_scheduleDay, tbl_formats.format_norma, tbl_program.format_id, tbl_program.p_active, tbl_program.p_date, tbl_program.p_endDate, tbl_program.p_id, tbl_areas.area_name, tbl_user.usr_username FROM tbl_userInfo INNER JOIN tbl_user ON tbl_userInfo.usrInfo_id = tbl_user.usrInfo_id INNER JOIN tbl_areas ON tbl_userInfo.area_id = tbl_areas.area_id INNER JOIN tbl_program INNER JOIN tbl_formats ON tbl_program.format_id = tbl_formats.format_id ON tbl_userInfo.area_id = tbl_program.area_id WHERE (tbl_program.p_active = 0) AND (tbl_user.usr_username=@usr_username)">
                            <SelectParameters>
                                <asp:SessionParameter Name="usr_username" SessionField="username" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </asp:Panel>
                </div>
                <div class="box-footer">
                </div>
            </div>
        </asp:Panel>
</asp:Content>
