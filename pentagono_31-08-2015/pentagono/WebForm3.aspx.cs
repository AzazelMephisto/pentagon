using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using pent;
using pentagono.DataSet1TableAdapters;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;

namespace pentagono
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        //private funciones ldap = new funciones();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write(Page.User.Identity.Name);
            //ScriptManager.GetCurrent(this).RegisterPostBackControl(Button4);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Creamos el documento con el tamaño de página tradicional
            Document doc = new Document(PageSize.LETTER);
            // Indicamos donde vamos a guardar el documento
            PdfWriter writer = PdfWriter.GetInstance(doc,
                                        new FileStream(@"C:\prueba.pdf", FileMode.Create));

            // Le colocamos el título y el autor
            // **Nota: Esto no será visible en el documento
            doc.AddTitle("Mi primer PDF");
            doc.AddCreator("Roberto Torres");

            // Abrimos el archivo
            doc.Open();

            // Escribimos el encabezamiento en el documento
            doc.Add(new Paragraph("Mi primer documento PDF"));
            doc.Add(Chunk.NEWLINE);

            iTextSharp.text.Font _standardFont = new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 8, iTextSharp.text.Font.NORMAL, BaseColor.BLACK);

            // Creamos una tabla que contendrá el nombre, apellido y país 
            // de nuestros visitante.
            PdfPTable tblPrueba = new PdfPTable(3);
            tblPrueba.WidthPercentage = 100;

            // Configuramos el título de las columnas de la tabla
            PdfPCell clNombre = new PdfPCell(new Phrase("Nombre", _standardFont));
            clNombre.BorderWidth = 0;
            clNombre.BorderWidthBottom = 0.75f;

            PdfPCell clApellido = new PdfPCell(new Phrase("Apellido", _standardFont));
            clApellido.BorderWidth = 0;
            clApellido.BorderWidthBottom = 0.75f;

            PdfPCell clPais = new PdfPCell(new Phrase("País", _standardFont));
            clPais.BorderWidth = 0;
            clPais.BorderWidthBottom = 0.75f;

            // Añadimos las celdas a la tabla
            tblPrueba.AddCell(clNombre);
            tblPrueba.AddCell(clApellido);
            tblPrueba.AddCell(clPais);

            // Llenamos la tabla con información
            clNombre = new PdfPCell(new Phrase("Roberto", _standardFont));
            clNombre.BorderWidth = 0;

            clApellido = new PdfPCell(new Phrase("Torres", _standardFont));
            clApellido.BorderWidth = 0;

            clPais = new PdfPCell(new Phrase("Puerto Rico", _standardFont));
            clPais.BorderWidth = 0;

            // Añadimos las celdas a la tabla
            tblPrueba.AddCell(clNombre);
            tblPrueba.AddCell(clApellido);
            tblPrueba.AddCell(clPais);

            clNombre = new PdfPCell(new Phrase("Juan", _standardFont));
            clNombre.BorderWidth = 0;

            clApellido = new PdfPCell(new Phrase("Rodríguez", _standardFont));
            clApellido.BorderWidth = 0;

            clPais = new PdfPCell(new Phrase("México", _standardFont));
            clPais.BorderWidth = 0;

            tblPrueba.AddCell(clNombre);
            tblPrueba.AddCell(clApellido);
            tblPrueba.AddCell(clPais);

            // Finalmente, añadimos la tabla al documento PDF y cerramos el documento
            doc.Add(tblPrueba);

            doc.Close();
            writer.Close();

            //MessageBox.Show("¡PDF creado!");
    }

        private string getEmail(int userID)
        {
            tbl_userTableAdapter users = new tbl_userTableAdapter();
            int userInfo = Convert.ToInt32(users.getUsrInfo(userID));
            tbl_userInfoTableAdapter usrInfo = new tbl_userInfoTableAdapter();
            DataSet1.tbl_userInfoDataTable dtUsrInfo = new DataSet1.tbl_userInfoDataTable();
            usrInfo.FillByUserID(dtUsrInfo, userInfo);
            string correo = Convert.ToString(dtUsrInfo.Rows[0]["usrInfo_email"]);
            users.Dispose();
            usrInfo.Dispose();
            dtUsrInfo.Dispose();
            return correo;
        }

        public bool deshabilitaEstatus(int estatus)
        {
            if(estatus == 5)
            {
                return false;
            }
            else
            {
                return true;
            }
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["pentagonov2ConnectionString"].ConnectionString;
            pentagSQL bd = new pentagSQL();
            //DataTable acciones = new DataTable();
            //acciones = bd.generaAcciones("10", ConnectionString);
            //int i = 0;
            //foreach(DataRow row in acciones.Rows)
            //{
            //    Label3.Text = "Se encontraron " + i + " aspecto: "  + row[0].ToString();
            //    i+=1;
            //}

            //GridView2.DataSource = acciones;
            //GridView2.DataBind();

            //Label3.Text = bd.insertaProgram(ConnectionString);
            bd.generaAcciones("10", "4", ConnectionString);
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}