using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pentagono
{
    public partial class dash_vos : System.Web.UI.Page
    {
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
                //FileUpload fupEv = (FileUpload)row.FindControl("V_ID1");
                Label rdb_obs = row.FindControl("V_ID1") as Label;
                SqlDataSource1.SelectParameters["vosId"].DefaultValue = rdb_obs.Text;

            }


        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            if (!(sender == null))
            {
                LinkButton lab = (LinkButton)sender;
                GridViewRow row = (GridViewRow)lab.NamingContainer;
                //FileUpload fupEv = (FileUpload)row.FindControl("V_ID1");
                Label rdb_obs = row.FindControl("V_ID1") as Label;
                SqlDataSource1.SelectParameters["vosId"].DefaultValue = rdb_obs.Text;

            }
        }
    }
}