using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pentagono
{
    public partial class pentagonoPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                lbl_usr.Text = Convert.ToString(Session["userName"]);
            }
            else
            {
                lbl_logout.Visible = false;
            }
        }
    }
}