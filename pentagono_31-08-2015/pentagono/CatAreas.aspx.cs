using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pentagono
{
    public partial class CatAreas : System.Web.UI.Page
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
           
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (NoArea.Text != "")//actualizar 
                {
                    pent.pentagSQL bd = new pent.pentagSQL();
                    bd.updateCatArea(Nombre.Text, RadioButtonList2.SelectedValue.ToString(), NoArea.Text, ConnectionString);
                    //Response.Write("<script>alert('Guardado Correctamente');</script>");
                    HiddenField1.Value = "0";
                    Response.Redirect("CatAreas.aspx");
                }
                else
                {//guardar nuevo

                    pent.pentagSQL bd = new pent.pentagSQL();
                    bd.InsertCatArea(Nombre.Text, RadioButtonList2.SelectedValue.ToString(), ConnectionString);
                    Response.Redirect("CatAreas.aspx");
                }
            }
            catch (Exception ex) {
                Response.Write("<script>alert('ocurrio un error contacte con el administrador del sistema');</script>");
            }

        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            if (!(sender == null))
            {

                LinkButton lab = (LinkButton)sender;
                GridViewRow row = (GridViewRow)lab.NamingContainer;

                Label LbArea = row.FindControl("Area1") as Label;
                NoArea.Text = LbArea.Text;

                Label LbNombre = row.FindControl("Nombre1") as Label;
                Nombre.Text = LbNombre.Text;

                CheckBox Activo = row.FindControl("Activo1") as CheckBox;
                if (Activo.Checked == true)
                {
                    RadioButtonList2.SelectedValue = "1";
                }
                else
                {
                    RadioButtonList2.SelectedValue = "0";
                }
                HiddenField1.Value = "1";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            NoArea.Text = "";
            Nombre.Text = "";
            HiddenField1.Value = "1";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}