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
        if (!IsPostBack)
        {
            objConn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" + Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true";
            objConn.Open();
            SqlDataSource1.SelectCommand = "SELECT * FROM Forum ";
            objCmd = new SqlCommand(SqlDataSource1.SelectCommand, objConn);

            objReader = objCmd.ExecuteReader();
            //ListView1.DataSource = objReader;
            ListView1.Visible = true;
            //ListView1.DataBind();
            objReader.Close();
            objConn.Close();
            TextBox1.Attributes.Add("onkeydown", "if (event.keyCode==13){document.getElementById('" + Button1.ClientID + "').focus();return true;}");


        }
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        ListView1.SelectedIndex = ((ListViewDataItem)e.Item).DisplayIndex;
        ListView1.DataBind();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        ListViewItem item = (ListViewItem)(sender as Control).NamingContainer;
        Label fid = (Label)item.FindControl("Label1");
       

        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" + Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
        con.Open();
        String imd = "INSERT INTO JCF (JCFID,FID) VALUES ('100001', @FID )";
        SqlCommand com = new SqlCommand(imd, con);
        com.Parameters.Add("@FID", SqlDbType.Int).Value = fid.Text;

        com.ExecuteNonQuery();
        con.Close();
        Response.Write("<script>alert('收藏成功')</script>");
        
    }
    protected void ImageButton1_Click(object sender, EventArgs e)
    {
        ImageButton btn = sender as ImageButton;
        ListViewItem item = (ListViewItem)(sender as Control).NamingContainer;
        Label fid = (Label)item.FindControl("Label1");
        Session["fid"] = fid.Text;
        Response.Redirect("Forum-天堂地獄之間information .aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            objConn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" + Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true";
            objConn.Open();
            SqlDataSource1.SelectCommand = "SELECT * FROM Forum WHERE ForumName=@ForumName";
            SqlDataSource1.SelectParameters.Add("ForumName", TextBox1.Text);
            // SqlDataSource1.SelectCommand = "SELECT * FROM CS WHERE CaseName LIKE '%"+ TextBox1.Text +"%'"; 
            // SqlStr = "SELECT * FROM CS WHERE CaseStyle=@CaseStyle or CaseCategory=@CaseCategory or CaseName=@CaseName";
            objCmd = new SqlCommand(SqlDataSource1.SelectCommand, objConn);
            //objCmd.Parameters.Add("@CaseStyle", SqlDbType.NVarChar,50);
            //objCmd.Parameters.Add("@CaseCategory", SqlDbType.NVarChar,50);
            //objCmd.Parameters.Add("@CaseName", SqlDbType.NVarChar,100);
            //objCmd.Parameters["@CaseStyle"].Value = ListBox1.SelectedValue;
            //objCmd.Parameters["@CaseCategory"].Value = ListBox2.SelectedValue;
            //objCmd.Parameters["@CaseName"].Value = TextBox1.Text;
            objReader = objCmd.ExecuteReader();
            if (objReader.Read())
            {
                ListView1.Visible = true;
                Label7.Visible = false;
                //ListView1.DataSource = objReader;
                ListView1.DataBind();
            }
            else
            {
                ListView1.Visible = false;
                Label7.Visible = true;
                Label7.Text = "查無此記錄!";
            }
            objReader.Close();
            objConn.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}