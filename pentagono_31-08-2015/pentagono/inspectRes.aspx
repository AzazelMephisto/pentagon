<%@ Page MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/pentago_theme.Master" AutoEventWireup="true" CodeBehind="inspectRes.aspx.cs" Inherits="pentagono.inspectRes" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    <h1>Detalle de Inspección</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contenido" runat="server">
    <asp:Panel ID="pnl_inspectHead" runat="server" CssClass="col-12">
    <div class="box box-primary box-solid">
               <div class="box-header with-border">
                    <h3 class="box-title"><asp:Label ID="Label1" runat="server"></asp:Label>
                    </h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                    </div>
                </div>
        <div class="box-body">
            <asp:FormView ID="FormView1" runat="server" DataSourceID="sds_inspHead">
                <EditItemTemplate>
                    inspect_noEmp:
                    <asp:TextBox ID="inspect_noEmpTextBox" runat="server" Text='<%# Bind("inspect_noEmp") %>' />
                    <br />
                    inspect_date:
                    <asp:TextBox ID="inspect_dateTextBox" runat="server" Text='<%# Bind("inspect_date") %>' />
                    <br />
                    inspect_start:
                    <asp:TextBox ID="inspect_startTextBox" runat="server" Text='<%# Bind("inspect_start") %>' />
                    <br />
                    inspect_end:
                    <asp:TextBox ID="inspect_endTextBox" runat="server" Text='<%# Bind("inspect_end") %>' />
                    <br />
                    inspect_recor:
                    <asp:TextBox ID="inspect_recorTextBox" runat="server" Text='<%# Bind("inspect_recor") %>' />
                    <br />
                    usr_username:
                    <asp:TextBox ID="usr_usernameTextBox" runat="server" Text='<%# Bind("usr_username") %>' />
                    <br />
                    area_name:
                    <asp:TextBox ID="area_nameTextBox" runat="server" Text='<%# Bind("area_name") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    inspect_noEmp:
                    <asp:TextBox ID="inspect_noEmpTextBox" runat="server" Text='<%# Bind("inspect_noEmp") %>' />
                    <br />
                    inspect_date:
                    <asp:TextBox ID="inspect_dateTextBox" runat="server" Text='<%# Bind("inspect_date") %>' />
                    <br />
                    inspect_start:
                    <asp:TextBox ID="inspect_startTextBox" runat="server" Text='<%# Bind("inspect_start") %>' />
                    <br />
                    inspect_end:
                    <asp:TextBox ID="inspect_endTextBox" runat="server" Text='<%# Bind("inspect_end") %>' />
                    <br />
                    inspect_recor:
                    <asp:TextBox ID="inspect_recorTextBox" runat="server" Text='<%# Bind("inspect_recor") %>' />
                    <br />
                    usr_username:
                    <asp:TextBox ID="usr_usernameTextBox" runat="server" Text='<%# Bind("usr_username") %>' />
                    <br />
                    area_name:
                    <asp:TextBox ID="area_nameTextBox" runat="server" Text='<%# Bind("area_name") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="form-group col-xs-4">
                        <asp:Label ID="lblArea" runat="server" Font-Bold="True" Text="Area: "></asp:Label>
                        <asp:Label ID="area_nameLabel" runat="server" Text='<%# Bind("area_name") %>' />
                        <br />
                        <asp:Label ID="Label19" runat="server" Font-Bold="True" Text="Sub-area:"></asp:Label>
                        &nbsp;<asp:Label ID="lbl_subarea" runat="server" Text='<%# Eval("areaF_name") %>'></asp:Label>
                    </div>
                    <div class="form-group col-xs-4">
                        <asp:Label ID="lblIntegrante" runat="server" Font-Bold="True" Text="Integrante de la CSH:"></asp:Label>
                        <asp:Label ID="usr_usernameLabel" runat="server" Text='<%# Bind("usr_username") %>' />
                        <br />
                        <asp:Label ID="Label15" runat="server" Font-Bold="True" Text="Supervisor:"></asp:Label>
                        &nbsp;<asp:DropDownList ID="ddl_supervisor" runat="server" AppendDataBoundItems="True" DataSourceID="sds_users" DataTextField="usrInfo_name" DataValueField="usr_username" Enabled="False" SelectedValue='<%# Bind("sup_username") %>'>
                            <asp:ListItem Value=" ">No asignado</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sds_users" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_user.usr_username, tbl_userInfo.usrInfo_name FROM tbl_user INNER JOIN tbl_userInfo ON tbl_user.usrInfo_id = tbl_userInfo.usrInfo_id WHERE tbl_user.usr_active=1"></asp:SqlDataSource>
                    </div>
                    <div class="form-group col-xs-4">
                        <asp:Label ID="lblFecha" runat="server" Font-Bold="True" Text="Fecha:"></asp:Label>
                        <asp:Label ID="inspect_dateLabel" runat="server" Text='<%# Bind("inspect_date", "{0:d}") %>' />
                    </div>
                    <div class="form-group col-xs-4">
                        <asp:Label ID="lblNumEmpleados" runat="server" Font-Bold="True" Text="Número de empleados:"></asp:Label>
                        <asp:Label ID="inspect_noEmpLabel" runat="server" Text='<%# Bind("inspect_noEmp") %>' />
                    </div>
                    <div class="form-group col-xs-4">
                        <asp:Label ID="lblRecorrido" runat="server" Font-Bold="True" Text="Recorrido: "></asp:Label>
                        <asp:Label ID="inspect_recorLabel" runat="server" Text='<%# Bind("recor_desc") %>' />
                    </div>
                    <div class="form-group col-xs-4">
                        <asp:Label ID="lblInicio" runat="server" Font-Bold="True" Text="Inicio:"></asp:Label>
                        <asp:Label ID="inspect_startLabel" runat="server" Text='<%# Bind("inspect_start", "{0:t}") %>' />
                        <asp:Label ID="lblTermino" runat="server" Font-Bold="True" Text="Termino:"></asp:Label>
                        <asp:Label ID="inspect_endLabel" runat="server" Text='<%# Bind("inspect_end", "{0:t}") %>' />
                    </div>
                    <br />
                </ItemTemplate>
            </asp:FormView>
        </div>
        <div class="box-footer">
            <asp:Panel ID="pnl_inspectDtl" runat="server" ScrollBars="Auto">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="grv_inspectDtl" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover dataTable" DataSourceID="sds_inspDetail">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Guardar"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancelar"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Editar"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID" SortExpression="aspect_id">
                        <EditItemTemplate>
                            <asp:Label ID="Label20" runat="server" Text='<%# Bind("aspect_id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("aspect_id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Elemento" SortExpression="aspect_element">
                        <EditItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("aspect_element") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("aspect_element") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Forma revisar" SortExpression="aspect_review">
                        <EditItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("aspect_review") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("aspect_review") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Satisfactorio" SortExpression="inspectDtl_satis">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("inspectDtl_satis") %>' Enabled="False" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("inspectDtl_satis") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="inspectDtl_obs" HeaderText="Observaciones" SortExpression="inspectDtl_obs" />
                    <asp:TemplateField HeaderText="Evidencia" SortExpression="inspectDtl_evidence">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# campoEvidencia(String.Format("uploaded/inspects/{0}", Eval("inspectDtl_evidence"))).ToString() %>' Text='<%# campoEvidencia(Eval("inspectDtl_evidence").ToString()) %>' Target="_blank"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
    </div>
    </asp:Panel>
    <asp:SqlDataSource ID="sds_inspHead" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_inspect.inspect_noEmp, tbl_inspect.inspect_date, tbl_inspect.inspect_start, tbl_inspect.inspect_end, tbl_inspect.inspect_recor, tbl_inspect.usr_username, tbl_areas.area_name, tbl_recorType.recor_desc, tbl_inspect.sup_username, tbl_inspect.areaF_id, tbl_areasFisicas.areaF_name FROM tbl_inspect INNER JOIN tbl_areas ON tbl_inspect.area_id = tbl_areas.area_id INNER JOIN tbl_recorType ON tbl_inspect.inspect_recor = tbl_recorType.recor_id INNER JOIN tbl_areasFisicas ON tbl_inspect.areaF_id = tbl_areasFisicas.areaF_id WHERE (tbl_inspect.inspect_id = @inspect_id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="inspect_id" QueryStringField="inspectID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sds_inspDetail" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_aspect.aspect_element, tbl_aspect.aspect_review, tbl_inspectDtl.inspectDtl_satis, tbl_inspectDtl.inspectDtl_obs, tbl_inspectDtl.inspect_id, tbl_inspectDtl.aspect_id, tbl_inspectDtl.inspectDtl_evidence FROM tbl_aspect INNER JOIN tbl_inspectDtl ON tbl_aspect.aspect_id = tbl_inspectDtl.aspect_id WHERE (tbl_inspectDtl.inspect_id = @inspect_id)" UpdateCommand="UPDATE tbl_inspectDtl SET inspectDtl_obs = @inspectDtl_obs WHERE (inspect_id = @inspect_id) AND (aspect_id = @aspect_id)" OnSelecting="sds_inspDetail_Selecting">
        <SelectParameters>
            <asp:QueryStringParameter Name="inspect_id" QueryStringField="inspectID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="inspectDtl_obs" />
            <asp:QueryStringParameter Name="inspect_id" QueryStringField="inspectID" />
            <asp:Parameter Name="aspect_id" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Panel ID="pnl_aspects" runat="server" CssClass="col-12">
    <div class="box box-primary box-solid">
               <div class="box-header with-border">
                    <h3 class="box-title"><asp:Label ID="lbl_tituloRes" runat="server">Acciones</asp:Label>
                    </h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                    </div>
                </div>
        <div class="box-body">
            <asp:FormView ID="frv_acciones" runat="server" DataSourceID="sds_actions" DefaultMode="Insert">
                <EditItemTemplate>
                    actType_id:
                    <asp:TextBox ID="actType_idTextBox" runat="server" Text='<%# Bind("actType_id") %>' />
                    <br />
                    evAction_actions:
                    <asp:TextBox ID="evAction_actionsTextBox" runat="server" Text='<%# Bind("evAction_actions") %>' />
                    <br />
                    crtlType_id:
                    <asp:TextBox ID="crtlType_idTextBox" runat="server" Text='<%# Bind("crtlType_id") %>' />
                    <br />
                    resp_id:
                    <asp:TextBox ID="resp_idTextBox" runat="server" Text='<%# Bind("resp_id") %>' />
                    <br />
                    evAction_date:
                    <asp:TextBox ID="evAction_dateTextBox" runat="server" Text='<%# Bind("evAction_date") %>' />
                    <br />
                    actPlan_id:
                    <asp:TextBox ID="actPlan_idTextBox" runat="server" Text='<%# Bind("actPlan_id") %>' />
                    <br />
                    key1:
                    <asp:TextBox ID="key1TextBox" runat="server" Text='<%# Bind("key1") %>' />
                    <br />
                    actType_desc:
                    <asp:TextBox ID="actType_descTextBox" runat="server" Text='<%# Bind("actType_desc") %>' />
                    <br />
                    ctrlType_desc:
                    <asp:TextBox ID="ctrlType_descTextBox" runat="server" Text='<%# Bind("ctrlType_desc") %>' />
                    <br />
                    stat_id:
                    <asp:TextBox ID="stat_idTextBox" runat="server" Text='<%# Bind("stat_id") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <div class="form-group col-xs-4">
                        <asp:Label ID="Label2" runat="server" Text="Acciones:"></asp:Label>
                        <asp:TextBox ID="evAction_actionsTextBox" runat="server" CssClass="form-control" Text='<%# Bind("evAction_actions") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="evAction_actionsTextBox" ErrorMessage="* Favor de especificar acciones" ForeColor="Red" ValidationGroup="addAction"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group col-xs-4">
                        <asp:Label ID="Label3" runat="server" Text="Tipo de acción:"></asp:Label>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="sds_acType" DataTextField="actType_desc" DataValueField="actType_id" SelectedValue='<%# Bind("actType_id") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sds_acType" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT [actType_id], [actType_desc] FROM [tbl_actionType] WHERE ([actType_active] = @actType_active)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="True" Name="actType_active" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div class="form-group col-xs-4">
                        <asp:Label ID="Label4" runat="server" Text="Tipo de control:"></asp:Label>
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" DataSourceID="sds_ctrlType" DataTextField="ctrlType_desc" DataValueField="ctrlType_id" SelectedValue='<%# Bind("crtlType_id") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sds_ctrlType" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT [ctrlType_id], [ctrlType_desc] FROM [tbl_controlType] WHERE ([ctrlType_active] = @ctrlType_active)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="true" Name="ctrlType_active" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div class="form-group col-xs-4">
                        <asp:Label ID="Label5" runat="server" Text="Responsable:"></asp:Label>
                        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control" DataSourceID="sds_users" DataTextField="usrInfo_name" DataValueField="usr_username" SelectedValue='<%# Bind("usr_username") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sds_users" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_user.usr_id, tbl_userInfo.usrInfo_name, tbl_user.usr_username, tbl_userInfo.usrInfo_email FROM tbl_user INNER JOIN tbl_userInfo ON tbl_user.usrInfo_id = tbl_userInfo.usrInfo_id"></asp:SqlDataSource>
                    </div>
                    <div class="form-group col-xs-4">
                        <asp:Label ID="Label6" runat="server" Text="Fecha:"></asp:Label>
                        <asp:TextBox ID="evAction_dateTextBox" runat="server" CssClass="form-control" Text='<%# Bind("evAction_date") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="evAction_dateTextBox" ErrorMessage="*Fecha obligatoria" ForeColor="Red" ValidationGroup="addAction"></asp:RequiredFieldValidator>
                        <cc1:CalendarExtender ID="evAction_dateTextBox_CalendarExtender" runat="server" BehaviorID="evAction_dateTextBox_CalendarExtender" CssClass="MyCalendar" TargetControlID="evAction_dateTextBox" Format="dd/MM/yyyy" />
                    </div>
                    <div class="form-group col-xs-12">
                        &nbsp;<asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center">
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Agregar" ValidationGroup="addAction" />
                            <asp:LinkButton ID="InsertCancelButton" runat="server" CommandName="Cancel" Text="Limpiar" />
                        </asp:Panel>
                    </div>
                    &nbsp;
                </InsertItemTemplate>
                <ItemTemplate>
                    actType_id:
                    <asp:Label ID="actType_idLabel" runat="server" Text='<%# Bind("actType_id") %>' />
                    <br />
                    evAction_actions:
                    <asp:Label ID="evAction_actionsLabel" runat="server" Text='<%# Bind("evAction_actions") %>' />
                    <br />
                    crtlType_id:
                    <asp:Label ID="crtlType_idLabel" runat="server" Text='<%# Bind("crtlType_id") %>' />
                    <br />
                    resp_id:
                    <asp:Label ID="resp_idLabel" runat="server" Text='<%# Bind("resp_id") %>' />
                    <br />
                    evAction_date:
                    <asp:Label ID="evAction_dateLabel" runat="server" Text='<%# Bind("evAction_date") %>' />
                    <br />
                    actPlan_id:
                    <asp:Label ID="actPlan_idLabel" runat="server" Text='<%# Bind("actPlan_id") %>' />
                    <br />
                    key1:
                    <asp:Label ID="key1Label" runat="server" Text='<%# Bind("key1") %>' />
                    <br />
                    actType_desc:
                    <asp:Label ID="actType_descLabel" runat="server" Text='<%# Bind("actType_desc") %>' />
                    <br />
                    ctrlType_desc:
                    <asp:Label ID="ctrlType_descLabel" runat="server" Text='<%# Bind("ctrlType_desc") %>' />
                    <br />
                    stat_id:
                    <asp:Label ID="stat_idLabel" runat="server" Text='<%# Bind("stat_id") %>' />
                    <br />
                </ItemTemplate>
            </asp:FormView>
            </div>
        <div class="box-footer">
            <asp:Panel ID="pnl_acciones" runat="server" ScrollBars="Auto">
                
                    <asp:GridView ID="grv_actions" runat="server" AutoGenerateColumns="False" AutoGenerateEditButton="True" CssClass="table table-bordered table-hover dataTable" DataSourceID="sds_actions" DataKeyNames="evAction_id" OnRowUpdating="grv_actions_RowUpdating">
                        <Columns>
                            <asp:CommandField DeleteText="Quitar" ShowDeleteButton="True">
                            <HeaderStyle Width="7%" />
                            </asp:CommandField>
                            <asp:TemplateField HeaderText="Tipo de acción" SortExpression="actType_desc">
                                <EditItemTemplate>
                                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("actType_desc") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("actType_desc") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Acciones" SortExpression="evAction_actions">
                                <EditItemTemplate>
                                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("actType_desc") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("evAction_actions") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tipo de control" SortExpression="ctrlType_desc">
                                <EditItemTemplate>
                                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("ctrlType_desc") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ctrlType_desc") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Fecha" SortExpression="evAction_date">
                                <EditItemTemplate>
                                    <asp:Label ID="Label16" runat="server" Text='<%# Eval("evAction_date", "{0:d}") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("evAction_date", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Usuario" SortExpression="usr_username">
                                <EditItemTemplate>
                                    <asp:Label ID="Label17" runat="server" Text='<%# Eval("usr_username") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("usr_username") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Evidencia" SortExpression="evAction_fileEvidence">
                                <EditItemTemplate>
                                    <asp:FileUpload ID="fup_evAction" runat="server" Width="150px" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("evAction_fileEvidence") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estatus" SortExpression="stat_desc">
                                <EditItemTemplate>
                                    <asp:Label ID="Label18" runat="server" Text='<%# Eval("stat_desc") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("stat_desc") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

            </asp:Panel>
            <asp:SqlDataSource ID="sds_actions" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_eventActions.evAction_id, tbl_eventActions.actType_id, tbl_eventActions.evAction_actions, tbl_eventActions.crtlType_id, tbl_eventActions.resp_id, tbl_eventActions.evAction_date, tbl_eventActions.actPlan_id, tbl_eventActions.key1, tbl_actionType.actType_desc, tbl_controlType.ctrlType_desc, tbl_eventActions.stat_id, tbl_status.stat_desc, tbl_eventActions.usr_username, tbl_eventActions.evAction_fileEvidence FROM tbl_eventActions INNER JOIN tbl_actionPlan ON tbl_eventActions.actPlan_id = tbl_actionPlan.actPlan_id INNER JOIN tbl_status ON tbl_eventActions.stat_id = tbl_status.stat_id LEFT OUTER JOIN tbl_controlType ON tbl_eventActions.crtlType_id = tbl_controlType.ctrlType_id LEFT OUTER JOIN tbl_actionType ON tbl_eventActions.actType_id = tbl_actionType.actType_id WHERE (tbl_actionPlan.proc_id = 7) AND (tbl_actionPlan.key1 = @inspectID)" InsertCommand="INSERT INTO tbl_eventActions(actType_id, evAction_actions, crtlType_id, resp_id, evAction_date, stat_id, actPlan_id, key1, usr_username) VALUES (@actType_id, @evAction_actions, @crtlType_id, @resp_id, @evAction_date, @stat_id, @actPlan_id, @key1, @usr_username)" DeleteCommand="DELETE FROM tbl_eventActions WHERE (evAction_id = @evAction_id) AND (key1 = @key1) AND (actPlan_id = @actPlan_id)" UpdateCommand="UPDATE tbl_eventActions SET evAction_fileEvidence = @evAction_fileEvidence, evAction_closeDate = @evAction_closeDate, stat_id = @stat_id WHERE (evAction_id = @evAction_id) AND (key1 = @key1)">
                <DeleteParameters>
                    <asp:Parameter Name="evAction_id" />
                    <asp:QueryStringParameter Name="key1" QueryStringField="inspectID" />
                    <asp:QueryStringParameter DefaultValue="" Name="actPlan_id" QueryStringField="actPlanID" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="actType_id" />
                    <asp:Parameter Name="evAction_actions" />
                    <asp:Parameter Name="crtlType_id" />
                    <asp:Parameter Name="resp_id" />
                    <asp:Parameter Name="evAction_date" />
                    <asp:Parameter DefaultValue="5" Name="stat_id" />
                    <asp:QueryStringParameter DefaultValue="" Name="actPlan_id" QueryStringField="actPlanID" />
                    <asp:QueryStringParameter Name="key1" QueryStringField="inspectID" />
                    <asp:Parameter Name="usr_username" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="inspectID" QueryStringField="inspectID" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="evAction_fileEvidence" />
                    <asp:Parameter Name="evAction_closeDate" />
                    <asp:Parameter Name="stat_id" />
                    <asp:Parameter Name="evAction_id" />
                    <asp:QueryStringParameter Name="key1" QueryStringField="inspectID" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <hr />
        </div>
    </div>
    </asp:Panel>
    <asp:Panel ID="pnl_botones" runat="server" HorizontalAlign="Right">
        <asp:Label ID="lbl_err" runat="server" ForeColor="Red"></asp:Label>
        <asp:Button ID="btn_guardar" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Guardar y enviar" Visible="False" />
        <asp:Button ID="btn_approve" runat="server" CssClass="btn btn-success" OnClick="btn_approve_Click" Text="Aprobar" Visible="False" />
        <asp:Button ID="btn_revisado" runat="server" CssClass="btn btn-success" OnClick="btn_revisado_Click" Text="Revisado" Visible="False" />
        <asp:Button ID="btn_print" runat="server" CssClass="btn btn-primary" OnClick="Button2_Click" Text="Imrpimir PDF" OnClientClick="aspnetForm.target ='_blank'" />
        <asp:ImageButton ID="imb_printPDF" runat="server" ImageUrl="~/Resources/img-pdf.png" OnClick="imb_printPDF_Click" Visible="False" />
    </asp:Panel>
    <p></p>
    <div class="box box-primary">
               <div class="box-header with-border">
                    <h3 class="box-title">
&nbsp;<asp:Label ID="lbl_insClosed" runat="server" Text="Bitacora"></asp:Label>
                    </h3>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                    </div>
                </div>
                <div class="box-body">

                    <asp:GridView ID="grv_bitacora" runat="server" AutoGenerateColumns="False" DataKeyNames="bitac_id" DataSourceID="sds_bitacora" GridLines="None" CssClass="bitacora">
                        <Columns>
                            <asp:BoundField DataField="bitac_id" HeaderText="bitac_id" InsertVisible="False" ReadOnly="True" SortExpression="bitac_id" Visible="False" />
                            <asp:BoundField DataField="bitac_date" HeaderText="Fecha" SortExpression="bitac_date" />
                            <asp:BoundField DataField="bitac_action" HeaderText="Acción" SortExpression="bitac_action" />
                            <asp:BoundField DataField="bitac_desc" HeaderText="Descripción" SortExpression="bitac_desc" />
                            <asp:BoundField DataField="bitac_module" HeaderText="Módulo" SortExpression="bitac_module" />
                            <asp:BoundField DataField="bitac_key1" HeaderText="Inspeccion" SortExpression="bitac_key1" />
                            <asp:BoundField DataField="bitac_key2" SortExpression="bitac_key2" />
                            <asp:BoundField DataField="usr_username" HeaderText="Usuario" SortExpression="usr_username" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sds_bitacora" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT bitac_id, bitac_date, bitac_action, bitac_desc, bitac_module, bitac_key1, bitac_key2, usr_username FROM tbl_bitacora WHERE (bitac_key1 = @bitac_key1) AND bitac_module='inspects' ORDER BY bitac_date DESC">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="bitac_key1" QueryStringField="inspectID" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </div>
                <div class="box-footer">
                </div>
     </div>
</asp:Content>
