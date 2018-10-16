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

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) { return; }


        int Num = 0;
        using (SqlConnection Con = new SqlConnection())
        {
            string Connectionstring = @"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=AssetManagement;Integrated Security=True;Pooling=False";
            Con.ConnectionString = Connectionstring;
            string CommandText = "INSERT INTO [User] (name,password,admin) VALUES (@name,@password,'False')";
            using (SqlCommand Cmd = new SqlCommand(CommandText, Con))
            {
                Cmd.Parameters.AddWithValue("@name", TxtName.Text);
                SHA1CryptoServiceProvider Sha1 = new SHA1CryptoServiceProvider();
                byte[] PasswordHash = Sha1.ComputeHash(Encoding.UTF8.GetBytes(TxtPassword2.Text));
                StringBuilder stringBuilder = new StringBuilder();
                foreach (byte b in PasswordHash)
                {
                    stringBuilder.Append(b.ToString());
                }
                Cmd.Parameters.AddWithValue("@password", stringBuilder.ToString());
                Sha1.Clear();
                Con.Open();
                try
                {
                    Num = Cmd.ExecuteNonQuery();
                }
                catch (Exception)
                {
                    LblError.Text = "Username already exists";
                }
            }
        }
        if (Num == 1)
        {
            Response.Redirect("Login.aspx");
        }
    }
}