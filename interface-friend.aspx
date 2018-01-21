﻿<%@ Page Title="我的好友" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Interface-friend.aspx.cs" Inherits="Default2" %>

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
           <asp:Button ID="Button14" runat="server" Text="我的收藏案件" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''"  style="border-top-left-radius: 20px;border-bottom-right-radius: 20px;" Width="120px" PostBackUrl="~/Interface-collectionC.aspx" />
       </div>
       <div>
           <asp:Button ID="Button15" runat="server" Text="我的收藏論帖" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''"  style="border-top-left-radius: 20px;border-bottom-right-radius: 20px;" Width="120px" PostBackUrl="~/Interface-collectionF.aspx" />
       </div>
       <div>
            <asp:Button ID="Button6" runat="server" Text="我的黑名單" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''"  style="border-top-left-radius: 20px;border-bottom-right-radius: 20px;" Width="120px" PostBackUrl="~/Interface-blacklist.aspx"/>
       </div>
       <div>
            <asp:Button ID="Button7" runat="server" Text="我的團隊" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''"  style="border-top-left-radius: 20px;border-bottom-right-radius: 20px;" Width="120px" PostBackUrl="~/Interface-team.aspx"/>
       </div>
   </div>
           
               
            
    <div style="float:center; padding-left:500px;">
         <asp:Image ID="Image1" runat="server" ImageAlign="Middle" ImageUrl="~/image/放大鏡(已去底).png" Height="20px" />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="搜尋" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" />
    </div>
   
    <div style="padding-left:200px">
          <div class="CMC">
             </div>
              <div>
                  <asp:ListView ID="ListView1" runat="server" DataKeyNames="FriendID" DataSourceID="SqlDataSource1" GroupItemCount="6">
                      <AlternatingItemTemplate>
                          <td runat="server" style="background-color: #FFFFFF; color: #284775;">
                              <asp:ImageButton ID="ImageButton3" runat="server" Height="50px" Width="55px" ImageUrl='<%# "img/"+Eval("MemberPhoto") %>'  OnClick="ImageButton3_Click"/>
                              <asp:Label ID="Label8" runat="server" Text='<%# Eval("MemberName") %>'></asp:Label>
                              <asp:Label ID="Label1" runat="server" Text='<%# Eval("MemberID") %>' Visible="false"></asp:Label>
                              <asp:Button ID="Button4" runat="server" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" Text="移除" OnClick="Button4_Click" OnClientClick="return confirm('確定要移除嗎？')"/>
                              <br /></td>
                      </AlternatingItemTemplate>
                      <EditItemTemplate>
                          <td runat="server" style="background-color: #999999;">FriendID:
                              <asp:Label ID="FriendIDLabel1" runat="server" Text='<%# Eval("FriendID") %>' />
                              <br />Remarks:
                              <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
                              <br />
                              <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
                              <br />
                              <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
                              <br /></td>
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
                          <td runat="server" style="">FriendID:
                              <asp:TextBox ID="FriendIDTextBox" runat="server" Text='<%# Bind("FriendID") %>' />
                              <br />Remarks:
                              <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
                              <br />
                              <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                              <br />
                              <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                              <br /></td>
                      </InsertItemTemplate>
                      <ItemTemplate>
                          <td runat="server" style="background-color: #FFF;color: #333333;">
                              <asp:ImageButton ID="ImageButton3" runat="server" Height="50px" Width="55px" ImageUrl='<%# "img/"+Eval("MemberPhoto") %>' OnClick="ImageButton3_Click"/>
                              <asp:Label ID="Label8" runat="server" Text='<%# Eval("MemberName") %>'></asp:Label>
                              <asp:Label ID="Label1" runat="server" Text='<%# Eval("MemberID") %>' Visible="false"></asp:Label>
                              <asp:Button ID="Button4" runat="server" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" Text="移除" OnClick="Button4_Click" OnClientClick="return confirm('確定要移除嗎？')"/>
                              <br /></td>
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
                                  <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
                              </tr>
                          </table>
                      </LayoutTemplate>
                      <SelectedItemTemplate>
                          <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">FriendID:
                              <asp:Label ID="FriendIDLabel" runat="server" Text='<%# Eval("FriendID") %>' />
                              <br />Remarks:
                              <asp:Label ID="RemarksLabel" runat="server" Text='<%# Eval("Remarks") %>' />
                              <br /></td>
                      </SelectedItemTemplate>
                  </asp:ListView>
             </div>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ></asp:SqlDataSource>
    </div>
   
</asp:Content>

