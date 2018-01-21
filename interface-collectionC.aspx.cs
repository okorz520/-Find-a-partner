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
        SqlDataSource1.SelectCommand = "SELECT CaseName,CasePhoto,CollectCID,CID FROM CollectCS,JCC,CS where CollectCID=JCCID and CollectCID='" + Session["userid"].ToString() + "' and CID=CS.CaseID ";
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
        Label cid = (Label)item.FindControl("Label2");
        Session["cid"] = cid.Text;
        Response.Redirect("Case-血鎮information.aspx");
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        try
        {
            Button btn = sender as Button;
            ListViewItem item = (ListViewItem)(sender as Control).NamingContainer;
            Label CID = (Label)item.FindControl("Label2");
            String a = CID.Text;
            int cid = Convert.ToInt32(a);

            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" + Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
            con.Open();
            string sqlStr = "DELETE FROM JCC WHERE JCCID='" + Session["userid"].ToString() + "' and CID='" + cid + "'";
            SqlCommand cmd = new SqlCommand(sqlStr, con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("interface-collectionC.aspx");
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }

    }


}