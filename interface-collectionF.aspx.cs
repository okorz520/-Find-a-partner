using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Windows;
using System.Drawing;

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
        SqlDataSource1.SelectCommand = "SELECT ForumName,ForumPhoto,CollectFID,FID FROM CollectForum,JCF,Forum where CollectFID=JCFID and CollectFID='" + Session["userid"].ToString() + "' and FID=Forum.ForumID ";

        objCmd = new SqlCommand(SqlDataSource1.SelectCommand, objConn);

        objReader = objCmd.ExecuteReader();
        ListView1.Visible = true;
        // ListView1.DataBind();
        objReader.Close();
        objConn.Close();
    }
    protected void ImageButton1_Click(object sender, EventArgs e)
    {
        ImageButton btn = sender as ImageButton;
        ListViewItem item = (ListViewItem)(sender as Control).NamingContainer;
        Label fid = (Label)item.FindControl("Label2");
        Session["fid"] = fid.Text;
        Response.Redirect("Forum-天堂地獄之間information .aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = sender as Button;
            ListViewItem item = (ListViewItem)(sender as Control).NamingContainer;
            Label FID = (Label)item.FindControl("Label2");
            String a = FID.Text;
            int fid = Convert.ToInt32(a);

            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" + Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
            con.Open();
            string sqlStr = "DELETE FROM JCF WHERE JCFID='" + Session["userid"].ToString() + "' and FID='" + fid + "'";
            SqlCommand cmd = new SqlCommand(sqlStr, con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("interface-collectionF.aspx");
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }

    }


}