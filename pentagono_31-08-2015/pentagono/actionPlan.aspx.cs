using System;
using System.Data;
using System.Drawing;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Text;
using pentagono.DataSet1TableAdapters;

namespace pentagono
{
    public partial class actionPlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userID"] == null)
            {
                Response.Redirect("login.aspx?pag=actionPlan");
            }
            else
            {
                if (Convert.ToInt32( Session["userID"]) >= 3)
                {
                    Response.Redirect("accessDenied.aspx");
                }
            }

        }

        protected void ddl_pager_SelectedIndexChanged(object sender, EventArgs e)
        {
            grv_actionPlan.PageSize = Convert.ToInt32(ddl_pager.SelectedValue);
        }

        protected void btn_excel_Click(object sender, EventArgs e)
        {
            ExportToExcel("Informe.xls", grv_actionPlan);
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages

                grv_actionPlan.AllowPaging = false;
                grv_actionPlan.DataBind();
                //this.BindGrid();

                grv_actionPlan.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in grv_actionPlan.HeaderRow.Cells)
                {
                    cell.BackColor = grv_actionPlan.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in grv_actionPlan.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = grv_actionPlan.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = grv_actionPlan.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                grv_actionPlan.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }

        private void ExportToExcel(string nameReport, GridView wControl)
        {
            HttpResponse response = Response;
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            Page pageToRender = new Page();
            HtmlForm form = new HtmlForm();
            form.Attributes.Add("runat", "server");
            form.Controls.Add(wControl);
            pageToRender.Controls.Add(form);
            response.Clear();
            response.Buffer = true;
            response.ContentType = "application/vnd.ms-excel";
            response.AddHeader("Content-Disposition", "attachment;filename=" + nameReport);
            response.Charset = "UTF-8";
            response.ContentEncoding = Encoding.Default;
            pageToRender.RenderControl(htw);
            response.Write(sw.ToString());
            response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        } 
    }
}