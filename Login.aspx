<%@ Page Title="登入" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
      .logintable{line-height:50px;font-family:'微軟正黑體';padding-bottom:150px;padding-top:50px;}
      .fortable{line-height:50px;font-family:'微軟正黑體';padding-bottom:150px;padding-top:50px;}
    .auto-style7 {
        height: 92px;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:60%;float:left;">
    <table class="logintable"align="center">
        <tr >
            <td colspan="3" align="center" >登入</td> 
        </tr>
         <tr>
            <td>帳號：</td>
            <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
            <td >&nbsp;</td>
        </tr>
         <tr>
            <td>密碼：</td>
            <td><asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox></td>
            <td ></td>
        </tr>
        <tr>
            <td colspan="3" align="center"><asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="登入" ValidationGroup="Login1"  BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" OnClick="LoginButton_Click"  /></td>
        </tr>
    </table>
</div>
<div style="float:left;" >
    <table class="fortable"align="center">
        <tr >
            <td colspan="3" align="center" >忘記密碼</td> 
        </tr>
         <tr>
            <td class="auto-style7">信箱：</td>
            <td class="auto-style7"><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
        </tr>
         
        <tr>
            <td colspan="3" align="center"><asp:Button ID="Button1" runat="server"  Text="送出"  BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" OnClick="Button1_Click"  /></td>
        </tr>
    </table>
</div>
</asp:Content>

