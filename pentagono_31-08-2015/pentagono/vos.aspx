<%@ Page Title="" Language="C#" MasterPageFile="~/pentagonoIpad.Master" AutoEventWireup="true" CodeBehind="vos.aspx.cs" Inherits="pentagono.vos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
  <h1>VOS (Vallejo Observation System)</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contenido" runat="server">

    <div style="background-color:#FEFEFE; Width:100%" class="col-12">
        <div class="box box-primary box-solid">
               <div class="box-header with-border">
                 <%--   <h3 class="box-title"><asp:Label ID="Label1" runat="server"></asp:Label>
                    </h3>--%>
                    <div class="box-tools pull-right">
                        <button class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse"><i class="fa fa-minus"></i></button>
                    </div>
                </div>
        <div class="box-body" >
            <div class="form-group col-xs-6">
                  <asp:Label ID="lblArea" runat="server" Font-Bold="True" Text="Area: "></asp:Label>
                 <b> <asp:Label ID="area_nameLabel" runat="server" Text="" /> </b>
             &nbsp;
                  <asp:Label ID="AreaId" runat="server" Text="Label"></asp:Label>
                  </div>
            <div class="form-group col-xs-6">
                  <asp:Label ID="lbl_proceso" runat="server" Font-Bold="True" Text="Proceso: "></asp:Label>
                  <asp:DropDownList ID="ddl_proc" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AppendDataBoundItems="True" DataSourceID="sds_process" DataTextField="vp_desc" DataValueField="vp_id">
                      <asp:ListItem Value="0">--Seleccione proceso--</asp:ListItem>
                  </asp:DropDownList>
                  <asp:SqlDataSource ID="sds_process" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT [vp_id], [vp_desc] FROM [tbl_vosproc] WHERE (([vp_active] = @vp_active) AND ([area_id] = @area_id))">
                      <SelectParameters>
                          <asp:Parameter DefaultValue="True" Name="vp_active" Type="Boolean" />
                          <asp:ControlParameter ControlID="AreaId" Name="area_id" PropertyName="Text" Type="Int32" />
                      </SelectParameters>
                  </asp:SqlDataSource>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="ddl_proc" ErrorMessage="Seleccione una opción" ForeColor="#CC0000" ValidationExpression="^[1-9][0-9]*$" ValidationGroup="test"></asp:RegularExpressionValidator>
             </div>
            <div class="form-group col-xs-6">
                  <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Observador:"></asp:Label>
                  <asp:TextBox ID="txt_viewer" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
             </div>
            <div class="form-group col-xs-6">
                  <asp:Label ID="lbl_fecha" runat="server" Font-Bold="True" Text="Fecha: "></asp:Label>
                  <asp:TextBox ID="txt_fecha" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
             </div>
            <div class="form-group col-xs-6">
                  <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Lugar: "></asp:Label>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_place" ErrorMessage="Verifique el formato" ForeColor="Red" ValidationExpression="^[A-Za-z 'ÑñáéíóúÁÉÍÓÚ0-9.,\n]{1,}$"></asp:RegularExpressionValidator>
                  <asp:TextBox ID="txt_place" runat="server" CssClass="form-control"></asp:TextBox>
             </div>
        </div>
        <div class="box-footer">
            <div style="overflow: auto; height:30%;  max-height :30% ; Width:100%">
               <asp:GridView ID="grv_vos" runat="server" AutoGenerateColumns="False" DataKeyNames="vp_id,b_id" DataSourceID="sds_vosDtl" CssClass="table table-borderes" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="vp_id" HeaderText="vp_id" InsertVisible="False" ReadOnly="True" SortExpression="vp_id" Visible="False" />
                    <asp:BoundField DataField="vp_desc" HeaderText="Pregunta" SortExpression="vp_desc" Visible="False" />
                    <asp:TemplateField HeaderText="Identificador" SortExpression="b_id">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("b_id") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="L1" runat="server" Text='<%# Bind("b_id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="b_name" HeaderText="Pregunta" SortExpression="b_name" />
                    <asp:TemplateField HeaderText="Observaciónes">
                        <ItemTemplate>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="OBS1" ErrorMessage="Seleccione una opción" ForeColor="Red" ValidationGroup="test"></asp:RequiredFieldValidator>
                            <asp:RadioButtonList ID="OBS1" runat="server" RepeatDirection="Horizontal" Width="100%" DataSourceID="SqlDataSource1" DataTextField="vo_desc" DataValueField="vo_id">
                                <asp:ListItem>SI</asp:ListItem>
                                <asp:ListItem Selected="True">NO</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT [vo_desc], [vo_id], [vo_active] FROM [tbl_vosobs] WHERE ([vo_active] = @vo_active)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="true" Name="vo_active" Type="Boolean" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Retroalimentación">
                        <ItemTemplate>
                            <asp:RadioButtonList ID="SI1" runat="server" RepeatDirection="Horizontal" Width="100%" Height="100%">
                                <asp:ListItem Value="1">Si</asp:ListItem>
                                <asp:ListItem Selected="True" Value="0">No</asp:ListItem>
                            </asp:RadioButtonList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Comentario">
                        <ItemTemplate>
                            <asp:TextBox ID="Comentario1" runat="server" Height="50%" Width="100%"></asp:TextBox>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Comentario1" ErrorMessage="RegularExpressionValidator" ForeColor="Red" ValidationExpression="^[A-Za-z 'ÑñáéíóúÁÉÍÓÚ0-9.,\n]{1,}$"></asp:RegularExpressionValidator>
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
            </div>
             
            
            
            
            <asp:SqlDataSource ID="sds_vosDtl" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_vosproc.vp_id, tbl_vosproc.vp_desc, tbl_behavior.b_id, tbl_behavior.b_name FROM tbl_behavior INNER JOIN tbl_vosproc ON tbl_behavior.vp_id = tbl_vosproc.vp_id WHERE (tbl_vosproc.vp_id = @vp_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_proc" DefaultValue="0" Name="vp_id" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Right">
                <asp:Button ID="btn_save" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btn_save_Click" ValidationGroup="test" />
            </asp:Panel>

        </div>
      </div>
    </div>
</asp:Content>
