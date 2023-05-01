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
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uid"] != null)
            {
                cartshow.Visible = true;
                profile.Visible = true;
                BindCartNumber();
            }
            else
            {
                cartshow.Visible = false;   
                profile.Visible = false;
            }
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
        protected void btnContact_Click(object sender, EventArgs e)
        {
            if (isformvalid())
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Insert into tblContectUs(PersonName,PersonEmail,msg ) Values('" + txtname.Text + "','" + txtemail.Text + "','" + txtmsg.Text + "' )", con);

                    cmd.ExecuteNonQuery();
                    SendMail();
                    Response.Write("<script> alert('Message sent  SuccessFully !!'); </script>");
                    clr();
                    con.Close();

                }
            }
            else
            {
                Response.Write("<script> alert(' faild!!'); </script>");
            }
        }

        private void SendMail()
        {
            string usermail = txtemail.Text;
            string usermsg=txtmsg.Text; 
            string uname=txtname.Text;
            string toEmailAddress = "nitin.prajapati_it@scct.edu.in";
            string Username = "Admin";
            string EmailBody = "Hello , " + Username + "!" + "<br/><br/>One of Your User "+uname+" with the Email "+usermail+" says <br/>"+usermsg+ "<br/><br><br>Custmer Service Team.";

            MailMessage PassRecMail = new MailMessage("nitin.prajapati_it@scct.edu.in", toEmailAddress);

            PassRecMail.Body = EmailBody;
            PassRecMail.IsBodyHtml = true;
            PassRecMail.Subject = "Rentspace User Contact !!";

            using (SmtpClient smtp = new SmtpClient())
            {
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("nitin.prajapati_it@scct.edu.in", "Nitin6390");
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

                smtp.Send(PassRecMail);
            }
        }

        private void clr()
        {
            txtmsg.Text = "";
            txtemail.Text = "";
            txtname.Text = "";
        }

        private bool isformvalid()
        {
            if (txtname.Text.Length < 4)
            {
                Response.Write("<script>alert('Name must be more than 4 character!!'); </script>");
                txtname.Focus();
                return false;
            }
            else if (txtmsg.Text.Length < 10)
            {
                Response.Write("<script>alert('Message must be more than 10 character!!'); </script>");
                txtmsg.Focus();
                return false;
            }
            return true;
        }
    }
}