using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pentagono
{


    public partial class CatCausas : System.Web.UI.Page
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

                Label LbArea = row.FindControl("IdCausas") as Label;
                NoCausa.Text = LbArea.Text;

                Label LbCausa = row.FindControl("Causa") as Label;
                Nombre.Text = LbCausa.Text;

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

        protected void Button2_Click(object sender, EventArgs e)
        {

            try
            {
                if (NoCausa.Text != "")//actualizar 
                {
                    pent.pentagSQL bd = new pent.pentagSQL();
                    bd.updateCatcausas(Nombre.Text, RadioButtonList2.SelectedValue, NoCausa.Text, ConnectionString);
                  
                    HiddenField1.Value = "0";
                    Response.Redirect("CatCausas.aspx");
                }
                else
                {//guardar nuevo

                    pent.pentagSQL bd = new pent.pentagSQL();
                    bd.InsertCatCatcausas(Nombre.Text, RadioButtonList2.SelectedValue, ConnectionString);
                    Response.Redirect("CatCausas.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('ocurrio un error contacte con el administrador del sistema');</script>");
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            NoCausa.Text = "";
            Nombre.Text = "";
            HiddenField1.Value = "1";
        }
    }


    }
