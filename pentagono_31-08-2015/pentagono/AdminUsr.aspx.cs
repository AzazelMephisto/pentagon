using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pentagono
{
    public partial class Admin : System.Web.UI.Page
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
                pent.pentagSQL bd = new pent.pentagSQL();
                DataTable dt = new DataTable();
                LinkButton lab = (LinkButton)sender;
                GridViewRow row = (GridViewRow)lab.NamingContainer;
                //FileUpload fupEv = (FileUpload)row.FindControl("V_ID1");
                Label rdb_obs = row.FindControl("Nuser") as Label;
                string auxString = rdb_obs.Text;
            
             
                dt = bd.getUsersAndInfoById(auxString, ConnectionString);
                usrinfo.Text = dt.Rows[0]["usrInfo_id"].ToString();
                NumUsr.Text = dt.Rows[0]["usr_id"].ToString();
                NameUsr.Text = dt.Rows[0]["usrInfo_name"].ToString();
                Email.Text = dt.Rows[0]["usrInfo_email"].ToString();
                Comp.Text = dt.Rows[0]["usrInfo_company"].ToString();
                string aux  = dt.Rows[0]["perArea_id"].ToString();
                AreaFun.SelectedValue = aux.Trim();
                AreaReal.SelectedValue = dt.Rows[0]["area_id"].ToString();
                User.Text = dt.Rows[0]["usr_username"].ToString();
                Cont.Text = dt.Rows[0]["usr_pass"].ToString();
                Rol.SelectedValue = dt.Rows[0]["rol_id"].ToString();
                string tem = dt.Rows[0]["usr_active"].ToString();
                if (tem == "True")
                {
                    RadioButtonList1.SelectedValue = "1";
                }
                else {
                    RadioButtonList1.SelectedValue = "0";
                }
                //Bandera.Text = "1";
                HiddenField1.Value = "1";




            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            HiddenField1.Value = "1";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (NumUsr.Text != "")//actualizar
            {


                pent.pentagSQL bd = new pent.pentagSQL();

                string res = bd.getIDbyuser(User.Text, ConnectionString);
                if (res == NumUsr.Text || res == "")
                {

                    bd.updateUsr(User.Text, Cont.Text, Rol.SelectedValue, RadioButtonList1.SelectedValue, NumUsr.Text, ConnectionString);
                    bd.updateUsrDtl(NameUsr.Text, Email.Text, Comp.Text, AreaFun.SelectedValue, AreaReal.SelectedValue, usrinfo.Text, ConnectionString);
                    //usrinfo.Text = "";
                    //NumUsr.Text = "";
                    //NameUsr.Text = "";
                    //Email.Text = "";
                    //Comp.Text = "";
                    //AreaFun.SelectedValue ="0";
                    //AreaReal.SelectedValue = "0";
                    //User.Text = "";
                    //Cont.Text ="";
                    //Rol.SelectedValue ="0";
                    //HiddenField1.Value = "0";            


                    Response.Redirect("AdminUsr.aspx");
                }
                else {
                    Response.Write("<script>alert('El nombre de usuario ya existe');</script>");
                }

            }
            else {//nuevo
                pent.pentagSQL bd = new pent.pentagSQL();
                //bd.updateUsr(User.Text, Cont.Text, Rol.SelectedValue, RadioButtonList1.SelectedValue, NumUsr.Text, ConnectionString);
                //bd.updateUsrDtl(NameUsr.Text, Email.Text, Comp.Text, AreaFun.SelectedValue, AreaReal.SelectedValue, usrinfo.Text, ConnectionString);
                string res = bd.getIDbyuser(User.Text, ConnectionString);
                if (res == NumUsr.Text)
                {
                    int usrInfo = bd.InsertUsrDtl(NameUsr.Text, Email.Text, Comp.Text, AreaFun.SelectedValue, AreaReal.SelectedValue, ConnectionString);
                    bd.InsertUser(User.Text, Cont.Text, Rol.SelectedValue, RadioButtonList1.SelectedValue, usrInfo.ToString(), ConnectionString);
                    Response.Write("<script>alert('Guardado Correctamente');</script>");
                    Response.Redirect("AdminUsr.aspx");
                }
                else
                {
                    User.Text = "";
                    Cont.Text ="";
                    Response.Write("<script>alert('El nombre de usuario ya existe');</script>");
                }
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            usrinfo.Text = "";
            NumUsr.Text = "";
            NameUsr.Text = "";
            Email.Text = "";
            Comp.Text = "";
            AreaFun.SelectedValue = "0";
            AreaReal.SelectedValue = "0";
            User.Text = "";
            Cont.Text = "";
            Rol.SelectedValue = "0";
            HiddenField1.Value = "0";

            HiddenField1.Value = "1";
        }
    }
}