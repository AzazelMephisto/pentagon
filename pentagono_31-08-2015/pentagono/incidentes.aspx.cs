using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pentagono.DataSet1TableAdapters;
using pent;

namespace pentagono
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        private funciones f = new funciones();
        private string eventID="";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                lblFechaReporte.Text = String.Format("{0:dd/MM/yyyy}",Convert.ToString(DateTime.Today));
                if (Session["userID"] == null)
                {
                    Response.Redirect("login.aspx?pag=incidentes");
                }
                txt_eventFecha_CalendarExtender.EndDate = DateTime.Today;
                txt_fechaAccion_CalendarExtender.StartDate = DateTime.Today;
                tbl_personEventTableAdapter perEvent = new tbl_personEventTableAdapter();
                tbl_inmediateActionTableAdapter inAction = new tbl_inmediateActionTableAdapter();

                perEvent.DeleteTempQuery(Session["userName"].ToString(),0);

                inAction.DeleteTempQuery(Session["userName"].ToString(),0);

                if (Request.QueryString["folio"] == null)
                {
                    txt_folio.Text = "0";
                    btn_reporte.Text = "Generar Reporte";
                    txt_evHora.Visible = false;
                    //if (Convert.ToInt32(Session["userRol"]) > 3)
                    //{
                        Panel3.Visible = false;
                    //}
                }
                else
                {
                    txt_folio.Text = Convert.ToString(Request.QueryString["folio"]);
                    txt_eventHora.Visible = false;
                    cargaIncidente(Convert.ToInt32(Request.QueryString["folio"]));
                    btn_reporte.Text = "Actualizar reporte";
                    Panel3.Visible = false;
                    pnl_ok.Visible = false;
                }
            }
            
        }
        private void generaActualizaReporte()
        {
            if(grvPersonEvent.EditIndex != -1)
            {
                //lblError.Text ="Sorre";
            }
            //creamos la instancia para la tabla extraida del dataset XSD
            tbl_incidentTableAdapter incidentes = new tbl_incidentTableAdapter();
            if (grvPersonEvent.Rows.Count > 0 && grvInmedActions.Rows.Count > 0)
            {
                btn_reporte.Enabled = true;

                try
                {
                    lbl_errAction.Visible = false;
                    lbl_errPersona.Visible = false;
                    string descriptEvento = txt_eventDesc.Text;
                    DateTime fechaEvento = Convert.ToDateTime(txt_eventFecha.Text);
                    int turnoEvento = Convert.ToInt32(ddl_turno.SelectedValue);
                    int areaEvento = Convert.ToInt32(ddl_eventArea.SelectedValue);
                    int tipoEvento = Convert.ToInt32(ddlEvents2.SelectedValue);
                    int placeEvento = Convert.ToInt32(ddl_eventPlace.SelectedValue);
                    int tipoEventoHijo = 0;
                    int gec = 0;
                    int tipoEventoHijoHijo = 0;
                    decimal serie = Convert.ToDecimal(generateSerial());
                    //string a = System.Configuration.ConfigurationManager.ConnectionStrings["WingtipToys"].ConnectionString;
                    if (!(DropDownList2.Visible == false || ddlEvCh.SelectedValue == "")) { tipoEventoHijo = Convert.ToInt32(DropDownList2.SelectedValue); }
                    if (!(ddlEvChCh.Visible == false || ddlEvCh.SelectedValue == "")) { tipoEventoHijoHijo = Convert.ToInt32(ddlEvCh.SelectedValue); }
                    if (RadioButtonList1.SelectedIndex == -1) { gec = 0; } else { gec = Convert.ToInt32(RadioButtonList1.SelectedValue); }
                    //mail(0, ddl_eventArea.SelectedItem.Text, ddl_eventClasif.SelectedItem.Text, txt_eventDesc.Text, txt_eventFecha.Text, "Revisión", Session["userName"].ToString(), 5);
                    if ((txt_folio.Text == "0") || txt_folio.Text == "")
                    {
                        //metodo para insertar la información. De momento se toma todo tal cual de los campos
                        int resIncident = incidentes.Insert(descriptEvento, fechaEvento, turnoEvento,
                               areaEvento, tipoEvento, tipoEventoHijo, 0, placeEvento,
                               serie, 6, gec, Convert.ToInt32(ddl_eventClasif.SelectedValue), Convert.ToInt32(Session["userID"]), DateTime.Now, TimeSpan.Parse(txt_eventHora.Text),Convert.ToString(Session["userName"]));

                        int incid_id = Convert.ToInt32(incidentes.getIncidentIDBySerial(serie));

                        tbl_personEventTableAdapter employeeEvent = new tbl_personEventTableAdapter();
                        int resEmploy = employeeEvent.UpdateIncidID(incid_id, Convert.ToString(Session["userName"]));
                        //employeeEvent.DeleteTempQuery(Convert.ToString(Session["userName"]), incid_id);
                        tbl_inmediateActionTableAdapter actions = new tbl_inmediateActionTableAdapter();
                        int resActions = actions.UpdateIncidID(incid_id, Convert.ToString(Session["userName"]));
                        //actions.DeleteTempQuery(Convert.ToString(Session["userName"]), incid_id);
                        tbl_bitacoraTableAdapter bitac = new tbl_bitacoraTableAdapter();
                        bitac.Insert(DateTime.Now, "reporte creado", "", "incidenteAccidente", incid_id,0, Convert.ToString(Session["userName"]));
                        bitac.Dispose();
                        //apartado de parametros que conforman el correo electrónico que se despliega
                        //******Descmentar para el servicio de correo electrónico********
                        //mail(incid_id, ddl_eventArea.SelectedItem.Text, ddl_eventClasif.SelectedItem.Text, txt_eventDesc.Text, txt_eventFecha.Text, "Revisión", Session["userName"].ToString(), Convert.ToInt32( ddl_eventArea.SelectedValue));
                        //enviarCorreo(incid_id);
                        //****** fin de correo electronico ****
                        lbl_reportNum.Text = incid_id.ToString();
                    }
                    else
                    {
                        int folio = Convert.ToInt32(txt_folio.Text);
                        int resIncident = incidentes.Update(descriptEvento, fechaEvento, turnoEvento, areaEvento, 
                            tipoEvento, tipoEventoHijo, 0, placeEvento, serie, 6, gec, Convert.ToInt32(ddl_eventClasif.SelectedValue),
                            Convert.ToInt32(Session["userID"]), Convert.ToDateTime(lblFechaReporte.Text), TimeSpan.Parse(txt_evHora.Text), Convert.ToString(Session["userName"]), folio);
                        mail(folio, ddl_eventArea.SelectedItem.Text, ddl_eventClasif.SelectedItem.Text, txt_eventDesc.Text, txt_eventFecha.Text, "Revisión", Session["userName"].ToString(), Convert.ToInt32(ddl_eventArea.SelectedValue));
                        //correoUpdateReport(folio);
                        tbl_bitacoraTableAdapter bitac = new tbl_bitacoraTableAdapter();
                        bitac.Insert(DateTime.Now, "Actualización de reporte", "", "incidenteAccidente", folio,0, Convert.ToString(Session["userName"]));
                        bitac.Dispose();
                        Response.Redirect("my-reports.aspx");
                    }
                    hdf_ok_ModalPopupExtender.Show();
                    //una vez generado el registro de incidente vamos a buscar el ID para relacionar empleados y acciones inmediatas
                    //int incid_id = Convert.ToInt32(incidentes.GetIDByFolio(Convert.ToInt32(serie)).Rows[0][0]);
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                    incidentes.Dispose();
                }
            }
            else
            {
                //Label20.Text = "Es necesario agregar acciones y los involucrados";
                // HttpContext.Current.Response.Write("Es necesario agregar acciones y los involucrados");
                if (grvPersonEvent.Rows.Count == 0)
                {
                    lbl_errPersona.Visible = true;
                }
                else if (grv_acciones.Rows.Count == 0)
                {
                    lbl_errAction.Visible = true;
                }
            }
        }

        protected void btn_addEmployee_Click(object sender, EventArgs e)
        {
            addPersonTemporal();
            txt_numEmployee.Text = "";
            txt_nombreEmployee.Text = "";
            txt_antique.Text = "";
            txt_company.Text = "";
            ddl_eventArea.SelectedValue = "0";
            ddl_tipoPersonal.SelectedValue = "0";
            ddl_personArea.SelectedValue = "0";
            grvPersonEvent.DataBind();

            if (grvPersonEvent.Rows.Count > 0 && grvInmedActions.Rows.Count > 0)
            {
                btn_reporte.Enabled = true;
            }
        }

        protected void btn_accion_Click(object sender, EventArgs e)
        {
            addActionsTemporal();
            txt_fechaAccion.Text = "";
            txt_accion.Text = "";
            txt_persona.Text ="";
            grvInmedActions.DataBind();
            if (grvPersonEvent.Rows.Count > 0 && grvInmedActions.Rows.Count > 0)
            {
                btn_reporte.Enabled = true;
            }
        }

        protected void grv_emplroyee_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void grv_actions_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        private string generateSerial()
        {
            string serie="0";
            if (Session["serial"] == null)
            {
                int ano, mes, dia, hora, minuto, segundo;
                ano = DateTime.Now.Year;
                mes = DateTime.Now.Month;
                dia = DateTime.Now.Day;
                hora = DateTime.Now.Hour;
                minuto = DateTime.Now.Minute;
                segundo = DateTime.Now.Second;

                serie = ano + "" + mes + "" + dia + "" + hora + "" + minuto + "" + segundo;
                Session["serial"]=serie;
            }
            else
            {
                serie = Convert.ToString(Session["serial"]);
            }
            return serie;
        }

        protected void txt_numEmployee_TextChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(txt_numEmployee.Text))
            {
                    tbl_userInfoTableAdapter userInfo = new tbl_userInfoTableAdapter();
                    DataSet1.tbl_userInfoDataTable dtInfo = new DataSet1.tbl_userInfoDataTable();
                    decimal numEmpleado = Convert.ToDecimal(txt_numEmployee.Text);
                    userInfo.FillByNoEmpleado(dtInfo, numEmpleado);
                    if (dtInfo.Rows.Count != 0)
                    {
                        txt_nombreEmployee.Text = Convert.ToString(userInfo.GetDataByNoEmpleado(numEmpleado).Rows[0]["usrInfo_name"]);
                        txt_company.Text = Convert.ToString(userInfo.GetDataByNoEmpleado(numEmpleado).Rows[0]["usrInfo_company"]);
                        txt_antique.Text = Convert.ToString(userInfo.GetDataByNoEmpleado(numEmpleado).Rows[0]["usrInfo_antique"]);
                        ddl_personArea.SelectedValue = Convert.ToString(userInfo.GetDataByNoEmpleado(numEmpleado).Rows[0]["perArea_id"]);
                    }
            }
        }

        private void enviarCorreo(int incid_id)
        {
            string bodytext;
            bodytext = "\nPor medio del presente se notifica que ha ocurrido un accidente no." + incid_id + " \n";
            bodytext = bodytext + "\nArea: " + ddl_eventArea.SelectedItem.Text + "\n";
            bodytext = bodytext + "Clasificación del Incidente: " + ddl_eventClasif.SelectedItem.Text.ToString() + "\n";
            bodytext = bodytext + "Clasificación del Incidente: " + txt_eventDesc.Text + "\n";
            bodytext = bodytext + "\nFecha del evento (formato aaaa-mm-dd): " + txt_eventFecha.Text.ToString() + "";
            bodytext = bodytext + "\n Área funcional: " + ddl_eventArea.SelectedItem.Text.ToString() + "";
            bodytext = bodytext + "\n Creador del reporte: " + Convert.ToString(Session["userName"]) + "";
            bodytext = bodytext + "\nPara más información, favor de consultar la siguiente liga. \n http://10.240.151.139/pentagono/incidDetail.aspx?folio=" + incid_id + "\n";

            //string to = Convert.ToString(usrInfoTable.Rows[0]["usrInfo_email"]) + ";";
            string[] correos; // = {""};
            correos = new string[2];
            //correos = new string[1];
            correos[0] = Convert.ToString(Session["email"]);
            correos[1] = getEmail(getResponsable(Convert.ToInt32(Session["userID"])));

            try
            {
                lblError.Text = f.enviarCorreoAsync("Fernando Reyes", correos, " ", bodytext, "Generación de reporte accidente incidente folio " + incid_id);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void ddlEvents_SelectedIndexChanged(object sender, EventArgs e)
        {
            tbl_eventTypeChildTableAdapter evTyCh = new tbl_eventTypeChildTableAdapter();
            int hasChild = Convert.ToInt32(evTyCh.getEventChildByEventType(Convert.ToInt32(ddlEvents.SelectedValue)));

            if (hasChild == 0)
            {
                ddlEvCh.Visible = false;
                ddlEvChCh.Visible = false;
            }
            else {
                ddlEvCh.Visible = true;
            }
            ddlEvChCh.DataBind();
            evTyCh.Dispose();
        }

        protected void ddlEvCh_SelectedIndexChanged(object sender, EventArgs e)
        {
            tbl_eventTypeGrandChildTableAdapter evTyChCh = new tbl_eventTypeGrandChildTableAdapter();
            int hasChild = Convert.ToInt32(evTyChCh.getEventChildByEventType(Convert.ToInt32(ddlEvCh.SelectedValue)));

            if (hasChild == 0)
            {
                ddlEvChCh.Visible = false;
            }
            else
            {
                ddlEvChCh.Visible = true;
            }
            evTyChCh.Dispose();
        }

        private string getEmail(int userID)
        {
            tbl_userTableAdapter users = new tbl_userTableAdapter();
            int userInfo = Convert.ToInt32(users.getUsrInfo(userID));
            tbl_userInfoTableAdapter usrInfo = new tbl_userInfoTableAdapter();
            DataSet1.tbl_userInfoDataTable dtUsrInfo = new DataSet1.tbl_userInfoDataTable();
            usrInfo.FillByUserID(dtUsrInfo, userInfo);
            string correo = Convert.ToString(dtUsrInfo.Rows[0]["usrInfo_email"]);
            users.Dispose();
            usrInfo.Dispose();
            dtUsrInfo.Dispose();
            return correo;
        }

        private int getEstatus(int incidentID)
        {
            int status = 0;
            tbl_incidentTableAdapter incid = new tbl_incidentTableAdapter();
            status = Convert.ToInt32(incid.getStatus(Convert.ToInt32( incidentID)));
            incid.Dispose();

            return status;
        }

        private int getResponsable(int userID)
        {
            tbl_userTableAdapter users = new tbl_userTableAdapter();
            int respID = Convert.ToInt32(users.respIDByUserID(Convert.ToInt32(userID)));
            users.Dispose();
            return respID;
        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlEvCh.Visible = false;
            ddlEvChCh.Visible = false;
        }

        protected void addPersonTemporal()
        {
            tbl_personEventTableAdapter persona = new tbl_personEventTableAdapter();
            int tipo,clase,area, noEmpleado;
            string company, nombre, tiempo;
            tipo=Convert.ToInt32(ddl_tipoPersonal.SelectedValue);
            clase = Convert.ToInt32(ddl_classPersonal.SelectedValue);
            area=Convert.ToInt32(ddl_personArea.SelectedValue);
            if (String.IsNullOrEmpty(txt_numEmployee.Text)) { noEmpleado = 0; } else { noEmpleado = Convert.ToInt32(txt_numEmployee.Text); }
            company = txt_company.Text;
            nombre = txt_nombreEmployee.Text;
            tiempo = txt_antique.Text;
            int folio = Convert.ToInt32(txt_folio.Text);
            persona.Insert(company, nombre, tiempo, tipo, clase, folio, area, Convert.ToString(Session["userName"]), noEmpleado);
            
            persona.Dispose();
        }

        protected void addActionsTemporal()
        {
            tbl_inmediateActionTableAdapter action = new tbl_inmediateActionTableAdapter();
            string persona, inAction;
            DateTime fechaAc;
            persona = txt_persona.Text;
            inAction = txt_accion.Text;
            fechaAc = Convert.ToDateTime( txt_fechaAccion.Text);
            int folio = Convert.ToInt32(txt_folio.Text);
            action.Insert(inAction, fechaAc, persona, folio, Convert.ToString(Session["userName"]));
        
            action.Dispose();
        }

        protected void btn_ok_Click(object sender, EventArgs e)
        {
            Response.Redirect("my-reports.aspx");
        }

        protected void ddl_tipoPersonal_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddl_tipoPersonal.SelectedValue == "1")
            {
                txt_company.Text = "Aspen Labs";
                txt_numEmployee.Visible = true;
                lbl_numEmploy.Visible = true;
            }
            else if(Convert.ToInt32( ddl_tipoPersonal.SelectedValue) > 2)
            {
                txt_numEmployee.Visible = false;
                lbl_numEmploy.Visible = false;
            }
            else
            {
                txt_numEmployee.Visible = true;
                lbl_numEmploy.Visible = true;
            }
        }

        protected void txt_eventFecha_TextChanged(object sender, EventArgs e)
        {
            txt_fechaAccion_CalendarExtender.StartDate = Convert.ToDateTime(txt_eventFecha.Text);
        }

        private void cargaIncidente(int incidID)
        {
            tbl_incidentTableAdapter incid = new tbl_incidentTableAdapter();
            DataSet1.tbl_incidentDataTable tblIncid = new DataSet1.tbl_incidentDataTable();
            incid.FillByFolio(tblIncid ,incidID);
            txt_eventDesc.Text = Convert.ToString(tblIncid.Rows[0]["incident_desc"]);
            txt_eventFecha.Text = String.Format("{0:dd/MM/yyyy}", Convert.ToDateTime(tblIncid.Rows[0]["incident_date"]));
            string a = String.Format("{0:hh:mm}", tblIncid.Rows[0]["incident_hour"].ToString());
            //txt_eventHora.Text = String.Format("{0:hh:mm}", tblIncid.Rows[0]["incident_hour"].ToString()).Replace(":","");
            txt_evHora.Text = tblIncid.Rows[0]["incident_hour"].ToString();
            ddl_turno.SelectedValue = Convert.ToString(tblIncid.Rows[0]["turn_id"]);
            ddl_eventArea.SelectedValue = Convert.ToString(tblIncid.Rows[0]["area_id"]);
            
            eventID = Convert.ToString(tblIncid.Rows[0]["event_id"]);
            ddlEvents.SelectedValue = eventID;
            ddlEvents2.SelectedValue = eventID;
            string eventIDAfter = ddlEvents.SelectedValue;
            string evChildBefore = Convert.ToString(tblIncid.Rows[0]["evChild_id"]);
            muestraEventChild(eventID);
            if (ddlEvCh.Visible == true) { ddlEvCh.SelectedValue = Convert.ToString(tblIncid.Rows[0]["evChild_id"]); }
            if (ddlEvChCh.Visible == true) { ddlEvChCh.SelectedValue = Convert.ToString(tblIncid.Rows[0]["evGrndChild_id"]); }
            ddl_eventPlace.SelectedValue = Convert.ToString(tblIncid.Rows[0]["evPlace_id"]);
            RadioButtonList1.SelectedValue = Convert.ToString(tblIncid.Rows[0]["gec_id"]);
            ddl_eventClasif.SelectedValue = Convert.ToString(tblIncid.Rows[0]["evClass_id"]);
            lblFechaReporte.Text = String.Format("{0:dd/MM/yyyy}", Convert.ToDateTime(tblIncid.Rows[0]["incident_repDate"]));
            int estatus = Convert.ToInt32(tblIncid.Rows[0]["stat_id"]);
            if(estatus==8)
            {
                btn_accion.Enabled = true;
                btn_reporte.Enabled = true;
                btn_addEmployee.Enabled = true;
                lbl_estatus.Text = "Rechazada";
                lbl_estatus.ForeColor = System.Drawing.Color.Red;
            }
            else 
            {
                btn_accion.Enabled = true;
                btn_reporte.Enabled = true;
                btn_addEmployee.Enabled = true;
                grvPersonEvent.Enabled = true;
                grvInmedActions.Enabled = true;
                if (estatus == 6)
                { 
                    lbl_estatus.Text = "Revisión";
                    lbl_estatus.ForeColor = System.Drawing.Color.Blue;
                }
                if (estatus == 7)
                { 
                    lbl_estatus.Text = "Aprobada";
                    lbl_estatus.ForeColor = System.Drawing.Color.Green;
                    if(Convert.ToInt32(tblIncid.Rows[0]["gec_id"]) == 2)
                    {
                        Panel3.Visible = true;
                    }
                }
            }
            incid.Dispose();
            tblIncid.Dispose();
        }

        protected void btn_reporte_Click(object sender, EventArgs e)
        {
            generaActualizaReporte();
        }

        private void correoUpdateReport(int incid_id)
        {
            string bodytext;
            bodytext = "\nPor medio del presente se notifica que se actualizó el accidente no." + incid_id + " \n";
            bodytext = bodytext + "\nArea: " + ddl_eventArea.SelectedItem.Text + "\n";
            bodytext = bodytext + "Clasificación del Incidente: " + ddl_eventClasif.SelectedItem.Text.ToString() + "\n";
            bodytext = bodytext + "Clasificación del Incidente: " + txt_eventDesc.Text + "\n";
            bodytext = bodytext + "\nFecha del evento (formato aaaa-mm-dd): " + txt_eventFecha.Text.ToString() + "";
            bodytext = bodytext + "\n Área funcional: " + ddl_eventArea.SelectedItem.Text.ToString() + "";
            bodytext = bodytext + "\n Creador del reporte: " + Convert.ToString(Session["userName"]) + "";
            bodytext = bodytext + "\nPara más información, favor de consultar la siguiente liga. \n http://10.240.151.139/pentagono/incidDetail.aspx?folio=" + incid_id + "\n";

            //string to = Convert.ToString(usrInfoTable.Rows[0]["usrInfo_email"]) + ";";
            string[] correos; // = {""};// = { "fernando.reyes@aspenlatam.com", "karla.chavez@aspenlatam.com" };
            correos = new string[2];
            correos[0] = Convert.ToString(Session["email"]);
            correos[1] = getEmail(getResponsable(Convert.ToInt32(Session["userID"])));

            f.enviarCorreo("Fernando Reyes", correos, Convert.ToString(Session["userName"]), bodytext, "Actualización de reporte accidente incidente folio " + incid_id);
        //}
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            muestraEventChild(ddlEvents2.SelectedValue);
        }

        private void muestraEventChild(string event_id)
        {
            tbl_eventTypeChildTableAdapter evTyCh = new tbl_eventTypeChildTableAdapter();
            int hasChild = Convert.ToInt32(evTyCh.getEventChildByEventType(Convert.ToInt32(event_id)));

            if (hasChild == 0)
            {
                //UpdatePanel1.Visible = false;
                ddlEvCh.Visible = false;
                ddlEvChCh.Visible = false;
            }
            else
            {
                //UpdatePanel1.Visible = true;
                //ddlEvCh.Visible = true;
                DropDownList2.Visible = true ;
            }
            ddlEvChCh.DataBind();
            evTyCh.Dispose();
        }

        protected void btn_addCausa_Click(object sender, EventArgs e)
        {
            tbl_eventCauseTableAdapter tblCausas = new tbl_eventCauseTableAdapter();
            int tipoCausa = Convert.ToInt32(ddl_tipoCausa.SelectedValue);
            int causa = Convert.ToInt32(ddl_causa.SelectedValue);
            int folio = Convert.ToInt32(txt_folio.Text);
            tblCausas.Insert(fup_evidencia.FileName, txt_causeComment.Text, causa, tipoCausa, folio);

            if (fup_evidencia.HasFile)
            {
                string filename = Path.GetFileName(fup_evidencia.FileName);
                //string filename = Path.GetFileName(FileUploadControl.FileName);
                fup_evidencia.SaveAs(Server.MapPath("~/uploaded/") + filename);
            }
            tblCausas.Dispose();
            grv_causa.DataBind();
            limpiaCausa();
        }

        private void limpiaCausa()
        {
            ddl_causa.SelectedValue = "0";
            ddl_ctrlType.SelectedValue = "0";
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            tbl_eventActionsTableAdapter Actions = new tbl_eventActionsTableAdapter();
            int actType = Convert.ToInt32(ddl_actType.SelectedValue);
            int ctrlType = Convert.ToInt32(ddl_ctrlType.SelectedValue);
            DateTime fechaComp = Convert.ToDateTime(txt_fechaComp.Text);
            int folio = Convert.ToInt32(txt_folio.Text);
            int resp = Convert.ToInt32(ddl_resp.SelectedValue);
            int actionPlanID = Convert.ToInt32(txt_folio0.Text);

            Actions.Insert(actType, txt_acciones.Text, ctrlType, resp, fechaComp, null, "", 5, folio, actionPlanID);
            Actions.Dispose();
            grv_acciones.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            tbl_actionPlanTableAdapter actionPlan = new tbl_actionPlanTableAdapter();
            tbl_eventActionsTableAdapter evActions = new tbl_eventActionsTableAdapter();
            DataSet1.tbl_actionPlanDataTable dtActPlan = new DataSet1.tbl_actionPlanDataTable();

            if (txt_folio0.Text == "0")
            {
                int actPlan_id = 0;
                int inciID = Convert.ToInt32(txt_folio.Text);
                actionPlan.Insert(0, "", false, 9, 1, inciID,6);
                actPlan_id = Convert.ToInt32(actionPlan.getMaxActPlan());

                evActions.updateActPlan(actPlan_id, Convert.ToInt32(txt_folio.Text));

                tbl_bitacoraTableAdapter bitac = new tbl_bitacoraTableAdapter();
                bitac.Insert(Convert.ToDateTime(DateTime.Today.ToShortDateString()), "plan de acción creado", "", "investigación", Convert.ToInt32(txt_folio.Text), 0, Convert.ToString(Session["userName"]));

            }
            else
            {
                tbl_bitacoraTableAdapter bitac = new tbl_bitacoraTableAdapter();
                bitac.Insert(Convert.ToDateTime(DateTime.Today.ToShortDateString()), "se ha actualizado el plan de acción", "", "investigación", Convert.ToInt32(txt_folio.Text), 0, Convert.ToString(Session["userName"]));
            }

            actionPlan.Dispose();
            evActions.Dispose();
            dtActPlan.Dispose();
            Response.Redirect("my-reports.aspx");
        }

        protected void grv_acciones_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int RowID = Convert.ToInt32(grv_acciones.DataKeys[e.RowIndex].Value);
            DropDownList responsable = grv_acciones.Rows[e.RowIndex].FindControl("DropDownList1") as DropDownList;
            if (!(responsable.SelectedValue == "4"))
            {
                FileUpload fileUpload = grv_acciones.Rows[e.RowIndex].FindControl("FileUpload1") as FileUpload;
                DropDownList tipoAccion = grv_acciones.Rows[e.RowIndex].FindControl("ddlActionType") as DropDownList;
                DropDownList tipoControl = grv_acciones.Rows[e.RowIndex].FindControl("ddlCtrlType") as DropDownList;

                TextBox acciones = grv_acciones.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
                TextBox compromiso = grv_acciones.Rows[e.RowIndex].FindControl("TextBox1") as TextBox;
                int estatus = 0;
                DateTime cierre = DateTime.Today;

                if (Convert.ToDateTime(compromiso.Text) > cierre)
                {
                    estatus = 3;
                }
                else
                {
                    estatus = 2;
                }

                if (fileUpload.HasFile)
                {
                    fileUpload.SaveAs(System.IO.Path.Combine(Server.MapPath("~/uploaded/"), fileUpload.FileName));
                    TextBox txtEvidencia = grv_acciones.Rows[e.RowIndex].FindControl("txtEvidencia") as TextBox;
                    //txtEvidencia.Text = "2";

                    //((TextBox)(grv_acciones.Rows[e.RowIndex].FindControl("txtEvidencia"))).Text="2";
                    //update db using the name of the file corresponding to RowID
                }
                evActionsData.UpdateCommand = "UPDATE tbl_eventActions SET evAction_fileEvidence='" + fileUpload.FileName + "', stat_id=" + estatus + " WHERE evAction_id=" + RowID;
                evActionsData.Update();
                grv_acciones.EditIndex = -1;
                grv_acciones.DataBind();
            }
            else
            {
                Label8.Text = "Usuario no autorizado";
            }
        }

        private void mail(int incid_id, string area, string clasif, string desc, string fecha ,string estatus, string user, int areaID)
        {
            string bodytext;
            string involucrados="";

            tbl_personEventTableAdapter involuc = new tbl_personEventTableAdapter();
            DataSet1.tbl_personEventDataTable tblinvoluc = new DataSet1.tbl_personEventDataTable();
            involuc.FillByIncid(tblinvoluc,user,incid_id);

            for(int i=0; i <= tblinvoluc.Rows.Count - 1; i++)
            {
                if(!(String.IsNullOrEmpty(Convert.ToString( tblinvoluc.Rows[i]["perEvent_numEmploy"]))))
                {
                    involucrados += "No. empleado: " + tblinvoluc.Rows[i]["perEvent_numEmploy"] + " \n\n";
                }
                involucrados += "Nombre de la persona: " + tblinvoluc.Rows[i]["perEvent_name"] + " \n ";
                involucrados += "Empresa: " + tblinvoluc.Rows[i]["perEvent_company"] + " \n ";
                involucrados += "Area funcional: " + tblinvoluc.Rows[i]["area_id"] + " \n\n ";
            }
            involuc.Dispose();
            tblinvoluc.Dispose();

            tbl_incidentTableAdapter incid = new tbl_incidentTableAdapter();
            tbl_statusTableAdapter stat = new tbl_statusTableAdapter();

            bodytext = "\nPor medio del presente se notifica que ha ocurrido un accidente no." + incid_id + " del día " + fecha + " \n";
            bodytext = bodytext + "\n Area: " + area + "\n";
            bodytext = bodytext + " Clasificación del Incidente: " + clasif + "\n";
            bodytext = bodytext + "\n Descripción del Incidente: " + desc + "\n";
            bodytext = bodytext + "\nPersonal involucrado: " + "" + "";
            bodytext = bodytext + involucrados;
            bodytext = bodytext + "\n Área funcional: " + area + "";
            bodytext = bodytext + "\n Creador del reporte: " + Convert.ToString(Session["userName"]) + "";
            bodytext = bodytext + "\n\n Estatus: " + stat.getEstatusDesc(Convert.ToInt32( incid.getStatus(incid_id))) + "";
            bodytext = bodytext + "\nPara más información, favor de consultar la siguiente liga. \n http://10.240.151.139/pentagono/incidDetail.aspx?folio=" + incid_id + "\n";

            incid.Dispose();
            stat.Dispose();

            //string to = Convert.ToString(usrInfoTable.Rows[0]["usrInfo_email"]) + ";";
            tbl_userInfoTableAdapter usrInfo = new tbl_userInfoTableAdapter();
            DataSet1.tbl_userInfoDataTable  tblusrInfo = new DataSet1.tbl_userInfoDataTable();
            usrInfo.FillByArea(tblusrInfo, areaID);

            string[] correos; // = {""};
            int numCorreos = tblusrInfo.Rows.Count + 1;
            correos = new string[numCorreos];
            correos[0] = Convert.ToString(Session["email"]);
            for (int j = 1; j <= tblusrInfo.Rows.Count; j++)
            {
                correos[j] = Convert.ToString(tblusrInfo.Rows[j-1]["usrInfo_email"]);
            }
            //string[] correos; // = {""};
            //correos = new string[2];
            ////correos = new string[1];
            //correos[0] = Convert.ToString(Session["email"]);
            //correos[1] = getEmail(getResponsable(Convert.ToInt32(Session["userID"])));

            try
            {
                lblError.Text = f.enviarCorreoAsync("Fernando Reyes", correos, " ", bodytext, "Reporte incidente/accidente folio " + incid_id);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}