using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.IO;
using System.Data;
using iTextSharp.text;
using iTextSharp.text.pdf;

namespace pentagono
{
    public class funcPDF
    {
        private string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["pentagonov2ConnectionString"].ConnectionString;

        public void PDF(string ruta, string logo, string inspectID, string recursosFolder)
        {
            // Creamos el documento con el tamaño de página tradicional
            Document doc = new Document(PageSize.LETTER);
            // Indicamos donde vamos a guardar el documento
            PdfWriter writer = PdfWriter.GetInstance(doc, new FileStream(ruta, FileMode.Create));

            // **Nota: Esto no será visible en el documento
            doc.AddTitle("Inspecciones pentagono");
            doc.AddCreator("Admin");
            // Abrimos el archivo
            doc.Open();

            // Creamos el tipo de Font que vamos utilizar
            iTextSharp.text.Font _standardFont = new iTextSharp.text.Font(iTextSharp.text.Font.FontFamily.HELVETICA, 8, iTextSharp.text.Font.NORMAL, BaseColor.BLACK);

            // Escribimos el encabezamiento en el documento
            //iTextSharp.text.Image imagen = iTextSharp.text.Image.GetInstance(@"C:\Users\REYESFE\Pictures\imgs\logo.jpg");
            Image imagen = Image.GetInstance(logo);
            //imagen.ScaleToFit(140f, 120f);
            imagen.ScalePercent(40);
            // Insertamos la imagen en el documento
            //doc.Add(imagen);

            PdfPTable tblHeader = new PdfPTable(4);

            tblHeader.TotalWidth = 500f;
            tblHeader.LockedWidth = true;
            float[] widths = new float[] { 30f, 50f, 25f, 25f };
            tblHeader.SetWidths(widths);
            tblHeader.SpacingAfter = 20;

            pent.pentagSQL sql = new pent.pentagSQL();
            //addCell(tblHeader, "ASPEN", 1);
            string formato = sql.getSingleValueByID("format_id", inspectID, "tbl_inspect", "inspect_id", ConnectionString);
            //Select format_id, format_codigo, format_version, format_rev," +
            //                    " format_nextRev, format_name,format_norma
            DataTable dtHeaderFormat = new DataTable();
            dtHeaderFormat = sql.headerFormat(formato, ConnectionString);

            PdfPCell cllogo = new PdfPCell(imagen);
            cllogo.BorderWidth = 0;
            tblHeader.AddCell(cllogo);
            addCell(tblHeader, "PLANTA VALLEJO MEXICO", 1);
            addCell(tblHeader, "TIPO", 1);
            addCell(tblHeader, "FORMATO", 1);

            addCell(tblHeader, "", 1);
            addCell(tblHeader, "", 1);
            addCell(tblHeader, "CODIGO: ", 1);
            addCell(tblHeader, dtHeaderFormat.Rows[0][1].ToString(), 1);

            addCell(tblHeader, "TITULO: ", 1);
            addCell(tblHeader, dtHeaderFormat.Rows[0][5].ToString(), 1);
            addCell(tblHeader, "VERSION: ", 1);
            addCell(tblHeader, dtHeaderFormat.Rows[0][2].ToString(), 1);

            addCell(tblHeader, "NO INSPECCION: " + inspectID, 1);
            addCell(tblHeader, dtHeaderFormat.Rows[0]["format_norma"].ToString(), 1); //inspectID
            addCell(tblHeader, "PROXIMA REVISIÓN", 1);
            addCell(tblHeader, Convert.ToDateTime(dtHeaderFormat.Rows[0][4]).ToString("MMM yyyy"), 1);

            doc.Add(tblHeader);

            //*** Zona de datos generales del reporte/inspección
            PdfPTable tblHead = new PdfPTable(3);

            tblHead.TotalWidth = 500f;
            tblHead.LockedWidth = true;
            float[] widthsHead = new float[] { 40f, 40f, 40f };
            tblHead.SetWidths(widthsHead);
            //Select tbl_areas.area_name, tbl_inspect.area_id, usrInfo_name ,inspect_noEmp,"+
            // inspect_date, recor_desc ,inspect_start,inspect_end,recor_id
            DataTable dtInspectHead = new DataTable();
            dtInspectHead = sql.headInspeccion(inspectID, ConnectionString);

            addCellBorder(tblHead, "Área: "+dtInspectHead.Rows[0][0].ToString(), 1);
            addCellBorder(tblHead, "Integrante de la CSH: "+ dtInspectHead.Rows[0][2].ToString(), 1);
            addCellBorder(tblHead, "Fecha: "+ Convert.ToDateTime(dtInspectHead.Rows[0][4]).ToString("dd/MM/yyyy"), 1);

            addCellBorder(tblHead, "Número de Empleados: "+ dtInspectHead.Rows[0][3].ToString(), 1);
            addCellBorder(tblHead, "Recorrido de Verificación: "+ dtInspectHead.Rows[0][5].ToString(), 1);
            addCellBorder(tblHead, "Inicio: "+ Convert.ToDateTime(dtInspectHead.Rows[0][6]).ToString("HH:mm:ss") +"  Fin: "+ Convert.ToDateTime(dtInspectHead.Rows[0][7]).ToString("HH:mm:ss"), 1);


            doc.Add(tblHead);

            //*** Zona para el detalle de la inspección
            PdfPTable tblDetail = new PdfPTable(5);
            

            tblDetail.TotalWidth = 500f;
            tblDetail.LockedWidth = true;
            float[] widthsDtl = new float[] { 20f, 50f, 10f, 10f, 30f };
            tblDetail.SetWidths(widthsDtl);
            tblDetail.SpacingAfter = 20;

            addCell(tblDetail, "Elemento", 1, "b", "c", 0.5f);
            addCell(tblDetail, "Forma de Revisar", 1, "b", "c", 0.5f);
            addCell(tblDetail, "Satisfactorio", 1, "b", "c", 0.5f);
            addCell(tblDetail, "No Satisfactorio ", 1, "b", "c", 0.5f);
            addCell(tblDetail, "Observaciones: ", 1, "b", "c", 0.5f);

            //addCellBorder(tblDetail, "Elemento", 1);
            //addCellBorder(tblDetail, "Forma de Revisar", 1);
            //addCellBorder(tblDetail, "Satisfactorio", 1);
            //addCellBorder(tblDetail, "No Satisfactorio ", 1);
            //addCellBorder(tblDetail, "Observaciones: ", 1);

            DataTable dtInspect = new DataTable();
            Image check = Image.GetInstance(recursosFolder + "check_48.png");
            check.ScalePercent(25);
            Image cancel = Image.GetInstance(recursosFolder + "cancel_48.png");
            cancel.ScalePercent(25);

            PdfPCell mark = new PdfPCell(check, false);
            mark.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
            PdfPCell markBad = new PdfPCell(cancel, false);
            markBad.HorizontalAlignment = PdfPCell.ALIGN_CENTER;

            dtInspect = sql.detalleInspeccion(inspectID, ConnectionString);
            foreach (DataRow row in dtInspect.Rows)
            {
                addCell(tblDetail, row[0].ToString(), 1, "b", "c", 0.5f);
                //addCellBorder(tblDetail, row[0].ToString(), 1);
                addCellBorder(tblDetail, row[1].ToString(), 1);
                if (Convert.ToBoolean(row[3]))
                {
                    tblDetail.AddCell(mark);
                    //addCellBorder(tblDetail, , 1);
                    addCellBorder(tblDetail, "", 1);
                }
                else
                {
                    addCellBorder(tblDetail, "", 1);
                    tblDetail.AddCell(markBad);
                    //addCellBorder(tblDetail, recursosFolder+"cancel_48.png", 1);
                }
                addCellBorder(tblDetail, row[4].ToString(), 1);
            }

            doc.Add(tblDetail);
            //Salto de linea
            //doc.Add(Chunk.NEWLINE);

            //*** Tabla de acciones
            PdfPTable tblActions = new PdfPTable(3);
            tblActions.TotalWidth = 500f;
            tblActions.LockedWidth = true;
            float[] widthsAct = new float[] { 80f, 20f, 20f };
            tblActions.SetWidths(widthsAct);
            tblActions.SpacingAfter = 90;

            addCellBorder(tblActions, "Acciones recomendadas/correctivas", 1);
            addCellBorder(tblActions, "Responsable", 1);
            addCellBorder(tblActions, "Fecha compromiso", 1);

            DataTable dtActions = new DataTable();

            dtActions = sql.listaAcciones(inspectID, "7","1", ConnectionString);
            foreach (DataRow row in dtActions.Rows)
            {
                addCellBorder(tblActions, row[1].ToString(), 1);
                addCellBorder(tblActions, row["usrInfo_name"].ToString(), 1);
                addCellBorder(tblActions, Convert.ToDateTime(row[4]).ToString("dd/MM/yyyy"), 1);
            }
            doc.Add(tblActions);

            //*** Tabla de firmas digitales
            PdfPTable tblSignatures = new PdfPTable(1);
            tblSignatures.TotalWidth = 500f;
            tblSignatures.LockedWidth = true;
            float[] widthsSig = new float[] { 40f };
            tblSignatures.SetWidths(widthsSig);
            tblSignatures.SpacingAfter = 20;

            //addCell(tblSignatures, "Integrante de la CSH \nNombre y Firma", 1);
            //addCell(tblSignatures, "Supervisor \nNombre y Firma", 1);
            //addCell(tblSignatures, "Gerente \nNombre y Firma", 1);

            //addCell(tblSignatures, "", 1);
            //addCell(tblSignatures, "", 1);
            //addCell(tblSignatures, "", 1);

            DataTable dtSignatuers = new DataTable();

            dtSignatuers = sql.getSignatures(inspectID, ConnectionString);

            addCell(tblSignatures, "Firmas Electrónicas", 1, "b", "l");
            foreach (DataRow row in dtSignatuers.Rows)
            {
                //addCell(tblSignatures, row["bitac_date"].ToString() +" "+ row["bitac_desc"].ToString(), 1);
                addCell(tblSignatures, row["bitac_date"].ToString() + " " + row["bitac_desc"].ToString(), 1, "n", "l");
            }
            doc.Add(tblSignatures);

            doc.Close();
            writer.Close();
            //System.Diagnostics.Process.Start(ruta);
        }
        private static void addCellBorder(PdfPTable table, string text, int rowspan)
        {
            BaseFont bfTimes = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, false);
            iTextSharp.text.Font times = new iTextSharp.text.Font(bfTimes, 8, iTextSharp.text.Font.NORMAL, iTextSharp.text.BaseColor.BLACK);

