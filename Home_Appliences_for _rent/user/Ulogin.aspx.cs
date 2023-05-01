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
    public partial class Ulogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Request.Cookies["Uname"] !=null && Request.Cookies["Upwd"] !=null)
                {
                    txtmail.Text = Request.Cookies["Uname"].Value.ToString();
                    txtpass.Text = Request.Cookies["Upwd"].Value.ToString();
                    CheckBox1.Checked=true; 
                }
            }
            if(Session["Username"] != null)
            {
                Response.Redirect("UserHome.aspx");
            }
            txtmail.Focus();    

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from TblUser where email=@email and pwd=@password",con);
                cmd.Parameters.AddWithValue("@email",txtmail.Text);
                cmd.Parameters.AddWithValue("@password", txtpass.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if(dt.Rows.Count != 0)
                {
                    if(CheckBox1.Checked)
                    {
                        Response.Cookies["Uname"].Value=txtmail.Text;
                        Response.Cookies["Upwd"].Value = txtpass.Text;
                      

                        Response.Cookies["Uname"].Expires = DateTime.Now.AddDays(1);
                        Response.Cookies["Upwd"].Expires = DateTime.Now.AddDays(1);

                    }
                    else
                    {
                        Response.Cookies["Uname"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["Upwd"].Expires = DateTime.Now.AddDays(-1);
                    }
                    string Utype;
                    Utype = dt.Rows[0][9].ToString().Trim();
                    if(Utype == "user")
                    {
                    //feacting the name of user and assigning it to session
                    string name=dt.Rows[0]["fname"].ToString().Trim();
                    int uid =Convert.ToInt32( dt.Rows[0]["Userid"]);
                    Session["Username"] = name;
                    Session["uid"] = uid;
                     //featching userid and assigning in cookie
                     Response.Cookies["userid"].Value = dt.Rows[0]["Userid"].ToString();
                    Response.Cookies["userid"].Expires = DateTime.Now.AddDays(30);
                    Response.Redirect("UserHome.aspx");
                    }
                    else
                    {
                        int uid = Convert.ToInt32(dt.Rows[0]["Userid"]);
                        string adminname = dt.Rows[0]["fname"].ToString();
                        Session["admin"] = adminname;
                        Session["Auid"] = uid;
                        Response.Redirect("/Admin/AdminHome.aspx");
                    }
                   
                }
                else
                {
                    Response.Write("<script> alert('Invalid Email or Password!!'); </script>");
                }
                con.Close();
            }
        }
    }
}