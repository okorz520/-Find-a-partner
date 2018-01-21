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
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime date1 = DateTime.Now;
        Session["today"] = date1.ToString("yyyy/MM/dd");
        Label1.Text = Session["today"].ToString();
        String MID = Session["userid"].ToString();
        QueryName(MID);
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
            String imd = "INSERT INTO Forum (ForumName,ForumType,ForumIntdn,MemberID,ForumPhoto,Time) VALUES (@ForumName, @ForumType, @ForumIntdn,@MemberID,@ForumPhoto,@Time)";
            SqlCommand com = new SqlCommand(imd, con);
            com.Parameters.Add("@ForumName", SqlDbType.NVarChar, 100).Value = TextBox1.Text;
            com.Parameters.Add("@ForumType", SqlDbType.NVarChar, 50).Value = DropDownList2.SelectedValue;
            com.Parameters.Add("@ForumIntdn", SqlDbType.NVarChar).Value = TextBox2.Text;
            com.Parameters.Add("@ForumPhoto", SqlDbType.NVarChar).Value = FileUpload1.FileName;
            com.Parameters.Add("@MemberID", SqlDbType.NVarChar).Value = Session["userid"].ToString();
            com.Parameters.Add("@Time", SqlDbType.DateTime).Value = Label1.Text;

            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Forum.aspx");
        }
        catch (Exception ex)
        { 
        HttpContext.Current.Response.Write("<script>alert('新增論帖失敗')</script>");
        }
    }
}