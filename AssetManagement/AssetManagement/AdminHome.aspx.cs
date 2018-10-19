using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["Theme"] != null)
        {
            Page.Theme = Session["Theme"].ToString();
        }
        else
        {
            Page.Theme = "Light";
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnInsert_Click(object sender, EventArgs e)
    {
        ItemsDataSource.InsertCommandType = SqlDataSourceCommandType.Text;
        ItemsDataSource.Insert();

        TxtName.Text = "";
        TxtQuantity.Text = "";
    }

}