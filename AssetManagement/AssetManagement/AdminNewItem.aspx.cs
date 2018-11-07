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

    protected void BtnInsert_Click(object sender, EventArgs e)
    {
        ItemsDataSource.InsertCommandType = SqlDataSourceCommandType.Text;
        try
        {
            ItemsDataSource.Insert();
            LblStatus.Text = "Successfully Added Item";
            LblStatus.ForeColor = System.Drawing.Color.Green;
        }
        catch(Exception ex)
        {
            LblStatus.Text = "Cannot Add This Item";
            LblStatus.ForeColor = System.Drawing.Color.Red;
        }

        TxtName.Text = "";
        TxtQuantity.Text = "";
    }
}