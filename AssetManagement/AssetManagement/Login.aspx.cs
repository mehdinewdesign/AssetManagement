using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        using (SqlConnection Con = new SqlConnection())
        {
            string Connectionstring = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=AssetManagement;Integrated Security=True;Pooling=False";
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
                using(SqlDataReader DataReader = Cmd.ExecuteReader())
                {
                    if (DataReader.Read())
                    {
                        string ActualPassword = (string)DataReader["password"];
                        if (ActualPassword == Password)
                        {
                            Response.Redirect("Home.aspx");
                        }
                    }
                }
            }
        }
    }

    protected void BtnNewAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect("NewAccount.aspx");
    }
}