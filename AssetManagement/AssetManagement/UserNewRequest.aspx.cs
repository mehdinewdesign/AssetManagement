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
        Page.Theme = "Light";
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        BtnRequest.Visible = false;
        if (!IsPostBack)
        {
            using (SqlConnection Con = new SqlConnection())
            {
                string Connectionstring = ConfigurationManager.ConnectionStrings["AssetManagement"].ConnectionString;
                Con.ConnectionString = Connectionstring;
                string CommandText = "SELECT name FROM [Items]";
                using (SqlCommand Cmd = new SqlCommand(CommandText, Con))
                {
                    Con.Open();
                    using (SqlDataReader DataReader = Cmd.ExecuteReader())
                    {
                        while (DataReader.Read())
                        {
                            DdlItemName.Items.Add(DataReader["name"].ToString());
                        }
                    }

                }
            }
        }
    }

    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        using (SqlConnection Con = new SqlConnection())
        {
            string Connectionstring = ConfigurationManager.ConnectionStrings["AssetManagement"].ConnectionString;
            Con.ConnectionString = Connectionstring;
            string CommandText = "SELECT quantity FROM [Items] where name=@name";
            using (SqlCommand Cmd = new SqlCommand(CommandText, Con))
            {
                Cmd.Parameters.AddWithValue("@name", DdlItemName.SelectedItem.Text);
                Con.Open();
                using (SqlDataReader DataReader = Cmd.ExecuteReader())
                {
                    if (DataReader.Read())
                    {
                        int quantity = (int)DataReader["quantity"];
                        if (quantity > 0)
                        {
                            LblAvailable.Text = DdlItemName.SelectedItem.Text + " Is Available";
                            LblAvailable.ForeColor = System.Drawing.Color.Green;
                            BtnRequest.Visible = true;
                        }
                        else
                        {
                            LblAvailable.Text = DdlItemName.SelectedItem.Text + " Is Not Available";
                            LblAvailable.ForeColor = System.Drawing.Color.Red;
                            BtnRequest.Visible = false;
                        }
                    }
                }

            }
        }
    }

    protected void BtnRequest_Click(object sender, EventArgs e)
    {
        using (SqlConnection Con = new SqlConnection())
        {
            string Connectionstring = ConfigurationManager.ConnectionStrings["AssetManagement"].ConnectionString;
            Con.ConnectionString = Connectionstring;
            string CommandText = "INSERT INTO AssetRequest(username,itemname) VALUES(@username,@itemname)";
            using (SqlCommand Cmd = new SqlCommand(CommandText, Con))
            {
                Cmd.Parameters.AddWithValue("@username", (string)Session["UserName"]);
                Cmd.Parameters.AddWithValue("@itemname", DdlItemName.SelectedItem.Text);
                Con.Open();
                int num = Cmd.ExecuteNonQuery();

            }
        }
    }
}