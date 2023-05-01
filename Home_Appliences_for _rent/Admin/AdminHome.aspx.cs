using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Home_Appliences_for__rent.Admin
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                success.InnerText=Session["admin"].ToString();    
            }
            else
            {
                Response.Redirect("/user/Ulogin.aspx");
            }
        }
    }
}