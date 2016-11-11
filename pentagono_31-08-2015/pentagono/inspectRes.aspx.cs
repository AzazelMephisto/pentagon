using System;
using System.Data;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pent;

namespace pentagono
{
    public partial class inspectRes : System.Web.UI.Page
    {
        private string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["pentagonov2ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                if (Session["userID"] == null)
                {
                    //string url = Request.RawUrl;
                    Response.Redirect("login.aspx?pag=inspectRes");
                }
                pentagSQL bd = new pentagSQL();
                string estatus = bd.getStatus(Request.QueryString["inspectID"],"tbl_inspect","inspect_id",ConnectionString);
                string formato = bd.getFormatByInspectID(Request.QueryString["inspectID"], ConnectionString);
                Label1.Text = "Folio: " + Request.QueryString["inspectID"] + "       Formato: " + formato;

                if(estatus == "6")
                {
                    btn_guardar.Visible = true;
                    if(Convert.ToInt32(Session["userRol"]) <= 3)
                    {
                        btn_revisado.Visible = true;
                    }
                }else if (Convert.ToInt32(Session["userRol"]) <= 2 && estatus == "12")
                {
                    btn_approve.Visible = true;
                }
                if (estatus == "7")
                {
                    frv_acciones.Visible = false;
                    grv_inspectDtl.Enabled = false;
                }
                if(string.IsNullOrEmpty( Request.QueryString["inspectID"]))
                {
                    pnl_botones.Visible = false;
                    frv_acciones.Visible = false;
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            funcPDF pdf = new funcPDF();
            //pdf.PDF(@"C:\Users\REYESFE\Documents\Visual Studio 2015\Projects\pentagono_31-08-2015\pentagono\pdf\inspects");
            string directServer = Server.MapPath("~");
            string nombreArchico = "inspección-" + Request.QueryString["inspectID"] + ".pdf";
            try
            {
                pdf.PDF(directServer + @"\pdf\inspects\" + nombreArchico, directServer + @"\Resources\Logo_Aspen.jpg",Request.QueryString["inspectID"],directServer+@"\Resources\");
                //pdf.PDF("pdf/inspects/" + nombreArchico, "Resources/Logo_Aspen.jpg", Request.QueryString["inspectID"], "Resources/");
            }
            catch(Exception ex)
            {

            }
            string pageurl = "~/pdf/inspects/" + nombreArchico;
            //Response.Redirect(ResolveUrl(pageurl));
            //Response.Write("<script>");
            //Response.Write(String.Format("window.open('{0}','_blank')", ResolveUrl(pageurl)));
            //Response.Write("</script>");
            string pageurljavas = "pdf/inspects/" + nombreArchico;
            Response.Write("<script>");
            Response.Write("window.open('" + pageurljavas + "')");
            Response.Write("<" + "/script>");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            /***** 
                Aqui hace falta agregar una condición en caso de que todo sea correcto, no hace falta acciones 
            ******/
            //if(grv_actions.Rows.Count>0)
            //{
                funciones funcMail = new funciones();
                pentagSQL bd = new pentagSQL();
                DataTable dtUsers = new DataTable();
                string inspectID = Request.QueryString["inspectID"];
                string planID = Request.QueryString["actPlanID"];
                string horaFecha = DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
                //string supervisor = bd.getSingleValueByID("sup_username", Session["userName"].ToString(), "tbl_inspect", "usr_username", ConnectionString);
                string supervisor = bd.getSingleValueByID("sup_username", inspectID, "tbl_inspect", "inspect_id", ConnectionString);
                string correoSupervisor = bd.getEmailByUserName(supervisor, ConnectionString);
                string[] correos = { correoSupervisor };
                string[] cc = { Session["email"].ToString() };
                string bodytext = ""; 
                int i = 0;

                //cuerpoCorreo 
                bodytext = "Esitmad@: <br /><br />";
                bodytext = bodytext + "<br />Por medio del presente se le notifica que la inspección con Folio:" + inspectID + " fue realizada!<br /><br />";
                bodytext = bodytext + "Por favor, se le solicita su revisión y visto bueno para la misma<br />";
                bodytext = bodytext + "<br />";
                bodytext = bodytext + "\nPara más información, haga clic en el siguiente enlace. <a href='http://10.240.151.139/pentagono/inspectRes.aspx?inspectID=" + inspectID + "&actPlanID=" + planID + "'>Clic aqui</a>";
                btn_guardar.Enabled = false;

                //Aqui manda el correo electrónico para avisar que se terminó de documentar
                funcMail.enviarCorreo("Aspen App Web", correos, cc, "Supervisor", bodytext, "Inspección realizada");

                //Agregar código para la bitacora de seguimiento
                bd.insertBitacora(horaFecha, "Inspección actualizada", "Inspección realizada por: " + Session["userName"], "inspects", inspectID, planID, Session["userName"].ToString(), "1", ConnectionString);

                Response.Redirect("dash-inspect.aspx");
            //}
            /*else
            {
                lbl_err.Text = "Es necesario que defina por lo menos una acción";
            }*/

            
        }

        protected void btn_approve_Click(object sender, EventArgs e)
        {
            pentagSQL bd = new pentagSQL();
            funciones funcMail = new funciones();
            DataTable dtUsers = new DataTable();
            DataTable dtUserCreate = new DataTable();
            string inspectID = Request.QueryString["inspectID"];
            string planID = Request.QueryString["actPlanID"];
            string horaFecha = DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");
            string userCreate = bd.getSingleValueByID("usr_username", inspectID, "tbl_inspect", "inspect_id", ConnectionString);
            string userCreateMail = bd.getEmailByUserName(userCreate, ConnectionString);
            string areaID = bd.getSingleValueByID("area_id", inspectID, "tbl_inspect", "inspect_id", ConnectionString);
            dtUsers = bd.getUsersByArea(areaID, ConnectionString);
            string[] correos = { userCreateMail };
            string[] cc = new string[dtUsers.Rows.Count];
            string bodytext = "";
            bd.updateStatus("7", Request.QueryString["inspectID"], ConnectionString);
            int i = 0;
            //Correo para mandar
            foreach (DataRow row in dtUsers.Rows)
            {
                //tomamos los correos de todos los encargados del area
                cc[i] = row["usrInfo_email"].ToString();
                i++;
            }
            //cc[i] = userCreateMail;
            //cuerpoCorreo 
            bodytext = "Esitmad@: <br /><br />";
            bodytext = bodytext + "<br />Por medio del presente se le notifica que la inspección con Folio:" + inspectID + " fue aprobada!<br /><br />";
            bodytext = bodytext + "Por favor, se le solicita su revisión y visto bueno para la misma<br />";
            bodytext = bodytext + "<br />";
            bodytext = bodytext + "\nPara más información, haga clic en el siguiente enlace. <a href='http://10.240.151.139/pentagono/inspectRes.aspx?inspectID=" + inspectID + "&actPlanID=" + planID + "'>Clic aqui</a>";
            bodytext = bodytext + "<br />";
            bodytext = bodytext + "Saludos";
            btn_approve.Enabled = false;
            //Aqui manda el correo electrónico para avisar que se terminó de documentar
            funcMail.enviarCorreo("Aspen App Web", correos, cc, "Supervisor", bodytext, "Inspección aprobada");

            //Agregar código para la bitacora de seguimiento
            bd.insertBitacora(horaFecha, "Inspección aprobada", "La inspección aprobada por: "+Session["userName"], "inspects", inspectID, planID, Session["userName"].ToString(),"1", ConnectionString);

            Response.Redirect("dash-inspect.aspx");
        }

        protected void btn_revisado_Click(object sender, EventArgs e)
        {
            pentagSQL bd = new pentagSQL();
            funciones funcMail = new funciones();
            DataTable dtUsers = new DataTable();
            string inspectID = Request.QueryString["inspectID"];
            string planID = Request.QueryString["actPlanID"];
            string areaID = bd.getSingleValueByID("area_id", inspectID, "tbl_inspect", "inspect_id", ConnectionString);
            dtUsers = bd.getUsersByArea(areaID, ConnectionString);
            string userCreate = bd.getSingleValueByID("usr_username", inspectID, "tbl_inspect", "inspect_id", ConnectionString);
            string userCreateMail = bd.getEmailByUserName(userCreate, ConnectionString);
            string supervisor = bd.getSingleValueByID("sup_username", userCreate, "tbl_inspect", "usr_username", ConnectionString);
            string correoSupervisor = bd.getEmailByUserName(supervisor, ConnectionString);
            string[] correos = new string[dtUsers.Rows.Count + 1];
            string[] cc = { correoSupervisor };
            string bodytext = "";
            string horaFecha = DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss");

            int i = 0;
            foreach (DataRow row in dtUsers.Rows)
            {
                //tomamos los correos de todos los encargados del area
                correos[i] = row["usrInfo_email"].ToString();
                i++;
            }

            //actualizar el estatus
            bd.updateStatus("12", Request.QueryString["inspectID"], ConnectionString);

            //cuerpoCorreo 
            bodytext = "Esitmad@: <br /><br />";
            bodytext = bodytext + "<br />Por medio del presente se le notifica que la inspección con Folio:" + inspectID + " fue revizada!<br /><br />";
            bodytext = bodytext + "Por favor, se le solicita su revisión y visto bueno para la misma<br />";
            bodytext = bodytext + "<br />";
            bodytext = bodytext + "\nPara más información, haga clic en el siguiente enlace. <a href='http://10.240.151.139/pentagono/inspectRes.aspx?inspectID=" + inspectID + "&actPlanID=" + planID + "'>Clic aqui</a>";
            btn_revisado.Enabled = false;

            //Aqui manda el correo electrónico para avisar que se terminó de documentar
            funcMail.enviarCorreo("Aspen App Web", correos, cc, "Supervisor", bodytext, "Inspección revisada");

            //Agregar código para la bitacora de seguimiento
            bd.insertBitacora(horaFecha, "Inspección revisada", "Inspección revisada por: " + Session["userName"], "inspects", inspectID, planID, Session["userName"].ToString(),"1", ConnectionString);

            Response.Redirect("dash-inspect.aspx");
        }

        protected void imb_printPDF_Click(object sender, ImageClickEventArgs e)
        {
            funcPDF pdf = new funcPDF();
            //pdf.PDF(@"C:\Users\REYESFE\Documents\Visual Studio 2015\Projects\pentagono_31-08-2015\pentagono\pdf\inspects");
            string directServer = Server.MapPath("~");
            string nombreArchico = "inspección-" + Request.QueryString["inspectID"] + ".pdf";
            pdf.PDF(directServer + @"\pdf\inspects\" + nombreArchico, directServer + @"\Resources\Logo_Aspen.jpg", Request.QueryString["inspectID"], directServer + @"\Resources\");
            string pageurl = "~/pdf/inspects/" + nombreArchico;
            Response.Redirect(ResolveUrl(pageurl));
            //Response.Write("<script>");
            //Response.Write(String.Format("window.open('{0}','_blank')", ResolveUrl(pageurl)));
            //Response.Write("</script>");
        }

        protected void grv_actions_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            FileUpload fup = grv_actions.Rows[e.RowIndex].FindControl("fup_evAction") as FileUpload;
            Label lbl = grv_actions.Rows[e.RowIndex].FindControl("Label16") as Label;
            string actName = "";
            int RowID = Convert.ToInt32(grv_actions.DataKeys[e.RowIndex].Value);
            if (fup.HasFile)
            {
                string status = "";
                if (Convert.ToDateTime(lbl.Text) < Convert.ToDateTime( DateTime.Today.ToString("dd/MM/yyyy")))
                {
                    status = "3";
                }
                else
                {
                    status = "2";
                }
                actName = "action_" + Request.QueryString["inspectID"]+"_"+e.RowIndex+".jpg";
                fup.SaveAs(Server.MapPath("~/uploaded/actions/"+ actName));
                sds_actions.UpdateParameters["evAction_closeDate"].DefaultValue = DateTime.Today.ToString("dd/MM/yyyy");
                sds_actions.UpdateParameters["stat_id"].DefaultValue = status;
                sds_actions.UpdateParameters["evAction_fileEvidence"].DefaultValue = actName;
                grv_actions.EditIndex = -1;
                grv_actions.DataBind();
            }
        }
        public string campoEvidencia(string ev)
        {
            string texto = "";
            if(!(ev == "[hpl_evidencia]"))
            {
                texto = ev;
            }
            return texto;
        }

        protected void sds_inspDetail_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}