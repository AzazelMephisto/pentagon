<%@ Page MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/pentago_theme.Master" Async="true" AutoEventWireup="true" CodeBehind="incidentes.aspx.cs" Inherits="pentagono.WebForm2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            text-align: right;
        }
        .auto-style4 {
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="titulo" runat="server">
    <h1>Generar reporte de accidente / incidente</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contenido" runat="server">  
    <!-- Box informacon general -->
    <div class="row">
    <div class="col-md-2"></div>
        <div class="col-md-8">
           <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">1.- Información sobre el accidente o incidente</h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
           
            <div class="box-body">
              <table style="width: 100%;" class="incident">
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td class="auto-style2">
                            <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Size="Large" Text="Folio: "></asp:Label>
                        </td>
                        <td class="auto-style1">
                            <asp:TextBox ID="txt_folio" runat="server" Enabled="False" Font-Size="Large"></asp:TextBox>
                        </td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1"></td>
                        <td class="auto-style2"></td>
                        <td class="auto-style2">Fecha de Reporte: <asp:Label ID="lblFechaReporte" runat="server"></asp:Label></td>
                        <td class="auto-style1">
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style1">
                            <asp:Label ID="lbl_estatus" runat="server" Font-Bold="True" Font-Size="Medium"></asp:Label>
                      &nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="alginRight">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td><asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" DataSourceID="eventClassDataSource" DataTextField="gec_desc" DataValueField="gec_id" RepeatDirection="Horizontal" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"></asp:RadioButtonList>

<asp:SqlDataSource ID="eventClassDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_globalEventClass] WHERE ([gec_active] = @gec_active)"><SelectParameters>
<asp:Parameter DefaultValue="True" Name="gec_active" Type="Boolean" />
</SelectParameters>
</asp:SqlDataSource>
</td><td>&nbsp;</td></tr><tr><td class="auto-style3">&nbsp;</td><td class="alginRight"><asp:Label ID="Label1" runat="server" Text="Fecha de evento:"></asp:Label>
</td><td><asp:TextBox ID="txt_eventFecha" runat="server" CssClass="field" AutoPostBack="True" OnTextChanged="txt_eventFecha_TextChanged"></asp:TextBox>
<ajax:CalendarExtender ID="txt_eventFecha_CalendarExtender" runat="server" BehaviorID="txt_eventFecha_CalendarExtender" TargetControlID="txt_eventFecha" CssClass="MyCalendar" Format="dd/MM/yyyy" />
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_eventFecha" ErrorMessage="*Campo requerido" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
</td><td>&nbsp;</td></tr><tr><td class="auto-style3">&nbsp;</td><td class="alginRight"><asp:Label ID="Label2" runat="server" Text="Horario de evento:"></asp:Label>
</td><td><asp:TextBox ID="txt_eventHora" runat="server" CssClass="field"></asp:TextBox>
<ajax:MaskedEditExtender ID="txt_eventHora_MaskedEditExtender" runat="server" BehaviorID="txt_eventHora_MaskedEditExtender" Century="2000" CultureAMPMPlaceholder="" CultureCurrencySymbolPlaceholder="" CultureDateFormat=""  CultureTimePlaceholder="" Mask="99:99" MaskType="Time" TargetControlID="txt_eventHora" CultureDatePlaceholder="" CultureDecimalPlaceholder="" CultureThousandsPlaceholder="" />


&nbsp;<asp:TextBox ID="txt_evHora" runat="server"></asp:TextBox>
                        <asp:Label ID="lbl_evHora" runat="server" Text="hrs"></asp:Label>


</td><td>&nbsp;</td></tr><tr><td class="auto-style3">&nbsp;</td><td class="alginRight"><asp:Label ID="Label3" runat="server" Text="Turno:"></asp:Label>


</td><td><asp:DropDownList ID="ddl_turno" runat="server" DataSourceID="turnoData" DataTextField="turn_desc" DataValueField="turn_id" AppendDataBoundItems="True" CssClass="field"><asp:ListItem Value="0">Seleccione una opción</asp:ListItem>
</asp:DropDownList>


<asp:SqlDataSource ID="turnoData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_turn] WHERE ([turn_active] = @turn_active)"><SelectParameters>
<asp:Parameter DefaultValue="True" Name="turn_active" Type="Boolean" />
</SelectParameters>
</asp:SqlDataSource>


</td><td>&nbsp;</td></tr><tr><td class="auto-style3">&nbsp;</td><td class="alginRight"><asp:Label ID="Label4" runat="server" Text="Área que genera el reporte:"></asp:Label>


</td><td class="auto-style1"><asp:DropDownList ID="ddl_eventArea" runat="server" DataSourceID="areaData" DataTextField="area_name" DataValueField="area_id" AppendDataBoundItems="True" CssClass="field combobox"><asp:ListItem Value="0">Seleccione una opción</asp:ListItem>
</asp:DropDownList>
<asp:SqlDataSource ID="areaData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_areas] WHERE ([area_active] = @area_active)"><SelectParameters>
<asp:Parameter DefaultValue="True" Name="area_active" Type="Boolean" />
</SelectParameters>
</asp:SqlDataSource>

</td><td class="auto-style1"></td></tr><tr><td class="auto-style3"></td><td class="auto-style4"><asp:Label ID="Label5" runat="server" Text="Tipo de evento:"></asp:Label>
</td><td class="auto-style3">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:DropDownList ID="ddlEvents" runat="server" AutoPostBack="True" ClientIDMode="Static" DataSourceID="ev" DataTextField="event_desc" DataValueField="event_id" OnSelectedIndexChanged="ddlEvents_SelectedIndexChanged" Enabled="False" CssClass="disapear"></asp:DropDownList>
            <asp:DropDownList ID="ddlEvents2" runat="server" AutoPostBack="True" DataSourceID="ev" DataTextField="event_desc" DataValueField="event_id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            </asp:DropDownList>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="RadioButtonList1" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>





<asp:SqlDataSource ID="evChCh" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_eventTypeGrandChild] WHERE (([evGrndChild_active] = @evGrndChild_active) AND ([evChild_id] = @evChild_id))"><SelectParameters>
<asp:Parameter DefaultValue="True" Name="evGrndChild_active" Type="Boolean" />
<asp:ControlParameter ControlID="ddlEvCh" Name="evChild_id" PropertyName="SelectedValue" Type="Int32" />
</SelectParameters>
</asp:SqlDataSource>





