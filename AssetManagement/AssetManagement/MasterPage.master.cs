using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    HttpCookie Cookie;

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
        Session["UserName"] = string.Empty;
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

    //protected void BtnTheme_Click(object sender, EventArgs e)
    //{
    //    Cookie = Request.Cookies["Preferences"];
    //    if (Cookie == null)
    //    {
    //        Cookie = new HttpCookie("Preferences");
    //        Cookie.Expires = DateTime.Now.AddDays(30);
    //    }
    //    if (DdlTheme.SelectedItem.Text == "Dark")
    //    {
    //        Cookie["Theme"] = "Dark";
    //    }
    //    else
    //    {
    //        Cookie["Theme"] = "Light";
    //    }
    //    Response.Cookies.Add(Cookie);
    //    Response.Redirect(Request.RawUrl);
    //}
}
