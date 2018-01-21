using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Default3 : System.Web.UI.Page
{
    SqlConnection objConn = new SqlConnection();
    SqlCommand objCmd;
    SqlDataReader objReader;
    String SqlStr;
    string cID;
    protected void Page_Load(object sender, EventArgs e)
    {
        cID = Session["cid"].ToString();
        if (!IsPostBack)
        {
            objConn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" + Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true";
            objConn.Open();
            SqlDataSource1.SelectCommand = "SELECT MemberName,MemberPhoto,MemberID,WaitVerifyID FROM WaitVerifyMember,JWVM,Member where WaitVerifyID='"+cID+"' and WaitVerifyID=JWVMID and JWVM.MID=Member.MemberID ";
            objCmd = new SqlCommand(SqlDataSource1.SelectCommand, objConn);
            objReader = objCmd.ExecuteReader();
            ListView1.Visible = true;
            objReader.Close();
            objConn.Close();

            objConn.Open();
            string sqlStr = "Select* FROM TeamMember Where CaseID='"+cID+"' and MemberID='" + Session["userid"].ToString() + "'";
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
                string sqlStr1 = "INSERT INTO TeamMember (CaseID,MemberID) VALUES (@CaseID,@MemberID)";
                SqlCommand cmd1 = new SqlCommand(sqlStr1, objConn);
                cmd1.Parameters.Add("@CaseID", SqlDbType.Int).Value = cID;
                cmd1.Parameters.Add("@MemberID", SqlDbType.Int).Value = Session["userid"].ToString();
                cmd1.ExecuteNonQuery();
            }
            cmd.ExecuteNonQuery();
            objConn.Close();




        }
        
  
       
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = sender as Button;
            ListViewItem item = (ListViewItem)(sender as Control).NamingContainer;
            Label MID = (Label)item.FindControl("Label1");
            String a = MID.Text;
            int mid = Convert.ToInt32(a);

            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" + Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
            con.Open();
            string sqlStr = "INSERT INTO TeamMember (CaseID,MemberID) VALUES (@CaseID,@MemberID)";
            SqlCommand cmd = new SqlCommand(sqlStr, con);
            cmd.Parameters.Add("@CaseID", SqlDbType.Int).Value = cID;
            cmd.Parameters.Add("@MemberID", SqlDbType.Int).Value = mid;
            cmd.ExecuteNonQuery();
            con.Close();

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = sender as Button;
            ListViewItem item = (ListViewItem)(sender as Control).NamingContainer;
            Label MID = (Label)item.FindControl("Label1");
            String a = MID.Text;
            int mid = Convert.ToInt32(a);

            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" + Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
            con.Open();
            string sqlStr = "DELETE FROM JWVM WHERE JWVMID='"+cID+"' and MID='" + mid + "'";
            SqlCommand cmd = new SqlCommand(sqlStr, con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("WaitVerifyMember.aspx");
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

}