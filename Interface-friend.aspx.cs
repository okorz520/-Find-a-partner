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
    SqlCommand objCmd;
    SqlDataReader objReader;
    String SqlStr;
    protected void Page_Load(object sender, EventArgs e)
    {
        objConn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" +
            Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true";
        objConn.Open();

        SqlDataSource1.SelectCommand = "SELECT MID, MemberName,MemberPhoto,FriendID,MemberID FROM Friend,JF,Member where FriendID=JFID and FriendID='" + Session["userid"].ToString() + "' and MID=Member.MemberID";
        objCmd = new SqlCommand(SqlDataSource1.SelectCommand, objConn);

        objReader = objCmd.ExecuteReader();
        ListView1.Visible = true;
        // ListView1.DataBind();
        objReader.Close();
        objConn.Close();
    }

    protected void ImageButton3_Click(object sender, EventArgs e)
    {
        ImageButton btn = sender as ImageButton;
        ListViewItem item = (ListViewItem)(sender as Control).NamingContainer;
        Label mid = (Label)item.FindControl("Label1");
        Session["mid"] = mid.Text;
        Response.Redirect("other.aspx");
    }

    protected void Button4_Click(object sender, EventArgs e)
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
            string sqlStr = "DELETE FROM JF WHERE JFID='" + Session["userid"].ToString() + "' and MID='" + mid + "'";
            SqlCommand cmd = new SqlCommand(sqlStr, con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("interface-friend.aspx");
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }


    }
}