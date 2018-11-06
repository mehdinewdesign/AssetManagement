using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["PageType"] == null)
        {
            Session["PageType"] = "Login";
        }
    }

    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        Session["PageType"] = "Login";
        //Session["UserName"] = string.Empty;
        HttpCookie Cookie = Request.Cookies["Name"];
        if (Cookie != null)
        {
            Cookie.Expires = DateTime.Now.AddDays(-1);
        }
        FormsAuthentication.SignOut();
        Response.Redirect("Login.aspx");
    }

    protected void BtnNotifications_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminHome.aspx");
    }


    protected void BtnNewItem_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminNewItem.aspx");
    }

    protected void BtnAvailableItems_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminAvailableItems.aspx");
    }

    protected void BtnUserHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserHome.aspx");
    }

    protected void BtnNewRequest_Click(object sender, EventArgs e)
    {
        Response.Redirect("UserNewRequest.aspx");
    }

    protected void BtnChangePwd_Click(object sender, EventArgs e)
    {
        Response.Redirect("ChangePassword.aspx");
    }

    protected void BtnReportQuery_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminReportQuery.aspx");
    }
}
