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
    protected void Page_Load(object sender, EventArgs e)
    {

    }

   



    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con;
        String imd;
        SqlCommand com;
        SqlDataReader rd;

        try
        {
            con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" + Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
            con.Open();
            imd = "Select * From Member Where Account='" + TextBox1.Text + "'";
            com = new SqlCommand(imd, con);
            rd = com.ExecuteReader();
            if(rd.Read())
            {
                Response.Write("<script>alert('帳號已有人使用，請重新輸入')</script>");
                con.Close();
            }   
            rd.Close();
           
                imd = "INSERT INTO Member (MemberName,Email,Account,PWD) VALUES (@MemberName, @Email, @Account,@PWD)";
                com = new SqlCommand(imd, con);
                com.Parameters.Add("@MemberName", SqlDbType.NVarChar, 100).Value = TextBox5.Text;
                com.Parameters.Add("@Email", SqlDbType.NVarChar, 100).Value = TextBox4.Text;
                com.Parameters.Add("@Account", SqlDbType.NVarChar, 50).Value = TextBox1.Text;
                com.Parameters.Add("@PWD", SqlDbType.NVarChar, 255).Value = TextBox2.Text;

                com.ExecuteNonQuery();
                 string url;
                //url = "Page2.aspx?name=" + Server.UrlEncode(TextBox1.Text) + "&email=" + TextBox2.Text;
                url = "Register2.aspx?Name=" + "您好" + TextBox5.Text + "&帳號=" + TextBox1.Text + "&密碼=" + TextBox3.Text;
                Server.Transfer(url);
            con.Close();






        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
       

       
    }
}