            PdfPCell cell = new PdfPCell(new Phrase(text, times));
            //cell.BackgroundColor = BaseColor.LIGHT_GRAY;
            cell.Rowspan = rowspan;
            cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
            cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
            table.AddCell(cell);
        }
        private static void addCell(PdfPTable table, string text, int rowspan)
        {
            BaseFont bfTimes = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, false);
            iTextSharp.text.Font times = new iTextSharp.text.Font(bfTimes, 8, iTextSharp.text.Font.NORMAL, iTextSharp.text.BaseColor.BLACK);

            PdfPCell cell = new PdfPCell(new Phrase(text, times));
            cell.BorderWidth = 0;
            cell.Rowspan = rowspan;
            cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
            cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
            table.AddCell(cell);
        }
        private static void addCell(PdfPTable table, string text, int rowspan, string fontStyle)
        {
            BaseFont bfTimes = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, false);
            iTextSharp.text.Font fuente = new iTextSharp.text.Font(bfTimes, 8, iTextSharp.text.Font.NORMAL, iTextSharp.text.BaseColor.BLACK);

            if(fontStyle.ToLower()=="n")
            {
                fuente.SetStyle(Font.NORMAL);
            }else if (fontStyle.ToLower() == "b")
            {
                fuente.SetStyle(Font.BOLD);
            }
            else if (fontStyle.ToLower() == "i")
            {
                fuente.SetStyle(Font.ITALIC);
            }

            PdfPCell cell = new PdfPCell(new Phrase(text, fuente));
            cell.BorderWidth = 0;
            cell.Rowspan = rowspan;
            cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
            cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
            table.AddCell(cell);
        }
        private static void addCell(PdfPTable table, string text, int rowspan, string fontStyle, string halign)
        {
            BaseFont bfTimes = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, false);
            iTextSharp.text.Font fuente = new iTextSharp.text.Font(bfTimes, 8, iTextSharp.text.Font.NORMAL, iTextSharp.text.BaseColor.BLACK);

            if (fontStyle.ToLower() == "n")
            {
                fuente.SetStyle(Font.NORMAL);
            }
            else if (fontStyle.ToLower() == "b")
            {
                fuente.SetStyle(Font.BOLD);
            }
            else if (fontStyle.ToLower() == "i")
            {
                fuente.SetStyle(Font.ITALIC);
            }

            PdfPCell cell = new PdfPCell(new Phrase(text, fuente));
            cell.BorderWidth = 0;
            cell.Rowspan = rowspan;
            if (halign == "l")
            {
                cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
            }
            else if(halign == "c")
            {
                cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
            }
            else if (halign == "r")
            {
                cell.HorizontalAlignment = PdfPCell.ALIGN_RIGHT;
            }
            //cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
            cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
            table.AddCell(cell);
        }
        private static void addCell(PdfPTable table, string text, int rowspan, string fontStyle, string halign, float borderWidth)
        {
            BaseFont bfTimes = BaseFont.CreateFont(BaseFont.HELVETICA, BaseFont.CP1252, false);
            iTextSharp.text.Font fuente = new iTextSharp.text.Font(bfTimes, 8, iTextSharp.text.Font.NORMAL, iTextSharp.text.BaseColor.BLACK);

            if (fontStyle.ToLower() == "n")
            {
                fuente.SetStyle(Font.NORMAL);
            }
            else if (fontStyle.ToLower() == "b")
            {
                fuente.SetStyle(Font.BOLD);
            }
            else if (fontStyle.ToLower() == "i")
            {
                fuente.SetStyle(Font.ITALIC);
            }

            PdfPCell cell = new PdfPCell(new Phrase(text, fuente));
            cell.BorderWidth = borderWidth;
            cell.Rowspan = rowspan;
            if (halign == "l")
            {
                cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
            }
            else if (halign == "c")
            {
                cell.HorizontalAlignment = PdfPCell.ALIGN_CENTER;
            }
            else if (halign == "r")
            {
                cell.HorizontalAlignment = PdfPCell.ALIGN_RIGHT;
            }
            //cell.HorizontalAlignment = PdfPCell.ALIGN_LEFT;
            cell.VerticalAlignment = PdfPCell.ALIGN_MIDDLE;
            table.AddCell(cell);
        }
    }
}