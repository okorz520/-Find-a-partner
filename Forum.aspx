<%@ Page Title="論壇" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Forum.aspx.cs" Inherits="Default2" %>

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
</style>
    <style type="text/css">
        imgcss {
            width: 280px;
            height: 150px;
        }
        .新增樣式1 {
            width: 280px;
            height: 150px;
        }
        .auto-style1 {
            height: 35px;
        }
    </style>
<body>
    
        <table align="center" border="0" width="100%">
            <tr align="center"><td><asp:Label ID="Label1" runat="server" Text="論壇"  Font-Size="X-Large"></asp:Label></td></tr>
            <tr align="center">
                <td>
                    <asp:Image ID="Image1" runat="server" ImageAlign="Middle" ImageUrl="~/image/放大鏡(已去底).png" Height="20px" />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:ListBox ID="ListBox2" runat="server" Rows="1">
            <asp:ListItem>類型</asp:ListItem>
            <asp:ListItem>動畫</asp:ListItem>
            <asp:ListItem>漫畫</asp:ListItem>
            <asp:ListItem>小說</asp:ListItem>
            <asp:ListItem>遊戲</asp:ListItem>
        </asp:ListBox>
        <asp:Button ID="Button1" runat="server" Text="搜尋" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
        <asp:Label ID="Label7" runat="server"></asp:Label>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ></asp:SqlDataSource>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="5">
            <AlternatingItemTemplate>
                <td runat="server" style="background-color: #FFFFFF;color: #284775;">
                      <asp:ImageButton ID="ImageButton1" runat="server" CssClass="新增樣式1" ImageUrl='<%# "img/"+Eval("ForumPhoto") %>' OnClick="ImageButton1_Click" />
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ForumID") %>' Visible="false" />
                    <br />
                      <asp:Label ID="ForumNameLabel" runat="server" Text='<%# Eval("ForumName") %>'></asp:Label>
                    <br />
                      發布人:<asp:Label ID="MemberIDLabel" runat="server" Text='<%# Eval("MemberID") %>'></asp:Label>
                      <br />
                      發帖時間:<asp:Label ID="TimeLabel" runat="server" Text='<%# Eval("Time") %>' />
                    <br />  
                    <asp:Button ID="Button2" runat="server" Text="收藏❤" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="11pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" OnClick="Button2_Click"  />
                   
                      
                   
                    
                      <br />
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color: #999999;">ForumName:
                    <asp:TextBox ID="ForumNameTextBox" runat="server" Text='<%# Bind("ForumName") %>' />
                    <br />
                    Time:
                    <asp:TextBox ID="TimeTextBox" runat="server" Text='<%# Bind("Time") %>' />
                    <br />
                    ForumPhoto:
                    <asp:TextBox ID="ForumPhotoTextBox" runat="server" Text='<%# Bind("ForumPhoto") %>' />
                    <br />
                    MemberID:
                    <asp:TextBox ID="MemberIDTextBox" runat="server" Text='<%# Bind("MemberID") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                    <br />
                </td>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>未傳回資料。</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
<td runat="server" />
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">ForumName:
                    <asp:TextBox ID="ForumNameTextBox" runat="server" Text='<%# Bind("ForumName") %>' />
                    <br />Time:
                    <asp:TextBox ID="TimeTextBox" runat="server" Text='<%# Bind("Time") %>' />
                    <br />ForumPhoto:
                    <asp:TextBox ID="ForumPhotoTextBox" runat="server" Text='<%# Bind("ForumPhoto") %>' />
                    <br />MemberID:
                    <asp:TextBox ID="MemberIDTextBox" runat="server" Text='<%# Bind("MemberID") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                    <br />
                    </td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color: #FFF;color: #333333;">
                    <asp:ImageButton ID="ImageButton1" runat="server" CssClass="新增樣式1" ImageUrl='<%# "img/"+Eval("ForumPhoto") %>' OnClick="ImageButton1_Click" />
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ForumID") %>' Visible="false" />
                    <br />
                    <asp:Label ID="ForumNameLabel" runat="server" Text='<%# Eval("ForumName") %>'></asp:Label>
                    <br />
                    發布人:<asp:Label ID="MemberIDLabel" runat="server" Text='<%# Eval("MemberID") %>'></asp:Label>
                    <br />
                    發帖時間:<asp:Label ID="TimeLabel" runat="server" Text='<%# Eval("Time") %>'></asp:Label>
                    <br />
                    <asp:Button ID="Button2" runat="server" Text="收藏❤" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="11pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" OnClick="Button2_Click"  />

                    <br />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="groupPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr id="groupPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF">
                            <asp:DataPager ID="DataPager2" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    <asp:NumericPagerField />
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">ForumName:
                    <asp:Label ID="ForumNameLabel" runat="server" Text='<%# Eval("ForumName") %>' />
                    <br />Time:
                    <asp:Label ID="TimeLabel" runat="server" Text='<%# Eval("Time") %>' />
                    <br />ForumPhoto:
                    <asp:Label ID="ForumPhotoLabel" runat="server" Text='<%# Eval("ForumPhoto") %>' />
                    <br />MemberID:
                    <asp:Label ID="MemberIDLabel" runat="server" Text='<%# Eval("MemberID") %>' />
                    <br /></td>
            </SelectedItemTemplate>
        </asp:ListView>
        <br />
        <asp:Label ID="lb" runat="server" ></asp:Label>
        <br />
   <asp:ImageButton ID="ImageButton1" title="新增論帖" runat="server" Height="45px" ImageUrl="~/新增.png" style="position:fixed;float:right; bottom:20px;" PostBackUrl="~/Forum-add.aspx"/>
</body>
</asp:Content>


