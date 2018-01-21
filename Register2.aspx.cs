using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label2.Text = Request.QueryString["Name"];
        Label3.Text = Request.QueryString["帳號"];
        Label4.Text = Request.QueryString["密碼"];
    }
}