using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class Default2 : System.Web.UI.Page
{
    string fID;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        fID = Session["fid"].ToString();
        if (!IsPostBack) // 頁面首次載入實執行
            QueryName(fID);

       
    }
    public void QueryName(string Name_key)
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" +
        Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Forum Where ForumID='" + Name_key + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            TextBox1.Text = dr["ForumName"].ToString();
            DropDownList2.SelectedValue = dr["ForumType"].ToString();
            TextBox2.Text = dr["ForumIntdn"].ToString();
            Image1.ImageUrl = "~/img/" + dr["ForumPhoto"].ToString();
            string mid = dr["MemberID"].ToString();
            QueryName1(mid);
        }
        else
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('查無此人:');</script>" + Name_key);
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

        try
        {
            String pname = Path.GetFileName(FileUpload1.FileName);
            if (pname != null)
            {
                FileUpload1.SaveAs(Server.MapPath("~/img/") + pname);
            }
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" +
       Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
            con.Open();
            string sqlStr = "UPDATE Forum SET ForumType=@ForumType,ForumName=@ForumName, ForumIntdn=@ForumIntdn,ForumPhoto=@ForumPhoto  WHERE ForumID='" + fID + "'";
            SqlCommand cmd = new SqlCommand(sqlStr, con);
            cmd.Parameters.Add(new SqlParameter("@ForumType", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@ForumName", SqlDbType.NVarChar, 100));
            cmd.Parameters.Add(new SqlParameter("@ForumIntdn", SqlDbType.NVarChar));
            
            cmd.Parameters["@ForumName"].Value = TextBox1.Text;
            cmd.Parameters["@ForumType"].Value = DropDownList2.SelectedValue;
            cmd.Parameters["@ForumIntdn"].Value = TextBox2.Text;
            cmd.Parameters.Add("@ForumPhoto", SqlDbType.NVarChar).Value = FileUpload1.FileName;

            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Forum.aspx");
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
            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" +
          Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
            con.Open();
            string sqlStr = "DELETE FROM Forum WHERE ForumID='" + fID + "'";
            SqlCommand cmd = new SqlCommand(sqlStr, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}