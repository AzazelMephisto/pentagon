using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;
using System.Text;
using System.Data;

namespace pentagono
{
   
    public partial class Graficas : System.Web.UI.Page
    {
        StringBuilder str = new StringBuilder();
        StringBuilder Cadena = new StringBuilder();
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
        private string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["pentagonov2ConnectionString"].ConnectionString;


        private void BindChart( string data)
        {
            try
            {
             //OJO se genero con carga de string por que no aceptaba el objeto json

                str.Append(@"<script type=*text/javascript*>
                           google.charts.load('current', {'packages':['bar']});
                           google.charts.setOnLoadCallback(drawChart);
                           function drawChart() {
                            var data = google.visualization.arrayToDataTable([
                            #DATOS#
                          ]);

                            var options = {
                              chart: {
                                title: 'Company Performance',
                                subtitle: 'Sales, Expenses, and Profit: 2014-2017',
                              }
                            };

                    var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

                    chart.draw(data, options);
                     } </script> ");

                str.Replace("#DATOS#", data);
                lt.Text = str.ToString().Replace('*', '"');
            }
            catch
            { }
        }

        private void DibujaTabla(string data)
        {
            //DataTable dt = new DataTable();
            try
            {

                Cadena.Append(@"
                            <table  class=*table table - striped table - bordered* cellspacing=*0* width=*100%*>
                               #DATOS#
                            </table>                         
                         ");
                
                Cadena.Replace("#DATOS#", data);
                tabla.Text = Cadena.ToString().Replace('*', '"');
            }
            catch
            { }
        }

        protected void Consultar_Click(object sender, EventArgs e)
        {
            pent.pentagSQL bd = new pent.pentagSQL();
            DataTable dt = new DataTable();
            dt = bd.ObtenGraficaComportamientos(TextBox1.Text, TextBox2.Text, DropDownList1.SelectedValue.ToString(), DropDownList2.SelectedValue.ToString(), ConnectionString);
            string data = ObtenGrafia(dt);
            string datos = ObtenTabla(dt);

            BindChart(data);
            DibujaTabla(datos);
        }

        public String ObtenGrafia(DataTable dt) {
            string respuesta = "['pregunta' , 'total' , 'OK', 'OK%', 'MAL', 'MAL%','NO', 'NO%', 'SI', 'NO'], \n";
            int filas = dt.Rows.Count;

            foreach (DataRow row in dt.Rows) {
                string temp = " ['" + row["b_name"] + "'," + row["TOTAL"] + "," + row["OKObs"] + "," + row["OKPor"] + "," + row["MALObs"] + "," + row["MALPor"] + "," + row["NOObs"] + "," + row["NOPor"] + "," + row["si"] + "," + row["no"] + "], \n";

                respuesta = respuesta + temp;
            }
            respuesta=respuesta.Substring(0, respuesta.Length - 1);
            return respuesta;
        }





        public String ObtenTabla(DataTable dt)
        {                        
            string respuesta = "<thead> <tr> <th>pregunta</th> <th>total</th> <th>OK</th> <th>OK%</th> <th>MAL</th> <th>MAL%</th> <th>NO</th> <th>NO%</th> <th>SI</th> <th>NO</th>    </tr>  </thead>\n";
            int filas = dt.Rows.Count;

            foreach (DataRow row in dt.Rows)
            {
                string temp = " <tr> <td>" + row["b_name"] + "</td> <td>" + row["TOTAL"] + "</td> <td>" + row["OKObs"] + "</td> <td>" + row["OKPor"] + "</td> <td>" + row["MALObs"] + "</td> <td>" + row["MALPor"] + "</td> <td>" + row["NOObs"] + "</td> <td>" + row["NOPor"] + "</td> <td>" + row["si"] + "</td> <td>" + row["no"] + "</td> </tr> \n";

                respuesta = respuesta + temp;
            }
            //respuesta = respuesta.Substring(0, respuesta.Length - 1);
            return respuesta;
        }

    } 

}