using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    DataTable Cart = new DataTable("Cart");
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
        if (!IsPostBack)
        {
            Cart.Columns.Add(new DataColumn("Item Name"));
            BtnCart.Visible = false;
            LblName.Text += Request.QueryString["u"];
            LblName.Text += "!";
            using (SqlConnection Con = new SqlConnection())
            {
                string Connectionstring = ConfigurationManager.ConnectionStrings["AssetManagement"].ConnectionString;
                Con.ConnectionString = Connectionstring;
                string CommandText = "SELECT name FROM [Items]";
                using (SqlCommand Cmd = new SqlCommand(CommandText, Con))
                {
                    Con.Open();
                    using(SqlDataReader DataReader = Cmd.ExecuteReader())
                    {
                        while (DataReader.Read())
                        {
                            DdlItemName.Items.Add(new ListItem(DataReader["name"].ToString()));
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
                            BtnCart.Visible = true;
                        }
                        else
                        {
                            LblAvailable.Text = DdlItemName.SelectedItem.Text + " Is Not Available";
                            LblAvailable.ForeColor = System.Drawing.Color.Red;
                            BtnCart.Visible = false;
                        }
                    }
                }

            }
        }
    }

    protected void BtnCart_Click(object sender, EventArgs e)
    {
        //CartData cartData = new CartData();
        //Session["Cart"] = cartData;
        //Cart.Rows.Add(DdlItemName.SelectedItem.Text);
        //GVCart.DataSource = Cart;
        //GVCart.DataBind();
    }
}