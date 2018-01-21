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
    string cID;
    protected void Page_Load(object sender, EventArgs e)
    {
         cID = Session["cid"].ToString();
        if (! IsPostBack) // 頁面首次載入實執行
            QueryName(cID);

    }

    public void QueryName(string Name_key)
    {
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" +
        Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM CS Where CaseID='"+Name_key+"'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            TextBox1.Text = dr["CaseName"].ToString();
            ListBox1.SelectedValue = dr["CaseStyle"].ToString();
            ListBox2.SelectedValue = dr["CaseCategory"].ToString();
            string mid = dr["MemberID"].ToString();
            QueryName1(mid);
            CheckBoxList1.SelectedValue = dr["RecruitTlt"].ToString();
            TextBox5.Text = dr["CaseIntdn"].ToString();
            Image1.ImageUrl = "img/" + dr["CasePhoto"].ToString();
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
                FileUpload1.SaveAs(Server.MapPath("img/") + pname);
            }


                SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" +
     Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
                con.Open();
                string sqlStr = "UPDATE CS SET CaseStyle=@CaseStyle,CaseCategory=@CaseCategory,CasePhoto=@CasePhoto, RecruitTlt=@RecruitTlt,CaseIntdn=@CaseIntdn,CaseName=@CaseName WHERE CaseID='" + cID + "'";
                SqlCommand cmd = new SqlCommand(sqlStr, con);
                cmd.Parameters.Add(new SqlParameter("@CaseStyle", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@CaseCategory", SqlDbType.NVarChar, 50));
                cmd.Parameters.Add(new SqlParameter("@RecruitTlt", SqlDbType.NVarChar, 500));
                cmd.Parameters.Add(new SqlParameter("@CaseIntdn", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@CaseName", SqlDbType.NVarChar, 100));
            cmd.Parameters.Add(new SqlParameter("@CasePhoto", SqlDbType.NVarChar));
            cmd.Parameters["@CaseStyle"].Value = ListBox1.SelectedValue;
                cmd.Parameters["@CaseCategory"].Value = ListBox2.SelectedValue;
                cmd.Parameters["@RecruitTlt"].Value = CheckBoxList1.SelectedValue.ToString();
                cmd.Parameters["@CaseIntdn"].Value = TextBox5.Text;
                cmd.Parameters["@CaseName"].Value = TextBox1.Text;
            cmd.Parameters["@CasePhoto"].Value = FileUpload1.FileName;
            //cmd.Parameters.Add("@CasePhoto", SqlDbType.NVarChar).Value = FileUpload1.FileName;
                cmd.ExecuteNonQuery();
                con.Close();
            Response.Redirect("Case.aspx");
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
            string sqlStr = "DELETE FROM CS WHERE CaseID='" + cID + "'";
            SqlCommand cmd = new SqlCommand(sqlStr, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        catch(Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}