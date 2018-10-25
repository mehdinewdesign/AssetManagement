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
    DataTable Cart = new DataTable();
    HttpCookie Cookie;
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
        Cart.Columns.Add("name", typeof(String));
        if (!IsPostBack)
        {
            //Cart.Columns.AddRange(new DataColumn[1] { new DataColumn("Item Name",typeof(string))});
            
            GVCart.DataSource = Cart;
            GVCart.DataBind();
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
        Cart.Rows.Add(DdlItemName.SelectedItem.Text);
        Cart.Rows.Add("One");
        GVCart.DataSource = Cart;
        GVCart.DataBind();
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