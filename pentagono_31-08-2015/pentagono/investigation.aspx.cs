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
    public partial class investigation : System.Web.UI.Page
    {
        private funci f = new funci();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["userID"] == null)
                {
                    Response.Redirect("login.aspx?pag=investigation");
                }
                if(!(Request.QueryString["folio"] == null))
                {
                    txt_folio.Text = Request.QueryString["folio"];
                }
                txt_fechaComp_CalendarExtender.StartDate = DateTime.Today;
            }
            if(txt_folio.Text == "")
            {
                btn_addCausa.Enabled = false;
                btn_save.Enabled = false;
            }
            else
            {
                btn_addCausa.Enabled = true;
                btn_save.Enabled = true;
            }
            /*if (!Page.IsPostBack) { 
                if (Session["userID"] == null)
                {
                    Response.Redirect("login.aspx?pag=investigation");
                }
                else
                {
                    if ((int)Session["userRol"] == 4)
                        usuario();
                }

                Session["incidente_folio"] = txt_folio.Text;
                string folio_id = "";
                if (String.IsNullOrEmpty(Convert.ToString(Session["incidente_folio"])))
                {
                    if (!String.IsNullOrEmpty(Request.QueryString["folio"]))
                    {
                        folio_id = Request.QueryString["folio"];
                        txt_folio.Text = folio_id;
                        txt_folio_TextChanged(null, null);
                    }
                }
            
            else
            {
                folio_id = Convert.ToString(Session["incidente_folio"]);
            }
            txt_folio.Text = folio_id;
            //if(ddl_estatus.SelectedValue == "6")
            //{
            //    tbc_actionPlan.Visible = false;
            //}else
            //{
            //    tbc_actionPlan.Visible = true;
            //}
            }*/
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
            int actionPlanID = Convert.ToInt32(txt_folio0.Text );

            Actions.Insert(actType, txt_acciones.Text, ctrlType, resp, fechaComp, null, "", 5, folio, actionPlanID);
            Actions.Dispose();
            grv_acciones.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            tbl_actionPlanTableAdapter actionPlan = new tbl_actionPlanTableAdapter();
            tbl_eventActionsTableAdapter evActions = new tbl_eventActionsTableAdapter();
            DataSet1.tbl_actionPlanDataTable dtActPlan = new DataSet1.tbl_actionPlanDataTable();

            if (txt_folio0.Text=="0")
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
                int estatus=0;
                DateTime cierre = DateTime.Today;

                if(Convert.ToDateTime(compromiso.Text) > cierre)
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
                evActionsData.UpdateCommand = "UPDATE tbl_eventActions SET evAction_fileEvidence='" + fileUpload.FileName + "', stat_id=" + estatus + ",evAction_closeDate='"+cierre+"' WHERE evAction_id=" + RowID;
                evActionsData.Update();
                grv_acciones.EditIndex = -1;
                grv_acciones.DataBind();
            }
            else 
            {
                
                Label8.Text = "Usuario no autorizado";
            }
        }

        protected void btnSubirArchivo_Click(object sender, EventArgs e)
        {
            //btnSubirArchivo
        }

        protected void txt_folio_TextChanged(object sender, EventArgs e)
        {
            tbl_actionPlanTableAdapter acPlan = new tbl_actionPlanTableAdapter();
            int actPlanID = Convert.ToInt32(acPlan.getActIDByFolio(Convert.ToInt32(txt_folio.Text)));
            txt_folio0.Text = actPlanID.ToString();
            acPlan.Dispose();
        }

       /* protected void txt_folio_TextChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(txt_folio.Text))
            {
                tbl_incidentTableAdapter incident = new tbl_incidentTableAdapter();
                DataSet1.tbl_incidentDataTable dtIncident = new DataSet1.tbl_incidentDataTable();
                
                incident.FillByFolio(dtIncident, Convert.ToInt32(txt_folio.Text));

                if (dtIncident.Rows.Count > 0)
                {*/
                    //hdf_incid_id.Value = Convert.ToString(dtIncident.Rows[0]["incident_id"]);

                    /*ddl_gec.SelectedValue = Convert.ToString(dtIncident.Rows[0]["gec_id"]);
                    ddl_turno.SelectedValue = Convert.ToString(dtIncident.Rows[0]["turn_id"]);
                    ddl_eventArea.SelectedValue = Convert.ToString(dtIncident.Rows[0]["area_id"]);
                    ddl_eventClasif.SelectedValue = Convert.ToString(dtIncident.Rows[0]["evClass_id"]);
                    ddl_eventTipo.SelectedValue = Convert.ToString(dtIncident.Rows[0]["event_id"]);
                    ddl_eventPlace.SelectedValue = Convert.ToString(dtIncident.Rows[0]["evPlace_id"]);
                    txt_eventFecha.Text = Convert.ToString(Convert.ToDateTime(dtIncident.Rows[0]["incident_date"]).ToShortDateString());
                    txt_eventHora.Text = Convert.ToString(Convert.ToDateTime(dtIncident.Rows[0]["incident_date"]).ToShortTimeString());
                    txt_eventDesc.Text = Convert.ToString(dtIncident.Rows[0]["incident_desc"]);
                    if (Convert.ToInt32(dtIncident.Rows[0]["evChild_id"]) > 0)
                    {
                        //muestre el panel que contiene el event child y coloque el valor exacto
                        if (Convert.ToInt32(dtIncident.Rows[0]["evGrndChild_id"]) > 0)
                        {
                            //para generar el segundo panel con el valor del evento 
                        }
                    }*/
                    
                    //view_investigationActionsTableAdapter incidentInvest = new view_investigationActionsTableAdapter();
                    //grv_acciones.DataSource = null;
                    //    DataTable dt = new DataTable();
                    //dt = incidentInvest.GetDataIncidentID(Convert.ToInt32(hdf_incid_id.Value));
                    //dt.Columns[0].Caption = "algo";
                    //grv_acciones.DataSource = dt;
                    //grv_acciones.DataBind();
                    //if (Convert.ToInt32(dtIncident.Rows[0]["stat_id"]) != 0)
                    //{
                    //    ddl_estatus.SelectedValue = Convert.ToString(dtIncident.Rows[0]["stat_id"]);
                    //}
                    //else { ddl_estatus.SelectedValue = "6"; }
                    //if (Convert.ToInt32(dtIncident.Rows[0]["stat_id"]) <= 6)
                    //{
                    //    tbc_actionPlan.Visible = false;
                    //}
                    //else
                    //{
                    //    tbc_actionPlan.Visible = true;
                    //}
                /*}
                incident.Dispose();
                dtIncident.Dispose();
            }
            else
            {
                //hdf_incid_id.Value = "0";
                Session["incidente_folio"]="";
            }
        }

        protected void btn_addCausa_Click(object sender, EventArgs e)
        {
            if (Session["myIndex"] != null)
            {
                myIndex = int.Parse(Session["myIndex"].ToString());
            }
            else
            {
                myIndex = 0;
            }
            if (Session["dtCauses"] != null)
            {
                dtCauses = Session["dtCauses"] as DataTable;
            }
            else
            {
                dtCauses.Clear();
                dtCauses.Columns.Add("Tipo_Causa");
                dtCauses.Columns.Add("Causa");
                dtCauses.Columns.Add("Evidencia");
                dtCauses.Columns.Add("Index");
            }
            if (Session["myItemsCount"] != null)
            {
                myItemsCount = int.Parse(Session["myItemsCount"].ToString());
            }
            else
            {
                myItemsCount = 0;
            }
            DataRow myDataRow = dtCauses.NewRow();
            string rutaArchivo="";
            if (fup_evidencia.HasFile)
            {
                string filename = Path.GetFileName(fup_evidencia.FileName);
                //string filename = Path.GetFileName(FileUploadControl.FileName);
                fup_evidencia.SaveAs(Server.MapPath("~/uploaded/") + filename);
                //Label1.Text = Server.MapPath("~/uploaded/") + filename;
                rutaArchivo = Server.MapPath("~/uploaded/") + filename;
            }
            myDataRow["Index"] = myIndex;
            myDataRow["Tipo_Causa"] = ddl_tipoCausa.SelectedValue;
            myDataRow["Causa"] = ddl_causa.SelectedValue;
            myDataRow["Evidencia"] = rutaArchivo;
            dtCauses.Rows.Add(myDataRow);
            myIndex++;
            myItemsCount++;
            if (myItemsCount > 0)
            {
                //grv_causasAdd.DataSource = null;
                //grv_causasAdd.DataSource = dtCauses;
                //grv_causasAdd.DataBind();
            }
            Session["myIndex"] = myIndex;
            Session["dtCauses"] = dtCauses;
            Session["myItemsCount"] = myItemsCount;

            lbl_fileStatus.Text = "";
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            //creamos la instancia para la tabla extraida del dataset XSD
            tbl_incidentInvTableAdapter investig = new tbl_incidentInvTableAdapter();
            tbl_actionPlanTableAdapter actioPlanAdapter = new tbl_actionPlanTableAdapter();
            
            //try
            //{
            int actionType = Convert.ToInt32( ddl_actType.SelectedValue);
            string actionDesc = txt_acciones.Text; 
            int controlType = Convert.ToInt32( ddl_ctrlType.SelectedValue);
            int responsable = Convert.ToInt32(ddl_resp.SelectedValue);
            DateTime compDate = Convert.ToDateTime(txt_fechaComp.Text);
            bool closed = chk_complete.Checked;
            //int incidentID = Convert.ToInt32(hdf_incid_id.Value);
            int incidentID = Convert.ToInt32(txt_folio.Text );
            int actPlanID = 0;
            
            //una vez generado el registro de incidente vamos a buscar el ID para relacionar empleados y acciones inmediatas
            int invetigation_id = Convert.ToInt32(investig.invIDByIncident(incidentID));

            //buscamos una inv que tenga action plan! y de ser 0 no sin rows creamos uno nuevo
            if (invetigation_id != 0)
            {
                actPlanID = Convert.ToInt32( investig.actionPlanByInvID(invetigation_id)); 
            }
            
            //if (hdf_acciones.Value == "0")
            if ("0" == "0")
            {
                if (actPlanID == 0)
                {
                actPlanID = Convert.ToInt32(actioPlanAdapter.maxActID());
                actPlanID++;
                //Primero creamos el plan de acciones y posteriormente lo ligamos 
                actioPlanAdapter.Insert(actPlanID, "", null, 9, 1);
                }
                
                //metodo para insertar la información. De momento se toma todo tal cual de los campos
                int resIncidentInv = investig.Insert(actionType, actionDesc, controlType, responsable, compDate, closed, false, Convert.ToInt32(Session["userID"]), "", null, 5, incidentID, actPlanID, null);
                //una vez generado el 
                invetigation_id = Convert.ToInt32(investig.invIDByIncident(incidentID));
            }
            else
            {
                string closedDate = "";
                if (chk_complete.Checked)
                {
                    closedDate = DateTime.Now.ToShortDateString();
                    //DateTime fechaCompromiso = Convert.ToDateTime( investig.fechaCompromisoByInvID(Convert.ToInt32(hdf_acciones.Value)));
                    int estatus = 0;*/
                    //if (Convert.ToDateTime(closedDate) > fechaCompromiso) { estatus = 3; } else { estatus = 2; }
                    /*int resIncidentInv = investig.Update(actionType, actionDesc, controlType, responsable, compDate, closed, false, Convert.ToInt32(Session["userID"]), "", null, estatus, incidentID,
                        actPlanID, Convert.ToDateTime(closedDate), Convert.ToInt32(hdf_acciones.Value));
                */
                //}
                //else
                //{
                //    closedDate = null;
                    /*int resIncidentInv = investig.Update(actionType, actionDesc, controlType, responsable, compDate, closed, false, Convert.ToInt32(Session["userID"]), "", null, 5, incidentID,
                        actPlanID, null, Convert.ToInt32(hdf_acciones.Value));*/
        //        }
        //    }
        //        if (Session["dtCauses"] != null)
        //        {
        //            //Si existen empleados cargamos la tabla en una vatiable temporal
        //            dtCauses = Session["dtCauses"] as DataTable;
        //            //revisamos nuevamente que tenga registros
        //            if (dtCauses.Rows.Count > 0)
        //            {
        //                //Creamos la instacia del adaptador para empleados en el evento para insertar
        //                tbl_incidentInvDtlTableAdapter investigDtl = new tbl_incidentInvDtlTableAdapter();

        //                //tomando la variable temporal de la tabla de los empleados, hacemos el recorrido para insertar todos
        //                foreach (DataRow myRow in dtCauses.Rows)
        //                {
        //                    int resCause = investigDtl.Insert(invetigation_id, Convert.ToInt32(myRow["Causa"]),
        //                        Convert.ToInt32(myRow["Tipo_Causa"]), "", null);
        //                }
        //                investigDtl.Dispose();
        //            }
        //        }
        //        //enviarCorreo();
        //        grv_acciones.DataBind();
        //        limpiarCamposAcciones();
        //        limpiarCamposCausas();
        //        hdf_ok_ModalPopupExtender.Show();
        //        investig.Dispose();
        //        actioPlanAdapter.Dispose();
        //}

        //protected void btnActualiza_Click(object sender, EventArgs e)
        //{

        //}

        //protected void grv_acciones_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    //hdf_acciones.Value = Convert.ToString( grv_acciones.SelectedRow.Cells[9].Text);
        //    txt_acciones.Text = Convert.ToString(grv_acciones.SelectedRow.Cells[9].Text);
        //    //int invID = Convert.ToInt32(hdf_acciones.Value);
        //    tbl_incidentInvTableAdapter actions = new tbl_incidentInvTableAdapter();
        //    DataSet1.tbl_incidentInvDataTable dtInvestig = new DataSet1.tbl_incidentInvDataTable();
        //    //actions.FillByInvID(dtInvestig, Convert.ToInt32(invID));
        //    ddl_actType.SelectedValue = Convert.ToString(dtInvestig.Rows[0]["actType_id"]);
        //    ddl_ctrlType.SelectedValue = Convert.ToString(dtInvestig.Rows[0]["crtlType_id"]);
        //    ddl_resp.SelectedValue = Convert.ToString(dtInvestig.Rows[0]["resp_id"]);
        //    txt_acciones.Text = Convert.ToString(dtInvestig.Rows[0]["inv_actions"]);
        //    txt_fechaComp.Text = Convert.ToString(dtInvestig.Rows[0]["inv_compromiseDate"]);
        //    chk_complete.Checked = Convert.ToBoolean( dtInvestig.Rows[0]["inv_complete"]);
        //}

        //protected void btn_nuevo_Click(object sender, EventArgs e)
        //{
        //    limpiarCamposAcciones();
        //}

        //private void limpiarCamposAcciones()
        //{
        //    //hdf_acciones.Value = "0";
        //    txt_acciones.Text = "";
        //    ddl_actType.SelectedValue = "0";
        //    ddl_ctrlType.SelectedValue = "0";
        //    ddl_resp.SelectedValue = "0";
        //    txt_fechaComp.Text = "";
        //    chk_complete.Checked = false;
        //}
        //private void limpiarCamposCausas()
        //{
        //    ddl_tipoCausa.SelectedValue = "0";
        //    ddl_causa.SelectedValue = "0";
        //    txt_fechaComp.Text = "";
        //    //grv_causasAdd.DataSource = null;
        //    //grv_causasAdd.DataBind();
        //}

        //private void usuario()
        //{
        //    btn_addCausa.Enabled = false;
        //    btn_nuevo.Enabled = false;
        //    btn_save.Enabled = false;
        //    //ddl_estatus.Enabled = false;

        //}

        //private void enviarCorreo()
        //{
        //    using (tbl_userInfoTableAdapter usrInfo = new tbl_userInfoTableAdapter())
        //    {
        //        using (DataSet1.tbl_userInfoDataTable usrInfoTable = new DataSet1.tbl_userInfoDataTable())
        //        {
        //            usrInfo.FillByUserID(usrInfoTable, Convert.ToInt32(Session["UserID"]));
        //            if (usrInfoTable.Rows[0]["usrInfo_name"].ToString() != "")
        //            {
        //                string bodytext;
        //                bodytext = "\nSe ha generado una nueva acción de investigación del incidente con folio : " + lbl_folio.Text + "\n";
        //                bodytext = bodytext + "Tipo de acción: " + txt_eventDesc.Text + "\n";
        //                bodytext = bodytext + "\nAcciones: " + ddl_eventClasif.SelectedItem.Text.ToString() + "\n";
        //                bodytext = bodytext + "Fecha compromiso (formato aaaa-mm-dd): " + txt_eventFecha.Text.ToString() + "\n";
        //                bodytext = bodytext + "Tipo de control: " + ddl_eventArea.SelectedItem.Text.ToString() + "\n";

        //                //string to = Convert.ToString(usrInfoTable.Rows[0]["usrInfo_email"]) + ";";
        //                string[] correos = { "", "" };// = { "fernando.reyes@aspenlatam.com", "karla.chavez@aspenlatam.com" };
        //                correos[0] = "" + Convert.ToString(usrInfoTable.Rows[0]["usrInfo_email"]) + "";
        //                usrInfo.FillByUserID(usrInfoTable, Convert.ToInt32(ddl_resp.SelectedValue));
        //                correos[1] = usrInfoTable.Rows[0]["usrInfo_email"].ToString();
        //                //using (tbl_responsablesTableAdapter jefe = new tbl_responsablesTableAdapter())
        //                //{
        //                //    using (DataSet1.tbl_responsablesDataTable dtjefe = new DataSet1.tbl_responsablesDataTable())
        //                //    {
        //                //        using (tbl_userTableAdapter usr = new tbl_userTableAdapter())
        //                //        {
        //                //            int resp = Convert.ToInt32(usr.respIDByUserID(Convert.ToInt32(Session["UserID"])));

        //                //            jefe.FillByRespID(dtjefe, resp);
        //                //            correos[1] = Convert.ToString(dtjefe.Rows[0]["resp_email"]);
        //                //        }
        //                //    }
        //                //}

        //                f.enviarCorreo("Fernando Reyes", correos, Convert.ToString(usrInfoTable.Rows[0]["usrInfo_name"]), bodytext, "Generación de acciones para investigación " );
        //            }
        //        }
        //    }
        //}

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    tbl_incidentTableAdapter incindetAdap = new tbl_incidentTableAdapter();
        //    DateTime fechaEvento = Convert.ToDateTime(txt_eventFecha.Text + " " + txt_eventHora.Text);
        //    //incindetAdap.updateApprove(txt_eventDesc.Text, fechaEvento, ddl_turno.SelectedValue, ddl_eventArea.SelectedValue,
        //    //    ddl_eventTipo.SelectedValue, 0, 0, ddl_eventPlace.SelectedValue, txt_folio.Text, 0, ddl_eventClasif.SelectedValue, Convert.ToInt32(hdf_incid_id.Value));
        //    tbl_incidentTableAdapter incid = new tbl_incidentTableAdapter();
        //    incid.updateApprove(txt_eventDesc.Text,fechaEvento, Convert.ToInt32( ddl_turno.SelectedValue), Convert.ToInt32(ddl_eventArea.SelectedValue),
        //        Convert.ToInt32(ddl_eventTipo.SelectedValue), 0, 0, Convert.ToInt32(ddl_eventPlace.SelectedValue),
        //        Convert.ToDecimal(txt_folio.Text), Convert.ToInt32(ddl_eventClasif.SelectedValue), Convert.ToInt32(ddl_estatus.SelectedValue), Convert.ToInt32(hdf_incid_id.Value));
        //}
    }
}