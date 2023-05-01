using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Threading;

namespace Home_Appliences_for__rent.user
{
    public partial class Cart : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            { 
                if (!IsPostBack)
                {
                    BindCart();
                    Cartcount();

                }
              lblerror.Visible = false;
                Cartcount();
                //BindCartItem();
                //BindCartNumber();
            }
        }

        private void Cartcount()
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
                    mycart.InnerText= ds.Tables[0].Rows[0]["totalRow"].ToString();
                }

            }
        }

        private void BindCart()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                int i = (int)Convert.ToInt32(Session["uid"]);
                int uid = (int)Convert.ToInt32(Request.Cookies["userid"].Value);
                using (SqlCommand cmd = new SqlCommand("select * from tblcart where UserId='" + uid + "'", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrCartItem.DataSource = dt;
                        rptrCartItem.DataBind();

                        if (dt.Rows.Count > 0)
                        {
                            string TotalDeposit = dt.Compute("Sum(SubDAmount)", "").ToString();
                            string TotalRprice = dt.Compute("Sum(SubRAmount)", "").ToString();
                          
                            int TotalDeposit1 = Convert.ToInt32(dt.Compute("Sum(SubDAmount)", ""));
                            int TotalRprice1 = Convert.ToInt32(dt.Compute("Sum(SubRAmount)", ""));
                            totaldprice.InnerText = "Rs. " + string.Format("{0:#,###.##}", double.Parse(TotalDeposit)) + ".00";
                            totalrprice.InnerText = "Rs. " + string.Format("{0:#,###.##}", double.Parse(TotalRprice)) + ".00";
                            grandtotal.InnerText = " Rs. " + (TotalDeposit1 + TotalRprice1).ToString() + ".00";
                        }
                        else
                        {
                            mycart.InnerText = "Your Shopping Cart is Empty.";
                            btnRentnow.Enabled=false;
                        }
                    }
                }

            }
        }


        protected void rptrCartItem_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Int32 UserID = Convert.ToInt32(Session["uid"].ToString());
            if (e.CommandName == "QtyPlus")
            {
                string PID = (e.CommandArgument.ToString());
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM tblCart WHERE PId = @PID AND UserId = @UserID", con);

                    cmd.Parameters.AddWithValue("@PID", PID);
                    cmd.Parameters.AddWithValue("@UserID", UserID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            Int32 updateQty = Convert.ToInt32(dt.Rows[0]["PQuantity"].ToString());
                            SqlCommand myCmd = new SqlCommand("UPDATE tblcart SET PQuantity = @Quantity WHERE PId = @CartPID AND UserId = @UserID", con);

                            myCmd.Parameters.AddWithValue("@Quantity", updateQty + 1);
                            myCmd.Parameters.AddWithValue("@CartPID", PID);
                            myCmd.Parameters.AddWithValue("@UserID", UserID);

                            con.Open();
                            myCmd.ExecuteNonQuery();
                            //Int64 CartID = Convert.ToInt64(myCmd.ExecuteScalar());
                            con.Close();
                            BindCart();

                        }


                    }

                }
            }
            else if (e.CommandName == "QtyMinus")
            {
                string PID = (e.CommandArgument.ToString());
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM tblCart WHERE PId = @PID AND UserId = @UserID", con);

                    cmd.Parameters.AddWithValue("@PID", PID);
                    cmd.Parameters.AddWithValue("@UserID", UserID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            Int32 myQty = Convert.ToInt32(dt.Rows[0]["PQuantity"].ToString());
                            if (myQty <= 1)
                            {
                                lblerror.Visible = true;
                            }
                            else
                            {
                                SqlCommand myCmd = new SqlCommand("UPDATE tblcart SET PQuantity = @Quantity WHERE PId = @CartPID AND UserId = @UserID", con);
                                
                                myCmd.Parameters.AddWithValue("@Quantity", myQty - 1);
                                myCmd.Parameters.AddWithValue("@CartPID", PID);
                                myCmd.Parameters.AddWithValue("@UserID", UserID);
                                con.Open();
                                myCmd.ExecuteNonQuery();
                                //Int64 CartID = Convert.ToInt64(myCmd.ExecuteScalar());
                                con.Close();
                                BindCart();
                               

                            }
                        }

                    }

                }
            }
            else if (e.CommandName == "MonthsMinus")
            {
                string PID = (e.CommandArgument.ToString());
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM tblCart WHERE PId = @PID AND UserId = @UserID", con);

                    cmd.Parameters.AddWithValue("@PID", PID);
                    cmd.Parameters.AddWithValue("@UserID", UserID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            Int32 months = Convert.ToInt32(dt.Rows[0]["months"].ToString());
                            if (months <= 1)
                            {
                                lblerror.Visible = true;
                                 
                            }
                            else
                            {
                                SqlCommand myCmd = new SqlCommand("UPDATE tblcart SET months = @months WHERE PId = @CartPID AND UserId = @UserID", con);

                                myCmd.Parameters.AddWithValue("@months", months - 1);
                                myCmd.Parameters.AddWithValue("@CartPID", PID);
                                myCmd.Parameters.AddWithValue("@UserID", UserID);
                                con.Open();
                                myCmd.ExecuteNonQuery();
                                //Int64 CartID = Convert.ToInt64(myCmd.ExecuteScalar());
                                con.Close();
                                BindCart();


                            }
                        }

                    }

                }
            }
            else if (e.CommandName == "MonthsPlus")
            {
                string PID = (e.CommandArgument.ToString());
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM tblCart WHERE PId = @PID AND UserId = @UserID", con);

                    cmd.Parameters.AddWithValue("@PID", PID);
                    cmd.Parameters.AddWithValue("@UserID", UserID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            Int32 months = Convert.ToInt32(dt.Rows[0]["months"].ToString());
                            
                                SqlCommand myCmd = new SqlCommand("UPDATE tblcart SET months = @months WHERE PId = @CartPID AND UserId = @UserID", con);

                                myCmd.Parameters.AddWithValue("@months", months + 1);
                                myCmd.Parameters.AddWithValue("@CartPID", PID);
                                myCmd.Parameters.AddWithValue("@UserID", UserID);
                                con.Open();
                                myCmd.ExecuteNonQuery();
                                //Int64 CartID = Convert.ToInt64(myCmd.ExecuteScalar());
                                con.Close();
                                BindCart();
                        }

                    }

                }
            }
            else if (e.CommandName == "RemoveThisCart")
            {
                int CartPID = Convert.ToInt32(e.CommandArgument.ToString().Trim());
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
                {
                    SqlCommand myCmd = new SqlCommand("DELETE FROM tblCart WHERE CartId = @CartID", con);
                     
                    myCmd.Parameters.AddWithValue("@CartID", CartPID);
                    con.Open();
                    myCmd.ExecuteNonQuery();
                    con.Close();
                    BindCart();
                    Cartcount();
                }
            }
        }

        protected void btnRentnow_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }

        //private void BindCartNumber()
        //{

        //    if (Request.Cookies["CartItem"] !=null)
        //    {
        //        string CookiePid = Convert.ToString(Request.Cookies["CartItem"].Value); 
        //        string[] ProductArray = CookiePid.Split('|');
        //        int ProductCount = ProductArray.Length;
        //        pCount.InnerText= ProductCount.ToString();
        //    }
        //    else
        //    {
        //        pCount.InnerText =0.ToString(); 
        //    }
        //}

        //private void BindCartItem()
        //{
        //    string s;
        //    string t;

        //    string[] a = new string[6];

        //    DataTable dt=new DataTable();
        //   dt.Columns.AddRange(new DataColumn[6] { new DataColumn("Pid"), new DataColumn("PName"), new DataColumn("Extention"), new DataColumn("DPrice"), new DataColumn("Rprice"), new DataColumn("Pqty") });

        //    if (Request.Cookies["CartItem"] != null)
        //    {
        //        s = Convert.ToString(Request.Cookies["CartItem"].Value);
        //        string[] strArr = s.Split('|');

        //        for(int i = 0; i < strArr.Length; i++)
        //        {
        //            t= Convert.ToString( strArr[i].ToString());
        //            string[] stra = t.Split(',');
        //            for(int j = 0; j < stra.Length; j++)
        //            {
        //                a[j] = stra[j] ;

        //            }

        //            dt.Rows.Add(a[0].ToString(), a[1].ToString(), a[2].ToString(), a[3].ToString(), a[4].ToString(), a[5].ToString());
        //        }


        //    }
        //    rptrCartItem.DataSource = dt;
        //    rptrCartItem.DataBind();

        //}
    }
}