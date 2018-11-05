using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
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

    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) { return; }

        using (SqlConnection Con = new SqlConnection())
        {
            string Connectionstring = ConfigurationManager.ConnectionStrings["AssetManagement"].ConnectionString;
            Con.ConnectionString = Connectionstring;
            string CommandText = "SELECT * FROM [User] WHERE name=@username";
            using (SqlCommand Cmd = new SqlCommand(CommandText, Con))
            {
                Cmd.Parameters.AddWithValue("@username", TxtUsername.Text);
                SHA1CryptoServiceProvider Sha1 = new SHA1CryptoServiceProvider();
                byte[] PasswordHash = Sha1.ComputeHash(Encoding.UTF8.GetBytes(TxtPassword.Text));
                StringBuilder stringBuilder = new StringBuilder();
                foreach (byte b in PasswordHash)
                {
                    stringBuilder.Append(b.ToString());
                }
                string Password = stringBuilder.ToString();
                Sha1.Clear();
                Con.Open();
                using (SqlDataReader DataReader = Cmd.ExecuteReader())
                {
                    if (DataReader.Read())
                    {
                        if ((string)DataReader["password"] == Password && (bool)DataReader["admin"] == true)
                        {
                            Session["PageType"] = "Admin";
                            Response.Redirect("AdminHome.aspx");
                        }
                        else if ((string)DataReader["password"] == Password && (bool)DataReader["admin"] == false)
                        {
                            Session["PageType"] = "User";
                            Session["UserName"] = TxtUsername.Text;
                            Response.Redirect("UserHome.aspx");
                        }
                        else
                        {
                            LblError.Text = "Incorrect Username/Password";
                        }
                    }
                    else
                    {
                        LblError.Text = "Incorrect Username/Password";
                    }
                }
            }
        }
    }

    protected void BtnNewAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewAccount.aspx");
    }


    //protected void BtnTheme_Click(object sender, EventArgs e)
    //{
    //    Cookie = Request.Cookies["Theme"];
    //    if(Cookie == null)
    //    {
    //        Cookie = new HttpCookie("Theme");
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
    //    Response.Redirect("Login.aspx");
    //}
}