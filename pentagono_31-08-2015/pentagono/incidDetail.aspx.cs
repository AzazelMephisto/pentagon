using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;
using pentagono.DataSet1TableAdapters;
using pent;

namespace pentagono
{
    public partial class incidDetail : System.Web.UI.Page
    {
        private funciones funcCorreo = new funciones();
        protected void Page_Load(object sender, EventArgs e)
        {
            int estatus = 0;
            btnRechazada_ModalPopupExtender.Hide();
            tbl_incidentTableAdapter incid = new tbl_incidentTableAdapter();
            estatus = Convert.ToInt32(incid.getStatus(Convert.ToInt32(Request.QueryString["folio"])));
            tbl_statusTableAdapter stat = new tbl_statusTableAdapter();
            Label22.Text = stat.getEstatusDesc(Convert.ToInt32(estatus));
            stat.Dispose();
            incid.Dispose();
            txt_fechaComp_CalendarExtender.StartDate = DateTime.Today;
            
            if (!Page.IsPostBack)
            {
                if (Session["userID"] == null)
                {
                    Response.Redirect("login.aspx?pag=incidDetail&folio=" + Convert.ToString(Request.QueryString["folio"]));
                }
                if (Convert.ToInt32(Session["userRol"]) >= 4 || String.IsNullOrEmpty(Request.QueryString["folio"]) || Request.QueryString["folio"] == null)
                {
                    btnAceptar.Visible = false;
                    btnRechazada.Visible = false;
                    pnl_motivo.Visible = false;
                }
                if (!(Request.QueryString["folio"] == null))
                {
                    txt_folio.Text = Request.QueryString["folio"];
                    txt_folio0.Text= Convert.ToString( getPlanAccion(Convert.ToInt32(txt_folio.Text)));
                }
            }
            if (estatus == 6)
            {
                //FormView1.DefaultMode = FormViewMode.Edit;
                btnActualizar.Visible = false;
                btnAceptar.Visible = true;
                btnRechazada.Visible = true;
                FormView1.Enabled = false;
                GridView1.AutoGenerateEditButton = false;
                GridView4.AutoGenerateEditButton = false;
                GridView1.Enabled = false;
                GridView4.Enabled = false;
                Panel3.Visible = false;
                Panel2.Visible = false;
                Label22.ForeColor = System.Drawing.Color.Blue;

            }
            else if (estatus == 7)
            {
                btnActualizar.Visible = false;
                btnAceptar.Visible = false;
                btnRechazada.Visible = false;
                FormView1.Enabled = false;
                GridView1.AutoGenerateEditButton = false;
                GridView4.AutoGenerateEditButton = false;
                GridView1.Enabled = false;
                GridView4.Enabled = false;
                pnl_motivo.Visible = false;
                Label22.ForeColor = System.Drawing.Color.Green;
                Panel3.Visible = true;
                int actPlanNum = getPlanAccion(Convert.ToInt32(txt_folio.Text));
                int actPlanStatus = getPlanActStatus(actPlanNum);
                
            }
            else if(estatus == 8)
            {
                btnActualizar.Visible = true;
                btnAceptar.Visible = false;
                btnRechazada.Visible = false;
                pnl_motivo.Visible = false;
                Panel3.Visible = false;
                Panel2.Visible = false;
                Label22.ForeColor = System.Drawing.Color.Red;
            }
            else if (Convert.ToInt32(Session["userRol"]) > 2)
            {
                btnAceptar0.Visible = false;
                btnRechazada0.Visible = false;
                Panel2.Visible = false;
                pnlBotones.Visible = false;
                if (estatus == 9)
                {
                    /* Revisar si se puede modificar despues de guardar */
                    //grv_acciones.Enabled = false;
                    //grv_causa.Enabled = false;
                    //btn_addCausa.Enabled = false;
                    //btn_save.Enabled = false;
                    //btnGuardaInv.Enabled = false;
                    lblEstatusPlan.Text = "Revisión";
                    Label22.ForeColor = System.Drawing.Color.Blue;
                    FormView1.Enabled = false;
                }
                else if (estatus == 11)
                {
                    btn_addCausa.Enabled = false;
                    btn_save.Enabled = false;
                    lblEstatusPlan.Text = "Validado";
                    Label22.ForeColor = System.Drawing.Color.Green;
                    FormView1.Enabled = false;
                    Panel5.Visible = false;
                }
                else if (estatus == 10) { lblEstatusPlan.Text = "Rechazada"; Label22.ForeColor = System.Drawing.Color.Red; FormView1.Enabled = false; }
            }
            else if (Convert.ToInt32(Session["userRol"]) <= 2)
            {
                pnlBotones.Visible = false;
                btnGuardaInv.Visible = false;
                FormView1.Enabled = false;
                GridView1.Enabled = false;
                GridView4.Enabled = false;
                if (estatus == 11)
                {
                    btn_addCausa.Enabled = false;
                    btn_save.Enabled = false;
                    lblEstatusPlan.Text = "Validado";
                    Label22.ForeColor = System.Drawing.Color.Green;
                    btnRechazada0.Visible = false;
                    btnAceptar0.Visible = false;
                    pnl_motivo.Visible = false;
                    Panel2.Visible = false;
                    grv_causa.Enabled = false;
                    FormView1.Enabled = false;
                }
                else if (estatus == 10)
                {
                    btnRechazada0.Visible = false;
                    btnAceptar0.Visible = false;
                    Panel2.Visible = false;
                    lblEstatusPlan.Text = "Rechazado por validación";
                    Label22.ForeColor = System.Drawing.Color.Red;
                    FormView1.Enabled = false;
                }
                else if (estatus == 9) { lblEstatusPlan.Text = "Por Validar"; Label22.ForeColor = System.Drawing.Color.Blue; FormView1.Enabled = false; }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("investigation.aspx?folio=" + Request.QueryString["folio"]);
        }

        protected void btnBitacora_Click(object sender, EventArgs e)
        {
            Response.Redirect("bitacora.aspx?folio=" + Request.QueryString["folio"]);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            tbl_bitacoraTableAdapter bitac = new tbl_bitacoraTableAdapter();
            bitac.Insert(Convert.ToDateTime(DateTime.Today.ToShortDateString()), "cambio de estatus", "", "incidenteAccidente", Convert.ToInt32(Request.QueryString["folio"]),0, Convert.ToString(Session["userName"]));
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            tbl_incidentTableAdapter incident = new tbl_incidentTableAdapter();
            tbl_bitacoraTableAdapter bitac = new tbl_bitacoraTableAdapter();
            int folio = Convert.ToInt32(Request.QueryString["folio"]);
            incident.updateApprove(7,folio);
            bitac.Insert(DateTime.Now, "solicitud aprobada", "", "incidentAccident", folio,0, Convert.ToString(Session["userName"]));
            bitac.Dispose();
            incident.Dispose();
            enviarCorreo(Convert.ToInt32(Request.QueryString["folio"]));
            Response.Redirect("my-reports.aspx");
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {

            int folio = Convert.ToInt32(Request.QueryString["folio"]);
            using (tbl_incidentTableAdapter incid = new tbl_incidentTableAdapter())
            {
                incid.updateApprove(6, folio);
            }
            using (tbl_bitacoraTableAdapter bitac = new tbl_bitacoraTableAdapter())
            {
                bitac.Insert(DateTime.Now, "Actualización de reporte", "", "incidentAccident", folio,0, Convert.ToString(Session["userName"]));
            }
            enviarCorreo(Convert.ToInt32(Request.QueryString["folio"]));
        }

        private void enviarCorreo(int incid_id)
        {
            int userCreate = 0;
            using (tbl_incidentTableAdapter incident = new tbl_incidentTableAdapter())
            {
                DataTable dtUsuario = new DataTable();
                dtUsuario = incident.GetIDByFolio(incid_id);
                userCreate = Convert.ToInt32(dtUsuario.Rows[0]["usr_id"]);
                dtUsuario.Dispose();
            }  
            string bodytext;
            bodytext = "\nEl reporte  generado con número de folio: " + incid_id + " fue aprobado por su jefe";
            //bodytext = bodytext + "Descripción del evento: " + txt_eventDesc.Text + "\n";
            //bodytext = bodytext + "Clasificación del evento: " + ddl_eventClasif.SelectedItem.Text.ToString() + "\n";
            //bodytext = bodytext + "\nFecha del evento (formato aaaa-mm-dd): " + txt_eventFecha.Text.ToString() + "";
            //bodytext = bodytext + "\n\n Área en donde ocurrio el evento: " + ddl_eventArea.SelectedItem.Text.ToString() + "";
            bodytext = bodytext + "\n Para mayor información conultar en: http://10.240.151.139/pentagono/incidDetail.aspx?folio=" + incid_id + "\n";

            //string to = Convert.ToString(usrInfoTable.Rows[0]["usrInfo_email"]) + ";";
            string[] correos; // = {""};// = { "fernando.reyes@aspenlatam.com", "karla.chavez@aspenlatam.com" };
            correos = new string[2];
            //correos = new string[1];
            correos[0] = getEmail(Convert.ToInt32(Session["userID"]));
            correos[1] = getEmail(userCreate);

            funcCorreo.enviarCorreo("Fernando Reyes", correos, Convert.ToString(Session["userName"]), bodytext, "Actualización de reporte accidente incidente folio " + incid_id);
        }

        private void correoRechazado(int incid_id, string motivo) 
        {
            string bodytext = "";
            bodytext = "Lamentamos informarle que el reporte que usted realizó con folio: " + incid_id + " ha sido rechazado por su jefe";
            bodytext += "por el/los siguiente(s) motivo(s): " + motivo;
            //funcCorreo.enviarCorreo("Fernando Reyes", correos, Convert.ToString(usrInfoTable.Rows[0]["usrInfo_name"]), bodytext, "Actualización de reporte accidente incidente folio " + incid_id);
            //enviarCorreoRecha(int incid_id, string motivo);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if(!(String.IsNullOrEmpty( txtMotivo.Text)))
            {
                tbl_incidentTableAdapter incident = new tbl_incidentTableAdapter();
                tbl_bitacoraTableAdapter bitac = new tbl_bitacoraTableAdapter();
                int folio = Convert.ToInt32(Request.QueryString["folio"]);
                incident.updateApprove(8, folio);
                bitac.Insert(DateTime.Now, "solicitud rechazada", "Motivo: " + txtMotivo.Text, "incidenteAccidente", folio,0, Convert.ToString(Session["userName"]));
                bitac.Dispose();
                incident.Dispose();
                try
                {
                    enviarCorreoRecha(Convert.ToInt32(Request.QueryString["folio"]), txtMotivo.Text);
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }

                Response.Redirect("my-reports.aspx");
            }
            else
            {

            }
        }

        private void enviarCorreoRecha(int incid_id, string motivo)
        {
            int userCreate=0;
            using (tbl_incidentTableAdapter incident = new tbl_incidentTableAdapter())
            {
                DataTable dtUsuario = new DataTable();
                dtUsuario = incident.GetIDByFolio(incid_id);
                userCreate = Convert.ToInt32(dtUsuario.Rows[0]["usr_id"]);
                dtUsuario.Dispose();
            }          

            //using (tbl_userInfoTableAdapter usrInfo = new tbl_userInfoTableAdapter())
            //{
            //    using (DataSet1.tbl_userInfoDataTable usrInfoTable = new DataSet1.tbl_userInfoDataTable())
            //    {
            //        usrInfo.FillByUserID(usrInfoTable, userCreate);
            //        if (usrInfoTable.Rows[0]["usrInfo_name"].ToString() != "")
            //        {
                        string bodytext;
                        bodytext = "Lamentamos informarle que el reporte que usted realizó con folio: " + incid_id + " ha sido rechazado por su jefe";
                        bodytext += "por el/los siguiente(s) motivo(s): " + motivo;
                        bodytext = bodytext + "\nRequiere de su revisión y aporabación http://10.240.151.139/pentagono/incidentes.aspx?folio=" + incid_id + "\n";

                        //string to = Convert.ToString(usrInfoTable.Rows[0]["usrInfo_email"]) + ";";
                        string[] correos; // = {""};// = { "fernando.reyes@aspenlatam.com", "karla.chavez@aspenlatam.com" };
                        correos = new string[2];
                        //correos = new string[1];
                        correos[0] = getEmail(userCreate);
                        correos[1] = getEmail(Convert.ToInt32(Session["UserID"]));
                        //using (tbl_responsablesTableAdapter jefe = new tbl_responsablesTableAdapter())
                        //{
                        //    using (DataSet1.tbl_responsablesDataTable dtjefe = new DataSet1.tbl_responsablesDataTable())
                        //    {
                        //        using (tbl_userTableAdapter usr = new tbl_userTableAdapter())
                        //        {
                        //            int resp = Convert.ToInt32(usr.respIDByUserID(Convert.ToInt32(Session["UserID"])));

                        //            jefe.FillByRespID(dtjefe, resp);
                        //            //correos[1] = Convert.ToString(dtjefe.Rows[0]["resp_email"]);
                        //        }
                        //    }
                        //}

                        funcCorreo.enviarCorreo("Fernando Reyes", correos, "Aspen WebApp", bodytext, "Actualización de reporte accidente incidente folio " + incid_id);
                //    }
                //}
           // }
        }

        protected void btn_addCausa_Click(object sender, EventArgs e)
        {
            int tipoCausa = Convert.ToInt32(ddl_tipoCausa.SelectedValue);
            int causa = Convert.ToInt32(ddl_causa.SelectedValue);
            int folio = Convert.ToInt32(txt_folio.Text);
            
            if(!((tipoCausa == 0) || (causa == 0))) { 
                if (fup_evidencia.HasFile)
                {
                    tbl_eventCauseTableAdapter tblCausas = new tbl_eventCauseTableAdapter();
                    string filename = Path.GetFileName(fup_evidencia.FileName);
                    //string filename = Path.GetFileName(FileUploadControl.FileName);
                    tblCausas.Insert(fup_evidencia.FileName, txt_causeComment.Text, causa, tipoCausa, folio);
                    fup_evidencia.SaveAs(Server.MapPath("~/uploaded/") + filename);
                    limpiaCausa();
                    tblCausas.Dispose();
                }
                else
                {

                }
            }
            grv_causa.DataBind();
        }

        private void limpiaCausa()
        {
            ddl_causa.SelectedValue = "0";
            ddl_tipoCausa.SelectedValue = "0";
            txt_causeComment.Text="";
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
            limpiaAcciones();
            grv_acciones.DataBind();
        }

        private void limpiaAcciones()
        {
            txt_acciones.Text="";
            txt_fechaComp.Text = "";
            ddl_actType.SelectedValue = "0";
            ddl_ctrlType.SelectedValue = "0";
            ddl_resp.SelectedValue = "0";
        }

        protected void grv_acciones_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            FileUpload fileUpload = grv_acciones.Rows[e.RowIndex].FindControl("FileUpload1") as FileUpload;
            if (fileUpload.HasFile)
            {
                int RowID = Convert.ToInt32(grv_acciones.DataKeys[e.RowIndex].Value);
                DropDownList responsable = grv_acciones.Rows[e.RowIndex].FindControl("DropDownList1") as DropDownList;
                if (!(responsable.SelectedValue == "4"))
                {
                    
                    DropDownList tipoAccion = grv_acciones.Rows[e.RowIndex].FindControl("ddlActionType") as DropDownList;
                    DropDownList tipoControl = grv_acciones.Rows[e.RowIndex].FindControl("ddlCtrlType") as DropDownList;

                    TextBox acciones = grv_acciones.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
                    TextBox compromiso = grv_acciones.Rows[e.RowIndex].FindControl("TextBox1") as TextBox;
                    int estatus = 0;
                    DateTime cierre = DateTime.Today;

                    if (Convert.ToDateTime(compromiso.Text) < cierre)
                    {
                        estatus = 3;
                    }
                    else
                    {
                        estatus = 2;
                    }

                
                    fileUpload.SaveAs(System.IO.Path.Combine(Server.MapPath("~/uploaded/"), fileUpload.FileName));
                    TextBox txtEvidencia = grv_acciones.Rows[e.RowIndex].FindControl("txtEvidencia") as TextBox;
                    //txtEvidencia.Text = "2";

                    //((TextBox)(grv_acciones.Rows[e.RowIndex].FindControl("txtEvidencia"))).Text="2";
                    //update db using the name of the file corresponding to RowID
                
                evActionsData.UpdateCommand = "UPDATE tbl_eventActions SET evAction_fileEvidence='" + fileUpload.FileName + "', stat_id=" + estatus + " WHERE evAction_id=" + RowID;
                evActionsData.Update();
                grv_acciones.EditIndex = -1;
                grv_acciones.DataBind();
                }
            }
            else
            {
                Label21.Text = "Usuario no autorizado";
            }
        }

        protected void btnGuardaInv_Click(object sender, EventArgs e)
        {
            tbl_actionPlanTableAdapter actionPlan = new tbl_actionPlanTableAdapter();
            tbl_eventActionsTableAdapter evActions = new tbl_eventActionsTableAdapter();
            DataSet1.tbl_actionPlanDataTable dtActPlan = new DataSet1.tbl_actionPlanDataTable();
            if(grv_acciones.EditIndex > -1)
            {

            }
            if (txt_folio0.Text == "0")
            {
                int actPlan_id = 0;
                int inciID = Convert.ToInt32(txt_folio.Text);
                actPlan_id = Convert.ToInt32(actionPlan.getMaxActPlan())+1;
                actionPlan.Insert(actPlan_id, "", false, 9, 0, inciID,9);
                actPlan_id = Convert.ToInt32(actionPlan.getMaxActPlan());

                evActions.updateActPlan(actPlan_id, Convert.ToInt32(txt_folio.Text));

                tbl_bitacoraTableAdapter bitac = new tbl_bitacoraTableAdapter();
                bitac.Insert(DateTime.Now, "plan de acción creado", "", "investigación", Convert.ToInt32(txt_folio.Text), 0, Convert.ToString(Session["userName"]));
                correoSHE(Convert.ToInt32(txt_folio.Text));
            }
            else
            {
                actionPlan.updateStatus(9, Convert.ToInt32(txt_folio0.Text));
                tbl_bitacoraTableAdapter bitac = new tbl_bitacoraTableAdapter();
                bitac.Insert(DateTime.Now, "se ha actualizado el plan de acción", "", "investigación", Convert.ToInt32(txt_folio.Text), 0, Convert.ToString(Session["userName"]));
                correoSHEupdate(Convert.ToInt32(txt_folio.Text));
            }
            tbl_incidentTableAdapter incident = new tbl_incidentTableAdapter();
            int folio = Convert.ToInt32(Request.QueryString["folio"]);
            incident.updateApprove(9, folio);

            actionPlan.Dispose();
            evActions.Dispose();
            dtActPlan.Dispose();
            Response.Redirect("dash-incidentes.aspx");
        }

        private void correoSHE(int incid_id)
        {
            //int userCreate = 0;

            string[] correos; // = {""};// = { "fernando.reyes@aspenlatam.com", "karla.chavez@aspenlatam.com" };
            correos = new string[2];
            //correos = new string[1];
            correos[0] = getEmail(Convert.ToInt32(Session["userID"]));
            correos[1] = "marco.perfino@aspenlatam.com";

            string bodytext;
            bodytext = "\nEstimado: \n";
            bodytext = "\nSe ha iniciado una investigación para el accidente con folio: " + incid_id + " \n";
            bodytext = bodytext + "\n Favor de reviasar http://10.240.151.139/pentagono/incidDetail.aspx?folio=" + incid_id + "\n";

            funcCorreo.enviarCorreo("Fernando Reyes", correos, Convert.ToString(Session["userName"]), bodytext, "Generación de investigación " + incid_id);
        }

        private void correoSHEupdate(int incid_id)
        {
            string[] correos; // = {""};// = { "fernando.reyes@aspenlatam.com", "karla.chavez@aspenlatam.com" };
            correos = new string[2];
            //correos = new string[1];
            correos[0] = getEmail(Convert.ToInt32(Session["userID"]));
            correos[1] = "marco.perfino@aspenlatam.com";

            string bodytext;
            bodytext = "\nEstimado: \n";
            bodytext = "\nSe han realizado cambios iniciado una investigación para el accidente con folio: " + incid_id + " \n";
            bodytext = bodytext + "\n Puede reviasar en la siguiente liga http://10.240.151.139/pentagono/incidDetail.aspx?folio=" + incid_id + "\n";

            funcCorreo.enviarCorreo("Fernando Reyes", correos, Convert.ToString(Session["userName"]), bodytext, "Generación de investigación " + incid_id);
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

        protected void txt_folio_TextChanged(object sender, EventArgs e)
        {
            
        }

        private int getPlanAccion(int incidID)
        {
            tbl_actionPlanTableAdapter acPlan = new tbl_actionPlanTableAdapter();
            int actPlanID = Convert.ToInt32(acPlan.getActIDByFolio(incidID));
            txt_folio0.Text = actPlanID.ToString();
            acPlan.Dispose();
            return actPlanID;
        }

        private int getPlanActStatus(int actionPlan)
        {
            tbl_actionPlanTableAdapter acPlan = new tbl_actionPlanTableAdapter();
            int actPlanStatus = Convert.ToInt32(acPlan.getStatus(actionPlan));
            acPlan.Dispose();
            return actPlanStatus;
        }

        protected void btnEnviarMotivo_Click(object sender, EventArgs e)
        {
            if (!(String.IsNullOrEmpty(TextBox4.Text)))
            {
                tbl_incidentTableAdapter incident = new tbl_incidentTableAdapter();
                tbl_actionPlanTableAdapter acPlan = new tbl_actionPlanTableAdapter();
                tbl_bitacoraTableAdapter bitac = new tbl_bitacoraTableAdapter();
                int folio = Convert.ToInt32(Request.QueryString["folio"]);
                acPlan.updateStatus(10,Convert.ToInt32(txt_folio0.Text));
                bitac.Insert(DateTime.Now, "plan de acción rechazado", "Motivo: " + TextBox4.Text, "planAccion", folio, 0, Convert.ToString(Session["userName"]));
                bitac.Dispose();
                incident.updateApprove(10, folio);
                incident.Dispose();
                try
                {
                    enviarCorreoRecha(Convert.ToInt32(Request.QueryString["folio"]), txtMotivo.Text);
                }
                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }

                Response.Redirect("dash-incidentes.aspx");
            }
            else
            {

            }
        }

        protected void btnAceptar0_Click(object sender, EventArgs e)
        {
            tbl_actionPlanTableAdapter acPlan = new tbl_actionPlanTableAdapter();
            tbl_incidentTableAdapter incident = new tbl_incidentTableAdapter();
            tbl_bitacoraTableAdapter bitac = new tbl_bitacoraTableAdapter();
            int folio = Convert.ToInt32(Request.QueryString["folio"]);
            int actionPlan = Convert.ToInt32(txt_folio0.Text);
            acPlan.updateStatus(11, Convert.ToInt32(txt_folio0.Text));
            bitac.Insert(DateTime.Now, "plan de acción validado", "", "planAcción", folio, actionPlan, Convert.ToString(Session["userName"]));
            bitac.Dispose();
            incident.updateApprove(11, folio);
            incident.Dispose();
            acPlan.Dispose();
            correoSHEupdate(Convert.ToInt32(Request.QueryString["folio"]));
            Response.Redirect("dash-incidentes.aspx");
        }

        public bool accesoActividad(int estatus, string usuario)
        {
            bool habilitado = true;

            if(Convert.ToInt32(Session["userRol"]) == 4)
            {
                if ((estatus <= 3) || (!(usuario == Convert.ToString(Session["userName"]))))
                {
                    habilitado = false;
                }
                else
                {
                    habilitado = true;
                }
            }
            else
            {
                habilitado = true;
            }

            return habilitado;
        }

        private void mail(int incid_id, string area, string clasif, string desc, string fecha, string estatus, string user, int areaID)
        {
            string bodytext;
            string involucrados = "";

            tbl_personEventTableAdapter involuc = new tbl_personEventTableAdapter();
            DataSet1.tbl_personEventDataTable tblinvoluc = new DataSet1.tbl_personEventDataTable();
            involuc.FillByIncid(tblinvoluc, user, incid_id);

            for (int i = 0; i <= tblinvoluc.Rows.Count - 1; i++)
            {
                if (!(String.IsNullOrEmpty(Convert.ToString(tblinvoluc.Rows[i]["perEvent_numEmploy"]))))
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
            bodytext = bodytext + "\n\n Estatus: " + stat.getEstatusDesc(Convert.ToInt32(incid.getStatus(incid_id))) + "";
            bodytext = bodytext + "\nPara más información, favor de consultar la siguiente liga. \n http://10.240.151.139/pentagono/incidDetail.aspx?folio=" + incid_id + "\n";

            incid.Dispose();
            stat.Dispose();

            //string to = Convert.ToString(usrInfoTable.Rows[0]["usrInfo_email"]) + ";";
            //tbl_userInfoTableAdapter usrInfo = new tbl_userInfoTableAdapter();
            //DataSet1.tbl_userInfoDataTable tblusrInfo = new DataSet1.tbl_userInfoDataTable();
            //usrInfo.FillByArea(tblusrInfo, areaID);

            string[] correos; // = {""};
            //int numCorreos = tblusrInfo.Rows.Count + 1;
            correos = new string[2];
            correos[0] = Convert.ToString(Session["email"]);
            correos[1] = "marco.perfino@aspenlatam.com";
            //for (int j = 1; j <= tblusrInfo.Rows.Count; j++)
            //{
            //    correos[j] = Convert.ToString(tblusrInfo.Rows[j - 1]["usrInfo_email"]);
            //}
            //string[] correos; // = {""};
            //correos = new string[2];
            ////correos = new string[1];
            //correos[0] = Convert.ToString(Session["email"]);
            //correos[1] = getEmail(getResponsable(Convert.ToInt32(Session["userID"])));

            try
            {
                lblError.Text = funcCorreo.enviarCorreoAsync("Fernando Reyes", correos, " ", bodytext, "Reporte incidente/accidente folio " + incid_id);
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }
    }
}