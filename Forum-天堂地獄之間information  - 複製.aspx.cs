using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;

public partial class Default2 : System.Web.UI.Page
{
    string fID;
    SqlConnection objConn = new SqlConnection();
    SqlCommand objCmd;
    SqlDataReader objReader;
    String SqlStr;
    protected void Page_Load(object sender, EventArgs e)
    {
        fID = Session["fid"].ToString();



        if (!IsPostBack) // 頁面首次載入實執行
            QueryName(fID);

    
        
    }
    public void QueryName(string Name_key)
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" +
        Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Forum,Member Where ForumID='" + Name_key + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Label10.Text = dr["ForumName"].ToString();
            Label4.Text = dr["ForumType"].ToString();
            string mid = dr["MemberID"].ToString();
            Session["mid"] = mid;
            QueryName1(mid);
            Label6.Text = dr["ForumIntdn"].ToString();
            Image1.ImageUrl = "~/img/" + dr["ForumPhoto"].ToString();
        }
        else
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('查無此資料:');</script>" + Name_key);
        con.Close();
    }
    public void QueryName1(string Name_key)
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" +
        Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Member Where MemberID='" + Name_key + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            HyperLink5.Text = dr["MemberName"].ToString();
        }
        con.Close();
    }

   
}