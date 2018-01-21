using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class 專案__尋找小伙伴_Default3 : System.Web.UI.Page
{

    String OMID;
    protected void Page_Load(object sender, EventArgs e)
    {
        OMID = Session["mid"].ToString();
        QueryName(OMID);
    }

    public void QueryName(string Name_key)
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" +
        Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Member Where MemberID='" + Name_key + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Label2.Text = dr["MemberName"].ToString();
            Label3.Text = dr["Style"].ToString();
            Label7.Text = dr["SelfIDN"].ToString();
            Label8.Text = dr["Email"].ToString();
            HyperLink2.Text = dr["Works"].ToString();
            ImageButton3.ImageUrl = "~/img/" + dr["MemberPhoto"].ToString();
        }
        else
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('查無此人:');</script>" + Name_key);
        con.Close();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" + Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
        con.Open();
        String imd = "INSERT INTO JCM (JCMID,MID) VALUES ('"+ Session["userid"].ToString() + "', @MID )";
        SqlCommand com = new SqlCommand(imd, con);
        com.Parameters.Add("@MID", SqlDbType.Int).Value = OMID;

        com.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('收藏成功')</script>");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" + Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
        con.Open();
        String imd = "INSERT INTO JF (JFID,MID) VALUES ('" + Session["userid"].ToString() + "', @MID )";
        SqlCommand com = new SqlCommand(imd, con);
        com.Parameters.Add("@MID", SqlDbType.Int).Value = OMID;

        com.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('加入好友成功')</script>");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" + Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
        con.Open();
        String imd = "INSERT INTO JB (JBID,MID) VALUES ('" + Session["userid"].ToString() + "', @MID )";
        SqlCommand com = new SqlCommand(imd, con);
        com.Parameters.Add("@MID", SqlDbType.Int).Value = OMID;

        com.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('加入黑名單成功')</script>");
    }
}