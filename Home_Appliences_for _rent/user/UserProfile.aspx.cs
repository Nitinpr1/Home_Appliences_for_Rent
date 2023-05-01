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
    public partial class UserProfile : System.Web.UI.Page
    {
        int uid;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["uid"] != null)
            {
                uid = Convert.ToInt32(Session["uid"]);
                //Label1.Text = Session["Username"].ToString();
                BindUserDetails();
                EditProfileBox();
                BindCartNumber();

            }
            btnEditProfile.Visible = true;
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

        private void EditProfileBox()
        {
            edit.Visible = false;
        }

        private void BindUserDetails()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("select * from TblUser where Userid='" + uid + "'", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        if (dt.Rows.Count != 0)
                        {
                            lblfname.Text = dt.Rows[0]["fname"].ToString();
                            lbllname.Text = dt.Rows[0]["lname"].ToString();
                            lblfname1.Text = dt.Rows[0]["fname"].ToString();
                            lbllname1.Text = dt.Rows[0]["lname"].ToString();
                            lblcontact.Text = dt.Rows[0]["Conumber"].ToString();
                            lblcity.Text = dt.Rows[0]["city"].ToString();
                            lbladd.Text = dt.Rows[0]["Adress"].ToString();
                            lblaadhar.Text = dt.Rows[0]["aadhar"].ToString();
                            lblemail.Text = dt.Rows[0]["email"].ToString();
                            lblcity1.Text = dt.Rows[0]["city"].ToString();
                        }
                    }
                }

            }

        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            edit.Visible = true;
            btnEditProfile.Visible = false;
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassword.aspx");
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Remove("uid");
            Session.Remove("Username");
            Response.Redirect("/GuestUser/GuestHome.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                if (IsformValid())
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update TblUser set fname=@fname, lname=@lname, Adress=@adress, aadhar=@aadhar, city=@city, Conumber=@conumber, zip=@zip where Userid=@Uid", con);
                    cmd.Parameters.AddWithValue("@fname", txtfname.Text.Trim());
                    cmd.Parameters.AddWithValue("@lname", txtlname.Text.Trim());
                    
                    cmd.Parameters.AddWithValue("@adress", txtadd.Text.Trim());
                    cmd.Parameters.AddWithValue("@aadhar", Int64.Parse(txtaadhar.Text.Trim()));
                    cmd.Parameters.AddWithValue("@city", txtcity.Text.Trim());
                    cmd.Parameters.AddWithValue("@conumber", Int64.Parse(txtcontact.Text.Trim()));
                    cmd.Parameters.AddWithValue("@zip", Int64.Parse(txtzip.Text.Trim()));
                    cmd.Parameters.AddWithValue("@Uid", uid);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    clr();
                    Response.Write("<script>alert('Profile Updated Successfully!!'); </script>");
                }
            }
        }

        private void clr()
        {
            txtfname.Text = "";
            txtlname.Text = "";
           
            txtadd.Text = "";
            txtaadhar.Text = "";
            txtcity.Text = "";
            txtzip.Text = "";
            txtcontact.Text = "";
        }

        private bool IsformValid()
        {
            string sAdhaar = txtaadhar.Text;
            bool isValidnumber = aadharcard.validateVerhoeff(sAdhaar);

            if (txtfname.Text.Length < 4)
            {
                Response.Write("<script>alert('Name must be more than 4 character!!'); </script>");
                txtfname.Focus();
                return false;
            }
            
            else if (txtcontact.Text.Length != 10)
            {
                Response.Write("<script>alert(' Please Enter valid Number!!'); </script>");
                txtcontact.Focus();
                return false;
            }
            //aadhar no validation start
            else if (txtaadhar.Text.Length < 12)
            {
                Response.Write("<script> alert('Aadhaar Number should be of 12 digits!!'); </script>");
                txtaadhar.Focus();
                return false;
            }
            else if (!isValidnumber)
            {
                Response.Write("<script> alert('Invalid Aadhaar Number!!'); </script>");
                txtaadhar.Focus();
                return false;
            }
            //aadhar no validation end
            return true;
        }
    }
}