using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;


namespace Home_Appliences_for__rent.user
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnForgotPassword_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from TblUser where email=@email", con);
                cmd.Parameters.AddWithValue("@email", txtemail.Text);
                SqlDataAdapter sda=new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if(dt.Rows.Count != 0)
                {
                    //string myGUID=Guid.NewGuid().ToString();
                    //int Uid = Convert.ToInt32(dt.Rows[0][0]);
                    //SqlCommand cmd1 = new SqlCommand("insert into ForgotPass(Id,Uid,RequestDateTime) values('" + myGUID + "','" + Uid + "',GETDATE())", con);
                    //cmd1.ExecuteNonQuery();
                    //Click the below link to Reset Your Password !<br/> https://localhost:44317/user/RecoverPassword.aspx?Id=
                    string uemail = dt.Rows[0]["email"].ToString();
                    String password=dt.Rows[0]["pwd"].ToString();

                    // Send Reset link through Email

                    string ToEmailAddress = dt.Rows[0][3].ToString();
                    string Username = dt.Rows[0][1].ToString();
                    string EmailBody = "Hi ," + Username + "<br/><br/>Your Email is : "+uemail+"<br/>And Passowrd is : "+password+"<br/><br/>Now Go back to Sign In and Enjoy Renting !!<br/><br/>Rentspace Customer Service.";

                    MailMessage PassRecMail=new MailMessage("nitin.prajapati_it@scct.edu.in", ToEmailAddress);

                    PassRecMail.Body = EmailBody;
                    PassRecMail.IsBodyHtml = true;
                    PassRecMail.Subject = "Forgot Password";

                    using(SmtpClient smtp = new SmtpClient())
                    {
                        smtp.EnableSsl = true;
                        smtp.UseDefaultCredentials = false;
                        smtp.Credentials = new NetworkCredential("nitin.prajapati_it@scct.edu.in", "scct.edu");
                        smtp.Host = "smtp.gmail.com";
                        smtp.Port = 587;
                        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

                        smtp.Send(PassRecMail);
                    }

                    //........
                    lblsu.Text = "Please check Your email For Password!!";
                    lblsu.ForeColor = System.Drawing.Color.Green;
                    txtemail.Text = "";
                }
                else
                {
                    lblsu.Text = " OOps! This Email Does not Exist... Try again!!";
                    lblsu.ForeColor = System.Drawing.Color.Red;
                    txtemail.Focus();
                }
            }
        }
    }
}
