using System;
using System.IO;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pent;

namespace pentagono
{
    public partial class inspects : System.Web.UI.Page
    {
        pentagSQL bd = new pentagSQL();
        private string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["pentagonov2ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page.IsPostBack)
            {
                
            }
            else
            {
                lbl_fecha.Text = DateTime.Today.ToShortDateString();
                //---- Cambiar el username fijo por el username que está logeando ---
                if (Session["userID"] == null)
                {
                    Response.Redirect("login.aspx?pag=inspectRes");
                }
                //lbl_user.Text = Session["user_Name"].ToString();
                string supervisor = bd.getSingleValueByID("sup_username", Session["userName"].ToString(), "tbl_user", "usr_username", ConnectionString);
                    if (!string.IsNullOrEmpty(supervisor))
                    {
                        ddl_supervisor.SelectedValue = supervisor;
                    }
                Session["firstEv"] = "1";
            }
            RegisterPostBackControl();
        }

        protected void btn_end_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow row in grv_inspectDtl.Rows)
                {
                    string obs = "";
                    RadioButton rdb_cumple = row.FindControl("rdb_cumple") as RadioButton;
                    RadioButton rdb_na = row.FindControl("rdb_na") as RadioButton;
                    TextBox txtObs = row.FindControl("txt_evidencia") as TextBox;
                    TextBox txtFile = row.FindControl("txt_file") as TextBox;
                    Label lblAspect = (Label)row.FindControl("Label2");
                    HyperLink hpl = (HyperLink)row.FindControl("hpl_evidencia");
                    GridViewRow rowSelected = (GridViewRow)rdb_cumple.NamingContainer;
                    if(txtObs == null)
                    {
                        obs = "";
                    }
                    else
                    {
                        obs = txtObs.Text;
                    }
                    if (!rdb_na.Checked)
                    {
                        if (rdb_cumple.Checked)
                        {
                            //lblError.Text = "OK! se puede utilizar para evitar errores";
                            bd.insrInspectDtl(Session["inspectID"].ToString(), lblAspect.Text, "1", obs, hpl.Text, ConnectionString);
                        }
                        else
                        {
                            bd.insrInspectDtl(Session["inspectID"].ToString(), lblAspect.Text, "0", obs, hpl.Text, ConnectionString);
                        }
                    }
                }
                string horaFecha = DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
                //*** actualizar la hora de fin de la inspección
                bd.updateInspectHead(horaFecha, Session["inspectID"].ToString(), ConnectionString);
                //*** actulizar el programa para cerrar esta inspección
                bd.updateProgramInspect(horaFecha, Request.QueryString["pID"], ConnectionString);

                string actPl = bd.generaActionPlan(Convert.ToString(Session["inspectID"]), 7, ConnectionString);
                //*** generamos el registro en la bitacora
                bd.insertBitacora(horaFecha, "Inspección finalizada", "", "inspects", Session["inspectID"].ToString(), actPl, Session["userName"].ToString(),"0", ConnectionString);
                //Generar las acciones para los elementos no satisfactorios
                //bd.generaAcciones(Convert.ToString(Session["inspectID"]), actPl, ConnectionString);
                Response.Redirect("dash-inspect.aspx");
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("dash-inspect.aspx");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Button1.Visible = false;
            //string inspID = bd.inspectHead(Request.QueryString["formatID"], ddl_area.SelectedValue,
            //    txt_numEmpleados.Text, "2016-02-23", rbl_recorrido.SelectedValue, Session[""], ConnectionString);
            //ddl_supervisor
            string inspID = bd.inspectHead(Request.QueryString["formatID"], ddl_area.SelectedValue, ddl_areaF.SelectedValue,
                txt_numEmpleados.Text, DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss"), rbl_recorrido.SelectedValue, Convert.ToString(Session["userName"]), Request.QueryString["pID"],ddl_supervisor.SelectedValue, ConnectionString);
            lbl_inicio.Text = DateTime.Now.ToString("HH:mm:ss");
            Session["inspectID"]= inspID;
            btn_end.Visible = true;
        }

