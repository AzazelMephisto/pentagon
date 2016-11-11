using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace pentagono
{
    public partial class dash_inspect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                if (Session["userID"] == null)
                        {
                            Response.Redirect("login.aspx?pag=dash-inspect");
                        }
                if(Convert.ToInt32( Session["userRol"]) > 2)
                {
                    string select = "";
                    if (Convert.ToInt32(Session["userRol"]) == 3 )
                    {

                        select = "SELECT tbl_inspect.inspect_id, tbl_areas.area_name, tbl_formats.format_codigo, tbl_inspect.inspect_date, tbl_inspect.inspect_start, tbl_inspect.usr_username, tbl_actionPlan.actPlan_id, tbl_status.stat_id, tbl_status.stat_desc FROM tbl_inspect INNER JOIN tbl_formats ON tbl_inspect.format_id = tbl_formats.format_id INNER JOIN tbl_areas ON tbl_inspect.area_id = tbl_areas.area_id INNER JOIN tbl_actionPlan ON tbl_inspect.inspect_id = tbl_actionPlan.key1 INNER JOIN tbl_status ON tbl_inspect.stat_id = tbl_status.stat_id WHERE tbl_actionPlan.proc_id=7";
                    }
                    else if (Convert.ToInt32(Session["userRol"]) == 4)
                    {
                        select = "SELECT tbl_inspect.inspect_id, tbl_areas.area_name, tbl_formats.format_codigo, tbl_inspect.inspect_date, tbl_inspect.inspect_start, tbl_inspect.usr_username, tbl_actionPlan.actPlan_id, tbl_status.stat_id, tbl_status.stat_desc FROM tbl_inspect INNER JOIN tbl_formats ON tbl_inspect.format_id = tbl_formats.format_id INNER JOIN tbl_areas ON tbl_inspect.area_id = tbl_areas.area_id INNER JOIN tbl_actionPlan ON tbl_inspect.inspect_id = tbl_actionPlan.key1 INNER JOIN tbl_status ON tbl_inspect.stat_id = tbl_status.stat_id WHERE tbl_actionPlan.proc_id=7 AND tbl_inspect.usr_username='" + Session["userName"] + "' ORDER BY tbl_formats.format_codigo,tbl_inspect.inspect_id DESC";
                    }
                    sds_inspects.SelectCommand = select;
                    GridView1.DataBind();
                }
            }
            
            GridViewHelper helper = new GridViewHelper(this.GridView1);
            helper.RegisterGroup("format_codigo", true, true);
            helper.ApplyGroupSort();
        }
        public string formatoEstatus(int estatus)
        {
            string color = "label";
            if (estatus == 6)
            {
                color = "label label-warning";
            }
            else if (estatus == 7)
            {
                color = "label label-success";
            }
            else if (estatus == 8)
            {
                color = "label label-danger";
            }
            else if (estatus == 10)
            {
                color = "label label-danger";
            }
            else if (estatus == 12)
            {
                color = "label label-primary";
            }

            return color;
        }
    }
}