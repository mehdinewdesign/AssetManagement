using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
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

    protected void GVAsset_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int quantity = 0;
        using (SqlConnection Con = new SqlConnection(WebConfigurationManager.ConnectionStrings["AssetManagement"].ConnectionString))
        {
            using (SqlCommand Cmd = new SqlCommand("SELECT quantity FROM [Items] WHERE name=@name", Con))
            {
                Cmd.Parameters.AddWithValue("@name", GVAsset.Rows[e.RowIndex].Cells[0].Text);
                Con.Open();
                using (SqlDataReader DataReader = Cmd.ExecuteReader())
                {
                    if (DataReader.Read())
                    {
                        quantity = (int)DataReader["quantity"];
                        quantity++;
                    }
                }
            }

        }
        using (SqlConnection Con = new SqlConnection(WebConfigurationManager.ConnectionStrings["AssetManagement"].ConnectionString))
        {
            using (SqlCommand Cmd = new SqlCommand("UPDATE [Items] SET quantity=@quantity WHERE name=@name", Con))
            {
                Cmd.Parameters.AddWithValue("@quantity", quantity.ToString());
                Cmd.Parameters.AddWithValue("@name", GVAsset.Rows[e.RowIndex].Cells[0].Text);
                Con.Open();
                Cmd.ExecuteNonQuery();
            }

        }
    }

    protected void GVAsset_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DateTime DueDate = (DateTime)DataBinder.Eval(e.Row.DataItem, "duedate");
            if (DueDate < DateTime.Now)
            {
                e.Row.BackColor = System.Drawing.Color.Red;
            }
        }
    }
}