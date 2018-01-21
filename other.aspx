<%@ Page Title="他人介面" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="other.aspx.cs" Inherits="專案__尋找小伙伴_Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <style>
div{
float:left;
width:280px;
font-family:'微軟正黑體';
z-index:2;
}

.case-list
{
  padding-left:30px;
  padding-top:15px;
  padding-bottom:15px;
  margin:0px;
  width:280px;
  height:300px; 
}

a{
text-decoration:none;
}
a:link {color: black}
a:visited {color: black}
a:active {color: black}
a:hover {color:  black}

ul{padding:0;}
ul li{ 
list-style-type:none;}
        .auto-style5 {
            height: 48px;
        }
    </style>
    <table align="center" style="padding-top:50px;padding-bottom:150px;line-height:40px;font-family:'微軟正黑體';width:800px">
        <tr align="center"><td colspan="4">
            <asp:Label ID="Label1" runat="server" Text="我的基本資料" Font-Bold="True" Font-Size="X-Large"></asp:Label></td></tr>
          
            <tr>
                <td rowspan="7">  
                    <asp:ImageButton ID="ImageButton3" runat="server" Width="200px" height=""  style="padding-bottom:300px;"/>
         
                <td style="width:50px;" >暱稱：</td>
                <td class="auto-style5">
                    <asp:Label ID="Label2" runat="server" ></asp:Label>
                </td>
            </tr>
             <tr>
         
                <td>擅長：</td>
                <td>
                    <asp:Label ID="Label3" runat="server" ></asp:Label></td>
            </tr>
             <tr>
                 
                <td >自介：</td>
                <td>
                    <asp:Label ID="Label7" runat="server" ></asp:Label>
                </td>
            </tr>
             <tr>
                
                <td>信箱：</td>
                <td>
                    <asp:Label ID="Label8" runat="server" ></asp:Label>
                </td>
            </tr> 
            <tr>
                
                <td >作品：</td>
                <td>
                    <asp:HyperLink ID="HyperLink2" runat="server"></asp:HyperLink></td>
            </tr>
        <tr >
            <td></td>
            <td ><asp:Button ID="Button1" runat="server" Text="加入收藏"  BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" OnClick="Button1_Click"/>&emsp;
            <asp:Button ID="Button2" runat="server" Text="加入好友"  BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''"  OnClick="Button2_Click"/>&emsp;
           <asp:Button ID="Button3" runat="server" Text="加入黑名單"  BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''"  OnClick="Button3_Click"/></td>
        </tr>
           
        </table>

    
    
    
</asp:Content>

