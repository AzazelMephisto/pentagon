using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pentagono
{
    public partial class pdhs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                if (Session["userID"] == null)
                {
                     Response.Redirect("login.aspx?pag=pdhs");
                }
                if (Convert.ToInt32(Session["userRol"]) > 3)
                {
                    pnl_agendaInspect.Visible = false;
                    AjaxControlToolkit.CalendarExtender cal = (frv_pdhs.FindControl("p_scheduleDayTextBox_CalendarExtender") as AjaxControlToolkit.CalendarExtender);
                    cal.StartDate = DateTime.Today;
                }
             }
            
        }

        protected void frv_pdhs_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            sds_program.InsertParameters["p_date"].DefaultValue = DateTime.Today.ToString("dd-MM-yyyy");
            sds_program.InsertParameters["p_active"].DefaultValue = "1";
        }

        protected void grv_inspec_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           
        }

        protected void p_endDateTextBox_TextChanged(object sender, EventArgs e)
        {

        }
    }
}