<asp:SqlDataSource ID="evCh" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_eventTypeChild] WHERE (([evChild_active] = @evChild_active) AND ([event_id] = @event_id))"><SelectParameters>
<asp:Parameter DefaultValue="True" Name="evChild_active" Type="Boolean" />
<asp:ControlParameter ControlID="ddlEvents2" DefaultValue="0" Name="event_id" PropertyName="SelectedValue" Type="Int32" />
</SelectParameters>
</asp:SqlDataSource>





<asp:SqlDataSource ID="ev" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_eventType] WHERE (([event_active] = @event_active) AND ([gec_id] = @gec_id))"><SelectParameters>
<asp:Parameter DefaultValue="True" Name="event_active" Type="Boolean" />
<asp:ControlParameter ControlID="RadioButtonList1" DefaultValue="0" Name="gec_id" PropertyName="SelectedValue" Type="Int32" />
</SelectParameters>
</asp:SqlDataSource>





</td><td class="auto-style3"></td></tr><tr><td class="auto-style3">&nbsp;</td><td class="alginRight">&nbsp;</td><td>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate>
            <asp:DropDownList ID="ddlEvCh" runat="server" AutoPostBack="True" DataSourceID="evCh" DataTextField="evChild_name" DataValueField="evChild_id" OnSelectedIndexChanged="ddlEvCh_SelectedIndexChanged" Visible="False"><asp:ListItem Value="0">-- Seleccione una opción --</asp:ListItem></asp:DropDownList>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="evCh" DataTextField="evChild_name" DataValueField="evChild_id" Visible="False">
            </asp:DropDownList>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlEvents2" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ddlEvents" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>

