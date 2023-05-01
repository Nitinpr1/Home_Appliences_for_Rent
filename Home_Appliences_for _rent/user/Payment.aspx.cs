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
    public partial class Payment : System.Web.UI.Page
    {
        public static Int32 OrderNumber = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                if (!IsPostBack)
                {
                    BindUserDetails();
                    BindOrderProducts();
                    genAutoNum();
                    BindReturndate();
                    //code for preventing the user to input the date less than today
                    // Get the current date 
                    DateTime today = DateTime.Today;
                    // Set the minimum date to today's date
                    txtexpirydate.Attributes.Add("min", today.ToString("yyyy-MM-dd"));
                }
                Cartcount();

            }
            else
            {
                Response.Redirect("Ulogin.aspx");
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
                    
                }

            }
        }
        private void BindReturndate()
        {
            int uid = Convert.ToInt32(Session["uid"]);
            DataTable dt = new DataTable();
            using (SqlConnection con0 = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                SqlCommand cmd0 = new SqlCommand("SELECT Pid FROM tblcart WHERE UserId = @UID", con0);
                cmd0.Parameters.AddWithValue("@UID", uid);
                using (SqlDataAdapter sda0 = new SqlDataAdapter(cmd0))
                {
                    sda0.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        DataTable dt1 = new DataTable();
                        dt1.Columns.AddRange(new DataColumn[2] { new DataColumn("ProductName"), new DataColumn("mo") });
                        foreach (DataRow row in dt.Rows)
                        {
                            int pid = Convert.ToInt32(row["Pid"]);
                            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
                            {
                                SqlCommand cmd = new SqlCommand("SELECT * FROM tblcart where Pid=@Pid AND UserId = @UID", con);
                                cmd.Parameters.AddWithValue("@Pid", pid);
                                cmd.Parameters.AddWithValue("@UID", uid);
                                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                                DataTable dtProducts = new DataTable();
                                sda.Fill(dtProducts);
                                foreach (DataRow dr in dtProducts.Rows)
                                {
                                    int a = int.Parse(dr["months"].ToString());
                                    int b = a * 30;
                                    DateTime date = DateTime.Now.Date.AddDays(b);
                                    string g = date.ToString("dd/MM/yyyy");
                                    string productName = dr["Pname"].ToString();
                                    dt1.Rows.Add(productName, g);
                                }
                            }
                        }
                        GvReturndate.DataSource = dt1;
                        GvReturndate.DataBind();
                    }
                }
            }


        }
        private void genAutoNum()
        {
            Random r = new Random();
            int num = r.Next(Convert.ToInt32("321567"),
            Convert.ToInt32("987231"));
            string ChkOrderNum = num.ToString();
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * FROM tblOrders WHERE OrderNumber = @FindOrderNumber ", con);
                cmd.Parameters.AddWithValue("@FindOrderNumber", ChkOrderNum);
                if (con.State == ConnectionState.Closed) { con.Open(); }
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    con.Close();
                    if (dt.Rows.Count > 0)
                    {
                        genAutoNum();
                    }
                    else
                    {
                        OrderNumber = Convert.ToInt32(num.ToString());
                    }

                }
                Session["Oredernumber"]= OrderNumber.ToString();
            }
        }

        private void BindUserDetails()
        {
            int uid = Convert.ToInt32(Session["uid"]);
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
                            string fname = dt.Rows[0]["fname"].ToString();
                            string lname = dt.Rows[0]["lname"].ToString();
                            txtname.Text = fname + " " + lname;
                            txtconumber.Text = dt.Rows[0]["Conumber"].ToString();
                            txtcity.Text = dt.Rows[0]["city"].ToString();
                            txtaddress.Text = dt.Rows[0]["Adress"].ToString();
                            txtemail.Text = dt.Rows[0]["email"].ToString();
                            txtzip.Text = dt.Rows[0]["zip"].ToString();
                        }
                    }
                }
                Session["address"]=txtaddress.Text;
            }

        }


        private void BindOrderProducts()
        {
            int uid = Convert.ToInt32(Session["uid"]);
            DataTable dt = new DataTable();
            using (SqlConnection con0 = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                SqlCommand cmd0 = new SqlCommand("SELECT Pid FROM tblcart WHERE UserId = @UID", con0);

                cmd0.Parameters.AddWithValue("@UID", uid);
                using (SqlDataAdapter sda0 = new SqlDataAdapter(cmd0))
                {
                    sda0.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        foreach (DataColumn PID in dt.Columns)
                        {
                            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
                            {
                                using (SqlCommand cmd = new SqlCommand("SELECT * FROM tblcart where Pid=" + PID + " AND UserId ='" + uid + "'", con))
                                {
                                    cmd.CommandType = CommandType.Text;
                                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                                    {
                                        DataTable dtProducts = new DataTable();
                                        sda.Fill(dtProducts);
                                        Gvproducts.DataSource = dtProducts;
                                        Gvproducts.DataBind();
                                        BindPricedetails();

                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        private void BindPricedetails()
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


                        if (dt.Rows.Count > 0)
                        {
                            string TotalDeposit = dt.Compute("Sum(SubDAmount)", "").ToString();
                            string TotalRprice = dt.Compute("Sum(SubRAmount)", "").ToString();

                            int TotalDeposit1 = Convert.ToInt32(dt.Compute("Sum(SubDAmount)", ""));
                            int TotalRprice1 = Convert.ToInt32(dt.Compute("Sum(SubRAmount)", ""));
                            totaldprice.InnerText = "Rs. " + string.Format("{0:#,###.##}", double.Parse(TotalDeposit)) + ".00";
                            totalrprice.InnerText = "Rs. " + string.Format("{0:#,###.##}", double.Parse(TotalRprice)) + ".00";
                            grandtotal.InnerText = " Rs. " + (TotalDeposit1 + TotalRprice1).ToString() + ".00";
                            totalpay.InnerText = " Rs. " + (TotalDeposit1 + TotalRprice1).ToString() + ".00";
                            Session["dprice"] = TotalDeposit1.ToString();
                            Session["rprice"] = TotalRprice1.ToString();
                            Session["totalpaid"] = (TotalDeposit1 + TotalRprice1).ToString();
                        }
                        else
                        {
                            Label1.Text = "Your Shopping Cart is Empty.";


                        }
                    }
                }

            }
        }

        protected void btnPayment_Click(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                int i = (int)Convert.ToInt32(Session["uid"]);
                int total = Int32.Parse(Session["totalpaid"].ToString());
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
                {
                    SqlCommand cmd = new SqlCommand("insert into tblPayments(UserId,CardNo,Expirydate,CVV,TotalPaid,Paymentstatus,PaymentDate) values(@uid,@cardno,@exdate,@cvv,@totalpaid,@paymentstatus,@paydate)", con);
                    cmd.Parameters.AddWithValue("@uid", i);
                    cmd.Parameters.AddWithValue("@cardno", Int64.Parse(txtcard.Text.Trim()));
                    cmd.Parameters.AddWithValue("@exdate", txtexpirydate.Text);
                    cmd.Parameters.AddWithValue("@cvv", int.Parse(txtcvv.Text.Trim()));
                    cmd.Parameters.AddWithValue("@totalpaid", total);
                    cmd.Parameters.AddWithValue("@paymentstatus", "Paid");
                    cmd.Parameters.AddWithValue("@paydate",DateTime.Now);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    InsertOrders();
                    Response.Redirect("Orderplaced.aspx");
                }

            }
            else
            {
                Response.Redirect("Ulogin.aspx");

            }
        }
        protected void InsertOrders()
        {
            int dprice = Int32.Parse(Session["dprice"].ToString());
            int rprice = Int32.Parse(Session["rprice"].ToString());
            int total = Int32.Parse(Session["totalpaid"].ToString());

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                int i = (int)Convert.ToInt32(Session["uid"]);
                SqlCommand cmd = new SqlCommand("insert into tblOrders(OrderNumber,UserId,Email,UName,UAddress,ContactNo,City,Zip,DPrice,RPrice,TotalPaid,Paymentstatus,RentalDate) values(@ordernumber,@userid,@email,@uname,@uaddress,@conumber,@city,@zip,@dprice,@rprice,@totalpaid,@paymentstatus,@rentaldate)", con);
                cmd.Parameters.AddWithValue("@ordernumber", OrderNumber);
                cmd.Parameters.AddWithValue("@userid", i);
                cmd.Parameters.AddWithValue("@email", txtemail.Text.Trim());
                cmd.Parameters.AddWithValue("@uname", txtname.Text.Trim());
                cmd.Parameters.AddWithValue("@uaddress", txtaddress.Text.Trim());
                cmd.Parameters.AddWithValue("@conumber", Int64.Parse(txtconumber.Text.Trim()));
                cmd.Parameters.AddWithValue("@city", txtcity.Text.Trim());
                cmd.Parameters.AddWithValue("@zip", Int32.Parse(txtzip.Text.Trim()));
                cmd.Parameters.AddWithValue("@dprice", dprice);
                cmd.Parameters.AddWithValue("@rprice", rprice);
                cmd.Parameters.AddWithValue("@totalpaid", total);
                cmd.Parameters.AddWithValue("@paymentstatus", "Paid");
                cmd.Parameters.AddWithValue("@rentaldate", DateTime.Now);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                InsertOrderedProducts();
            }
        }
        protected void InsertOrderedProducts()
        {
            int i = (int)Convert.ToInt32(Session["uid"]);
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                foreach (GridViewRow gvr in Gvproducts.Rows)
                {
                    SqlCommand cmd = new SqlCommand("insert into tblOrderedProducts(OrderNumber,UserId,Products,Quantity,Months,RentalDate,OrderStatus) values(@ordernumber,@uid,@products,@qty,@mo,@rentdate,@orderstatus)", con);
                    cmd.Parameters.AddWithValue("@ordernumber", OrderNumber);
                    cmd.Parameters.AddWithValue("@uid", i);
                    cmd.Parameters.AddWithValue("@products", gvr.Cells[0].Text);
                    cmd.Parameters.AddWithValue("@qty",Int32.Parse( gvr.Cells[1].Text));
                    cmd.Parameters.AddWithValue("@mo",Int32.Parse( gvr.Cells[4].Text));
                    cmd.Parameters.AddWithValue("@rentdate", DateTime.Now);
                    cmd.Parameters.AddWithValue("@orderstatus", "Pass");
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                foreach(GridViewRow ro in GvReturndate.Rows)
                {
                    SqlCommand cmd = new SqlCommand("update tblOrderedProducts set Returndate=@returndate where UserId='" + i + "' and OrderNumber='" + OrderNumber + "'and Products=@pname", con);
                    cmd.Parameters.AddWithValue("@returndate", ro.Cells[1].Text);
                    cmd.Parameters.AddWithValue("@pname", ro.Cells[0].Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    Emptycart();
                }
            }
        }
        protected void Emptycart()
        {
            int i = (int)Convert.ToInt32(Session["uid"]);
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM tblCart WHERE UserId = @uid", con);
                cmd.Parameters.AddWithValue("uid", i);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
    }
}