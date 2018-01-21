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
            SqlDataSource1.SelectCommand = "SELECT * FROM CS ";
            objCmd = new SqlCommand(SqlDataSource1.SelectCommand, objConn);
            
            objReader = objCmd.ExecuteReader();
            //ListView1.DataSource = objReader;
            ListView1.Visible = true;
            //ListView1.DataBind();
            objReader.Close();
            objConn.Close();
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            objConn.ConnectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" +
                   Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true";
            objConn.Open();
            SqlDataSource1.SelectCommand = "SELECT * FROM CS WHERE CaseName=@CaseName";
            SqlDataSource1.SelectParameters.Add("CaseName", TextBox1.Text);
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
        catch(Exception ex)
        {
            Response.Write(ex.Message);
        }
    }




    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        ListView1.SelectedIndex = ((ListViewDataItem)e.Item).DisplayIndex;
        ListView1.DataBind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Write("<script>alert('未登入，請先登入在進行收藏動作')</script>");
        
    }

    protected void ImageButton1_Click(object sender, EventArgs e)
    {
        ImageButton btn = sender as ImageButton;
        ListViewItem item = (ListViewItem)(sender as Control).NamingContainer;
        Label cid = (Label)item.FindControl("Label2");
        Session["cid"] = cid.Text;
        Response.Redirect("Case-血鎮information - 複製.aspx");
    }



}