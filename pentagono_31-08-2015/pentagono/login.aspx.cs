using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pentagono.DataSet1TableAdapters;
using pent;

namespace pentagono
{
    public partial class login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private bool LoginCorrecto(string Usuario, string Contrasena)
        {
            bool auth = false;
            
            tbl_userTableAdapter usuarioAdapter = new tbl_userTableAdapter();
            DataTable dtUsuario = new DataTable();

            dtUsuario = usuarioAdapter.GetDataByUser(Usuario, Contrasena);

            if (dtUsuario.Rows.Count == 1)
            { 
                Session["userID"] = Convert.ToInt32( dtUsuario.Rows[0]["usr_id"]);
                Session["userName"] = Convert.ToString(dtUsuario.Rows[0]["usr_username"]);
                Session["userRol"] = Convert.ToInt32(dtUsuario.Rows[0]["rol_id"]); 
                auth = true;
                usuarioAdapter.updateLastAccess(DateTime.Now, Convert.ToInt32(dtUsuario.Rows[0]["usr_id"]));
            }
            else { auth = false; }
            usuarioAdapter.Dispose();
            dtUsuario.Dispose();
            return auth;
        }

        private bool dataLogin(string Usuario, string Contrasena)
        {
            bool auth = false;
            string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["pentagonov2ConnectionString"].ConnectionString;
            LDAPaccess authLdap = new LDAPaccess();
            pent.pentagSQL pentSQL = new pent.pentagSQL();
            tbl_userTableAdapter usuarioAdapter = new tbl_userTableAdapter();
            DataTable dtUsuario = new DataTable();
            dtUsuario = usuarioAdapter.GetDataByUser(Usuario, Contrasena);
            auth = authLdap.autenticado(Usuario, Contrasena);
            
            if (auth)
            {
                string[] userInfo = { "", "" };
                userInfo = authLdap.datosLdapUser(txtUser.Text);
                Session["email"] = userInfo[0];
                Session["user_Name"] = userInfo[1];
                dtUsuario = usuarioAdapter.GetDataByNetUser(Usuario);
                if (dtUsuario.Rows.Count == 1)
                {
                    Session["userID"] = Convert.ToInt32(dtUsuario.Rows[0]["usr_id"]);
                    Session["userName"] = Convert.ToString(dtUsuario.Rows[0]["usr_username"]);
                    Session["userRol"] = Convert.ToInt32(dtUsuario.Rows[0]["rol_id"]);
                    Session["Area"] = pentSQL.getUsersArea(Convert.ToInt32(dtUsuario.Rows[0]["usrInfo_id"]), ConnectionString);
                    if (Convert.ToString(Session["email"])=="")
                    {
                        tbl_userInfoTableAdapter usrInfo = new tbl_userInfoTableAdapter();
                        Session["email"] = Convert.ToString(usrInfo.getEmailByUser(Convert.ToInt32(dtUsuario.Rows[0]["usrInfo_id"])));
                        usrInfo.Dispose();
                    }
                    auth = true;
                    usuarioAdapter.updateLastAccess(DateTime.Now, Convert.ToInt32(dtUsuario.Rows[0]["usr_id"]));
                }
                else
                {
                    Session["userID"] = 0;
                    Session["userName"] = Usuario;
                    Session["userRol"] = 4;
                }
            }
            else
            {
                if (dtUsuario.Rows.Count == 1)
                {
                    Session["userID"] = Convert.ToInt32(dtUsuario.Rows[0]["usr_id"]);
                    Session["userName"] = Convert.ToString(dtUsuario.Rows[0]["usr_username"]);
                    Session["userRol"] = Convert.ToInt32(dtUsuario.Rows[0]["rol_id"]);
                    pentagSQL bd = new pentagSQL();
                    string userInfoID = bd.getSingleValueByID("usrInfo_id", Session["userName"].ToString(), "tbl_user", "usr_username", ConnectionString);
                    string nameUser = bd.getSingleValueByID("usrInfo_name", userInfoID, "tbl_userInfo", "usrInfo_id", ConnectionString);
                    Session["user_Name"] = nameUser;
                    tbl_userInfoTableAdapter usrInfo = new tbl_userInfoTableAdapter();
                    Session["email"] = Convert.ToString(usrInfo.getEmailByUser(Convert.ToInt32(dtUsuario.Rows[0]["usrInfo_id"])));
                    Session["Area"] = pentSQL.getUsersArea(Convert.ToInt32(dtUsuario.Rows[0]["usrInfo_id"]), ConnectionString);

                    usrInfo.Dispose();

                    auth = true;
                    usuarioAdapter.updateLastAccess(DateTime.Now, Convert.ToInt32(dtUsuario.Rows[0]["usr_id"]));
                }
            }
            usuarioAdapter.Dispose();
            dtUsuario.Dispose();
            return auth;
        }

        protected void bntLogin_Click(object sender, EventArgs e)
        {
            bool Autenticado = false;
            try
            {
                Autenticado = dataLogin(txtUser.Text, txtPass.Text);

                string folio = "";
                if (!(Convert.ToString(Request.QueryString["folio"]) == "" || Request.QueryString["folio"] == null)) { folio = "?folio=" + Convert.ToString(Request.QueryString["folio"]); }
                if (Autenticado)
                {
                    string paginaFuente = Request.QueryString["pag"];
                    if (String.IsNullOrEmpty(paginaFuente)) { paginaFuente = "Default"; }
                    Response.Redirect(paginaFuente + ".aspx" + folio);
                }
                else
                {
                    lbl_error.Text="Usuario y/o contraseña incorrectos";
                }
            }
            catch (Exception ex)
            {
                //captar el error en caso de que no permita conectar con el servidor LDAP y falle la BD.
                lbl_error.Text = "Ha ocurrido un error interno. Favor de contactar a su administrador del sistema con el siguiente error: \n" + ex.Message;
            }
        }
    }
}