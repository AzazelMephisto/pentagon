using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pentagono
{
    public partial class CatFormatos : System.Web.UI.Page
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

        protected void LinkButton_Click(object sender, EventArgs e)
        {
            if (!(sender == null))
            {

                LinkButton lab = (LinkButton)sender;
                GridViewRow row = (GridViewRow)lab.NamingContainer;

                Label FormIdLb = row.FindControl("FormatId") as Label;
                FormatID.Text = FormIdLb.Text;

                Label CodigoLB = row.FindControl("Codigo") as Label;

                FrmCodigo.Text = CodigoLB.Text;

                Label frmVerLB = row.FindControl("version") as Label;
                FrmVersion.Text = frmVerLB.Text;

                Label frmRevLb = row.FindControl("FormRev") as Label;
                string aux= frmRevLb.Text;
                aux = aux.Substring(0, 10);
                FrmRev.Text = aux;

                Label FrmNameLB = row.FindControl("Name") as Label;
                FrmNombre.Text = FrmNameLB.Text;

                Label FrmNormaLB = row.FindControl("Norma") as Label;
                FrmNorma.Text = FrmNormaLB.Text;

                HiddenField1.Value = "1";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (FormatID.Text != "")//actualizar 
                {
                    pent.pentagSQL bd = new pent.pentagSQL();
                    bd.updateCatFormats(FrmCodigo.Text, FrmVersion.Text, FrmRev.Text, FrmNombre.Text, FrmNorma.Text, FormatID.Text, ConnectionString);
                    HiddenField1.Value = "0";
                    Response.Redirect("CatFormatos.aspx");
                }
                else
                {//guardar nuevo

                    pent.pentagSQL bd = new pent.pentagSQL();
                    bd.InsertCatFormat(FrmCodigo.Text, FrmVersion.Text, FrmRev.Text, FrmNombre.Text, FrmNorma.Text, ConnectionString);
                    Response.Redirect("CatFormatos.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('ocurrio un error contacte con el administrador del sistema');</script>");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            FormatID.Text = "";
            FrmCodigo.Text ="";
            FrmVersion.Text = "";
            FrmRev.Text = "";
            FrmNombre.Text = "";
            FrmNorma.Text ="";
            HiddenField1.Value = "1";
        }
    }
}