using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pent;

namespace pentagono
{
    public partial class vos : System.Web.UI.Page
    {
        pentagSQL bd = new pentagSQL();
        private string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["pentagonov2ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                pent.pentagSQL pentSQL = new pent.pentagSQL();
                string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["pentagonov2ConnectionString"].ConnectionString;
                if (Session["userID"] == null)
                {
                    //string url = Request.RawUrl;
                    Response.Redirect("login.aspx?pag=vos");
                }
                txt_viewer.Text = Session["userName"].ToString();
                area_nameLabel.Text = pentSQL.getUsersAreaDesc(Session["Area"].ToString(),ConnectionString);
                AreaId.Text = Session["Area"].ToString();
            }
            txt_fecha.Text = DateTime.Today.ToShortDateString();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //ddl_proc.SelectedIndex = 2;
        }

        protected void btn_save_Click(object sender, EventArgs e)
        {
            try
            {
                string areaId = Session["Area"].ToString();
                string proc = ddl_proc.SelectedValue;
                string viewer = Session["userID"].ToString();
                string date = txt_fecha.Text;
                string place = txt_place.Text;

               
                string vId = bd.insrVos(areaId, viewer, date, proc, place, ConnectionString);
                string temp = bd.generaActionPlan(vId, 14, ConnectionString);               
                foreach (GridViewRow row in grv_vos.Rows)
                {
                    

                     RadioButtonList rdb_obs = row.FindControl("SI1") as RadioButtonList;
                     string Retro = rdb_obs.SelectedValue;

                    RadioButtonList observacion = row.FindControl("OBS1") as RadioButtonList;
                    string valObs = observacion.SelectedValue;
                    //if (test == "SI")
                    //{
                    //    test = "1";
                    //}
                    //else {
                    //    test = "0";
                    //}
                    TextBox Coment = row.FindControl("Comentario1") as TextBox;
                    string comentarios = Coment.Text;
                    Label noPregunta = row.FindControl("L1") as Label;
                    string preguntaNumero = noPregunta.Text;


                    bd.insrVosDtl(vId, preguntaNumero, valObs, Retro, comentarios, ConnectionString);
                }
                //bd.insrVos(areaId,viewer,date,proc,place,ConnectionString);
                Response.Redirect("dash-vos.aspx");
                //Response.Redirect("login.aspx?pag=vos");


            }
            catch(Exception ex)
            {

            }
       }
    }
}