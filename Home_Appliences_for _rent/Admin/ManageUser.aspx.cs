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
    public partial class ManageUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               if (Session["admin"] != null)
                {
                    binduser();
                }
                else
                {
                    Response.Redirect("/user/Ulogin.aspx");
                }
              
            }
            GVtoprint.Visible = false; 
        }

        private void binduser()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("select * from TblUser where usertype='user'", con);
                SqlDataAdapter sda=new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if(dt.Rows.Count != 0)
                {
                    GvUsers.DataSource = dt;
                    GvUsers.DataBind();
                    Gvusertoprint.DataSource = dt;
                    Gvusertoprint.DataBind();
                }
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        protected void btnExpdf_Click(object sender, EventArgs e)
        {
            ExportPDF();
        }

        
        private void ExportPDF()
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Rentspace_Users.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            Gvusertoprint.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A2, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            Gvusertoprint.AllowPaging = true;
            Gvusertoprint.DataBind();
        }

        protected void GvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userId = Convert.ToInt32(GvUsers.DataKeys[e.RowIndex].Value);
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("spDeleteUserAndRelatedData", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@userid",userId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            binduser();
        }
    }
}