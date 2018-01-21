<%@ Page Title="我的案件收藏" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="interface-collectionC.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        div{font-family:'微軟正黑體'}
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
           
               
            
    <div style="float:right;">
         <asp:Image ID="Image1" runat="server" ImageAlign="Middle" ImageUrl="~/image/放大鏡(已去底).png" Height="20px" />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem Value="用戶"></asp:ListItem>
            <asp:ListItem Value="案件"></asp:ListItem>
            <asp:ListItem Value="論帖"></asp:ListItem>
         </asp:DropDownList>
        <asp:Button ID="Button1" runat="server" Text="搜尋" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" />
    </div>
    <div class="collection-type" style="line-height:50px;padding-left:200px">
         <div class="title">          
             <asp:label runat="server" Font-Bold="True">案件收藏</asp:label>   
         </div>         
          <div>

              <asp:ListView ID="ListView1" runat="server" DataKeyNames="CollectCID" DataSourceID="SqlDataSource1" GroupItemCount="6">
                  <AlternatingItemTemplate>
                      <td runat="server" style="background-color: #FFFFFF;color: #284775;">
                          <asp:ImageButton ID="ImageButton1" runat="server" Height="100px" Width="150px" ImageUrl='<%# "img/"+Eval("CasePhoto") %>'  OnClick="ImageButton1_Click"/>
                          <br />
                           <asp:Label ID="Label2" runat="server" Text='<%# Eval("CID") %>' Visible="false" />
                          <br />
                          <asp:Label ID="Label1" runat="server"  Text='<%# Eval("CaseName") %>'></asp:Label>
                          <asp:Button ID="Button4" runat="server"  BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" Text="移除" OnClick="Button4_Click" OnClientClick="return confirm('確定要刪除嗎？')"/>
                          <br />
                      </td>
                  </AlternatingItemTemplate>
                  <EditItemTemplate>
                      <td runat="server" style="background-color: #999999;">CollectCID:
                          <asp:Label ID="CollectCIDLabel1" runat="server" Text='<%# Eval("CollectCID") %>' />
                          <br />Remarks:
                          <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
                          <br />Time:
                          <asp:TextBox ID="TimeTextBox" runat="server" Text='<%# Bind("Time") %>' />
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
                      <td runat="server" style="">CollectCID:
                          <asp:TextBox ID="CollectCIDTextBox" runat="server" Text='<%# Bind("CollectCID") %>' />
                          <br />Remarks:
                          <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
                          <br />Time:
                          <asp:TextBox ID="TimeTextBox" runat="server" Text='<%# Bind("Time") %>' />
                          <br />
                          <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                          <br />
                          <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                          <br /></td>
                  </InsertItemTemplate>
                  <ItemTemplate>
                      <td runat="server" style="background-color: #FFF;color: #333333;">
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="100px" Width="150px" ImageUrl='<%# "img/"+Eval("CasePhoto") %>'  OnClick="ImageButton1_Click"/>
                          <br />
                           <asp:Label ID="Label2" runat="server" Text='<%# Eval("CID") %>' Visible="false" />
                          <br />
                          <asp:Label ID="Label1" runat="server"  Text='<%# Eval("CaseName") %>'></asp:Label>
                          <asp:Button ID="Button4" runat="server"  BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" Text="移除" OnClick="Button4_Click" OnClientClick="return confirm('確定要刪除嗎？')"/>

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
                              <td runat="server" style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF"></td>
                          </tr>
                      </table>
                  </LayoutTemplate>
                  <SelectedItemTemplate>
                      <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">CollectCID:
                          <asp:Label ID="CollectCIDLabel" runat="server" Text='<%# Eval("CollectCID") %>' />
                          <br />Remarks:
                          <asp:Label ID="RemarksLabel" runat="server" Text='<%# Eval("Remarks") %>' />
                          <br />Time:
                          <asp:Label ID="TimeLabel" runat="server" Text='<%# Eval("Time") %>' />
                          <br /></td>
                  </SelectedItemTemplate>
              </asp:ListView>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [CollectCS]"></asp:SqlDataSource>

          </div>
         


</div>
</asp:Content>

