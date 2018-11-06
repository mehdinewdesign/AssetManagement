using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        Page.Theme = "Light";
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RBtnQueries_SelectedIndexChanged(object sender, EventArgs e)
    {
        string Query = "AdminReport.aspx?q=" + Server.UrlEncode(RBtnQueries.SelectedValue);
        Response.Redirect(Query);
    }
}