<%@ Page Title="" Language="C#" MasterPageFile="~/pentago_theme.Master" AutoEventWireup="true" CodeBehind="Acciones-vos.aspx.cs" Inherits="pentagono.Acciones_vos" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    <h3><asp:Label ID="Label1" runat="server" Text="Acciones Correctivas Vos"></asp:Label></h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contenido" runat="server">



        <div style="overflow: auto; height:30%;  max-height :30% ; Width:100%">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="area_id,v_id,Expr2,vp_id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="No° Vos" InsertVisible="False" SortExpression="v_id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("v_id") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="V_ID1" runat="server" Text='<%# Bind("v_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="area_id" HeaderText="area_id" InsertVisible="False" ReadOnly="True" SortExpression="area_id" Visible="False" />
                <asp:BoundField DataField="area_name" HeaderText="Area" SortExpression="area_name" />
                <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" Visible="False" />
                <asp:BoundField DataField="usr_id" HeaderText="usr_id" SortExpression="usr_id" Visible="False" />
                <asp:BoundField DataField="v_date" HeaderText="Fecha" SortExpression="v_date" />
                <asp:BoundField DataField="v_place" HeaderText="Lugar" SortExpression="v_place" />
                <asp:BoundField DataField="Expr2" HeaderText="Expr2" ReadOnly="True" SortExpression="Expr2" Visible="False" />
                <asp:BoundField DataField="usr_username" HeaderText="Usuario" SortExpression="usr_username" />
                <asp:BoundField DataField="vp_id" HeaderText="vp_id" InsertVisible="False" ReadOnly="True" SortExpression="vp_id" Visible="False" />
                <asp:BoundField DataField="vp_desc" HeaderText="Proceso" SortExpression="vp_desc" />
                <asp:TemplateField HeaderText="Acción">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Nueva</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Detalle">
                    <ItemTemplate>
                        <asp:LinkButton ID="Detalle" runat="server" OnClick="Detalle_Click">Detalle</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_areas.area_id, tbl_areas.area_name, tbl_vos.v_id, tbl_vos.area_id AS Expr1, tbl_vos.usr_id, tbl_vos.v_date, tbl_vos.v_place, tbl_user.usr_id AS Expr2, tbl_user.usr_username, tbl_vosproc.vp_id, tbl_vosproc.vp_desc FROM tbl_areas INNER JOIN tbl_vos ON tbl_areas.area_id = tbl_vos.area_id INNER JOIN tbl_user ON tbl_vos.usr_id = tbl_user.usr_id INNER JOIN tbl_vosproc ON tbl_vos.vp_id = tbl_vosproc.vp_id  order by tbl_vos.v_id Desc">
        </asp:SqlDataSource>
        </div>
    
  
                 
                        <asp:Panel ID="Panel1" runat="server" Visible="False">   <%--panel ojo--%>
                            <div class="box box-primary">
                                <div class="box-header">
                                    <h3 class="box-title"><b>Acciones</b></h3>
                                    <div class="box-tools pull-right">
                                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                                            <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    &nbsp;&nbsp;
                                    <br />
                                   <h3 class="box-title"><b>No° Vos:</b></h3>
                                    &nbsp;&nbsp;
                                    <b><asp:Label ID="vosID" runat="server" Text="Label"></asp:Label>
                                    <br />
                                    </b>
                                    <asp:Label ID="AcPlan" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div class="box-body">
                                    <table style="width:100%;">
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>
                                                <asp:Label ID="lbl_tipoAccion" runat="server" Text="Tipo de Acción:" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddl_actType" runat="server" AppendDataBoundItems="True" CssClass="field" DataSourceID="actionTypeData" DataTextField="actType_desc" DataValueField="actType_id">
                                                    <asp:ListItem Value="0">Seleccione una opción</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="ddl_actType" ErrorMessage="seleccione un elemento" ForeColor="Red" ValidationExpression="^[1-9][0-9]*$" ValidationGroup="NAccion"></asp:RegularExpressionValidator>
                                                <asp:SqlDataSource ID="actionTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT actType_id, actType_desc, actType_active FROM tbl_actionType WHERE (actType_active = @actType_active)">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="True" Name="actType_active" Type="Boolean"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>
                                                <asp:Label ID="lbl_acciones" runat="server" Text="Acciones:" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_acciones" runat="server" CssClass="field" Height="53px" TextMode="MultiLine"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_acciones" ErrorMessage="verifique el formato del campo " ForeColor="Red" ValidationExpression="^[A-Za-z 'ÑñáéíóúÁÉÍÓÚ0-9.,\n]{1,}$" ValidationGroup="NAccion"></asp:RegularExpressionValidator>
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>
                                                <asp:Label ID="lbl_tipoControl" runat="server" Text="Tipo de control:" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddl_ctrlType" runat="server" AppendDataBoundItems="True" CssClass="field" DataSourceID="controlTypeData" DataTextField="ctrlType_desc" DataValueField="ctrlType_id">
                                                    <asp:ListItem Value="0">Seleccione una opción</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="controlTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT ctrlType_id, ctrlType_desc, ctrlType_active FROM tbl_controlType WHERE (ctrlType_active = @ctrlType_active)">
                                                    <SelectParameters>
                                                        <asp:Parameter DefaultValue="True" Name="ctrlType_active" Type="String"></asp:Parameter>
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="ddl_ctrlType" ErrorMessage="seleccione un elemento" ForeColor="Red" ValidationExpression="^[1-9][0-9]*$" ValidationGroup="NAccion"></asp:RegularExpressionValidator>
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>
                                                <asp:Label ID="lbl_responsable" runat="server" Text="Responasble:" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddl_resp" runat="server" AppendDataBoundItems="True" CssClass="field" DataSourceID="responsData" DataTextField="usrInfo_name" DataValueField="usrInfo_id">
                                                    <asp:ListItem Value="0">Seleccione una opción</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="responsData" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_userInfo.usrInfo_id, tbl_userInfo.usrInfo_name, tbl_user.usr_id FROM tbl_user INNER JOIN tbl_userInfo ON tbl_user.usrInfo_id = tbl_userInfo.usrInfo_id WHERE (tbl_user.rol_id &gt; 1)"></asp:SqlDataSource>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="ddl_resp" ErrorMessage="seleccione un elemento" ForeColor="Red" ValidationExpression="^[1-9][0-9]*$" ValidationGroup="NAccion"></asp:RegularExpressionValidator>
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>
                                                <asp:Label ID="lbl_fechaComp" runat="server" Text="Fecha compromiso:" Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txt_fechaComp" runat="server"></asp:TextBox>
                                                <cc1:CalendarExtender ID="txt_fechaComp_CalendarExtender" runat="server" BehaviorID="txt_fechaComp_CalendarExtender" CssClass="MyCalendar" Format="dd/MM/yyyy" TargetControlID="txt_fechaComp">
                                                </cc1:CalendarExtender>
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1"></td>
                                            <td class="auto-style1"></td>
                                            <td class="auto-style1">
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txt_fechaComp" ErrorMessage="verifique el formato del campo " ForeColor="Red" ValidationExpression="^\d{2}/\d{2}/\d{4}$" ValidationGroup="NAccion"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_fechaComp" ErrorMessage="favor de ingresar el dato" ForeColor="Red" ValidationGroup="NAccion"></asp:RequiredFieldValidator>
                                            </td>
                                            <td class="auto-style1"></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                            <td>
                                                <asp:Button ID="btn_save" runat="server" CssClass="btn btn-primary" OnClick="btn_save_Click" Text="Agregar acción" ValidationGroup="NAccion" />
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="box-footer">
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_eventActions.evAction_id, tbl_eventActions.actType_id, tbl_eventActions.evAction_actions, tbl_eventActions.crtlType_id, tbl_eventActions.resp_id, tbl_eventActions.evAction_date, tbl_eventActions.evAction_closeDate, tbl_eventActions.evAction_fileEvidence, tbl_eventActions.stat_id, tbl_eventActions.incident_id, tbl_eventActions.actPlan_id, tbl_eventActions.usr_username, tbl_eventActions.key1, tbl_actionType.actType_desc, tbl_actionType.actType_id AS Expr1, tbl_user.usr_id, tbl_user.usr_username AS Expr2 FROM tbl_eventActions INNER JOIN tbl_actionType ON tbl_eventActions.actType_id = tbl_actionType.actType_id INNER JOIN tbl_user ON tbl_eventActions.resp_id = tbl_user.usr_id WHERE (tbl_eventActions.actPlan_id = @ActPlan)
ORDER BY tbl_eventActions.evAction_id Desc">
                                        <SelectParameters>
                                            <asp:Parameter Name="ActPlan" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </div>
                        </asp:Panel>
           

    <p></p>
 
     <div style="overflow: auto; height:30%;  max-height :30% ; Width:100%">
       <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="evAction_id,Expr1,usr_id" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="30%" Width="100%">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="evAction_id" HeaderText="No Acción" InsertVisible="False" ReadOnly="True" SortExpression="evAction_id" />
            <asp:BoundField DataField="actType_id" HeaderText="actType_id" SortExpression="actType_id" Visible="False" />
            <asp:BoundField DataField="evAction_actions" HeaderText="Acción" SortExpression="evAction_actions" />
            <asp:BoundField DataField="crtlType_id" HeaderText="crtlType_id" SortExpression="crtlType_id" Visible="False" />
            <asp:BoundField DataField="resp_id" HeaderText="resp_id" SortExpression="resp_id" Visible="False" />
            <asp:BoundField DataField="actType_desc" HeaderText="Tipo Acción" SortExpression="actType_desc" />
            <asp:BoundField DataField="evAction_date" HeaderText="Acción" SortExpression="evAction_date" />
            <asp:BoundField DataField="evAction_closeDate" HeaderText="Cierre Acción" SortExpression="evAction_closeDate" />
            <asp:BoundField DataField="evAction_fileEvidence" HeaderText="evAction_fileEvidence" SortExpression="evAction_fileEvidence" Visible="False" />
            <asp:BoundField DataField="stat_id" HeaderText="est" SortExpression="stat_id" Visible="False" />
            <asp:BoundField DataField="incident_id" HeaderText="incident_id" SortExpression="incident_id" Visible="False" />
            <asp:BoundField DataField="actPlan_id" HeaderText="actPlan_id" SortExpression="actPlan_id" Visible="False" />
            <asp:BoundField DataField="usr_username" HeaderText="Responsable-1" SortExpression="usr_username" Visible="False" />
            <asp:BoundField DataField="key1" HeaderText="key1" SortExpression="key1" Visible="False" />
            <asp:BoundField DataField="Expr1" HeaderText="Expr1" InsertVisible="False" ReadOnly="True" SortExpression="Expr1" Visible="False" />
            <asp:BoundField DataField="usr_id" HeaderText="usr_id" ReadOnly="True" SortExpression="usr_id" Visible="False" />
            <asp:BoundField DataField="Expr2" HeaderText="Responsable" SortExpression="Expr2" />
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
      </div>

        &nbsp;
</asp:Content>
