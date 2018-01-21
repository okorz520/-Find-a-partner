using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Default2 : System.Web.UI.Page
{
    SqlConnection objConn = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        String MID = Session["userid"].ToString();
        QueryName(MID);

        objConn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" + Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true";

        objConn.Open();
        string sqlStr = "Select* FROM CollectCS,CollectForum,Blacklist,CollectMember,Friend Where CollectMID='" + Session["userid"].ToString() + "' and  BlacklistID='" + Session["userid"].ToString() + "' and CollectFID='" + Session["userid"].ToString() + "' and CollectCID ='" + Session["userid"].ToString() + "' and FriendID='"+ Session["userid"].ToString() + "'";
        SqlCommand cmd = new SqlCommand(sqlStr, objConn);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            cmd.Cancel();
            dr.Close();
            objConn.Close();
            return;
        }
        else
        {
            dr.Close();
            string sqlStr1 = "INSERT INTO CollectCS (CollectCID) VALUES (@CollectCID)";
            SqlCommand cmd1 = new SqlCommand(sqlStr1, objConn);
            cmd1.Parameters.Add("@CollectCID", SqlDbType.Int).Value = Session["userid"].ToString();
            cmd1.ExecuteNonQuery();
            cmd1.Cancel();
            string sqlStr2 = "INSERT INTO CollectForum (CollectFID) VALUES (@CollectFID)";
            SqlCommand cmd2 = new SqlCommand(sqlStr2, objConn);
            cmd2.Parameters.Add("@CollectFID", SqlDbType.Int).Value = Session["userid"].ToString();
            cmd2.ExecuteNonQuery();
            cmd2.Cancel();
            string sqlStr3 = "INSERT INTO CollectMember (CollectMID) VALUES (@CollectMID)";
            SqlCommand cmd3 = new SqlCommand(sqlStr3, objConn);
            cmd3.Parameters.Add("@CollectMID", SqlDbType.Int).Value = Session["userid"].ToString();
            cmd3.ExecuteNonQuery();
            cmd3.Cancel();
            string sqlStr4 = "INSERT INTO Blacklist (BlacklistID) VALUES (@BlacklistID)";
            SqlCommand cmd4 = new SqlCommand(sqlStr4, objConn);
            cmd4.Parameters.Add("@BlacklistID", SqlDbType.Int).Value = Session["userid"].ToString();
            cmd4.ExecuteNonQuery();
            cmd4.Cancel();
            string sqlStr5 = "INSERT INTO Friend (FriendID) VALUES (@FriendID)";
            SqlCommand cmd5 = new SqlCommand(sqlStr5, objConn);
            cmd5.Parameters.Add("@FriendID", SqlDbType.Int).Value = Session["userid"].ToString();
            cmd5.ExecuteNonQuery();
            cmd5.Cancel();
        }
        cmd.ExecuteNonQuery();
        objConn.Close();

        
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
}