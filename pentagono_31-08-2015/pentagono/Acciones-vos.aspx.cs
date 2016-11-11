using pentagono.DataSet1TableAdapters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pentagono
{
    public partial class Acciones_vos : System.Web.UI.Page
    {
        private string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["pentagonov2ConnectionString"].ConnectionString;
     
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["userID"] == null)
                {
                    //string url = Request.RawUrl;
                    Response.Redirect("login.aspx?pag=vos");
                }

            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (!(sender == null))
            {
            
                pent.pentagSQL bd = new pent.pentagSQL();
                LinkButton lab = (LinkButton)sender;
                GridViewRow row = (GridViewRow)lab.NamingContainer;
                //FileUpload fupEv = (FileUpload)row.FindControl("V_ID1");
                Label rdb_obs = row.FindControl("V_ID1") as Label;
                string auxString = rdb_obs.Text;              
                vosID.Text = rdb_obs.Text;
                Panel1.Visible = true;
                int temp = bd.getActionPlan("14", auxString, ConnectionString);//pendiente########
                AcPlan.Text = temp.ToString();
                //SqlDataSource1.SelectParameters["vosId"].DefaultValue = rdb_obs.Text;
                GridView2.Visible = false;

            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {

            tbl_eventActionsTableAdapter Actions = new tbl_eventActionsTableAdapter();
            int actType = Convert.ToInt32(ddl_actType.SelectedValue);
            int ctrlType = Convert.ToInt32(ddl_ctrlType.SelectedValue);
            DateTime fechaComp = Convert.ToDateTime(txt_fechaComp.Text);
            int folio = Convert.ToInt32(vosID.Text);
            int resp = Convert.ToInt32(ddl_resp.SelectedValue);
            int actionPlanID = Convert.ToInt32(AcPlan.Text);

            Actions.Insert(actType, txt_acciones.Text, ctrlType, resp, fechaComp, null, "", 5, folio, actionPlanID);
            //SqlDataSource2.SelectParameters["ActPlan"].DefaultValue = AcPlan.Text;
           
            Response.Write("<script>alert('Guardado Correctamente');</script>");
            Panel1.Visible = false;

            ddl_actType.SelectedValue = "0";
            ddl_ctrlType.SelectedValue = "0";
            txt_fechaComp.Text = "";
            ddl_resp.SelectedValue = "0";
            txt_acciones.Text = "";



        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (!(sender == null))
            {

                pent.pentagSQL bd = new pent.pentagSQL();
                LinkButton lab = (LinkButton)sender;
                GridViewRow row = (GridViewRow)lab.NamingContainer;
                //FileUpload fupEv = (FileUpload)row.FindControl("V_ID1");
                Label rdb_obs = row.FindControl("V_ID1") as Label;
                string auxString = rdb_obs.Text;
                vosID.Text = rdb_obs.Text;
                //Panel1.Visible = true;
                int temp = bd.getActionPlan("14", auxString, ConnectionString);//pendiente########           
                SqlDataSource2.SelectParameters["ActPlan"].DefaultValue = temp.ToString();


            }
        }

        protected void Detalle_Click(object sender, EventArgs e)
        {
            GridView2.Visible = true;
            pent.pentagSQL bd = new pent.pentagSQL();
            LinkButton lab = (LinkButton)sender;
            GridViewRow row = (GridViewRow)lab.NamingContainer;
            //FileUpload fupEv = (FileUpload)row.FindControl("V_ID1");
            Label rdb_obs = row.FindControl("V_ID1") as Label;
            string auxString = rdb_obs.Text;
            vosID.Text = rdb_obs.Text;
            int temp = bd.getActionPlan("14", auxString, ConnectionString);//pendiente########  
            GridView2.DataBind();   //OJO instruccion para eliminar cache del grid      
            SqlDataSource2.SelectParameters["ActPlan"].DefaultValue = temp.ToString();
           
        }
    }
}