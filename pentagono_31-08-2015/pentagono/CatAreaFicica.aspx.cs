using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pentagono
{
    public partial class CatAreaFicica : System.Web.UI.Page
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            HiddenField1.Value = "1";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            try
            {
                if (NoAreaFi.Text != "")//actualizar 
                {
                    pent.pentagSQL bd = new pent.pentagSQL();
                    bd.updateCatAreaFisc(Nombre.Text, RadioButtonList1.SelectedValue.ToString(), AreaFun.SelectedValue.ToString(), NoAreaFi.Text, ConnectionString);
                    //Response.Write("<script>alert('Guardado Correctamente');</script>");
                    HiddenField1.Value = "0";
                    Response.Redirect("CatAreaFicica.aspx");
                }
                else
                {//guardar nuevo

                    pent.pentagSQL bd = new pent.pentagSQL();
                    bd.InsertCatAreaFisc(Nombre.Text, RadioButtonList1.SelectedValue.ToString(), AreaFun.SelectedValue.ToString(), ConnectionString);
                    Response.Redirect("CatAreaFicica.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('ocurrio un error contacte con el administrador del sistema');</script>");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton lab = (LinkButton)sender;
            GridViewRow row = (GridViewRow)lab.NamingContainer;

            Label LbAreaFis = row.FindControl("NoAreaFis") as Label;
            NoAreaFi.Text = LbAreaFis.Text;

            Label LbNombre = row.FindControl("NomArea") as Label;
            Nombre.Text = LbNombre.Text;

            CheckBox Activo = row.FindControl("Activo") as CheckBox;
            if (Activo.Checked == true)
            {
                RadioButtonList1.SelectedValue = "1";
            }
            else
            {
                RadioButtonList1.SelectedValue = "0";
            }
            Label LbArea = row.FindControl("AreaId") as Label;
            AreaFun.SelectedValue = LbArea.Text;
            HiddenField1.Value = "1";
        }
    }
}