<asp:UpdatePanel ID="UpdatePanel3" runat="server" Visible="False"><ContentTemplate>
<asp:DropDownList ID="ddlEvChCh" runat="server" DataSourceID="evChCh" DataTextField="evGrndChild_name" DataValueField="evGrndChild_id" Visible="False"></asp:DropDownList>
</ContentTemplate>
<Triggers>
<asp:AsyncPostBackTrigger ControlID="ddlEvCh" EventName="SelectedIndexChanged" />
</Triggers>
</asp:UpdatePanel>
</td><td>&nbsp;</td></tr><tr><td class="auto-style3">&nbsp;</td><td class="alginRight"><asp:Label ID="Label6" runat="server" Text="Clasificación del evento:"></asp:Label>
</td><td><asp:DropDownList ID="ddl_eventClasif" runat="server" AppendDataBoundItems="True" CssClass="field" DataSourceID="eventClassData" DataTextField="evClass_name" DataValueField="evClass_id"><asp:ListItem>Seleccione una opción</asp:ListItem>
</asp:DropDownList>
<asp:SqlDataSource ID="eventClassData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_eventClass] WHERE ([evClass_active] = @evClass_active)"><SelectParameters>
<asp:Parameter DefaultValue="True" Name="evClass_active" Type="Boolean" />
</SelectParameters>
</asp:SqlDataSource>
</td><td>&nbsp;</td></tr><tr><td class="auto-style3">&nbsp;</td><td class="alginRight"><asp:Label ID="Label7" runat="server" Text="Lugar del evento:"></asp:Label>
</td><td><asp:DropDownList ID="ddl_eventPlace" runat="server" DataSourceID="eventAreaData" DataTextField="evPlace_name" DataValueField="evPlace_id" AppendDataBoundItems="True" CssClass="field"><asp:ListItem>Seleccione una opción</asp:ListItem>
</asp:DropDownList>
<asp:SqlDataSource ID="eventAreaData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_eventPlace] WHERE ([evPlace_active] = @evPlace_active)"><SelectParameters>
<asp:Parameter DefaultValue="True" Name="evPlace_active" Type="Boolean" />
</SelectParameters>
</asp:SqlDataSource>
</td><td>&nbsp;</td></tr><tr><td class="auto-style4">&nbsp;</td><td class="alginRight"><asp:Label ID="Label8" runat="server" Text="Descripción del evento:"></asp:Label>
</td><td><asp:TextBox ID="txt_eventDesc" runat="server" CssClass="field" Height="50px" TextMode="MultiLine"></asp:TextBox>

<br /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_eventDesc" ErrorMessage="*Campo requerido" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
</td><td>&nbsp;</td></tr><tr><td class="auto-style2">&nbsp;</td><td colspan="2">&nbsp;</td><td>&nbsp;</td></tr></table>
            </div><!-- /.box-body -->
          </div><!-- /Box informacon general -->
        </div>
        <div class="col-md-2"></div>
        </div>
    
    <!-- Box detalle involucrados -->
    <div class="row">
    <div class="col-md-2"></div>
        <div class="col-md-8">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">2.-Información del personal involucrado en el evento</h3>
              <div class="box-tools pull-right">
                <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
              </div>
            </div>
            <div class="box-body">
              <table style="width: 100%;"><tr><td>&#160;</td><td class="alginRight"><asp:Label ID="Label9" runat="server" Text="Tipo de personal:" Font-Bold="True"></asp:Label>


</td><td>


    <asp:SqlDataSource ID="personTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_personType] WHERE ([perType_active] = @perType_active)"><SelectParameters>
<asp:Parameter DefaultValue="True" Name="perType_active" Type="Boolean" />
</SelectParameters>
</asp:SqlDataSource>
                      <asp:UpdatePanel ID="UpdatePanel12" runat="server" UpdateMode="Conditional">
                          <ContentTemplate>
                              <asp:DropDownList ID="ddl_tipoPersonal" runat="server" AppendDataBoundItems="True" CssClass="field" DataSourceID="personTypeData" DataTextField="perType_desc" DataValueField="perType_id" AutoPostBack="True" OnSelectedIndexChanged="ddl_tipoPersonal_SelectedIndexChanged">
                                  <asp:ListItem Value="0">Seleccione una opción</asp:ListItem>
                              </asp:DropDownList>
                          </ContentTemplate>
                          <Triggers>
                              <asp:AsyncPostBackTrigger ControlID="btn_addEmployee" EventName="Click" />
                          </Triggers>
                      </asp:UpdatePanel>
