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
    public partial class Usignup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtfname.Focus();
        }

        protected void UserSignUp_Click(object sender, EventArgs e)
        {
            //try
            //{


                if (isformvalid())
                {
                    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("Insert into TblUser(fname,lname,email,pwd,Adress,aadhar,city,zip,usertype,Conumber) Values('" + txtfname.Text + "','" + txtlname.Text + "','" + txtemail.Text + "','" + txtpass.Text + "','" + txtadd.Text + "','" + Int64.Parse(txtaadhar.Text) + "','" + txtcity.Text + "','" + Int32.Parse( txtzip.Text) + "','user','"+ Int64.Parse(txtcontact.Text)+"')", con);

                        cmd.ExecuteNonQuery();

                        Response.Write("<script> alert('Registration SuccessFull !!'); </script>");
                        

                        //sending mail for Signup

                        string toEmailAddress = txtemail.Text;
                        string Username =  txtfname.Text.Trim()+txtlname.Text.Trim();
                        string EmailBody = "Hello ," + Username+"!"+ "<br/><br/> <br/>Thank you ! for creating a Rentspace Account. We are more than happy to have you on board.<br/>Please make yourself at home and enjoy Renting with us.<br/><br><br/>See you around,<br/>Custmer Service Team."; 

                        MailMessage PassRecMail = new MailMessage("nitin.prajapati_it@scct.edu.in", toEmailAddress);

                        PassRecMail.Body = EmailBody;
                        PassRecMail.IsBodyHtml = true;
                        PassRecMail.Subject = "Rentspace Registration !!";

                        using (SmtpClient smtp = new SmtpClient())
                        {
                            smtp.EnableSsl = true;
                            smtp.UseDefaultCredentials = false;
                            smtp.Credentials = new NetworkCredential("nitin.prajapati_it@scct.edu.in", "password");
                            smtp.Host = "smtp.gmail.com";
                            smtp.Port = 587;
                            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

                            smtp.Send(PassRecMail);
                        }
                        clr();
                        con.Close();

                        //.........

                        Response.Redirect("Ulogin.aspx");
                    }
                }
                
                else
                {
                    Response.Write("<script> alert('Registration Faild!!'); </script>");
                }

            //}
            //catch(Exception ex)
            //{
            //    Response.Write(ex);
            //}
        }

        private bool isformvalid()
        {
            string sAdhaar = txtaadhar.Text;
            bool isValidnumber = aadharcard.validateVerhoeff(sAdhaar);

            if (txtfname.Text.Length<4)
            {
                Response.Write("<script>alert('Name must be more than 4 character!!'); </script>");
                txtfname.Focus();
                return false;
            }
            else if(txtpass.Text.Length<4)
            {
                Response.Write("<script>alert('Password must be more than 4 character!!'); </script>");
                txtpass.Focus();
                return false;
            }
            else if(txtcontact.Text.Length!=10){
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
        

        private void clr()
        {
            txtfname.Text = "";
            txtlname.Text = "";
            txtemail.Text = "";
            txtpass.Text = "";
            txtadd.Text = "";
            txtaadhar.Text = "";
            txtcity.Text = "";
            txtzip.Text = "";
            txtconpass.Text = "";
            txtcontact.Text = "";
        }
    }
}
