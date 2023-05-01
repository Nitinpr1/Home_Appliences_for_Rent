using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Home_Appliences_for__rent.user
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        int uid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] != null)
            {
                  uid = Convert.ToInt32(Session["uid"]);
                 
                BindCartNumber();
            }
            else if (Session["Auid"] != null)
            {
                uid = Convert.ToInt32(Session["Auid"]);
                cartid.Visible = false;
                profile.Visible = false;
            }
            else
            {
                Response.Redirect("Ulogin.aspx");
            }
            txtoldpass.Focus();
        }
        private void BindCartNumber()
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
        protected void btnRecoverPassword_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                SqlCommand cmd=new SqlCommand("Select * from TblUser where UserId=@uid and pwd=@pass",con);
                cmd.Parameters.AddWithValue("@uid", uid);
                cmd.Parameters.AddWithValue("@pass",txtoldpass.Text.Trim());
                con.Open();
                cmd.ExecuteNonQuery();
                SqlDataAdapter sda=new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if(dt.Rows.Count != 0)
                {
                    SqlCommand cmd1 = new SqlCommand("update TblUser set pwd=@newpass where UserId=@uid and pwd=@oldpass", con);
                    cmd1.Parameters.AddWithValue("@uid", uid);
                    cmd1.Parameters.AddWithValue("@oldpass", txtoldpass.Text.Trim());
                    cmd1.Parameters.AddWithValue("@newpass",txtnewpass.Text.Trim());
                    cmd1.ExecuteNonQuery();
                    Response.Write("<script>alert('Password Changed Successfully !!')</script>");
                    con.Close();
                }
                else
                {
                    Response.Write("<script>alert('Please Enter Old Password Correctly!!')</script>");

                }
            }
        }
    }
}