        protected void rbl_eval_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            //RadButton mybutton = (RadButton)sender;
            //if (mybutton.Checked)
            //{
            //    string InspQuestion_ID = mybutton.Value;
            //    GridDataItem item = (GridDataItem)mybutton.NamingContainer;
            //    // RadTextBox temptextbox = (RadTextBox)item.FindControl("TextOnNoBox");
            //    // temptextbox.Visible = true;
            //    RadAjaxPanel paneltemp = (RadAjaxPanel)item.FindControl("OptionNoPanel");
            //    paneltemp.Visible = true;
            //    HiddenField itemidHF = (HiddenField)item.FindControl("ItemIDGrid");
            //    string ItemId = itemidHF.Value;
            //}
            //showEvidence((RadioButton)sender);
        }
        private void showEvidence(RadioButton cumple)
        {
            //si es la primera vez que se muestra la evidencia, es importante o necesario que se ejecute 
            //un primer postback completo de la página
            RadioButton radioCumple = (RadioButton)cumple;
            string inspectQuest = radioCumple.GroupName;
            //GridDataItem item = (GridDataItem)mybutton.NamingContainer;
            GridViewRow row = (GridViewRow)radioCumple.NamingContainer;
            UpdatePanel uppEv = (UpdatePanel)row.FindControl("upp_evidencia");
            if ((radioCumple.Checked) && (radioCumple.Text == "No"))
            {
                uppEv.Visible = true;
            }
            else if ((radioCumple.Checked) && (radioCumple.Text == "Si"))
            {
                uppEv.Visible = true;
            }
            FileUpload flUpload = row.FindControl("fup_evidence") as FileUpload;
            //ScriptManager.GetCurrent(this).RegisterPostBackControl(flUpload);
            if (flUpload.HasFile)
            {

            }
        }

        protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
        {
            //RadioButton radioCumple = (RadioButton)sender;
            //GridViewRow row = (GridViewRow)radioCumple.NamingContainer;
            
            //showEvidence((RadioButton)sender);
            ////btn_cargaImagen
            ////ScriptManager.GetCurrent(this).RegisterAsyncPostBackControl(lb);
            //Button btn = (Button)row.FindControl("btn_cargaImagen");
            //ScriptManager.GetCurrent(this).RegisterPostBackControl(btn);

            //if(Session["firstEv"].ToString() == "1")
            //{
            //    Session["firstEv"] = "0";
            //    RegisterPostBackControl();
            //}
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //foreach (GridViewRow row in grv_inspectDtl.Rows)
            //{
            //    //DataRowView rowView = (DataRowView)row.DataItem;
            //    // Retrieve the state value for the current row. 
            //    //string aspect = rowView["aspect_element"].ToString();

            //}
            //funcPDF pdf = new funcPDF();
            ////pdf.PDF(@"C:\Users\REYESFE\Documents\Visual Studio 2015\Projects\pentagono_31-08-2015\pentagono\pdf\inspects");
            //string directServer = Server.MapPath("~");
            //pdf.PDF(directServer+@"\pdf\inspects\"+"prueba1.pdf",directServer+ @"\Resources\Logo_Aspen.jpg", Session["inspectID"].ToString());

        }

        protected void grv_inspectDtl_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            int page = grv_inspectDtl.PageIndex;
            int newpage = e.NewPageIndex;
            if (grv_inspectDtl.PageIndex < e.NewPageIndex)
            {

            }
        }

        public bool checkedYes(string cumple)
        {
            bool correcto = false;
            if (cumple=="1")
            {
                correcto = true;
            }
            return correcto;
        }

        protected void btn_cargaImagen_Click(object sender, EventArgs e)
        {
            if(!(sender==null))
            {
                Button btn = (Button)sender;
                GridViewRow row = (GridViewRow)btn.NamingContainer;
                FileUpload fupEv = (FileUpload)row.FindControl("fup_evidence");
                TextBox txt = (TextBox)row.FindControl("txt_file");
                HyperLink hpl = (HyperLink)row.FindControl("hpl_evidencia");
                //hpl_evidencia
                string filename ="";
                string newName = "";
                if (fupEv.HasFile)
                {
                    filename = Path.GetFileName(fupEv.FileName);
                    string ext = fupEv.FileName.Substring(fupEv.FileName.Length-3, 3);
                    Label lblAspect = (Label)row.FindControl("Label2");
                    newName = "evid_"+ Session["inspectID"].ToString()+"_"+ lblAspect.Text+"."+ ext;
                    //string filename = Path.GetFileName(FileUploadControl.FileName);

                    fupEv.SaveAs(Server.MapPath("~/uploaded/inspects/") + newName);
                }
                hpl.Text = newName;
                hpl.NavigateUrl = "uploaded/inspects/" + newName;
                //txt.Text = filename;
            }
            
        }

        private void RegisterPostBackControl()
        {
            foreach (GridViewRow row in grv_inspectDtl.Rows)
            {
                Button btn = row.FindControl("btn_cargaImagen") as Button;
                ScriptManager.GetCurrent(this).RegisterPostBackControl(btn);
            }
        }

    }
}