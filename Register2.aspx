<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register2.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div align="center">
        <asp:Label ID="Label1" runat="server" Text="註冊成功!" Font-Size="25pt"></asp:Label>
        <br />
        <br />        
        <asp:Label ID="Label2" runat="server" ></asp:Label><br />
        您的登入帳號為：<asp:Label ID="Label3" runat="server" ></asp:Label><br />
        您的登入密碼為:<asp:Label ID="Label4" runat="server" ></asp:Label>
        <br />
        <asp:Button ID="Button2" runat="server" Text="確認" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="11pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" PostBackUrl="~/Default.aspx"  />

        <br />         
    </div>
        
</asp:Content>

