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
    public partial class Guestview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Pid"] != null)
            {
                if (!IsPostBack)
                {
                    //BindProdectimg();
                    BindProdetail();
                     

                }
            }
            else
            {
                Response.Redirect("/GuestHome.aspx");
            }
        }

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
    }
}