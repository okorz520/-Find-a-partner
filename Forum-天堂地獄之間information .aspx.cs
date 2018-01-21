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

        objConn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" + Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true";
        objConn.Open();
        SqlDataSource1.SelectCommand = "SELECT MemberName,MemberPhoto,TextContent,MessageForum.time,MessageForumID,MID FROM MessageForum,Member,Forum where MessageForum.ForumID='" + fID + "' and MessageForum.ForumID=Forum.ForumID and MessageForum.MID=Member.MemberID  ";
        objCmd = new SqlCommand(SqlDataSource1.SelectCommand, objConn);
        objReader = objCmd.ExecuteReader();
        ListView1.Visible = true;
        objReader.Close();
        objConn.Close();

        if (!IsPostBack) // 頁面首次載入實執行
            QueryName(fID);

    

        objConn.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Member Where MemberID='" + Session["userid"].ToString() + "'", objConn);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {

            ImageButton2.ImageUrl = "~/img/" + dr["MemberPhoto"].ToString();
        }

        objConn.Close();

        
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;

        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" + Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
        con.Open();
        String imd = "INSERT INTO JCF (JCFID,FID) VALUES ('100001', @FID )";
        SqlCommand com = new SqlCommand(imd, con);
        com.Parameters.Add("@FID", SqlDbType.Int).Value =fID;

        com.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('收藏成功')</script>");
        if (this.Button1.Text == "已收藏")
        {
            this.Button1.Text = "收藏案件";
        }
        else
        {
            this.Button1.Text = "已收藏";
            this.Button1.BackColor = Color.Gray;
            Button1.Enabled = false;
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;

        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" + Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
        con.Open();
        String imd = "INSERT INTO MessageForum (MID,ForumID,TextContent,time) VALUES (@MID, @FID ,@TextContent,@time)";
        SqlCommand com = new SqlCommand(imd, con);
        com.Parameters.Add("@MID", SqlDbType.Int).Value = Session["userid"].ToString();
        com.Parameters.Add("@FID", SqlDbType.Int).Value = fID;
        com.Parameters.Add("@TextContent", SqlDbType.NVarChar).Value = TextBox1.Text;
        DateTime date1 = DateTime.Now;
        Session["today"] = date1.ToString();
        string time = Session["today"].ToString();
        com.Parameters.Add("@time", SqlDbType.DateTime).Value = time;

        com.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Forum-天堂地獄之間information .aspx");



    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (HyperLink5.Text == Session["username"].ToString())
        {
            Response.Redirect("Forum-modify.aspx");
        }
        else
            Response.Write("<script>alert('無權限修改')</script>");
    }
}