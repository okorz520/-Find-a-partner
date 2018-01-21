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
    string cID;
    SqlConnection objConn = new SqlConnection();
    SqlCommand objCmd;
    SqlDataReader objReader;
    String SqlStr;
    protected void Page_Load(object sender, EventArgs e)
    {
        cID = Session["cid"].ToString();

        objConn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" + Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true";
        objConn.Open();
        SqlDataSource1.SelectCommand = "SELECT MemberName,MemberPhoto,TextContent,MessageCase.time,MessageCaseID,MID FROM MessageCase,Member,CS where MessageCase.CaseID='" + cID + "' and MessageCase.CaseID=CS.CaseID and MessageCase.MID=Member.MemberID  ";
        objCmd = new SqlCommand(SqlDataSource1.SelectCommand, objConn);
        objReader = objCmd.ExecuteReader();
        ListView1.Visible = true;
        objReader.Close();
        objConn.Close();
        if (!IsPostBack) // 頁面首次載入實執行
            QueryName(cID);

        objConn.Open();
        string sqlStr = "Select* FROM WaitVerifyMember Where WaitVerifyID='" + cID + "' ";
        SqlCommand cmd1 = new SqlCommand(sqlStr, objConn);
        SqlDataReader dr1 = cmd1.ExecuteReader();
        if (dr1.HasRows)
        {
            cmd1.Cancel();
            dr1.Close();
            objConn.Close();
            return;
        }
        else
        {
            dr1.Close();
          
            string sqlStr5 = "INSERT INTO WaitVerifyMember (WaitVerifyID) VALUES (@WaitVerifyID)";
            SqlCommand cmd5 = new SqlCommand(sqlStr5, objConn);
            cmd5.Parameters.Add("@WaitVerifyID", SqlDbType.Int).Value = cID;
            cmd5.ExecuteNonQuery();
            cmd5.Cancel();
        }
        cmd1.ExecuteNonQuery();
        objConn.Close();


        TextBox1.Attributes.Add("onkeydown", "if (event.keyCode==13){document.getElementById('" + Button3.ClientID + "').focus();return true;}");

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
        SqlCommand cmd = new SqlCommand("SELECT * FROM CS,Member Where CaseID='" + Name_key + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            Label1.Text = dr["CaseName"].ToString();
            Label4.Text = dr["CaseStyle"].ToString();
            Label5.Text = dr["CaseCategory"].ToString();
            string mid= dr["MemberID"].ToString();
            Session["mid"] = mid;
            QueryName1(mid);
            Label6.Text = dr["RecruitTlt"].ToString();
            Label12.Text = dr["CaseIntdn"].ToString();
            Image1.ImageUrl = "~/img/" + dr["CasePhoto"].ToString();
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
        String imd = "INSERT INTO JCC (JCCID,CID) VALUES ('100001', @CID )";
        SqlCommand com = new SqlCommand(imd, con);
        com.Parameters.Add("@CID", SqlDbType.Int).Value = cID;

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

    protected void Button2_Click(object sender, EventArgs e)
    {
        if(HyperLink5.Text == Session["username"].ToString())
        {
            Response.Redirect("Case-modify.aspx");
        }
        else
            Response.Write("<script>alert('無權限修改')</script>");
    }





    protected void Button3_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;

        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" + Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
        con.Open();
        String imd = "INSERT INTO MessageCase (MID,CaseID,TextContent,time) VALUES (@MID, @CID ,@TextContent,@time)";
        SqlCommand com = new SqlCommand(imd, con);
        com.Parameters.Add("@MID", SqlDbType.Int).Value = Session["userid"].ToString();
        com.Parameters.Add("@CID", SqlDbType.Int).Value = cID;
        com.Parameters.Add("@TextContent", SqlDbType.NVarChar).Value = TextBox1.Text;
        DateTime date1 = DateTime.Now;
        Session["today"] = date1.ToString();
        string time = Session["today"].ToString();
        com.Parameters.Add("@time", SqlDbType.DateTime).Value = time;

        com.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Case-血鎮information.aspx");



    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;

        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" + Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
        con.Open();
        String imd = "INSERT INTO JWVM (MID,JWVMID) VALUES (@MID, @JWVMID)";
        SqlCommand com = new SqlCommand(imd, con);
        com.Parameters.Add("@MID", SqlDbType.Int).Value = Session["userid"].ToString();
        com.Parameters.Add("@JWVMID", SqlDbType.Int).Value = cID;

        com.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('已送出申請')</script>");
        if (this.Button4.Text == "已送出申請")
        {
            this.Button4.Text = "申請加入";
        }
        else
        {
            this.Button4.Text = "已送出申請";
            this.Button4.BackColor = Color.Gray;
            Button4.Enabled = false;
        }
    }
}