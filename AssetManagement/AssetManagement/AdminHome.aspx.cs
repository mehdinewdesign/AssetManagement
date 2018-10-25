using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    HttpCookie Cookie;

    protected void Page_PreRender(object sender, EventArgs e)
    {

    }

    protected void Page_PreInit(object sender, EventArgs e)
    {
        Cookie = Request.Cookies["Theme"];
        if (Cookie != null)
        {
            Page.Theme = Cookie["Theme"].ToString();
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

    protected void GVNotifications_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow) { return; }
        bool flag = true;
        using (SqlConnection Con = new SqlConnection(WebConfigurationManager.ConnectionStrings["AssetManagement"].ConnectionString))
        {
            using (SqlCommand Cmd = new SqlCommand("SELECT quantity FROM [Items] WHERE name=@name", Con))
            {
                Cmd.Parameters.AddWithValue("@name", e.Row.Cells[1].Text);
                Con.Open();
                using (SqlDataReader DataReader = Cmd.ExecuteReader())
                {
                    if (DataReader.Read())
                    {
                        if ((int)DataReader["quantity"] <= 0)
                        {
                            flag = false;
                        }
                    }
                }
            }
        }
        if (!flag)
        {
            e.Row.Controls[4].Visible = false;

        }
    }



    protected void GVNotifications_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int quantity=0;
        using (SqlConnection Con = new SqlConnection(WebConfigurationManager.ConnectionStrings["AssetManagement"].ConnectionString))
        {
            using (SqlCommand Cmd = new SqlCommand("SELECT quantity FROM [Items] WHERE name=@name", Con))
            {
                Cmd.Parameters.AddWithValue("@name", GVNotifications.Rows[e.RowIndex].Cells[1].Text);
                Con.Open();
                using (SqlDataReader DataReader = Cmd.ExecuteReader())
                {
                    if (DataReader.Read())
                    {
                        quantity = (int)DataReader["quantity"];
                        quantity--;
                    }
                }
            }
            
        }
        using (SqlConnection Con = new SqlConnection(WebConfigurationManager.ConnectionStrings["AssetManagement"].ConnectionString))
        {
            using (SqlCommand Cmd = new SqlCommand("UPDATE [Items] SET quantity=@quantity WHERE name=@name",Con))
            {
                Cmd.Parameters.AddWithValue("@quantity", quantity.ToString());
                Cmd.Parameters.AddWithValue("@name", GVNotifications.Rows[e.RowIndex].Cells[1].Text);
                Con.Open();
                Cmd.ExecuteNonQuery();
            }

        }
    }

    protected void GVNotifications_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        Response.Redirect("AdminHome.aspx");
    }

}