</td>
    <td>&#160;</td></tr>
    <tr>
        <td>&#160;</td>
        <td class="alginRight"><asp:Label ID="Label10" runat="server" Text="Clasificación del personal:" Font-Bold="True"></asp:Label></td>
        <td><asp:SqlDataSource ID="personEventClassData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_personEventClass] WHERE ([perEvClass_active] = @perEvClass_active)"><SelectParameters>
            <asp:Parameter DefaultValue="True" Name="perEvClass_active" Type="Boolean" />
            </SelectParameters>
            </asp:SqlDataSource>
            <asp:UpdatePanel ID="UpdatePanel11" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:DropDownList ID="ddl_classPersonal" runat="server" AppendDataBoundItems="True" CssClass="field" DataSourceID="personEventClassData" DataTextField="perEvClass_desc" DataValueField="perEvClass_id">
                    </asp:DropDownList>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btn_addEmployee" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </td>
        <td>&#160;</td></tr>
    <tr><td>&#160;</td>
        <td class="alginRight">
            <asp:UpdatePanel ID="UpdatePanel14" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Label ID="lbl_numEmploy" runat="server" Font-Bold="True" Text="Número de empleado:"></asp:Label>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddl_tipoPersonal" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
        </td>
        <td>
            <asp:UpdatePanel ID="UpdatePanel13" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:TextBox ID="txt_numEmployee" runat="server" CssClass="field" OnTextChanged="txt_numEmployee_TextChanged"></asp:TextBox>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddl_tipoPersonal" EventName="SelectedIndexChanged" />
                    <asp:AsyncPostBackTrigger ControlID="btn_addEmployee" EventName="Click">
                    </asp:AsyncPostBackTrigger>
                </Triggers>
            </asp:UpdatePanel>
        </td>
        <td>&#160;</td></tr>
    <tr>
        <td>&#160;</td>
        <td class="alginRight"><asp:Label ID="Label11" runat="server" Text="Nombre del involucrado:" Font-Bold="True"></asp:Label></td>
        <td>
            <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:TextBox ID="txt_nombreEmployee" runat="server" CssClass="field"></asp:TextBox>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btn_addEmployee" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </td>
        <td>&#160;</td>
    </tr>
    <tr><td>&#160;</td>
        <td class="alginRight"><asp:Label ID="Label12" runat="server" Text="Compañía:" Font-Bold="True"></asp:Label></td>
        <td>
            <asp:UpdatePanel ID="uplCompany" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:TextBox ID="txt_company" runat="server" CssClass="field"></asp:TextBox>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btn_addEmployee" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </ContentTemplate>
                <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddl_tipoPersonal" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel></td>
        <td>&#160;</td>
    </tr>
    <tr><td>&#160;</td>
        <td class="alginRight"><asp:Label ID="Label14" runat="server" Text="Antigüedad:" Font-Bold="True"></asp:Label></td>
        <td>
            <asp:UpdatePanel ID="UpdatePanel9" runat="server" UpdateMode="Conditional">
                  <ContentTemplate>
                      <asp:TextBox ID="txt_antique" runat="server" CssClass="field"></asp:TextBox>
                      <ajax:CalendarExtender ID="txt_antique_CalendarExtender" runat="server" BehaviorID="txt_antique_CalendarExtender" CssClass="MyCalendar" Format="dd/MM/yyyy" TargetControlID="txt_antique" />
                  </ContentTemplate>
                  <Triggers>
                      <asp:AsyncPostBackTrigger ControlID="btn_addEmployee" EventName="Click" />
                  </Triggers>
            </asp:UpdatePanel>
        </td>
        <td>&#160;</td>
    </tr>
    <tr><td>&#160;</td>
        <td class="alginRight"><asp:Label ID="lbl_personArea" runat="server" AssociatedControlID="ddl_personArea" Text="Área del empleado:"></asp:Label>
        </td>
        <td>
            <asp:SqlDataSource ID="personAreaData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT * FROM [tbl_personArea] WHERE ([perArea_active] = @perArea_active)"><SelectParameters>
            <asp:Parameter DefaultValue="True" Name="perArea_active" Type="Boolean" />
            </SelectParameters>
            </asp:SqlDataSource>
                      <asp:UpdatePanel ID="UpdatePanel10" runat="server">
                          <ContentTemplate>
                              <asp:DropDownList ID="ddl_personArea" runat="server" AppendDataBoundItems="True" CssClass="field" DataSourceID="personAreaData" DataTextField="perArea_name" DataValueField="perArea_id" Width="90%">
                                  <asp:ListItem Value="0">Seleccione una opción</asp:ListItem>
                              </asp:DropDownList>
                          </ContentTemplate>
                      </asp:UpdatePanel>
        </td>
        <td>&#160;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&#160;</td>
        <td>&nbsp;</td>
        <td><asp:Button ID="btn_addEmployee" runat="server" OnClick="btn_addEmployee_Click" Text="Agregar información" CssClass="btn btn-primary" /></td>
        <td>&nbsp;</td>
     </tr>
  </table>
  <br />
                <!-- Box para el grid -->
                <div class="box">
                    <div class="box-body">
                        <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
                      <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                          <ContentTemplate>
                            <asp:GridView ID="grvPersonEvent" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" CssClass="table table-bordered table-hover dataTable" DataKeyNames="perEvent_id" DataSourceID="personEventData" Font-Size="X-Small"><Columns><asp:TemplateField HeaderText="Tipo de personal" SortExpression="personType_id"><EditItemTemplate><asp:DropDownList ID="ddl_tipoPersonal" runat="server" AppendDataBoundItems="True" CssClass="field" DataSourceID="personTypeData" DataTextField="perType_desc" DataValueField="perType_id" SelectedValue='<%# Bind("personType_id") %>' Font-Size="Small" Width="100px"><asp:ListItem>Seleccione una opción</asp:ListItem></asp:DropDownList></EditItemTemplate><ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("perType_desc") %>'></asp:Label></ItemTemplate></asp:TemplateField><asp:TemplateField HeaderText="Clasificación" SortExpression="personClass_id"><EditItemTemplate><asp:DropDownList ID="ddl_classPersonal" runat="server" AppendDataBoundItems="True" CssClass="field" DataSourceID="personEventClassData" DataTextField="perEvClass_desc" DataValueField="perEvClass_id" SelectedValue='<%# Bind("personClass_id") %>' Font-Size="Small" Width="120px"><asp:ListItem Value="0">Seleccione una opción</asp:ListItem></asp:DropDownList></EditItemTemplate><ItemTemplate><asp:Label ID="Label2" runat="server" Text='<%# Bind("perEvClass_desc") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                            <asp:BoundField DataField="perEvent_company" HeaderText="Empresa" SortExpression="perEvent_company" /><asp:BoundField DataField="perEvent_name" HeaderText="Nombre" SortExpression="perEvent_name" />
                                <asp:TemplateField HeaderText="Antigüedad" SortExpression="perEvent_timeWork">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("perEvent_timeWork") %>'></asp:TextBox>
                                        <ajax:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" BehaviorID="TextBox1_CalendarExtender" TargetControlID="TextBox1" CssClass="MyCalendar" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("perEvent_timeWork") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Area" SortExpression="area_id">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddl_personArea" runat="server" CssClass="field" DataSourceID="personAreaData" DataTextField="perArea_name" DataValueField="perArea_id" Font-Size="Small" SelectedValue='<%# Bind("area_id") %>' Width="130px" AppendDataBoundItems="True">
                                            <asp:ListItem Value="0">Seleccione una opción</asp:ListItem>
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("perArea_name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="perEvent_id" HeaderText="ID" SortExpression="perEvent_id" InsertVisible="False" ReadOnly="True" Visible="False" /></Columns></asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btn_addEmployee" EventName="Click" />
                        </Triggers>
                        </asp:UpdatePanel>
                            <asp:Label ID="lbl_errPersona" runat="server" Text="*Es necesario agregar al menos una persona" ForeColor="Red" Visible="False"></asp:Label>
                      </asp:Panel>
                    </div><!-- /.box-body -->
                </div>
            </div><!-- /.box-body -->
          </div><!-- /Box detalle involucrados -->
        </div>
        <div class="col-md-2"></div>
       </div>
    
    <!-- Box acciones inmediatas -->
    <div class="row">
    <div class="col-md-2"></div>
        <div class="col-md-8">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">3.-Acciones inmediatas</h3>
                <div class="box-tools pull-right">
                    <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                </div>
              </div>

            <div class="box-body">
              <table style="width: 100%;"><tr><td></td><td style="width:40%" class="alginRight"><asp:Label ID="Label15" runat="server" Text="Nombre de la persona que realizó la acción:"></asp:Label></td><td>
                  <asp:UpdatePanel ID="UpdatePanel15" runat="server" UpdateMode="Conditional">
                      <ContentTemplate>
                          <asp:TextBox ID="txt_persona" runat="server" CssClass="field"></asp:TextBox>
                      </ContentTemplate>
                      <Triggers>
                          <asp:AsyncPostBackTrigger ControlID="btn_accion" EventName="Click" />
                      </Triggers>
                  </asp:UpdatePanel>
                  </td><td>&nbsp;&#160;</td></tr><tr><td></td><td class="alginRight"><asp:Label ID="Label16" runat="server" Text="Descripción de la acción:"></asp:Label></td><td>
                  <asp:UpdatePanel ID="UpdatePanel16" runat="server" UpdateMode="Conditional">
                      <ContentTemplate>
                          <asp:TextBox ID="txt_accion" runat="server" CssClass="field"></asp:TextBox>
                      </ContentTemplate>
                      <Triggers>
                          <asp:AsyncPostBackTrigger ControlID="btn_accion" EventName="Click" />
                      </Triggers>
                  </asp:UpdatePanel>
                  </td><td>&nbsp;&#160;</td></tr><tr><td></td><td class="alginRight"><asp:Label ID="Label17" runat="server" Text="Fecha de la acción:"></asp:Label></td><td>
                  <asp:UpdatePanel ID="uplFechaAcc" runat="server" UpdateMode="Conditional">
                      <ContentTemplate>
                          <asp:UpdatePanel ID="UpdatePanel17" runat="server" UpdateMode="Conditional">
                              <ContentTemplate>
                                  <asp:TextBox ID="txt_fechaAccion" runat="server" CssClass="field"></asp:TextBox>
                                  <ajax:CalendarExtender ID="txt_fechaAccion_CalendarExtender" runat="server" BehaviorID="txt_fechaAccion_CalendarExtender" CssClass="MyCalendar" Format="dd/MM/yyyy" TargetControlID="txt_fechaAccion" />
                              </ContentTemplate>
                              <Triggers>
                                  <asp:AsyncPostBackTrigger ControlID="btn_accion" EventName="Click" />
                              </Triggers>
                          </asp:UpdatePanel>
                      </ContentTemplate>
                      <Triggers>
                          <asp:AsyncPostBackTrigger ControlID="txt_eventFecha" EventName="TextChanged" />
                      </Triggers>
                  </asp:UpdatePanel>
                  </td><td>&nbsp;&#160;</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td></td><td>&nbsp;</td><td>
                  <asp:Button ID="btn_accion" runat="server" OnClick="btn_accion_Click" Text="Agregar Acción" CssClass="btn btn-primary" /></td><td>&nbsp;&#160;</td></tr></table>
                <br />
                <div class="box">
                    <div class="box-body">
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional"><ContentTemplate><asp:GridView ID="grvInmedActions" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataKeyNames="inAction_id" DataSourceID="actionInmedData" Font-Size="Smaller" CssClass="table table-bordered table-hover dataTable"><Columns><asp:TemplateField HeaderText="Descripción" SortExpression="inAction_desc"><EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Font-Size="Small" Text='<%# Bind("inAction_desc") %>'></asp:TextBox></EditItemTemplate><ItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Bind("inAction_desc") %>'></asp:Label></ItemTemplate></asp:TemplateField>
                            <asp:TemplateField HeaderText="Fecha de acción" SortExpression="inAction_date">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("inAction_date") %>' TextMode="Date"></asp:TextBox>
                                    <ajax:CalendarExtender ID="txt_inAction_date_Calendar" runat="server" BehaviorID="txt_inAction_date_Calendar" TargetControlID="TextBox2" CssClass="MyCalendar" Format="dd/MM/yyyy" />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("inAction_date", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Persona que realiza" SortExpression="inAction_person">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("inAction_person") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("inAction_person") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                                </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btn_accion" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <asp:Label ID="lbl_errAction" runat="server" Text="*Es necesario agregar al menos una accion" ForeColor="Red" Visible="False"></asp:Label>
                    </div>
                    <div class="box-footer">
                        <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btn_accion" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div><!-- /.box-body -->
            </div>
          </div><!-- /Box acciones inmediatas -->
            <div class="col-md-2"></div>
         </div>
        <asp:SqlDataSource ID="personEventData" runat="server" 
            ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" 
            DeleteCommand="DELETE FROM tbl_personEvent WHERE  (incident_id = @incident_id) AND (username = @username) AND (perEvent_id = @perEvent_id)" 
            SelectCommand="SELECT tbl_personEvent.perEvent_id, tbl_personEvent.perEvent_company, tbl_personEvent.perEvent_name, tbl_personEvent.perEvent_timeWork, tbl_personEvent.personType_id, tbl_personEvent.personClass_id, tbl_personEvent.incident_id, tbl_personEvent.area_id, tbl_personEvent.username, tbl_personEventClass.perEvClass_desc, tbl_personArea.perArea_name, tbl_personType.perType_desc FROM tbl_personEvent INNER JOIN tbl_personType ON tbl_personEvent.personType_id = tbl_personType.perType_id INNER JOIN tbl_personEventClass ON tbl_personEvent.personClass_id = tbl_personEventClass.perEvClass_id LEFT OUTER JOIN tbl_personArea ON tbl_personEvent.area_id = tbl_personArea.perArea_id WHERE (tbl_personEvent.username = @username) AND (tbl_personEvent.incident_id = @incident_id)" 
            UpdateCommand="UPDATE [tbl_personEvent] SET perEvent_company=@perEvent_company, perEvent_name=@perEvent_name, personType_id=@personType_id, personClass_id=@personClass_id, area_id=@area_id WHERE (incident_id = @incident_id) AND (username = @username) AND (perEvent_id = @perEvent_id)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="txt_folio" DefaultValue="0" Name="incident_id" PropertyName="Text" />
                <asp:SessionParameter DefaultValue="" Name="username" SessionField="userName" />
                <asp:Parameter Name="perEvent_id" />
            </DeleteParameters>
            <SelectParameters>
                <asp:SessionParameter Name="username" SessionField="userName" Type="String" />
                <asp:ControlParameter ControlID="txt_folio" DefaultValue="0" Name="incident_id" PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter DefaultValue="" Name="perEvent_company" />
                <asp:SessionParameter Name="username" SessionField="userName" />
                <asp:ControlParameter ControlID="txt_folio" DefaultValue="0" Name="incident_id" PropertyName="Text" />
                <asp:Parameter Name="perEvent_id" />
                <asp:Parameter Name="perEvent_name" />
                <asp:Parameter Name="personType_id" />
                <asp:Parameter Name="personClass_id" />
                <asp:Parameter Name="area_id" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="personEventFolioData" runat="server" SelectCommand="SELECT tbl_personEvent.perEvent_id, tbl_personEvent.perEvent_company, tbl_personEvent.perEvent_name, tbl_personEvent.perEvent_timeWork, tbl_personEvent.personType_id, tbl_personEvent.personClass_id, tbl_personEvent.incident_id, tbl_personEvent.area_id, tbl_personEvent.username, tbl_personEventClass.perEvClass_desc, tbl_personArea.perArea_name, tbl_personType.perType_desc FROM tbl_personEvent INNER JOIN tbl_personType ON tbl_personEvent.personType_id = tbl_personType.perType_id INNER JOIN tbl_personEventClass ON tbl_personEvent.personClass_id = tbl_personEventClass.perEvClass_id LEFT OUTER JOIN tbl_personArea ON tbl_personEvent.area_id = tbl_personArea.perArea_id WHERE (tbl_personEvent.incident_id = @incident_id)

" UpdateCommand="UPDATE [tbl_personEvent] SET perEvent_company=@perEvent_company, perEvent_name=@perEvent_name, personType_id=@personType_id, personClass_id=@personClass_id, area_id=@area_id WHERE (incident_id = @incident_id) AND (perEvent_id = @perEvent_id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txt_folio" DefaultValue="0" Name="incident_id" PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="perEvent_company" />
                <asp:Parameter Name="perEvent_name" />
                <asp:Parameter Name="personType_id" />
                <asp:Parameter Name="personClass_id" />
                <asp:Parameter Name="area_id" />
                <asp:ControlParameter ControlID="txt_folio" DefaultValue="0" Name="incident_id" PropertyName="Text" />
                <asp:Parameter Name="perEvent_id" />
            </UpdateParameters>
</asp:SqlDataSource>

        <asp:SqlDataSource ID="actionInmedData" runat="server" 
            ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" 
            DeleteCommand="DELETE FROM tbl_inmediateAction WHERE (incident_id = @incident_id) AND (username = @username) AND (inAction_id = @inAction_id)" 
            SelectCommand="SELECT inAction_id, inAction_desc, inAction_date, inAction_person, incident_id, username FROM tbl_inmediateAction WHERE (incident_id = @incident_id) AND (username = @username)" 
            UpdateCommand="UPDATE tbl_inmediateAction SET inAction_desc=@inAction_desc, inAction_person=@inAction_person WHERE ([incident_id] = @incident_id) AND ([username] = @username) AND ([inAction_id] = @inAction_id)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="txt_folio" DefaultValue="0" Name="incident_id" PropertyName="Text" />
                <asp:SessionParameter Name="username" SessionField="userName" />
                <asp:Parameter DefaultValue="" Name="inAction_id" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="txt_folio" DefaultValue="0" Name="incident_id" PropertyName="Text" Type="Int32" />
                <asp:SessionParameter Name="username" SessionField="userName" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="inAction_desc" />
                <asp:ControlParameter ControlID="txt_folio" DefaultValue="0" Name="incident_id" PropertyName="Text" />
                <asp:SessionParameter DefaultValue="" Name="username" SessionField="username" />
                <asp:Parameter Name="inAction_id" />
                <asp:Parameter Name="inAction_person" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Right">
        <asp:Label ID="lblError" runat="server"></asp:Label>
        <asp:Button runat="server" Text="Generar Reporte" ID="btn_reporte" CssClass="btn btn-primary" OnClick="btn_reporte_Click"></asp:Button>
    </asp:Panel>
    <br />
    <asp:Panel ID="Panel3" runat="server">
        <asp:Label ID="lbl_folio0" runat="server" Font-Size="X-Large" ForeColor="#3B608F" Text="Plan de acción:"></asp:Label>
        <asp:TextBox ID="txt_folio0" runat="server" AutoPostBack="True" BorderWidth="0px" Font-Size="X-Large" ForeColor="#3B608F">0</asp:TextBox>
        <br /><br />
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
                            <asp:Label ID="Label18" runat="server" Text="Comentarios adicionales"></asp:Label>
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
            <asp:Panel ID="Panel4" runat="server" style="margin-top: 0px">
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
                <asp:Label ID="Label21" runat="server" Text="Label"></asp:Label>
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
        <asp:Panel ID="Panel5" runat="server" HorizontalAlign="Right">
            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Guardar" />
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
        <asp:SqlDataSource ID="evActionsData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" DeleteCommand="DELETE FROM tbl_eventActions WHERE (evAction_id=@evAction_id)" SelectCommand="SELECT tbl_eventActions.evAction_id, tbl_eventActions.actType_id, tbl_eventActions.evAction_actions, tbl_eventActions.crtlType_id, tbl_eventActions.resp_id, tbl_eventActions.evAction_date, tbl_eventActions.evAction_closeDate, tbl_eventActions.evAction_fileEvidence, tbl_eventActions.stat_id, tbl_eventActions.incident_id, tbl_eventActions.actPlan_id, tbl_status.stat_desc, tbl_controlType.ctrlType_desc, tbl_actionType.actType_desc, tbl_userInfo.usrInfo_name FROM tbl_userInfo INNER JOIN tbl_user ON tbl_userInfo.usrInfo_id = tbl_user.usrInfo_id INNER JOIN tbl_eventActions INNER JOIN tbl_actionType ON tbl_eventActions.actType_id = tbl_actionType.actType_id INNER JOIN tbl_status ON tbl_eventActions.stat_id = tbl_status.stat_id INNER JOIN tbl_controlType ON tbl_eventActions.crtlType_id = tbl_controlType.ctrlType_id ON tbl_user.usr_id = tbl_eventActions.resp_id WHERE (tbl_eventActions.incident_id = @incident_id)" UpdateCommand="UPDATE tbl_eventActions SET evAction_fileEvidence=@evAction_fileEvidence WHERE (evAction_id=@evAction_id) AND (incident_id=@incident_id)">
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
    
    <asp:SqlDataSource ID="bitacoraData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT bitac_id, bitac_date, bitac_action, bitac_desc, bitac_module, bitac_key1, bitac_key2, usr_username FROM tbl_bitacora WHERE (bitac_key1 = @bitac_key1 AND bitac_module = 'incidenteAccidente') ORDER BY bitac_date DESC">
            <SelectParameters>
                <asp:QueryStringParameter Name="bitac_key1" QueryStringField="folio" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="col-12" >
            <asp:HiddenField ID="hdf_ok" runat="server" />
            <ajax:ModalPopupExtender ID="hdf_ok_ModalPopupExtender" runat="server" BehaviorID="hdf_ok_ModalPopupExtender" DynamicServicePath="" PopupControlID="pnl_ok" TargetControlID="hdf_ok" BackgroundCssClass="modalShadow">
            </ajax:ModalPopupExtender>
            <asp:Panel ID="pnl_ok" runat="server" CssClass="modalPanel" >
                Reporte generado no.
                <asp:Label ID="lbl_reportNum" runat="server"></asp:Label>
                <br />
                <asp:Label ID="Label19" runat="server" Text="Datos guardados correctamente"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Resources/ok.png" />
                <br />
                <br />
                <asp:Button ID="btn_ok" runat="server" Text="Ok" OnClick="btn_ok_Click" />
            </asp:Panel>
        </div>
</asp:Content>
