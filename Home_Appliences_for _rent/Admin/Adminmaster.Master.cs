using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Home_Appliences_for__rent.Admin
{
    public partial class Adminmaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsignout_Click(object sender, EventArgs e)
        {
            Session["admin"] = null;
            Session.Abandon();
            Response.Redirect("/user/Ulogin.aspx");
        }
    }
}