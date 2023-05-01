using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;

namespace Home_Appliences_for__rent.Admin
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["admin"] != null)
                {
                    BindOrderDetails();
                    BindPaymentsDetails();
                }
                else
                {
                    Response.Redirect("/user/Ulogin.aspx");
                }

            }
            
        }
        //select A.*,B.UName from tblPayments as A inner join tblOrders as B on B.UserId=A.UserId
        private void BindPaymentsDetails()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("select * from tblPayments", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    GvPayments.DataSource = dt;
                    GvPayments.DataBind();
                }
            }
        }

        private void BindOrderDetails()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("select A.*,B.UName,B.Email,B.ContactNo,B.UAddress,B.City,B.TotalPaid,B.Paymentstatus from tblOrderedProducts as A inner join tblOrders as B on B.OrderNumber=A.OrderNumber", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {

                    GvOrders.DataSource = dt;
                    GvOrders.DataBind();
                }
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        protected void btnOrderReport_Click(object sender, EventArgs e)
        {
            ExportOrderReport();
        }

        private void ExportOrderReport()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Order_Report.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GvOrders.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A2, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            GvOrders.AllowPaging = true;
            GvOrders.DataBind();
        }

        protected void btnPaymentReport_Click(object sender, EventArgs e)
        {
            ExportPaymentReport();
        }

        private void ExportPaymentReport()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Payment_Report.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GvPayments.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A2, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            GvPayments.AllowPaging = true;
            GvPayments.DataBind();
        }
    }
}