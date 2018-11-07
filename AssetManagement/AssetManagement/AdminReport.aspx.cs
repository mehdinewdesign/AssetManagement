using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["t"] == "1")
        {
            DSRequest.SelectCommand = "SELECT * FROM AssetRequest WHERE granted='true' AND allotdate>=@start AND allotdate<=@end";
        }
        else if(Request.QueryString["t"] == "2")
        {
            DSRequest.SelectCommand = "SELECT * FROM AssetRequest WHERE granted='true' AND duedate>=@start AND duedate<=@end";
        }
    }
}