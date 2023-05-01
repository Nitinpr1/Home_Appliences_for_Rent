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
    public partial class AddSubCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["admin"] != null)
                {
                    BindMainCat();
                    
                    //Label1.Text = Session["admin"].ToString();
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
                SqlDataAdapter sda=new SqlDataAdapter(cmd);
                DataTable dt = new DataTable(); 
                sda.Fill(dt);
                if(dt.Rows.Count !=0)
                {
                    ddlcategory.DataSource = dt;
                    ddlcategory.DataTextField = "CatName";
                    ddlcategory.DataValueField = "CatId";
                    ddlcategory.DataBind();
                    ddlcategory.Items.Insert(0, new ListItem("-Select-", "0"));
                }
                
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
                        SqlCommand cmd = new SqlCommand("Insert into tblSubcategory(SubcatName,MaincatId) Values('" + txtSubcategoryName.Text.Trim() + "','"+ddlcategory.SelectedItem.Value+"' )", con);

                        cmd.ExecuteNonQuery();

                        Response.Write("<script> alert('Sub-Category Added SuccessFully!!'); </script>");
                        txtSubcategoryName.Text = "";
                        con.Close();
                        ddlcategory.ClearSelection();
                        ddlcategory.Items.FindByValue("0").Selected = true;
                        BindMainCat();
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
            if (txtSubcategoryName.Text.Length < 4)
            {
                Response.Write("<script>alert('Name must be more than 4 character!!'); </script>");

                return false;
            }
            return true;
        }


        

        
    }
}