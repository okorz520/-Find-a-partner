<%@ Page Title="個人介面" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Interface.aspx.cs" Inherits="Default2" %>

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
                <td class="auto-style5"></td>
                <td style="width:50px;">暱稱：</td>
                <td class="auto-style5">
                    <asp:Label ID="Label2" runat="server" ></asp:Label>
                </td>
            </tr>
             <tr>
                 <td></td>
                <td>擅長：</td>
                <td>
                    <asp:Label ID="Label3" runat="server" ></asp:Label></td>
            </tr>
             <tr>
                 <td></td>
                <td >自介：</td>
                <td>
                    <asp:Label ID="Label7" runat="server" ></asp:Label>
                </td>
            </tr>
             <tr>
                 <td></td>
                <td>信箱：</td>
                <td>
                    <asp:Label ID="Label8" runat="server" ></asp:Label>
                </td>
            </tr> 
            <tr>
                 <td></td>
                <td >作品：</td>
                <td>
                    <asp:HyperLink ID="HyperLink2" runat="server"></asp:HyperLink></td>
            </tr>
        
             <tr align="right">
                 <td colspan="10">
                  <asp:Button ID="Button1" runat="server" Text="修改" PostBackUrl="~/Interface-modify.aspx"  BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" />
                     </td>
             </tr>
        </table>
<div class="case-list">
<a href="Interface-friend.aspx" title="好友" target="_blank">
<image src="https://vignette.wikia.nocookie.net/spongebobsquarepants/images/4/44/PNG1.png/revision/latest/scale-to-width-down/600?cb=20160119235826&path-prefix=zh" height=150px width=280px>
</a>
<div class="title">
<a href="Interface-friend.aspx " title="好友" target="_blank">
好友
</a>
</div>
</div>
    <div class="case-list">
<a href="Interface-collection.aspx" title="收藏" target="_blank">
<image src="https://www.62icon.com/client/assets/img/like-icon.svg" height=150px width=280px>
</a>
<div class="title">
<a href="Interface-collection.aspx " title="收藏" target="_blank">
收藏
</a>
</div>
</div>
    <div class="case-list">
<a href="Interface-blacklist.aspx" title="黑名單" target="_blank">
<image src="https://www.wenba.ca/uploads/article/20160519/5cb8ee242667af68697cd1ff413d156d.jpg" height=150px width=280px>
</a>
<div class="title">
<a href="Interface-blacklist.aspx " title="黑名單" target="_blank">
黑名單
</a>
</div>
</div>
    <div class="case-list">
<a href="Interface-team.aspx" title="團隊" target="_blank">
<image src="https://i1.wp.com/www.linweimarketing.com/wp-content/uploads/2015/04/Line%E5%92%8C%E5%BE%AE%E4%BF%A1%E5%A4%A7%E9%87%8F%E5%8A%A0%E5%A5%BD%E5%8F%8B%E8%A1%8C%E9%8A%B7%E6%A8%A1%E5%BC%8F%E7%9A%84%E4%B8%89%E5%A4%A7%E5%95%8F%E9%A1%8C3-%E6%9E%97%E7%91%8B%E7%B6%B2%E8%B7%AF%E8%A1%8C%E9%8A%B7%E7%AD%96%E7%95%A5%E7%AB%99.jpg?resize=600%2C332" height=150px width=280px>
</a>
<div class="title">
<a href="Interface-team.aspx" title="團隊" target="_blank">
團隊
</a>
</div>
</div>
</asp:Content>

