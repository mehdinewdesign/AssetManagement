using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) { return; }

        using (SqlConnection Con = new SqlConnection())
        {
            string Connectionstring = ConfigurationManager.ConnectionStrings["AssetManagement"].ConnectionString;
            Con.ConnectionString = Connectionstring;
            string CommandText = "UPDATE [User] SET password=@password WHERE name=@username";
            using (SqlCommand Cmd = new SqlCommand(CommandText, Con))
            {
                SHA1CryptoServiceProvider Sha1 = new SHA1CryptoServiceProvider();
                byte[] PasswordHash = Sha1.ComputeHash(Encoding.UTF8.GetBytes(TxtConfPwd.Text));
                StringBuilder stringBuilder = new StringBuilder();
                foreach (byte b in PasswordHash)
                {
                    stringBuilder.Append(b.ToString());
                }
                string Password = stringBuilder.ToString();
                Sha1.Clear();
                Cmd.Parameters.AddWithValue("@username", User.Identity.Name);
                Cmd.Parameters.AddWithValue("@password", Password);
                Con.Open();
                int num = Cmd.ExecuteNonQuery();
                HttpCookie Cookie = Request.Cookies["Name"];
                if (Cookie != null)
                {
                    Cookie.Expires = DateTime.Now.AddDays(-1);
                }
                Session["PageType"] = "Login";
                FormsAuthentication.SignOut();
                Response.Redirect("Login.aspx");
            }
        }
    }
}