using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    //protected void Page_PreInit(object sender, EventArgs e)
    //{
    //    Page.Theme = "Light";
    //}
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        string Query = "AdminReport.aspx?t=" + Server.UrlEncode(RBtnQueries.SelectedValue) + "&sd=" + Server.UrlEncode(TxtStartDate.Text) + "&ed=" + Server.UrlEncode(TxtEndDate.Text);
        Response.Redirect(Query);
    }
}