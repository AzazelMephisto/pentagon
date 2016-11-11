using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pentagono
{
    public partial class CatAspects : System.Web.UI.Page
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
                LinkButton lab = (LinkButton)sender;
                GridViewRow row = (GridViewRow)lab.NamingContainer;

                Label ASpectoIdentificador = row.FindControl("AspectId") as Label;
                AspectID.Text = ASpectoIdentificador.Text;

                Label FormatLb = row.FindControl("FormatId") as Label;
                Formatos.SelectedValue = FormatLb.Text;
                
                Label AspectElementLb = row.FindControl("Aspec") as Label;
                Elemento.Text = AspectElementLb.Text;

                Label ElementRevLb = row.FindControl("AspectRev") as Label;
                AspectRev.Text = ElementRevLb.Text;

                Label SecuensiaLb = row.FindControl("Secuen") as Label;
                AspSec.Text = SecuensiaLb.Text;

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
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (AspectID.Text != "")//actualizar 
                {
                    pent.pentagSQL bd = new pent.pentagSQL();
                    bd.updateCatAspect(Elemento.Text, AspectRev.Text, RadioButtonList1.SelectedValue, AspectID.Text,ConnectionString);

                    HiddenField1.Value = "0";
                    Response.Redirect("CatAspects.aspx");
                }
                else
                {//guardar nuevo

                    pent.pentagSQL bd = new pent.pentagSQL();
                    bd.InsertCatCatAspect(Formatos.SelectedValue,Elemento.Text,AspectRev.Text,RadioButtonList1.SelectedValue,ConnectionString);
                    Response.Redirect("CatAspects.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('ocurrio un error contacte con el administrador del sistema');</script>");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            AspectID.Text = "";
            Formatos.SelectedValue = "0";
            Elemento.Text = "";
            AspectRev.Text = "";
            AspSec.Text = "";
            HiddenField1.Value = "1";
        }
    }
}