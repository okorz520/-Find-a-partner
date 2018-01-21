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
        Label4.Text = Session["today"].ToString();
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
            String imd = "INSERT INTO CS (CaseName,CaseStyle,CaseCategory,RecruitTlt,CaseIntdn,MemberID,CasePhoto,CaseCondition,Time) VALUES (@CaseName, @CaseStyle, @CaseCategory, @RecruitTlt, @CaseIntdn,@MemberID,@CasePhoto,@CaseCondition,@Time)";
            SqlCommand com = new SqlCommand(imd, con);
            com.Parameters.Add("@CaseName", SqlDbType.NVarChar, 100).Value = TextBox1.Text;
            com.Parameters.Add("@CaseCondition", SqlDbType.NVarChar).Value = RadioButtonList1.SelectedValue;
            com.Parameters.Add("@CaseStyle", SqlDbType.NVarChar, 50).Value = ListBox1.SelectedValue;
            com.Parameters.Add("@CaseCategory", SqlDbType.NVarChar, 50).Value = ListBox2.SelectedValue;
            com.Parameters.Add("@RecruitTlt", SqlDbType.NVarChar, 500).Value = CheckBoxList1.SelectedValue;
            com.Parameters.Add("@CaseIntdn", SqlDbType.NVarChar).Value = TextBox5.Text;
            com.Parameters.Add("@CasePhoto", SqlDbType.NVarChar).Value = FileUpload1.FileName;
            com.Parameters.Add("@Time", SqlDbType.DateTime).Value = Label4.Text;
            com.Parameters.Add("@MemberID", SqlDbType.NVarChar).Value = Session["userid"].ToString();

            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Case.aspx");
        }

        catch(Exception ex)
        {
            Response.Write(ex.Message);
            HttpContext.Current.Response.Write("<script>alert('新增案件失敗')</script>");
        }
       
           

        }

}