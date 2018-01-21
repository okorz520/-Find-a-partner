<%@ Page Title="註冊" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .createtable{line-height:50px;font-family:'微軟正黑體';padding-bottom:50px;padding-top:50px;}
    </style>
    <table class="createtable"align="center">
        <tr >
            <td colspan="3" align="center" >註冊</td> 
        </tr>
         <tr>
            <td>暱稱：</td>
            <td><asp:TextBox ID="TextBox5" runat="server"  ></asp:TextBox></td>           
            <td > <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*此欄位不可為空白" ControlToValidate="TextBox5" ForeColor="Red">*</asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td>信箱：</td>
            <td><asp:TextBox ID="TextBox4" runat="server" TextMode="Email"></asp:TextBox></td>
            <td ><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*此欄位不可為空白" ControlToValidate="TextBox4" ForeColor="Red">*</asp:RequiredFieldValidator>
</td>
        </tr>
         <tr>
            <td>帳號：</td>
            <td><asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox></td>
            <td ><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*此欄位不可為空白" ControlToValidate="TextBox1" ForeColor="Red">*</asp:RequiredFieldValidator>
</td>
        </tr>
         <tr>
            <td>密碼：</td>
            <td><asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox></td>
            <td ><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*此欄位不可為空白" ControlToValidate="TextBox2" ForeColor="Red">*</asp:RequiredFieldValidator></td>
        </tr>
         <tr>
            <td>確認密碼：</td>
            <td><asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox></td>
            <td ><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*此欄位不可為空白" ControlToValidate="TextBox3" ForeColor="Red">*</asp:RequiredFieldValidator><asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="*密碼不一致" ControlToCompare="TextBox2" ControlToValidate="TextBox3" ForeColor="Red"></asp:CompareValidator></td>
        </tr>

        <tr>
            <td colspan="3" align="center">
                <asp:Button ID="Button1" runat="server"  Text="送出" ValidationGroup="Login1"  BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

