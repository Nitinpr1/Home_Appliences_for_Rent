using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Home_Appliences_for__rent.Admin
{
    public partial class AddCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                txtCategoryName.Focus();
                //Label1.Text = Session["admin"].ToString();
            }
            else
            {
                Response.Redirect("/user/Ulogin.aspx");
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            try
            {


                if (isformvalid())
                {
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("Insert into tblcategory(CatName) Values('" + txtCategoryName.Text.Trim() + "' )", con);

                        cmd.ExecuteNonQuery();

                        Response.Write("<script> alert('Category Added SuccessFully!!'); </script>");
                        clr();
                        con.Close();
                        
                    }
                }

                else
                {
                    Response.Write("<script> alert('Some Thing went Wrong!!'); </script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('Some Thing went Wrong!!'); </script>");
            }

        }

        private bool isformvalid()
        {
            if(txtCategoryName.Text.Length < 4)
            {
                Response.Write("<script>alert('Name must be more than 4 character!!'); </script>");
                 
                return false;
            }
            else if(txtCategoryName.Text=="")
            {
                Response.Write("<script>alert(' Category Name Required!!'); </script>");
                return false;
            }
            return true;   
        }

        private void clr()
        {
            txtCategoryName.Text = "";
        }
    }
}