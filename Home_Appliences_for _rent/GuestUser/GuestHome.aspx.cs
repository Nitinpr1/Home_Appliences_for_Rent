using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Home_Appliences_for__rent.GuestUser
{
    public partial class GuestHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                BindrptrProducts();
            }
            if (Session["Username"] != null)
            {
                Response.Redirect("UserHome.aspx");
            }

        }
        private void BindrptrProducts()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("select * from tblProducts", con))
                {

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrProducts.DataSource = dt;
                        rptrProducts.DataBind();
                    }
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/user/Ulogin.aspx");
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    Response.Write("<script>alert('Sign In Required !!')</script>");
        //}
    }
}