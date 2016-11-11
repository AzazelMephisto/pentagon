using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace pent
{
    class bdSQL
    {
        public string getSingleValue(string query, string connection)
        {
            string result="";
            using (SqlConnection openCon = new SqlConnection(connection))
            {

                try
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        cmd.Connection = openCon;

                        openCon.Open();

                        SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                        while (dr.Read())
                        {
                            result = dr[0].ToString();
                        }
                        dr.Close();
                    }
                }
                catch (Exception ex) {

                }



            }
            return result;
        }

   
        public string[] getMultipleValue(string[] columns, string tabla, string[] condicion, string connection)
        {
            string[] result;
            result = new string[columns.Length];
            string columnas="", condiciones="";
            for (int j=0; j <= columns.Length;j++)
            {
                if(j==0)
                {
                    columnas += "" + columns[j];
                }
                else
                {
                    columnas += "," + columns[j];
                }
                
            }
            for (int k = 0; k <= condicion.Length; k++)
            {
                if (k == 0)
                {
                    condiciones += "" + condicion[k];
                }
                else
                {
                    condiciones += " AND " + condicion[k];
                }

            }
            string querySelect = "SELECT "+ columnas +" FROM " + tabla + " WHERE " + condicion + " ";
            using (SqlConnection openCon = new SqlConnection(connection))
            {
                using (SqlCommand cmd = new SqlCommand(querySelect))
                {
                    cmd.Connection = openCon;

                    openCon.Open();

                    SqlDataReader dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                    while (dr.Read())
                    {
                        for(int i=0; i<= columns.Length; i++)
                        {
                            result[i] = dr[i].ToString();
                        }
                    }
                    dr.Close();
                    
                }
            }
            return result;
        }

        public string ejecutarConsulta(string query, string connection)
        {
            
            string result = "";
            using (SqlConnection openCon = new SqlConnection(connection))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = openCon;
                    try
                    {
                        openCon.Open();
                        result = Convert.ToString(cmd.ExecuteNonQuery());
                    }
                    catch (Exception ex)
                    {

                    }
                    finally {
                        openCon.Close();
                    }
                 
                }
            }
            return result;
        }

        public DataTable getTableData(string query, string connection)
        {
            DataTable dtresult = new DataTable();
      


                using (SqlConnection openCon = new SqlConnection(connection))
                {
                    using (SqlCommand cmd = new SqlCommand(query))
                    {
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        cmd.Connection = openCon;
                        try
                        {
                        openCon.Open();
                        da.Fill(dtresult);

                        }
                        catch (Exception ex)
                        {

                        }
                        finally
                        {
                            openCon.Close();
                        }

         
                    }
                }
           
            return dtresult;
        }

        public string ejecutarConsulta2(string query, string connection)
        {
            string result = "";
            using (SqlConnection openCon = new SqlConnection(connection))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Connection = openCon;
                    try
                    {
                        openCon.Open();
                        result = Convert.ToString(cmd.ExecuteScalar());
                    }
                    catch (Exception ex)
                    {

                    }
                    finally
                    {
                        openCon.Close();
                    }
                }
            }
            return result;
        }
    }
}
