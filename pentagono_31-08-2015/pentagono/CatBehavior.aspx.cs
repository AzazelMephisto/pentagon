using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pentagono
{
    public partial class CatBehavior : System.Web.UI.Page
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
            LinkButton lab = (LinkButton)sender;
            GridViewRow row = (GridViewRow)lab.NamingContainer;

            Label LbAreaFis = row.FindControl("VpId") as Label;
            HiddenField2.Value= LbAreaFis.Text;
            SqlDataSource3.SelectParameters["vp_id"].DefaultValue = LbAreaFis.Text.ToString();
            Button3.Visible = true;
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            LinkButton lab = (LinkButton)sender;
            GridViewRow row = (GridViewRow)lab.NamingContainer;

            Label NumPregunta = row.FindControl("b_id") as Label;
            NoPregunta.Text = NumPregunta.Text;

            Label NumProceso = row.FindControl("ProcesoId") as Label;
            ProcesID.Text = NumProceso.Text;


            Label Pregunta = row.FindControl("Pregunta") as Label;
            Nombre.Text = Pregunta.Text;

            CheckBox Activo = row.FindControl("Activo") as CheckBox;
            if (Activo.Checked == true)
            {
                RadioButtonList1.SelectedValue = "1";
            }
            else
            {
                RadioButtonList1.SelectedValue = "0";
            }
            HiddenField1.Value = "1";

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            NoPregunta.Text = "";
            ProcesID.Text = "";
            Nombre.Text = "";
            HiddenField1.Value = "1";
            ProcesID.Text = HiddenField2.Value;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (NoPregunta.Text != "")//actualizar 
                {
                    pent.pentagSQL bd = new pent.pentagSQL();
                    bd.updateCatBehavior(Nombre.Text, RadioButtonList1.SelectedValue, NoPregunta.Text, ConnectionString);
                    HiddenField1.Value = "0";
                    Response.Redirect("CatBehavior.aspx");
                }
                else
                {//guardar nuevo

                    pent.pentagSQL bd = new pent.pentagSQL();
                    bd.InsertCatBehavior(Nombre.Text, RadioButtonList1.SelectedValue, ProcesID.Text, ConnectionString);
                    Response.Redirect("CatBehavior.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('ocurrio un error contacte con el administrador del sistema');</script>");
            }

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataSource3.SelectParameters["vp_id"].DefaultValue = "0";
            HiddenField2.Value = "";
            Button3.Visible = false;
        }


    }
}