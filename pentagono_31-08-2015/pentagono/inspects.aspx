<%@ Page MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/pentagonoIpad.Master" AutoEventWireup="true" CodeBehind="inspects.aspx.cs" Inherits="pentagono.inspects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    <h1>Inspección</h1>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contenido" runat="server">
    <div class="row">
        <div class="col-md-12">
           <div class="box box-primary">
               <div class="box-header with-border">
                    <asp:FormView ID="frv_inspectTitle" runat="server" DataSourceID="sds_title" Width="100%">
                        <EditItemTemplate>
                            format_codigo:
                            <asp:TextBox ID="format_codigoTextBox" runat="server" Text='<%# Bind("format_codigo") %>' />
                            <br />
                            format_name:
                            <asp:TextBox ID="format_nameTextBox" runat="server" Text='<%# Bind("format_name") %>' />
                            <br />
                            format_norma:
                            <asp:TextBox ID="format_normaTextBox" runat="server" Text='<%# Bind("format_norma") %>' />
                            <br />
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            format_codigo:
                            <asp:TextBox ID="format_codigoTextBox" runat="server" Text='<%# Bind("format_codigo") %>' />
                            <br />
                            format_name:
                            <asp:TextBox ID="format_nameTextBox" runat="server" Text='<%# Bind("format_name") %>' />
                            <br />
                            format_norma:
                            <asp:TextBox ID="format_normaTextBox" runat="server" Text='<%# Bind("format_norma") %>' />
                            <br />
                            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <div class="col-md-8">
                                <asp:Label ID="format_nameLabel" runat="server" Text='<%# Bind("format_name") %>' Font-Bold="True" />
                            </div>
                            <div class="col-md-4" style="text-align: right">
                                <asp:Label ID="Label3" runat="server" Text="18/02/2016" Font-Bold="True"></asp:Label>
                            </div>
                            <div class="col-md-8">
                                <asp:Label ID="format_normaLabel" runat="server" Text='<%# Bind("format_norma") %>' Font-Bold="True" />
                            </div>
                            <div class="col-md-4" style="text-align: right">
                                <asp:Label ID="format_codigoLabel" runat="server" Text='<%# Bind("format_codigo") %>' Font-Bold="True" />
                            </div>
                            <br />
                        </ItemTemplate>
                    </asp:FormView>
                    <asp:SqlDataSource ID="sds_title" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT format_codigo, format_name, format_norma FROM tbl_formats WHERE (format_id = @format_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="format_id" QueryStringField="formatID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            <div class="box-body">
                <div class="col-12">
                <div class="form-group col-xs-3">
                                    <asp:Label ID="lbl_area" runat="server" Font-Bold="True" Text="Area"></asp:Label>
                                    <asp:DropDownList ID="ddl_area" runat="server" DataSourceID="sds_areas" DataTextField="area_name" DataValueField="area_id" CssClass="form-control" AutoPostBack="True">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sds_areas" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT [area_id], [area_name], [area_active] FROM [tbl_areas] WHERE ([area_active] = @area_active)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="true" Name="area_active" Type="Boolean" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                    </div>
                    <div class="form-group col-xs-3">
                                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="Sub-Area"></asp:Label>
                                    <asp:DropDownList ID="ddl_areaF" runat="server" CssClass="form-control" DataSourceID="sds_areaFisica" DataTextField="areaF_name" DataValueField="areaF_id">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sds_areaFisica" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT [areaF_id], [areaF_name], [areaF_active], [area_id] FROM [tbl_areasFisicas] WHERE (([areaF_active] = @areaF_active) AND ([area_id] = @area_id))">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="True" Name="areaF_active" Type="Boolean" />
                                            <asp:ControlParameter ControlID="ddl_area" Name="area_id" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                      </div>
                <div class="form-group col-xs-3" style="min-height:60px;">
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Integrante de CSH"></asp:Label>
                                    <asp:Label ID="lbl_user" runat="server"></asp:Label>
                    </div>
                <div class="form-group col-xs-3" style="min-height:60px;">
                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Supervisor:"></asp:Label>
                                    <asp:DropDownList ID="ddl_supervisor" runat="server" DataSourceID="sds_users" DataTextField="usrInfo_name" DataValueField="usr_username" AppendDataBoundItems="True" CssClass="form-control">
                                        <asp:ListItem>-Seleccione supervisor -</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="sds_users" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT tbl_user.usr_username, tbl_userInfo.usrInfo_name FROM tbl_user INNER JOIN tbl_userInfo ON tbl_user.usrInfo_id = tbl_userInfo.usrInfo_id WHERE tbl_user.usr_active=1"></asp:SqlDataSource>
                                </div>
                <div class="form-group col-xs-3" style="min-height:60px;">
                                    <asp:Label ID="lbl_lblfecha" runat="server" Font-Bold="True" Text="Fecha:"></asp:Label>
                                    <asp:Label ID="lbl_fecha" runat="server"></asp:Label>
                                </div>
                <div class="form-group col-xs-3" style="min-height:60px;">
                    <asp:Label ID="lbl_numEmpleados" runat="server" Font-Bold="True" Text="Número de Empleados:"></asp:Label>
                    <asp:TextBox ID="txt_numEmpleados" runat="server" CssClass="form-control" TextMode="Number">0</asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_numEmpleados" ErrorMessage="Campo requerido" ForeColor="Red" ValidationGroup="iniciar"></asp:RequiredFieldValidator>
                                </div>
                <div class="form-group col-xs-3" style="min-height:60px;"><asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Recorrido de verificación:"></asp:Label>
                                    <asp:RadioButtonList ID="rbl_recorrido" runat="server" DataSourceID="sds_recor" DataTextField="recor_desc" DataValueField="recor_id" RepeatDirection="Horizontal">
                                    </asp:RadioButtonList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rbl_recorrido" ErrorMessage="Debe elegir el tipo de recorrido" ForeColor="Red" ValidationGroup="iniciar"></asp:RequiredFieldValidator>
                                    <asp:SqlDataSource ID="sds_recor" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT [recor_id], [recor_desc], [recor_active] FROM [tbl_recorType] WHERE ([recor_active] = @recor_active)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="True" Name="recor_active" Type="Boolean" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                <div class="form-group col-xs-3" style="min-height:60px;">
                                    <asp:Label ID="lbl_lblinicio" runat="server" Font-Bold="True" Text="Inicio:"></asp:Label>
                                    <asp:Label ID="lbl_inicio" runat="server"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="lbl_lblinicio0" runat="server" Font-Bold="True" Text="Fin:"></asp:Label>
                                    <asp:Label ID="lbl_fin" runat="server"></asp:Label>
                                </div>
                </div>
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="grv_inspectDtl" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover dataTable" DataKeyNames="aspect_id" DataSourceID="sds_inspect" role="grid" OnPageIndexChanging="grv_inspectDtl_PageIndexChanging" Font-Size="Large">
                                <Columns>
                                    <asp:TemplateField HeaderText="aspect_id" InsertVisible="False" SortExpression="aspect_id" Visible="False">
                                        <EditItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("aspect_id") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("aspect_id") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Item" SortExpression="aspect_sec" Visible="False">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("aspect_sec") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("aspect_sec") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="aspect_element" HeaderText="Elemento" SortExpression="aspect_element">
                                    <HeaderStyle Width="100px" />
                                    <ItemStyle Width="20%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="aspect_review" HeaderText="Forma de revisar" SortExpression="aspect_review" >
                                    <HeaderStyle Width="400px" />
                                    <ItemStyle Width="60%" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Satisfactorio">
                                        <ItemTemplate>
                                            <asp:RadioButton ID="rdb_cumple" runat="server" AutoPostBack="True" GroupName='<%# Eval("aspect_id") %>' OnCheckedChanged="RadioButton1_CheckedChanged" Text="Si" Checked="True" TextAlign="Left" />
                                            <asp:RadioButton ID="rdb_nocumple" runat="server" AutoPostBack="True" GroupName='<%# Eval("aspect_id") %>' OnCheckedChanged="RadioButton2_CheckedChanged" Text="No" TextAlign="Left" />
                                            <asp:RadioButton ID="rdb_na" runat="server" AutoPostBack="false" GroupName='<%# Eval("aspect_id") %>' Text="N/A" TextAlign="Left" />       
                                            <br />
                                        </ItemTemplate>
                                        <ItemStyle Width="13%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Observaciones">
                                        <ItemTemplate>
                                            <asp:UpdatePanel ID="upp_evidencia" runat="server" Visible="True">
                                                <ContentTemplate>
                                                    <asp:TextBox ID="txt_evidencia" runat="server" Rows="2" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                                        <ContentTemplate>
                                                            <asp:FileUpload ID="fup_evidence" runat="server" Font-Size="Small" Width="100px" onChange="UploadFile(this,this.id)" />
                                                            <asp:Button ID="btn_cargaImagen" runat="server" OnClick="btn_cargaImagen_Click" Text="carga imagen" Font-Size="Small" Style="display: none" />
                                                            <asp:HyperLink ID="hpl_evidencia" runat="server" Target="_blank">[hpl_evidencia]</asp:HyperLink>
                                                            <asp:TextBox ID="txt_file" runat="server" Visible="False"></asp:TextBox>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </ItemTemplate>
                                        <ItemStyle Width="10%" />
                                    </asp:TemplateField>
                                </Columns>
                                <PagerSettings Mode="NextPrevious" NextPageImageUrl="~/Resources/nextArrow_32px.png" PreviousPageImageUrl="~/Resources/prevArrow_32px.png" />
                                <PagerStyle BackColor="#3366FF" BorderColor="#3399FF" BorderStyle="Dashed" BorderWidth="1px" Font-Bold="True" Font-Overline="False" ForeColor="#CCCCCC" />
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="grv_inspectDtl" EventName="PageIndexChanging" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:SqlDataSource ID="sds_inspect" runat="server" ConnectionString="<%$ ConnectionStrings:pentagonov2ConnectionString %>" SelectCommand="SELECT format_id, aspect_element, aspect_review, aspect_sec, aspect_active, aspect_id FROM tbl_aspect WHERE (aspect_active = @aspect_active) AND (format_id = @format_id) ORDER BY aspect_sec">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="True" Name="aspect_active" Type="Boolean" />
                            <asp:QueryStringParameter DefaultValue="" Name="format_id" QueryStringField="formatID" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:Panel>
            </div>
            <div class="box-footer">
                <asp:Panel ID="Panel2" runat="server">
                     <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click1" Text="Iniciar" ValidationGroup="iniciar" />
                     <asp:Button ID="btn_end" runat="server" CssClass="btn btn-primary" OnClick="btn_end_Click" Text="Finalizar" Visible="False" ValidationGroup="fin" />
                     <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Button" Visible="False" />
                </asp:Panel>
                <asp:UpdatePanel ID="udp_botons" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
          </div>
        </div>
    </div>
    <script type="text/javascript">
    function UploadFile(fileUpload,iden) {
        if (fileUpload.value != '') {
            var btn = document.getElementById(iden).nextElementSibling;
            //alert(btn.nodeValue);
            document.getElementById(btn.id).click();
        }
    }
</script>
</asp:Content>
