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
    String MID;
    protected void Page_Load(object sender, EventArgs e)
    {
        MID = Session["userid"].ToString();
        if (!IsPostBack) // 頁面首次載入實執行
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
            CheckBoxList1.SelectedValue = dr["Style"].ToString();
            TextBox1.Text = dr["MemberName"].ToString();
            TextBox3.Text = dr["Email"].ToString();
            TextBox2.Text = dr["SelfIDN"].ToString();
            TextBox4.Text = dr["Works"].ToString();
            ImageButton3.ImageUrl = "~/img/" + dr["MemberPhoto"].ToString();
        }
        else
            ClientScript.RegisterStartupScript(GetType(), "message", "<script>alert('查無此人:');</script>" + Name_key);
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


            SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" + Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
            con.Open();
            string sqlStr = "UPDATE Member SET Style=@Style,MemberPhoto=@MemberPhoto,MemberName=@MemberName,SelfIDN=@SelfIDN,Email=@Email,Works=@Works WHERE MemberID='" + MID + "'";
            SqlCommand cmd = new SqlCommand(sqlStr, con);
            cmd.Parameters.Add(new SqlParameter("@Style", SqlDbType.NVarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@MemberName", SqlDbType.NVarChar, 100));
            cmd.Parameters.Add(new SqlParameter("@SelfIDN", SqlDbType.NVarChar));
            cmd.Parameters.Add(new SqlParameter("@Email", SqlDbType.NVarChar, 100));
            cmd.Parameters.Add(new SqlParameter("@Works", SqlDbType.NVarChar, 2000));

            cmd.Parameters["@Style"].Value = CheckBoxList1.SelectedValue;
            cmd.Parameters["@MemberName"].Value = TextBox1.Text;
            cmd.Parameters["@SelfIDN"].Value = TextBox2.Text;
            cmd.Parameters["@Email"].Value = TextBox3.Text;
            cmd.Parameters["@Works"].Value = TextBox4.Text;
            cmd.Parameters.Add("@MemberPhoto", SqlDbType.NVarChar).Value = FileUpload1.FileName;
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Interface.aspx");
        }
        catch (Exception ex)
        {
            //HttpContext.Current.Response.Write("<script>alert('修改失敗，請重新修改')</script>");
            Response.Write(ex.Message);
        }
        
    }



  
}