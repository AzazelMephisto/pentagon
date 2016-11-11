<%@ Page MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/pentago_theme.Master" AutoEventWireup="true" Async="true" CodeBehind="investigation.aspx.cs" Inherits="pentagono.investigation" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="titulo" runat="server">
    <h1>Investigación</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
    <asp:Label ID="lbl_folio" runat="server" Text="Folio:" Font-Size="X-Large" ForeColor="#3B608F"></asp:Label>
        <asp:TextBox ID="txt_folio" runat="server" Font-Size="X-Large" ForeColor="#3B608F" BorderWidth="0px" AutoPostBack="True" OnTextChanged="txt_folio_TextChanged">0</asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;    <asp:Label ID="lbl_folio0" runat="server" Text="Plan de acción:" Font-Size="X-Large" ForeColor="#3B608F"></asp:Label>
        <asp:TextBox ID="txt_folio0" runat="server" Font-Size="X-Large" ForeColor="#3B608F" BorderWidth="0px" AutoPostBack="True">0</asp:TextBox>
    <div class="box box-primary">
        <div class="box-header">
            4. Análisis de causa raíz
        </div>
        <div class="box-body">
            <table style="width: 100%;">
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="lbl_evidencia" runat="server" Text="Evidencia:"></asp:Label>
                    </td>
                    <td>
                                <asp:FileUpload ID="fup_evidencia" runat="server" />
                    </td>
                    <td>&nbsp;</td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="lbl_tipoCausa" runat="server" Text="Tipo de Causa:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddl_tipoCausa" runat="server" AppendDataBoundItems="True" CssClass="field" DataSourceID="causeTypeData" DataTextField="causeType_desc" DataValueField="causeType_id">
                                <asp:ListItem Value="0">Seleccione una opción</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="causeTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_causeType] WHERE ([causeType_active] = @causeType_active)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="True" Name="causeType_active" Type="Boolean" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><asp:Label ID="lbl_causa" runat="server" Text="Causa:"></asp:Label></td>
                        <td><asp:DropDownList ID="ddl_causa" runat="server" CssClass="field" DataSourceID="causeData" DataTextField="cause_desc" DataValueField="cause_id" AppendDataBoundItems="True"><asp:ListItem Value="0">Seleccione una opción</asp:ListItem></asp:DropDownList><asp:SqlDataSource ID="causeData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_causes] WHERE ([cause_active] = @cause_active)"><SelectParameters><asp:Parameter DefaultValue="True" Name="cause_active" Type="Boolean" /></SelectParameters></asp:SqlDataSource></td><td>&nbsp;</td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text="Comentarios adicionales"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_causeComment" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td><asp:Button ID="btn_addCausa" runat="server" Text="Agregar Causa" CssClass="btn btn-primary" OnClick="btn_addCausa_Click" /></td>
                        <td>&nbsp;</td>
                    </tr>
            </table>
            <br />
            <asp:Panel ID="Panel1" runat="server" style="margin-top: 0px">
                <asp:GridView ID="grv_causa" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" CssClass="table table-bordered table-hover dataTable" DataKeyNames="evCause_id" DataSourceID="evCauseData" Font-Size="Small">
                    <Columns>
                        <asp:BoundField DataField="evCause_file" HeaderText="Evidencia" SortExpression="evCause_file" />
                        <asp:TemplateField HeaderText="Tipo Causa" SortExpression="causeType_id">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("causeType_id") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("causeType_desc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Causa" SortExpression="cause_id">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("cause_id") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("cause_desc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="evCause_desc" HeaderText="Comentarios" SortExpression="evCause_desc" />
                        <asp:HyperLinkField DataNavigateUrlFields="evCause_file" DataNavigateUrlFormatString="uploaded/{0}" DataTextField="evCause_file" Target="_blank" Text="Evidencia" />
                    </Columns>
                </asp:GridView>
            </asp:Panel>
        </div>
        <div class="box-footer">
        </div>
    </div>

    <div class="box box-primary">
        <div class="box-header">
            5. Acciones
        </div>
        <div class="box-body">
            <table style="width:100%;"><tr><td>&nbsp;</td><td><asp:Label ID="lbl_tipoAccion" runat="server" Text="Tipo de Acción:"></asp:Label></td><td><asp:DropDownList ID="ddl_actType" runat="server" AppendDataBoundItems="True" CssClass="field" DataSourceID="actionTypeData" DataTextField="actType_desc" DataValueField="actType_id"><asp:ListItem Value="0">Seleccione una opción</asp:ListItem></asp:DropDownList><asp:SqlDataSource ID="actionTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT actType_id, actType_desc, actType_active FROM tbl_actionType WHERE (actType_active = @actType_active)"><SelectParameters><asp:Parameter DefaultValue="True" Name="actType_active" Type="Boolean"></asp:Parameter></SelectParameters></asp:SqlDataSource></td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td><asp:Label ID="lbl_acciones" runat="server" Text="Acciones:"></asp:Label></td><td><asp:TextBox ID="txt_acciones" runat="server" CssClass="field" Height="53px" TextMode="MultiLine"></asp:TextBox></td><td>&nbsp;</td></tr><tr><td>
                &nbsp;</td><td><asp:Label ID="lbl_tipoControl" runat="server" Text="Tipo de control:"></asp:Label></td><td><asp:DropDownList ID="ddl_ctrlType" runat="server" AppendDataBoundItems="True" CssClass="field" DataSourceID="controlTypeData" DataTextField="ctrlType_desc" DataValueField="ctrlType_id"><asp:ListItem Value="0">Seleccione una opción</asp:ListItem></asp:DropDownList><asp:SqlDataSource ID="controlTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT ctrlType_id, ctrlType_desc, ctrlType_active FROM tbl_controlType WHERE (ctrlType_active = @ctrlType_active)"><SelectParameters><asp:Parameter DefaultValue="True" Name="ctrlType_active" Type="String"></asp:Parameter></SelectParameters></asp:SqlDataSource></td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td><asp:Label ID="lbl_responsable" runat="server" Text="Responasble:"></asp:Label></td><td>
    <asp:DropDownList ID="ddl_resp" runat="server" AppendDataBoundItems="True" CssClass="field" DataSourceID="responsData" DataTextField="usrInfo_name" DataValueField="usrInfo_id"><asp:ListItem Value="0">Seleccione una opción</asp:ListItem></asp:DropDownList>
    <asp:SqlDataSource ID="responsData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_userInfo.usrInfo_id, tbl_userInfo.usrInfo_name FROM tbl_user INNER JOIN tbl_userInfo ON tbl_user.usrInfo_id = tbl_userInfo.usrInfo_id WHERE (tbl_user.rol_id &gt; 1)"></asp:SqlDataSource>
    </td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td><asp:Label ID="lbl_fechaComp" runat="server" Text="Fecha compromiso:"></asp:Label></td><td><asp:TextBox ID="txt_fechaComp" runat="server"></asp:TextBox><ajax:CalendarExtender ID="txt_fechaComp_CalendarExtender" runat="server" BehaviorID="txt_fechaComp_CalendarExtender" CssClass="MyCalendar" Format="dd/MM/yyyy" TargetControlID="txt_fechaComp"></ajax:CalendarExtender></td><td>&nbsp;</td></tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr><td>&nbsp;</td><td>&nbsp;</td><td><asp:Button ID="btn_save" runat="server" Text="Agregar acción" CssClass="btn btn-primary" OnClick="btn_save_Click"></asp:Button></td><td>&nbsp;</td></tr></table>
        </div>
        <div class="box-footer">
            <asp:Panel ID="pnlAcciones" runat="server" ScrollBars="Auto">
                <asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
                <asp:GridView ID="grv_acciones" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" CssClass="table table-bordered table-hover dataTable" DataKeyNames="evAction_id" DataSourceID="evActionsData" Font-Size="Small" AutoGenerateEditButton="True" OnRowUpdating="grv_acciones_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="Tipo de acción" SortExpression="actType_id">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlActionType" runat="server" DataSourceID="actionTypeData" DataTextField="actType_desc" DataValueField="actType_id" SelectedValue='<%# Bind("actType_id") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("actType_desc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Acciones" SortExpression="evAction_actions">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("evAction_actions") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("evAction_actions") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tipo de control" SortExpression="crtlType_id">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlCtrlType" runat="server" DataSourceID="controlTypeData" DataTextField="ctrlType_desc" DataValueField="ctrlType_id" SelectedValue='<%# Bind("crtlType_id") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("ctrlType_desc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Responsable" SortExpression="resp_id">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="responsData" DataTextField="usrInfo_name" DataValueField="usrInfo_id" SelectedValue='<%# Bind("resp_id") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("usrInfo_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha compromiso" SortExpression="evAction_date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("evAction_date","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("evAction_date","{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Evidencia" SortExpression="evAction_fileEvidence">
                            <EditItemTemplate>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                <asp:Button ID="btnSubirArchivo" runat="server" OnClick="btnSubirArchivo_Click" Text="Subir" Visible="False" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("evAction_fileEvidence") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estatus" SortExpression="stat_id">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("stat_id") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("stat_desc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:Panel>
        </div>
    </div>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="Button1_Click" />
    <br /><br />
    <div class="box">
        <div class="box-header">
            Bitacora
        </div>
        <div class="box-body">
            <asp:Panel ID="pnlBitacora" runat="server">
            <asp:GridView ID="GridView3" runat="server" Font-Size="Small" AutoGenerateColumns="False" DataKeyNames="bitac_id" DataSourceID="bitacoraData" CssClass="bitacora" GridLines="None" ShowHeader="False">
                <Columns>
                    <asp:BoundField DataField="bitac_date" SortExpression="bitac_date" />
                    <asp:BoundField DataField="bitac_action" SortExpression="bitac_action" />
                    <asp:BoundField DataField="bitac_module" SortExpression="bitac_module" />
                    <asp:TemplateField SortExpression="bitac_key1">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("bitac_key1") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            folio:
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("bitac_key1") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="bitac_desc" SortExpression="bitac_desc" />
                </Columns>
            </asp:GridView>
        </asp:Panel>
        </div>
    </div>
        <asp:SqlDataSource ID="bitacoraData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT bitac_id, bitac_date, bitac_action, bitac_desc, bitac_module, bitac_key1, bitac_key2, usr_username FROM tbl_bitacora WHERE (bitac_key1 = @bitac_key1) ORDER BY bitac_date DESC">
            <SelectParameters>
                <asp:ControlParameter ControlID="txt_folio" Name="bitac_key1" PropertyName="Text" Type="Decimal" DefaultValue="0" />
            </SelectParameters>
        </asp:SqlDataSource>
    <asp:HiddenField ID="hdf_ok" runat="server" />
                <asp:ObjectDataSource ID="accionesDataReg" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataIncidentID" TypeName="pentagono.DataSet1TableAdapters.view_investigationActionsTableAdapter">

                </asp:ObjectDataSource>
    <asp:SqlDataSource ID="evCauseData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" DeleteCommand="DELETE FROM tbl_eventCause WHERE (evCause_id=@evCause_id)" SelectCommand="SELECT tbl_eventCause.evCause_id, tbl_eventCause.evCause_file, tbl_eventCause.evCause_desc, tbl_eventCause.cause_id, tbl_eventCause.causeType_id, tbl_eventCause.incident_id, tbl_causeType.causeType_desc, tbl_causes.cause_desc FROM tbl_eventCause INNER JOIN tbl_causeType ON tbl_eventCause.causeType_id = tbl_causeType.causeType_id INNER JOIN tbl_causes ON tbl_eventCause.cause_id = tbl_causes.cause_id WHERE (tbl_eventCause.incident_id = @incident_id)" UpdateCommand="UPDATE tbl_eventCause SET evCause_file=@evCause_file, evCause_desc=@evCause_desc, cause_id=@cause_id, causeType_id=@causeType_id WHERE evCause_id=@evCause_id AND incident_id=@incident_id">
        <DeleteParameters>
            <asp:Parameter Name="evCause_id" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txt_folio" Name="incident_id" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="evCause_file" />
            <asp:Parameter Name="evCause_desc" />
            <asp:Parameter Name="cause_id" />
            <asp:Parameter Name="causeType_id" />
            <asp:Parameter Name="evCause_id" />
            <asp:ControlParameter ControlID="txt_folio" Name="incident_id" PropertyName="Text" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="evActionsData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_eventActions.evAction_id, tbl_eventActions.actType_id, tbl_eventActions.evAction_actions, tbl_eventActions.crtlType_id, tbl_eventActions.resp_id, tbl_eventActions.evAction_date, tbl_eventActions.evAction_closeDate, tbl_eventActions.evAction_fileEvidence, tbl_eventActions.stat_id, tbl_eventActions.incident_id, tbl_eventActions.actPlan_id, tbl_status.stat_desc, tbl_controlType.ctrlType_desc, tbl_actionType.actType_desc, tbl_userInfo.usrInfo_name FROM tbl_userInfo INNER JOIN tbl_user ON tbl_userInfo.usrInfo_id = tbl_user.usrInfo_id INNER JOIN tbl_eventActions INNER JOIN tbl_actionType ON tbl_eventActions.actType_id = tbl_actionType.actType_id INNER JOIN tbl_status ON tbl_eventActions.stat_id = tbl_status.stat_id INNER JOIN tbl_controlType ON tbl_eventActions.crtlType_id = tbl_controlType.ctrlType_id ON tbl_user.usr_id = tbl_eventActions.resp_id WHERE (tbl_eventActions.incident_id = @incident_id)" DeleteCommand="DELETE FROM tbl_eventActions WHERE (evAction_id=@evAction_id)" UpdateCommand="UPDATE tbl_eventActions SET evAction_fileEvidence=@evAction_fileEvidence WHERE (evAction_id=@evAction_id) AND (incident_id=@incident_id)">
        <DeleteParameters>
            <asp:Parameter Name="evAction_id" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="txt_folio" Name="incident_id" PropertyName="Text" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="evAction_id" />
            <asp:ControlParameter ControlID="txt_folio" Name="incident_id" PropertyName="Text" />
            <asp:Parameter Name="evAction_fileEvidence" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <ajax:ModalPopupExtender ID="hdf_ok_ModalPopupExtender" runat="server" BehaviorID="hdf_ok_ModalPopupExtender" DynamicServicePath="" TargetControlID="hdf_ok" OkControlID="btn_ok" PopupControlID="pnl_ok" BackgroundCssClass="modalShadow"></ajax:ModalPopupExtender>
    <asp:Panel ID="pnl_ok" runat="server" CssClass="modalPanel"><asp:Label ID="Label1" runat="server" Text="Datos guardados correctamente"></asp:Label><br /><br /><br /><asp:Image ID="Image1" runat="server" ImageUrl="~/Resources/ok.png" /><br /><br /><asp:Button ID="btn_ok" runat="server" Text="Ok" /></asp:Panel>
    </asp:Content>
