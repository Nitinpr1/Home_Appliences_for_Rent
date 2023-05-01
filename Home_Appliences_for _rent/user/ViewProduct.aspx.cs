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
    public partial class ViewProduct : System.Web.UI.Page
    {
        //int proid;
        //string product_name, product_extesion, dprice, rprice;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                if (Request.QueryString["Pid"] != null)
                {
                    if (!IsPostBack)
                    {
                        //BindProdectimg();
                        BindProdetail();
                        BindCartNumber();

                    }
                }
                else
                {
                    Response.Redirect("/UserHome.aspx");
                }
            }
            else
            {
                Response.Redirect("/GuestUser/GuestHome.aspx");
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

            //if (Request.Cookies["CartItem"] != null)
            //{
            //    string CookiePid = Convert.ToString(Request.Cookies["CartItem"].Value);
            //    string[] ProductArray = CookiePid.Split('|');
            //    int ProductCount = ProductArray.Length;
            //    pCount.InnerText = ProductCount.ToString();
            //}
            //else
            //{
            //    pCount.InnerText = 0.ToString();
            //}
        }

        //private void BindProdectimg()
        //{
        //    int pid = (int)Convert.ToInt64(Request.QueryString["Pid"]);
        //    using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("select * from tblProducts where Pid='" + pid+"'", con))
        //        {
        //            cmd.CommandType = CommandType.Text;
        //            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //            {
        //                DataTable dt = new DataTable();
        //                sda.Fill(dt);
        //                rptrProductimg.DataSource = dt;
        //                rptrProductimg.DataBind();
        //            }
        //        }

        //    }
        //}

        private void BindProdetail()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            {
                int pid = (int)Convert.ToInt64(Request.QueryString["Pid"]);
                using (SqlCommand cmd = new SqlCommand("select * from tblProducts where Pid='" + pid + "'", con))
                {
            
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrProductView.DataSource = dt;
                        rptrProductView.DataBind();
                        Session["mypid"] = Convert.ToInt32(dt.Rows[0]["Pid"].ToString());
                        Session["pname"] = dt.Rows[0]["PName"].ToString();
                        Session["pimg"] = dt.Rows[0]["Pimg"].ToString();
                        Session["dprice"] = dt.Rows[0]["DPrice"].ToString();
                        Session["rprice"] = dt.Rows[0]["RPrice"].ToString();
                    }
                }

            }
        }

        protected void btnAddtoCart_Click(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                Int32 UserID = Convert.ToInt32(Session["uid"].ToString());
                Int64 PID = Convert.ToInt64(Request.QueryString["Pid"]);
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM tblCart where PId = @PID and UserId = @UserID", con);
                    
                    cmd.Parameters.AddWithValue("@UserID", UserID);
                    cmd.Parameters.AddWithValue("@PID", PID);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            Int32 updateQty = Convert.ToInt32(dt.Rows[0]["PQuantity"].ToString());
                            SqlCommand myCmd = new SqlCommand("UPDATE tblCart SET PQuantity = @Quantity WHERE PID = @CartPID AND UserId = @UserID", con);
                             
                            myCmd.Parameters.AddWithValue("@Quantity", updateQty +int.Parse( txtQuantity.Text.Trim()));
                            myCmd.Parameters.AddWithValue("@CartPID", PID);
                            myCmd.Parameters.AddWithValue("@UserID", UserID);
                           
                            myCmd.ExecuteNonQuery();
                            
                            Response.Write("<script> alert('Item Updated in cart'); </script>");
                            BindCartNumber();
                           
                        }
                        else
                        {
                            SqlCommand myCmd = new SqlCommand("insert into tblcart values(@UID,@PID,@Pname,@pimg,@pqty,@dprice,@rprice,@month)", con);
                             
                            myCmd.Parameters.AddWithValue("@UID", UserID);
                            myCmd.Parameters.AddWithValue("@PID", Session["mypid"].ToString());
                            myCmd.Parameters.AddWithValue("@Pname", Session["pname"].ToString());
                            myCmd.Parameters.AddWithValue("@pimg", Session["pimg"].ToString());
                            myCmd.Parameters.AddWithValue("@pqty", txtQuantity.Text.Trim()  );
                            myCmd.Parameters.AddWithValue("@dprice", Session["dprice"].ToString());
                            myCmd.Parameters.AddWithValue("@rprice", Session["rprice"].ToString());
                            myCmd.Parameters.AddWithValue("@month", txtmonths.Text.Trim());
                            myCmd.ExecuteNonQuery();
                            con.Close();
                            Response.Write("<script> alert('Item added in cart'); </script>");
                            BindCartNumber();
                             
                        }
                    }
                }
            }
            else
            {
                Int64 PID = Convert.ToInt64(Request.QueryString["Pid"]);
                Response.Redirect("Ulogin.aspx?rurl=" + PID);
            }






            //using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["RentspaceDB"].ConnectionString))
            //{
            //    int pid = (int)Convert.ToInt64(Request.QueryString["Pid"]);
            //    using (SqlCommand cmd = new SqlCommand("select A.*, B.* from tblProducts as A  inner join tblProductImg  as B on A.Pid=B.Pid where B.Pid='" + pid + "'" , con))
            //    {

            //        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            //        {
            //            con.Open();
            //            DataTable dt = new DataTable();
            //            sda.Fill(dt);
            //            foreach (DataRow dr in dt.Rows)
            //            {
            //                proid = Convert.ToInt32( dr["Pid"]);
            //                product_name= dr["PName"].ToString();
            //                product_extesion = dr["Extention"].ToString();
            //                dprice = dr["DPrice"].ToString();
            //                rprice = dr["Rprice"].ToString();

            //            }
            //            con.Close();
            //            string Pqty=txtQuantity.Text;
            //            if (Request.Cookies["CartItem"]== null)
            //            {
            //                Response.Cookies["CartItem"].Value = proid + "," + product_name.ToString() + "," + product_extesion.ToString()+ "," + dprice.ToString() + "," + rprice.ToString() + "," + Pqty.ToString();
            //                Response.Cookies["CartItem"].Expires=DateTime.Now.AddDays(1);
            //            }
            //            else
            //            {
            //                Response.Cookies["CartItem"].Value = Request.Cookies["CartItem"].Value + "|" + proid + "," + product_name.ToString() + "," + product_extesion.ToString() + ","+ dprice.ToString() + "," + rprice.ToString() + "," + Pqty.ToString();
            //                Response.Cookies["CartItem"].Expires = DateTime.Now.AddDays(1);
            //            }
            //        }
            //    }




        }
       
    }
}