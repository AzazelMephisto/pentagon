using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pentagono
{
    public partial class CatProcesos : System.Web.UI.Page
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

                Label ProcesoId = row.FindControl("VP_ID") as Label;
                ProcesID.Text = ProcesoId.Text;

                Label LbNombre = row.FindControl("Desc") as Label;
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
                //Nombre.Text = LbNombre.Text;

                HiddenField1.Value = "1";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (ProcesID.Text != "")//actualizar 
                {
                    pent.pentagSQL bd = new pent.pentagSQL();
                    bd.updateCatProceso(Nombre.Text, RadioButtonList1.SelectedValue, AreaFun.SelectedValue, ProcesID.Text,ConnectionString);
                    //Response.Write("<script>alert('Guardado Correctamente');</script>");
                    HiddenField1.Value = "0";
                    Response.Redirect("CatProcesos.aspx");
                }
                else
                {//guardar nuevo

                    pent.pentagSQL bd = new pent.pentagSQL();
                    bd.InsertCatProceso(Nombre.Text, RadioButtonList1.SelectedValue, AreaFun.SelectedValue, ConnectionString);
                    Response.Redirect("CatProcesos.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('ocurrio un error contacte con el administrador del sistema');</script>");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            ProcesID.Text = "";
            Nombre.Text = "";
            AreaFun.SelectedValue = "0";
            HiddenField1.Value = "1";
        }
    }
}