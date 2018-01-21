using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using System.IO;

public partial class Default2 : System.Web.UI.Page
{
    String MID;
    protected void Page_Load(object sender, EventArgs e)
    {
         MID = TextBox3.Text;
        TextBox2.Attributes.Add("onkeydown", "if (event.keyCode==13){document.getElementById('" + LoginButton.ClientID + "').focus();return true;}");
        TextBox3.Attributes.Add("onkeydown", "if (event.keyCode==13){document.getElementById('" + Button1.ClientID + "').focus();return true;}");

    }

    protected void LoginButton_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" +
                  Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true"))
            {
                con.Open();
                using (SqlCommand sqlcommand = new SqlCommand("select * from [Member] where Account=@Account and PWD=@PWD", con))
                {
                    sqlcommand.Parameters.Add("@Account", SqlDbType.NVarChar).Value = TextBox1.Text;
                    sqlcommand.Parameters.Add("@PWD", SqlDbType.NVarChar).Value = TextBox2.Text;
                    String username = string.Empty;
                    String username1 = string.Empty;
                    String userid = string.Empty;
                    using (SqlDataReader dr = sqlcommand.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            username = dr["Account"].ToString();
                            userid = dr["MemberID"].ToString();

                        }
                        
                        
                    }

                    if (username != string.Empty)
                    {
                        //-http://localhost:60888/專案現階段/管理者登入.aspx
                        //PassErr.Text = getNOPC();
                        //將資訊存在SESSION中
                        Session.Add("useraccount", username);
                        Session.Add("userid", userid);
                        Session.Add("username", username1);
                        Response.Redirect("Interface.aspx", true);
                        //開始設定session
                    }
                    else
                    {
                       
                        Response.Write("<Script language='Javascript'>");
                        Response.Write("alert('帳號或密碼錯誤')");
                        Response.Write("</" + "Script>");
                    }
                }

            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message); //如果有錯誤，輸出錯誤信息
        }
    }


  
    protected void Button1_Click(object sender, EventArgs e)
    {
        string to = TextBox3.Text;
        SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename=" +
     Server.MapPath("~/App_Data/DataBase.mdf") + ";" + "Integrated Security=true");
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Member Where Email='" + TextBox3.Text + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        
        string from = "rouyin0625@gmail.com";
        string subject = "";
        string body = "";
        using (MailMessage mm = new MailMessage("rouyin0625@gmail.com", TextBox3.Text))
        {
           
            mm.Subject = "尋找小夥伴";
            if (dr.Read())
            {
                mm.Body = "您的密碼是：" + dr["PWD"].ToString();

            }
            mm.IsBodyHtml = false;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential("rouyin0625@gmail.com", "19960625");
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = NetworkCred;
            smtp.Port = 587;
            smtp.Send(mm);
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Email sent.');", true);
        }


    }
}
    



