using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pentagono.DataSet1TableAdapters;

namespace pentagono
{
    public partial class dash_incidentes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] == null)
            {
                Response.Redirect("login.aspx?pag=dash-incidentes");
            }
            else
            {
                if (Convert.ToInt32(Session["userRol"]) <= 3)
                {
                    grv_incidents.Visible = false;
                    grv_incidents0.Visible = true;
                }
                else
                {
                    grv_incidents.Visible = true;
                    grv_incidents0.Visible = false;
                }
            }
        }

        protected void incidentesData_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            //using (tbl_userTableAdapter users = new tbl_userTableAdapter())
            //{
            //    int resp = Convert.ToInt32(users.respIDByUserID(Convert.ToInt32(Session["UserID"])));
            //    e.InputParameters["Param1"] = resp;
            //}
            
        }

        public string formatoEstatus(int estatus)
        {
            //string color = "label";
            //if (estatus.Equals("Aprobada"))
            //{
            //    color = "label label-success";
            //}
            //else if (estatus.Equals("Revisión"))
            //{
            //    color = "label label-primary";
            //}
            //else if (estatus.Equals("Rechazada"))
            //{
            //    color = "label label-danger";
            //}
            string color = "label";
            if(estatus == 7)
            {
                color = "label label-success";
            }else if (estatus == 6)
            {
                color = "label label-primary";
            }
            else if (estatus == 8)
            {
                color = "label label-danger";
            }
            else if (estatus == 10)
            {
                color = "label label-danger";
            }
            else if (estatus == 11)
            {
                color = "label label-success";
            }
            else if (estatus == 9)
            {
                color = "label label-primary";
            }

            return color;
        }

   }
}