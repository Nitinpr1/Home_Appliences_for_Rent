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

namespace Home_Appliences_for__rent.user
{
    public partial class Orderplaced : System.Web.UI.Page
    {
        int orderNumber, uid ;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    success.Visible = true;
                    address.InnerText = Session["address"].ToString();
                    orderNumber = int.Parse(Session["Oredernumber"].ToString());
                    orderno.InnerText = orderNumber.ToString();
                    uid = int.Parse(Session["uid"].ToString());
                    BindProductdetails();
                    orderdate.InnerText = DateTime.Now.Date.ToString("dd/MM/yyyy");
                    dprice.InnerText = Session["dprice"].ToString();
                    rprice.InnerText = Session["rprice"].ToString();
                    totalpaid.InnerText = Session["totalpaid"].ToString();
                }
                else
                {
                    Response.Redirect("Ulogin.aspx");
                    success.Visible = false;
                }
            }
            Cartcount();
            
        }

        private void BindProductdetails()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("select * from tblOrderedProducts where UserId='" + uid + "' and OrderNumber='"+ orderNumber + "'", con))
                {
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if(dt.Rows.Count !=0)
                    {
                        GvProductdetails.DataSource = dt;
                        GvProductdetails.DataBind();
                    }
                    con.Close();

                    

                }
            }
        }

        private void Cartcount()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                int uid = (int)Convert.ToInt32(Request.Cookies["userid"].Value);
                using (SqlCommand cmd = new SqlCommand("select count(UserId) as totalRow from tblcart where UserId='" + uid + "'", con))
                {
                    SqlDataAdapter sda = new SqlDataAdapter();
                    sda.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    con.Close();

                    pCount.InnerText = ds.Tables[0].Rows[0]["totalRow"].ToString();

                }

            }
        }

        protected void btnRecipt_Click(object sender, EventArgs e)
        {
            ExportRecipt();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        private void ExportRecipt()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Rental_receipt.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Panel1.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            
        }
    }
}