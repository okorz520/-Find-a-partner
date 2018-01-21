<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="interface-friend2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .button{float:left;line-height:50px;}
        .CMC{float:left;padding-right:30px}
    </style>
   <div class="button">
       <div>
       <asp:Button ID="Button3" runat="server" Text="基本資料" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''"  style="border-top-left-radius: 20px;border-bottom-right-radius: 20px;" Width="120px" PostBackUrl="~/Interface.aspx"/>
       </div>
       <div>
       <asp:Button ID="Button2" runat="server" Text="我的好友" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''"  style="border-top-left-radius: 20px;border-bottom-right-radius: 20px;" Width="120px" PostBackUrl="~/Interface-friend.aspx"/>
       </div>
        <div>
       <asp:Button ID="Button13" runat="server" Text="我的收藏用戶" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''"  style="border-top-left-radius: 20px;border-bottom-right-radius: 20px;" Width="120px" PostBackUrl="~/Interface-collection.aspx"/>
       </div>
       <div>
           <asp:Button ID="Button8" runat="server" Text="我的收藏案件" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''"  style="border-top-left-radius: 20px;border-bottom-right-radius: 20px;" Width="120px" PostBackUrl="~/Interface-collectionC.aspx" />
       </div>
       <div>
           <asp:Button ID="Button9" runat="server" Text="我的收藏論帖" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''"  style="border-top-left-radius: 20px;border-bottom-right-radius: 20px;" Width="120px" PostBackUrl="~/Interface-collectionF.aspx" />
       </div>
       <div>
       <asp:Button ID="Button6" runat="server" Text="我的黑名單" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''"  style="border-top-left-radius: 20px;border-bottom-right-radius: 20px;" Width="120px" PostBackUrl="~/Interface-blacklist.aspx"/>
       </div>
       <div>
       <asp:Button ID="Button7" runat="server" Text="我的團隊" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''"  style="border-top-left-radius: 20px;border-bottom-right-radius: 20px;" Width="120px"/>
       </div>
   </div>
           
               
            
    <div style="float:right;">
         <asp:Image ID="Image1" runat="server" ImageAlign="Middle" ImageUrl="~/image/放大鏡(已去底).png" Height="20px" />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="搜尋" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" />
    </div>
    <div style="padding-left:200px;line-height:50px">
        <div>好友待通過列表</div>
        
          <div class="CMC">
                 <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" ImageUrl="~/image/頭像2.jpg" />
                 <asp:HyperLink ID="HyperLink1" runat="server">路人甲</asp:HyperLink>
                 <asp:Button ID="Button14" runat="server" Text="通過"  BackColor="Black" BorderStyle="None" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" />
                 <asp:Button ID="Button4" runat="server" Text="移除"  BackColor="Black" BorderStyle="None" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" />
             </div>
              <div>
                 <asp:ImageButton ID="ImageButton2" runat="server" Height="50px" ImageUrl="~/image/頭像3.png" />
                 <asp:HyperLink ID="HyperLink2" runat="server">路人乙</asp:HyperLink>
                 <asp:Button ID="Button15" runat="server" Text="通過"  BackColor="Black" BorderStyle="None" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" />
                 <asp:Button ID="Button5" runat="server" Text="移除"  BackColor="Black" BorderStyle="None" Font-Bold="True" Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" />
             </div>
    </div>
   
</asp:Content>

