using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace Home_Appliences_for__rent.Admin
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["admin"] != null)
                {
                    BindMainCat();
                }
                else
                {
                    Response.Redirect("/user/Ulogin.aspx");
                }
            }

        }

         

        private void BindMainCat()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblcategory", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlcategory.DataSource = dt;
                    ddlcategory.DataTextField = "CatName";
                    ddlcategory.DataValueField = "CatId";
                    ddlcategory.DataBind();
                    ddlcategory.Items.Insert(0, new ListItem("-Select-", "0"));
                }

            }
        }

        protected void ddlcategory_SelectedIndexChanged(object sender, EventArgs e)
        {
             
            int MainCatId= Convert.ToInt32( ddlcategory.SelectedItem.Value);
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblSubcategory where MaincatId='" + ddlcategory.SelectedItem.Value + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlsubcategory.DataSource = dt;
                    ddlsubcategory.DataTextField = "SubcatName";
                    ddlsubcategory.DataValueField = "SubcatId";
                    ddlsubcategory.DataBind();
                    ddlsubcategory.Items.Insert(0, new ListItem("-Select-", "0"));
                }

            }
        }

        protected void btnaddProduct_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                if (ProImg.HasFile)
                {
                    string filename=ProImg.PostedFile.FileName;
                    string filePath = "ProductImg/" +filename;
                    ProImg.PostedFile.SaveAs(Server.MapPath("~/ProductImg/")+filename);
                    con.Open();
                    SqlCommand cmd=new SqlCommand("insert into tblProducts values('" + txtProductname.Text.Trim()+"','"+txtdprice.Text.Trim()+"','"+txtprice.Text.Trim()+"','"+ ddlcategory.SelectedItem.Value + "','"+ ddlsubcategory.SelectedItem.Value + "','"+ txtpdis.Text.Trim() + "','"+ txtpfet.Text.Trim() + "','"+ filePath + "')",con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    clr();
                    Response.Write("<script>alert('Product Added successfully')</script>");
                }
            }

        }

        private void clr()
        {
            txtProductname.Text = "";
            txtprice.Text = "";
            txtpdis.Text = "";
            txtpfet.Text = "";
            txtdprice.Text = "";
            ddlcategory.SelectedIndex = 0;
            ddlsubcategory.SelectedIndex = 0;
            
        }
    }
}