<%@ Page MaintainScrollPositionOnPostback="true" Title="Detalle Incidente" Language="C#" MasterPageFile="~/pentago_theme.Master" AutoEventWireup="true" Async="true" CodeBehind="incidDetail.aspx.cs" Inherits="pentagono.incidDetail" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="titulo" runat="server">
    <h1>Detalle de reporte</h1>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">
        <!-- Box informacon general -->
    <div class="row">
    <div class="col-md-1"></div>
        <div class="col-md-10">
           <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"><b>1.- Información sobre el accidente o incidente</b></h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
           
            <div class="box-body">
                <asp:Panel ID="Panel1" runat="server">
                    <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Size="Large" Text="Folio: "></asp:Label>
                    <asp:TextBox ID="txt_folio" runat="server" Enabled="False" Font-Size="Large" OnTextChanged="txt_folio_TextChanged"></asp:TextBox>
                    &nbsp;<asp:Label ID="Label22" runat="server"></asp:Label>
                </asp:Panel>
              <asp:FormView ID="FormView1" style="width: 100%;" runat="server" DataKeyNames="incident_id" DataSourceID="incidDetailData" DefaultMode="Edit">
                  <EditItemTemplate>
                      <table style="width:100%;">
                          <tr>
                              <td class="auto-style1">&nbsp;</td>
                              <td><asp:TextBox ID="txtIncidID" runat="server" Text='<%# Bind("incident_id") %>' Visible="False"></asp:TextBox></td>
                          </tr>
                          <tr>
                              <td class="auto-style1">&#160;</td><td><asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="gecData" DataTextField="gec_desc" DataValueField="gec_id" RepeatDirection="Horizontal" SelectedValue='<%# Bind("gec_id") %>'></asp:RadioButtonList></td>
                          </tr>
                          <tr>
                              <td class="auto-style1">Fecha:</td>
                              <td><asp:TextBox ID="incident_dateTextBox" runat="server" Text='<%# Bind("incident_date", "{0:dd/MM/yyyy}") %>' /></td>
                          </tr>
                          <tr>
                              <td class="auto-style1">Hora:</td>
                              <td><asp:TextBox ID="txt_hora" runat="server" Text='<%# Bind("incident_hour") %>'></asp:TextBox></td>
                          </tr><tr><td class="auto-style1">Turno:</td><td><asp:DropDownList ID="DropDownList1" runat="server" CssClass="field combobox" DataSourceID="turnoData" DataTextField="turn_desc" DataValueField="turn_id" SelectedValue='<%# Bind("turn_id") %>'></asp:DropDownList></td></tr><tr><td class="auto-style1">Area que genera:</td><td>
                  <asp:DropDownList ID="DropDownList2" runat="server" CssClass="field combobox" DataSourceID="areasData" DataTextField="area_name" DataValueField="area_id" SelectedValue='<%# Bind("area_id") %>'></asp:DropDownList></td></tr><tr><td class="auto-style1">Tipo de evento:</td><td><asp:DropDownList ID="DropDownList3" runat="server" CssClass="field combobox" DataSourceID="eventTypeData" DataTextField="event_desc" DataValueField="event_id" SelectedValue='<%# Bind("event_id") %>'></asp:DropDownList></td></tr>
                  <tr>
                      <td class="auto-style1">&nbsp;</td>
                      <td>
                          <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="evChildData" DataTextField="evChild_name" DataValueField="evChild_id" SelectedValue='<%# Bind("evChild_id") %>' AppendDataBoundItems="True">
                              <asp:ListItem Value="0">N/A</asp:ListItem>
                          </asp:DropDownList>
                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style1">&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr><td class="auto-style1">Clasificación del evento:</td><td><asp:DropDownList ID="DropDownList4" runat="server" CssClass="field combobox" DataSourceID="classEventData" DataTextField="evClass_name" DataValueField="evClass_id" SelectedValue='<%# Bind("evClass_id") %>'></asp:DropDownList></td></tr><tr><td class="auto-style2">Lugar del evento:</td><td class="auto-style3"><asp:DropDownList ID="DropDownList5" runat="server" CssClass="field combobox" DataSourceID="placeEventData" DataTextField="evPlace_name" DataValueField="evPlace_id" SelectedValue='<%# Bind("evPlace_id") %>'></asp:DropDownList></td></tr><tr><td class="auto-style1">Descripción del evento:</td><td><asp:TextBox ID="incident_descTextBox" runat="server" Text='<%# Bind("incident_desc") %>' TextMode="MultiLine" Width="100%" /></td></tr><tr><td class="auto-style1">&nbsp;</td><td>
                  <asp:Label ID="Label2" runat="server" Font-Size="Large" ForeColor="#00CC00" Text='<%# Bind("stat_desc") %>' Visible="False"></asp:Label>
                  </td></tr>
                  <tr>
                      <td class="auto-style1">&nbsp;</td>
                      <td>&nbsp;</td>
                  </tr>
                  <tr>
                      <td class="auto-style1">&#160;</td>
                      <td><asp:Button ID="Button2" runat="server" CausesValidation="True" CommandName="Update" Text="Actualizar" CssClass="btn btn-primary" /></td>
                  </tr>
                </table></EditItemTemplate><InsertItemTemplate>incident_desc: <asp:TextBox ID="incident_descTextBox" runat="server" Text='<%# Bind("incident_desc") %>' /><br />incident_date: <asp:TextBox ID="incident_dateTextBox" runat="server" Text='<%# Bind("incident_date") %>' /><br />turn_id: <asp:TextBox ID="turn_idTextBox" runat="server" Text='<%# Bind("turn_id") %>' /><br />area_id: <asp:TextBox ID="area_idTextBox" runat="server" Text='<%# Bind("area_id") %>' /><br />event_id: <asp:TextBox ID="event_idTextBox" runat="server" Text='<%# Bind("event_id") %>' /><br />evChild_id: <asp:TextBox ID="evChild_idTextBox" runat="server" Text='<%# Bind("evChild_id") %>' /><br />evGrndChild_id: <asp:TextBox ID="evGrndChild_idTextBox" runat="server" Text='<%# Bind("evGrndChild_id") %>' /><br />evPlace_id: <asp:TextBox ID="evPlace_idTextBox" runat="server" Text='<%# Bind("evPlace_id") %>' /><br />incident_serial: <asp:TextBox ID="incident_serialTextBox" runat="server" Text='<%# Bind("incident_serial") %>' /><br />stat_id: <asp:TextBox ID="stat_idTextBox" runat="server" Text='<%# Bind("stat_id") %>' /><br />gec_id: <asp:TextBox ID="gec_idTextBox" runat="server" Text='<%# Bind("gec_id") %>' /><br />evClass_id: <asp:TextBox ID="evClass_idTextBox" runat="server" Text='<%# Bind("evClass_id") %>' /><br />gec_desc: <asp:TextBox ID="gec_descTextBox" runat="server" Text='<%# Bind("gec_desc") %>' /><br />turn_desc: <asp:TextBox ID="turn_descTextBox" runat="server" Text='<%# Bind("turn_desc") %>' /><br />evChild_name: <asp:TextBox ID="evChild_nameTextBox" runat="server" Text='<%# Bind("evChild_name") %>' /><br />event_desc: <asp:TextBox ID="event_descTextBox" runat="server" Text='<%# Bind("event_desc") %>' /><br />area_name: <asp:TextBox ID="area_nameTextBox" runat="server" Text='<%# Bind("area_name") %>' /><br />stat_desc: <asp:TextBox ID="stat_descTextBox" runat="server" Text='<%# Bind("stat_desc") %>' /><br />evClass_name: <asp:TextBox ID="evClass_nameTextBox" runat="server" Text='<%# Bind("evClass_name") %>' /><br />evPlace_name: <asp:TextBox ID="evPlace_nameTextBox" runat="server" Text='<%# Bind("evPlace_name") %>' /><br /><asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />&#160; <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" /></InsertItemTemplate><ItemTemplate>incident_id: <asp:Label ID="incident_idLabel" runat="server" Text='<%# Eval("incident_id") %>' /><br />incident_desc: <asp:Label ID="incident_descLabel" runat="server" Text='<%# Bind("incident_desc") %>' /><br />incident_date: <asp:Label ID="incident_dateLabel" runat="server" Text='<%# Bind("incident_date") %>' /><br />turn_id: <asp:Label ID="turn_idLabel" runat="server" Text='<%# Bind("turn_id") %>' /><br />area_id: <asp:Label ID="area_idLabel" runat="server" Text='<%# Bind("area_id") %>' /><br />event_id: <asp:Label ID="event_idLabel" runat="server" Text='<%# Bind("event_id") %>' /><br />evChild_id: <asp:Label ID="evChild_idLabel" runat="server" Text='<%# Bind("evChild_id") %>' /><br />evGrndChild_id: <asp:Label ID="evGrndChild_idLabel" runat="server" Text='<%# Bind("evGrndChild_id") %>' /><br />evPlace_id: <asp:Label ID="evPlace_idLabel" runat="server" Text='<%# Bind("evPlace_id") %>' /><br />incident_serial: <asp:Label ID="incident_serialLabel" runat="server" Text='<%# Bind("incident_serial") %>' /><br />stat_id: <asp:Label ID="stat_idLabel" runat="server" Text='<%# Bind("stat_id") %>' /><br />gec_id: <asp:Label ID="gec_idLabel" runat="server" Text='<%# Bind("gec_id") %>' /><br />evClass_id: <asp:Label ID="evClass_idLabel" runat="server" Text='<%# Bind("evClass_id") %>' /><br />gec_desc: <asp:Label ID="gec_descLabel" runat="server" Text='<%# Bind("gec_desc") %>' /><br />turn_desc: <asp:Label ID="turn_descLabel" runat="server" Text='<%# Bind("turn_desc") %>' /><br />evChild_name: <asp:Label ID="evChild_nameLabel" runat="server" Text='<%# Bind("evChild_name") %>' /><br />event_desc: <asp:Label ID="event_descLabel" runat="server" Text='<%# Bind("event_desc") %>' /><br />area_name: <asp:Label ID="area_nameLabel" runat="server" Text='<%# Bind("area_name") %>' /><br />stat_desc: <asp:Label ID="stat_descLabel" runat="server" Text='<%# Bind("stat_desc") %>' /><br />evClass_name: <asp:Label ID="evClass_nameLabel" runat="server" Text='<%# Bind("evClass_name") %>' /><br />evPlace_name: <asp:Label ID="evPlace_nameLabel" runat="server" Text='<%# Bind("evPlace_name") %>' /><br /><asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" /></ItemTemplate>
              </asp:FormView>
            </div><!-- /.box-body -->
          </div><!-- /Box informacon general -->
        </div>
      <div class="col-md-1"></div>
    </div>
    <!-- Box detalle involucrados -->
    <div class="row">
    <div class="col-md-1"></div>
        <div class="col-md-10">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"><b>2.-Información del personal involucrado en el evento</b></h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <div class="box-body">
              <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" Font-Size="X-Small" style="margin-right: 0px" DataSourceID="personaEventData" AutoGenerateColumns="False" DataKeyNames="perEvent_id" AutoGenerateEditButton="True" CssClass="table table-bordered table-hover dataTable" AutoGenerateDeleteButton="True"><Columns><asp:BoundField DataField="perEvent_company" HeaderText="Compañía" SortExpression="perEvent_company" /><asp:BoundField DataField="perEvent_name" HeaderText="Nombre" SortExpression="perEvent_name" /><asp:BoundField DataField="perEvent_timeWork" HeaderText="Antigüedad" SortExpression="perEvent_timeWork" />
                    <asp:TemplateField HeaderText="Tipo de personal" SortExpression="personType_id">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("personType_id") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("perType_desc") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Clasificacion" SortExpression="personClass_id">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("personClass_id") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("perEvClass_desc") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Area" SortExpression="area_id">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("area_id") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("area_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns></asp:GridView></ContentTemplate></asp:UpdatePanel>
            </div><!-- /.box-body -->
          </div><!-- /Box detalle involucrados -->
        </div>
      <div class="col-md-1"></div>
    </div>
    <!-- Box acciones inmediatas -->
   <div class="row">
    <div class="col-md-1"></div>
        <div class="col-md-10">    
            <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"><b>3.-Acciones inmediatas</b></h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <div class="box-body">
              <asp:UpdatePanel ID="upl_acciones" runat="server"><ContentTemplate>
                <asp:GridView ID="GridView4" runat="server" Font-Size="X-Small" DataSourceID="actionEventData" AutoGenerateColumns="False" DataKeyNames="inAction_id" CssClass="table table-bordered table-hover dataTable" AutoGenerateEditButton="True" AutoGenerateDeleteButton="True"><Columns><asp:BoundField DataField="inAction_person" HeaderText="Persona que realiza" SortExpression="inAction_person" /><asp:BoundField DataField="inAction_desc" HeaderText="Descripción de la acción" SortExpression="inAction_desc" /><asp:BoundField DataField="inAction_date" HeaderText="Fecha de la acción" SortExpression="inAction_date" /></Columns></asp:GridView></ContentTemplate></asp:UpdatePanel>
            </div><!-- /.box-body -->
          </div><!-- /Box acciones inmediatas -->
        </div>
      <div class="col-md-1"></div>
     </div>
        &nbsp;<asp:Panel ID="pnlBotones" runat="server" HorizontalAlign="Right">
            <asp:Button ID="btnActualizar" runat="server" CssClass="btn btn-primary" Text="Enviar actualización" OnClick="btnActualizar_Click" />
            &nbsp;&nbsp;
            <asp:Button ID="btnAceptar" runat="server" Text="Aprobada" OnClick="btnAceptar_Click" CssClass="btn btn-success" />
            &nbsp;&nbsp;
            <asp:Button ID="btnRechazada" runat="server" Text="Rechazada" CssClass="btn btn-danger" />
            <cc1:ModalPopupExtender ID="btnRechazada_ModalPopupExtender" runat="server" BehaviorID="btnRechazada_ModalPopupExtender" DynamicServicePath="" TargetControlID="btnRechazada" BackgroundCssClass="modalShadow" CancelControlID="btn_cancelar" PopupControlID="pnl_motivo">
            </cc1:ModalPopupExtender>
            <br />
            <asp:Label ID="lblError" runat="server" ForeColor="Black"></asp:Label>
        </asp:Panel>
        <br />
    <asp:Panel ID="Panel3" runat="server">
        <asp:Label ID="lbl_folio0" runat="server" Font-Size="X-Large" ForeColor="#3B608F" Text="Plan de acción:"></asp:Label>
        <asp:TextBox ID="txt_folio0" runat="server" AutoPostBack="True" BorderWidth="0px" Font-Size="X-Large" ForeColor="#3B608F">0</asp:TextBox>
        <asp:Label ID="lblEstatusPlan" runat="server" Visible="False"></asp:Label>
        <br /><br />
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10"> 
                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title"><b>4. Análisis de causa raíz</b></h3>
                        <div class="box-tools pull-right">
                           <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                        </div>
                    </div>
        <div class="box-body">
            <table style="width: 100%;">
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:Label ID="lbl_evidencia" runat="server" Text="Evidencia:" Font-Bold="True"></asp:Label>
                    </td>
                    <td>
                                <asp:FileUpload ID="fup_evidencia" runat="server" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fup_evidencia" ErrorMessage="*Es necesario agregar evidencia para la causa" ForeColor="Red" ValidationGroup="InsertaCausa"></asp:RequiredFieldValidator>
                    </td>
                    <td>&nbsp;</td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="lbl_tipoCausa" runat="server" Text="Tipo de Causa:" Font-Bold="True"></asp:Label>
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
                        <td><asp:Label ID="lbl_causa" runat="server" Text="Causa:" Font-Bold="True"></asp:Label></td>
                        <td><asp:DropDownList ID="ddl_causa" runat="server" CssClass="field" DataSourceID="causeData" DataTextField="cause_desc" DataValueField="cause_id" AppendDataBoundItems="True"><asp:ListItem Value="0">Seleccione una opción</asp:ListItem></asp:DropDownList><asp:SqlDataSource ID="causeData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_causes] WHERE ([cause_active] = @cause_active)"><SelectParameters><asp:Parameter DefaultValue="True" Name="cause_active" Type="Boolean" /></SelectParameters></asp:SqlDataSource></td><td>&nbsp;</td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="Label18" runat="server" Text="Comentarios adicionales" Font-Bold="True"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_causeComment" runat="server" TextMode="MultiLine" CssClass="field"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>
                            <asp:Label ID="lbl_errorCausas" runat="server"></asp:Label>
                        </td>
                        <td>&nbsp;</td></tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td><asp:Button ID="btn_addCausa" runat="server" Text="Agregar Causa" CssClass="btn btn-primary" OnClick="btn_addCausa_Click" ValidationGroup="InsertaCausa" /></td>
                        <td>&nbsp;</td>
                    </tr>
            </table>
            <br />
            <asp:Panel ID="Panel4" runat="server" style="margin-top: 0px">
                <asp:GridView ID="grv_causa" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" CssClass="table table-bordered table-hover dataTable" DataKeyNames="evCause_id" DataSourceID="evCauseData" Font-Size="Small">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="evCause_file" DataNavigateUrlFormatString="uploaded/{0}" DataTextField="evCause_file" HeaderText="Evidencia" Target="_blank" Text="Evidencia" />
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
                    </Columns>
                </asp:GridView>
            </asp:Panel>
        </div>
        <div class="box-footer">
        </div>
    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10"> 
        <div class="box box-primary">
        <div class="box-header">
            <h3 class="box-title"><b>5. Acciones</b></h3>
            <div class="box-tools pull-right">
               <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
            </div>
        </div>
        <div class="box-body">
            <table style="width:100%;"><tr><td>&nbsp;</td><td><asp:Label ID="lbl_tipoAccion" runat="server" Text="Tipo de Acción:" Font-Bold="True"></asp:Label></td><td><asp:DropDownList ID="ddl_actType" runat="server" AppendDataBoundItems="True" CssClass="field" DataSourceID="actionTypeData" DataTextField="actType_desc" DataValueField="actType_id"><asp:ListItem Value="0">Seleccione una opción</asp:ListItem></asp:DropDownList>
                <asp:SqlDataSource ID="actionTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT actType_id, actType_desc, actType_active FROM tbl_actionType WHERE (actType_active = @actType_active)"><SelectParameters><asp:Parameter DefaultValue="True" Name="actType_active" Type="Boolean"></asp:Parameter></SelectParameters></asp:SqlDataSource></td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td><asp:Label ID="lbl_acciones" runat="server" Text="Acciones:" Font-Bold="True"></asp:Label></td><td><asp:TextBox ID="txt_acciones" runat="server" CssClass="field" Height="53px" TextMode="MultiLine"></asp:TextBox></td><td>&nbsp;</td></tr><tr><td>
                &nbsp;</td><td><asp:Label ID="lbl_tipoControl" runat="server" Text="Tipo de control:" Font-Bold="True"></asp:Label></td><td><asp:DropDownList ID="ddl_ctrlType" runat="server" AppendDataBoundItems="True" CssClass="field" DataSourceID="controlTypeData" DataTextField="ctrlType_desc" DataValueField="ctrlType_id"><asp:ListItem Value="0">Seleccione una opción</asp:ListItem></asp:DropDownList><asp:SqlDataSource ID="controlTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT ctrlType_id, ctrlType_desc, ctrlType_active FROM tbl_controlType WHERE (ctrlType_active = @ctrlType_active)"><SelectParameters><asp:Parameter DefaultValue="True" Name="ctrlType_active" Type="String"></asp:Parameter></SelectParameters></asp:SqlDataSource></td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td><asp:Label ID="lbl_responsable" runat="server" Text="Responasble:" Font-Bold="True"></asp:Label></td><td>
    <asp:DropDownList ID="ddl_resp" runat="server" AppendDataBoundItems="True" CssClass="field" DataSourceID="responsData" DataTextField="usrInfo_name" DataValueField="usrInfo_id"><asp:ListItem Value="0">Seleccione una opción</asp:ListItem></asp:DropDownList>
    <asp:SqlDataSource ID="responsData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_userInfo.usrInfo_id, tbl_userInfo.usrInfo_name, tbl_user.usr_id FROM tbl_user INNER JOIN tbl_userInfo ON tbl_user.usrInfo_id = tbl_userInfo.usrInfo_id WHERE (tbl_user.rol_id &gt; 1)"></asp:SqlDataSource>
    </td><td>&nbsp;</td></tr><tr><td>&nbsp;</td><td><asp:Label ID="lbl_fechaComp" runat="server" Text="Fecha compromiso:" Font-Bold="True"></asp:Label></td><td><asp:TextBox ID="txt_fechaComp" runat="server"></asp:TextBox><cc1:CalendarExtender ID="txt_fechaComp_CalendarExtender" runat="server" BehaviorID="txt_fechaComp_CalendarExtender" CssClass="MyCalendar" Format="dd/MM/yyyy" TargetControlID="txt_fechaComp"></cc1:CalendarExtender></td><td>&nbsp;</td></tr>
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
                <asp:Label ID="Label21" runat="server" Text="Label"></asp:Label>
                <asp:GridView ID="grv_acciones" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover dataTable" DataKeyNames="evAction_id" DataSourceID="evActionsData" Font-Size="Small" OnRowUpdating="grv_acciones_RowUpdating">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" Enabled='<%# accesoActividad(Convert.ToInt32( Eval("stat_id")), Convert.ToString(Eval("usr_username"))) %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
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
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="responsData" DataTextField="usrInfo_name" DataValueField="usr_id" SelectedValue='<%# Bind("resp_id") %>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("usrInfo_name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Fecha compromiso" SortExpression="evAction_date">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("evAction_date","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                <cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" BehaviorID="TextBox1_CalendarExtender" CssClass="MyCalendar" StartDate="<%# DateTime.Now %>" TargetControlID="TextBox1" Format="dd/MM/yyyy" />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("evAction_date","{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Evidencia" SortExpression="evAction_fileEvidence">
                            <EditItemTemplate>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
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
                </div>
                <div class="col-md-1"></div>
            </div>
        <asp:Panel ID="Panel5" runat="server" HorizontalAlign="Right" style="margin-top: 0px">
            <asp:Button ID="btnGuardaInv" runat="server" CssClass="btn btn-primary" OnClick="btnGuardaInv_Click" Text="Guardar" />
            &nbsp;<asp:Button ID="btnAceptar0" runat="server" CssClass="btn btn-success" OnClick="btnAceptar0_Click" Text="Validada" />
            &nbsp;<asp:Button ID="btnRechazada0" runat="server" CssClass="btn btn-danger" Text="Rechazada" />
            <cc1:ModalPopupExtender ID="btnRechazada0_ModalPopupExtender" runat="server" BehaviorID="btnRechazada0_ModalPopupExtender" CancelControlID="btnCancel2" DynamicServicePath="" PopupControlID="Panel2" TargetControlID="btnRechazada0" BackgroundCssClass="modalShadow">
            </cc1:ModalPopupExtender>
        </asp:Panel>
        <asp:ObjectDataSource ID="accionesDataReg" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataIncidentID" TypeName="pentagono.DataSet1TableAdapters.view_investigationActionsTableAdapter"></asp:ObjectDataSource>
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
        <asp:SqlDataSource ID="evActionsData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" DeleteCommand="DELETE FROM tbl_eventActions WHERE (evAction_id=@evAction_id)" SelectCommand="SELECT tbl_eventActions.evAction_id, tbl_eventActions.actType_id, tbl_eventActions.evAction_actions, tbl_eventActions.crtlType_id, tbl_eventActions.resp_id, tbl_eventActions.evAction_date, tbl_eventActions.evAction_closeDate, tbl_eventActions.evAction_fileEvidence, tbl_eventActions.stat_id, tbl_eventActions.incident_id, tbl_eventActions.actPlan_id, tbl_status.stat_desc, tbl_controlType.ctrlType_desc, tbl_actionType.actType_desc, tbl_userInfo.usrInfo_name, tbl_eventActions.usr_username FROM tbl_userInfo INNER JOIN tbl_user ON tbl_userInfo.usrInfo_id = tbl_user.usrInfo_id INNER JOIN tbl_eventActions INNER JOIN tbl_actionType ON tbl_eventActions.actType_id = tbl_actionType.actType_id INNER JOIN tbl_status ON tbl_eventActions.stat_id = tbl_status.stat_id INNER JOIN tbl_controlType ON tbl_eventActions.crtlType_id = tbl_controlType.ctrlType_id ON tbl_user.usr_id = tbl_eventActions.resp_id WHERE (tbl_eventActions.incident_id = @incident_id)" UpdateCommand="UPDATE tbl_eventActions SET evAction_fileEvidence=@evAction_fileEvidence, evAction_actions=@evAction_actions, crtlType_id=@crtlType_id, resp_id=@resp_id WHERE (evAction_id=@evAction_id) AND (incident_id=@incident_id)">
            <DeleteParameters>
                <asp:Parameter Name="evAction_id" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txt_folio" Name="incident_id" PropertyName="Text" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="evAction_fileEvidence" />
                <asp:Parameter Name="evAction_id" />
                <asp:ControlParameter ControlID="txt_folio" Name="incident_id" PropertyName="Text" />
                <asp:Parameter Name="evAction_actions" />
                <asp:Parameter Name="crtlType_id" />
                <asp:Parameter Name="resp_id" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    </asp:Panel>
    <br />
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
        <br />
        <asp:Panel ID="pnl_motivo" runat="server" CssClass="modalPanel" Width="300px">
        <div class="box box-warning" style="text-align:left;">
            <div class="box-body">
                <div class="form-group">
                    <asp:Label ID="lblMotivo" runat="server" Text="Motivo del rechazo"></asp:Label>
                    <asp:TextBox ID="txtMotivo" runat="server" TextMode="MultiLine" CssClass="form-control" Height="75px"></asp:TextBox>
                    <br />
                    <asp:Label ID="lblErrorMotivo" runat="server"></asp:Label>
                </div>
                <div class="box-footer" style="text-align:right;">
                    <asp:Button ID="btnMotivo" runat="server" CssClass="btn btn-primary" Text="Enviar" OnClick="Button3_Click" />
                    &nbsp;<asp:Button ID="btn_cancelar" runat="server" CssClass="btn btn-danger" Text="Cancelar" />
                </div>
            </div>
        </div>
        </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" CssClass="modalPanel" Width="300px">
        <div class="box box-warning" style="text-align:left;">
            <div class="box-body">
                <div class="form-group">
                    <asp:Label ID="Label8" runat="server" Text="Motivo del rechazo"></asp:Label>
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" CssClass="form-control" Height="75px"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label9" runat="server"></asp:Label>
                </div>
                <div class="box-footer" style="text-align:right;">
                    <asp:Button ID="btnEnviarMotivo" runat="server" CssClass="btn btn-primary" Text="Enviar" OnClick="btnEnviarMotivo_Click" />
                    &nbsp;<asp:Button ID="btnCancel2" runat="server" CssClass="btn btn-danger" Text="Cancelar" />
                </div>
            </div>
        </div>
        </asp:Panel>
        <asp:SqlDataSource ID="incidDetailData" runat="server" 
            ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" 
            SelectCommand="SELECT tbl_incident.incident_id, tbl_incident.incident_desc, tbl_incident.incident_date, tbl_incident.turn_id, tbl_incident.area_id, tbl_incident.event_id, tbl_incident.evChild_id, tbl_incident.evGrndChild_id, tbl_incident.evPlace_id, tbl_incident.incident_serial, tbl_incident.stat_id, tbl_incident.gec_id, tbl_incident.evClass_id, tbl_globalEventClass.gec_desc, tbl_turn.turn_desc, tbl_eventTypeChild.evChild_name, tbl_eventType.event_desc, tbl_areas.area_name, tbl_status.stat_desc, tbl_eventClass.evClass_name, tbl_eventPlace.evPlace_name, tbl_incident.incident_hour FROM tbl_incident INNER JOIN tbl_turn ON tbl_incident.turn_id = tbl_turn.turn_id INNER JOIN tbl_areas ON tbl_incident.area_id = tbl_areas.area_id INNER JOIN tbl_globalEventClass ON tbl_incident.gec_id = tbl_globalEventClass.gec_id INNER JOIN tbl_eventType ON tbl_incident.event_id = tbl_eventType.event_id INNER JOIN tbl_status ON tbl_incident.stat_id = tbl_status.stat_id INNER JOIN tbl_eventClass ON tbl_incident.evClass_id = tbl_eventClass.evClass_id INNER JOIN tbl_eventPlace ON tbl_incident.evPlace_id = tbl_eventPlace.evPlace_id LEFT OUTER JOIN tbl_eventTypeChild ON tbl_incident.evChild_id = tbl_eventTypeChild.evChild_id WHERE (tbl_incident.incident_id = @incident_id)" 
            UpdateCommand="UPDATE tbl_incident SET incident_desc=@incident_desc, incident_date=@incident_date, tbl_incident.turn_id=@turn_id, incident_hour=@incident_hour, area_id=@area_id, event_id=@event_id, evChild_id=@evChild_id, evPlace_id=@evPlace_id, evClass_id=@evClass_id WHERE (tbl_incident.incident_id = @incident_id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="incident_id" QueryStringField="folio" />
            </SelectParameters>
            <UpdateParameters>
                <asp:QueryStringParameter Name="incident_id" QueryStringField="folio" />
                <asp:Parameter Name="incident_date" />
                <asp:Parameter Name="turn_id" />
                <asp:Parameter Name="incident_desc" />
                <asp:Parameter Name="incident_hour" />
                <asp:Parameter Name="area_id" />
                <asp:Parameter Name="event_id" />
                <asp:Parameter Name="evChild_id" />
                <asp:Parameter Name="evPlace_id" />
                <asp:Parameter Name="evClass_id" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="estatusData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_status] WHERE (([stat_active] = @stat_active) AND ([stat_module] = @stat_module))">
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="stat_active" Type="Boolean" />
                <asp:Parameter DefaultValue="incidentAccident" Name="stat_module" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="turnoData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_turn] WHERE ([turn_active] = @turn_active)">
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="turn_active" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="areasData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_areas] WHERE ([area_active] = @area_active)">
            <SelectParameters>
                <asp:Parameter DefaultValue="true" Name="area_active" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="eventTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_eventType] WHERE ([event_active] = @event_active)">
            <SelectParameters>
                <asp:Parameter DefaultValue="true" Name="event_active" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="classEventData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_eventClass] WHERE ([evClass_active] = @evClass_active)">
            <SelectParameters>
                <asp:Parameter DefaultValue="true" Name="evClass_active" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="placeEventData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_eventPlace] WHERE ([evPlace_active] = @evPlace_active)">
            <SelectParameters>
                <asp:Parameter DefaultValue="true" Name="evPlace_active" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="personaEventData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_personEvent.perEvent_id, tbl_personEvent.perEvent_company, tbl_personEvent.perEvent_name, tbl_personEvent.perEvent_timeWork, tbl_personEvent.personType_id, tbl_personEvent.personClass_id, tbl_personEvent.incident_id, tbl_personEvent.area_id, tbl_personEvent.username, tbl_personEventClass.perEvClass_desc, tbl_personType.perType_desc, tbl_areas.area_name FROM tbl_personEvent INNER JOIN tbl_areas ON tbl_personEvent.area_id = tbl_areas.area_id INNER JOIN tbl_personEventClass ON tbl_personEvent.personClass_id = tbl_personEventClass.perEvClass_id INNER JOIN tbl_personType ON tbl_personEvent.personType_id = tbl_personType.perType_id WHERE (tbl_personEvent.incident_id = @incident_id)" UpdateCommand="UPDATE [tbl_personEvent] SET perEvent_company=@perEvent_company, perEvent_name=@perEvent_name, personType_id=@personType_id, personClass_id=@personClass_id, area_id=@area_id WHERE (incident_id = @incident_id) AND (perEvent_id = @perEvent_id)" DeleteCommand="DELETE FROM tbl_personEvent WHERE  (incident_id = @incident_id) AND (perEvent_id = @perEvent_id)">
            <DeleteParameters>
                <asp:QueryStringParameter Name="incident_id" QueryStringField="folio" />
                <asp:Parameter Name="perEvent_id" />
            </DeleteParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="incident_id" QueryStringField="folio" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="perEvent_company" />
                <asp:Parameter Name="perEvent_name" />
                <asp:Parameter Name="personType_id" />
                <asp:Parameter Name="personClass_id" />
                <asp:Parameter Name="area_id" />
                <asp:QueryStringParameter Name="incident_id" QueryStringField="folio" />
                <asp:Parameter Name="perEvent_id" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="actionEventData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_inmediateAction] WHERE ([incident_id] = @incident_id)" UpdateCommand="UPDATE tbl_inmediateAction SET inAction_desc=@inAction_desc, inAction_date=@inAction_date, inAction_name=@inAction_name  WHERE (([incident_id] = @incident_id) AND ([inAction_id] = @inAction_id))" DeleteCommand="DELETE FROM tbl_inmediateAction WHERE (incident_id = @incident_id) AND (inAction_id = @inAction_id)">
            <DeleteParameters>
                <asp:QueryStringParameter Name="incident_id" QueryStringField="folio" />
                <asp:Parameter Name="inAction_id" />
            </DeleteParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="incident_id" QueryStringField="folio" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="inAction_desc" />
                <asp:Parameter Name="inAction_date" />
                <asp:Parameter Name="inAction_name" />
                <asp:QueryStringParameter Name="incident_id" QueryStringField="folio" />
                <asp:Parameter Name="inAction_id" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="gecData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_globalEventClass] WHERE ([gec_active] = @gec_active)">
            <SelectParameters>
                <asp:Parameter DefaultValue="True" Name="gec_active" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="evChildData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_eventTypeChild] WHERE ([evChild_active] = @evChild_active)">
            <SelectParameters>
                <asp:Parameter DefaultValue="true" Name="evChild_active" Type="Boolean" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="bitacoraData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT bitac_id, bitac_date, bitac_action, bitac_desc, bitac_module, bitac_key1, bitac_key2, usr_username FROM tbl_bitacora WHERE (bitac_key1 = @bitac_key1) ORDER BY bitac_date DESC">
            <SelectParameters>
                <asp:QueryStringParameter Name="bitac_key1" QueryStringField="folio" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>
