using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.DirectoryServices;

namespace pent
{
    public class LDAPaccess
    {
        public bool autenticado(string user, string pass) 
        {
            bool auth = false;
            //Armamos la cadena completa de dominio y usuario
            string dominio = "ASPENLATAM";
            string path = "LDAP://aslamxs003.aspenlatam.com:389/OU=Users,OU=Vallejo,OU=Mexico,OU=Latam,DC=aspenlatam,DC=com";
            string domainAndUsername = dominio + @"\" + user;
            //Creamos un objeto DirectoryEntry al cual le pasamos el URL, dominio/usuario y la contraseña
            DirectoryEntry entry = new DirectoryEntry(path, domainAndUsername, pass);
            try
            {
                DirectorySearcher search = new DirectorySearcher(entry);
                //Verificamos que los datos de logeo proporcionados son correctos
                SearchResult result = search.FindOne();
                if (result == null)
                {
                    auth = false;
                }
                else
                {
                    auth = true;
                }
                //return auth;
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            return auth;
        }

        public string[] datosLdapUser(string netUser)
        {
            string LDAPuser = "reyesfe";
            string LDAPpass = "Fe21re05";
            DirectoryEntry d = new DirectoryEntry("LDAP://aslamxs003.aspenlatam.com:389/OU=Mexico,OU=Latam,DC=aspenlatam,DC=com", LDAPuser, LDAPpass, AuthenticationTypes.Secure);
            DirectorySearcher deSearch = new DirectorySearcher(d);
            deSearch.Filter = "(&(sAMAccountName=" + netUser + "))";

            SearchResultCollection objResultados;

            objResultados = deSearch.FindAll();
            Usuarios usarioData= new Usuarios();
            string[] usuarioInfo = {"",""}; 

            foreach (SearchResult MiObjeto in objResultados)
            {
                try
                {
                    usuarioInfo[0] = MiObjeto.Properties["mail"][0].ToString();
                }
                catch(Exception ex){ usuarioInfo[0] = ""; }

                usuarioInfo[1] = MiObjeto.Properties["displayName"][0].ToString();
                //usarioData.Email = MiObjeto.Properties["mail"][0].ToString();
                //usarioData.Title = MiObjeto.Properties["title"][0].ToString();
                //usarioData.Name = MiObjeto.Properties["displayName"][0].ToString();
            }

            return usuarioInfo;
        }

        public class Usuarios
        {
            private string email;
            public string Email
            {
                get { return email; }
                set { email = value; }
            }
            private string names;
            public string Name
            {
                get { return names; }
                set { names = value; }
            }
            private string title;
            public string Title
            {
                get { return title; }
                set { title = value; }
            }
        }
    }
}
