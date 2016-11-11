using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pentagono.DataSet1TableAdapters;

namespace pentagono
{
    public partial class my_reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] == null)
            {
                Response.Redirect("login.aspx?pag=my-reports");
            }
            view_incidentesTableAdapter misIncidentes = new view_incidentesTableAdapter();
            //misIncidentes.GetDataByUser
        }
        public string GetImageUrl(int estatus)
        {
            string color = "label";
            if ((estatus == 7) || (estatus == 11))
            {
                color = "label label-success";
            }
            else if ((estatus == 6) || (estatus == 9))
            {
                color = "label label-primary";
            }
            else if ((estatus == 8) || (estatus == 10))
            {
                color = "label label-danger";
            }
            return color;
        }

        public string urlReport()
        {
            string url = "";
            if(Convert.ToInt32( Session["userRol"]) > 3)
            {
                url = "incidDetail.aspx?folio={0}";
            }
            else
            {
                url = "incident.aspx?folio={0}";
            }

            return url;
        }
    }
}