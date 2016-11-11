using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pentagono
{
    public partial class pentago_theme : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                lbl_usr.Text = Convert.ToString(Session["user_Name"]);
                lbl_usrMini.Text=Convert.ToString(Session["user_Name"]);
                lbl_usr2.Text = Convert.ToString(Session["user_Name"]);
            }
            else
            {
                //lbl_logout.Visible = false;
            }
        }
    }
}