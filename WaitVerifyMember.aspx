<%@ Page Title="團隊待通過名單" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="WaitVerifyMember.aspx.cs" Inherits="Default3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .button{float:left;line-height:50px;height:500px;}
    </style>
     <div class="button">
         <div>
            <asp:Button ID="Button3" runat="server" Text="修改案件資料" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''"  style="border-top-left-radius: 20px;border-bottom-right-radius: 20px;" Width="120px" PostBackUrl="~/Case-modify.aspx"/>
       </div>
       <div>
            <asp:Button ID="Button4" runat="server" Text="審核成員名單" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''"  style="border-top-left-radius: 20px;border-bottom-right-radius: 20px;" Width="120px" PostBackUrl="~/WaitVerifyMember.aspx"/>
       </div>
    </div>
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="WaitVerifyID" DataSourceID="SqlDataSource1" >
        <AlternatingItemTemplate>
            <table>
                <tr>
                    <td><asp:ImageButton ID="ImageButton2" runat="server" Height="60" Width="60"  ImageUrl='<%# "img/"+Eval("MemberPhoto") %>' /></td>
                    <td><asp:Label ID="MemberName" runat="server" Text='<%# Eval("MemberName") %>'></asp:Label></td>
                    <td><asp:Button ID="Button1" runat="server" Text="通過"  BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="11pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" OnClick="Button1_Click"/></td>
                    <td><asp:Button ID="Button2" runat="server" Text="移除"  BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="11pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" OnClick="Button2_Click" OnClientClick="return confirm('確定要刪除嗎？')" /></td>
                </tr>
                  
            </table>
               <hr />
              <asp:Label ID="Label1" runat="server" Text='<%# Eval("MemberID") %>' Visible="false"></asp:Label>
            
<br />

        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="">WaitVerifyID:
            <asp:Label ID="WaitVerifyIDLabel1" runat="server" Text='<%# Eval("WaitVerifyID") %>' />
            <br />
            Time:
            <asp:TextBox ID="TimeTextBox" runat="server" Text='<%# Bind("Time") %>' />
            <br />
            Reason:
            <asp:TextBox ID="ReasonTextBox" runat="server" Text='<%# Bind("Reason") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
            <br /><br /></span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span></span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">WaitVerifyID:
            <asp:TextBox ID="WaitVerifyIDTextBox" runat="server" Text='<%# Bind("WaitVerifyID") %>' />
            <br />Time:
            <asp:TextBox ID="TimeTextBox" runat="server" Text='<%# Bind("Time") %>' />
            <br />
            Reason:
            <asp:TextBox ID="ReasonTextBox" runat="server" Text='<%# Bind("Reason") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
            <br /><br /></span>
        </InsertItemTemplate>
        <ItemTemplate>
  <table>
                <tr>
                    <td><asp:ImageButton ID="ImageButton2" runat="server" Height="60" Width="60"  ImageUrl='<%# "img/"+Eval("MemberPhoto") %>' /></td>
                    <td><asp:Label ID="MemberName" runat="server" Text='<%# Eval("MemberName") %>'></asp:Label></td>
                    <td><asp:Button ID="Button1" runat="server" Text="通過"  BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="11pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" OnClick="Button1_Click" /></td>
                    <td><asp:Button ID="Button2" runat="server" Text="移除"  BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="11pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" OnClick="Button2_Click" OnClientClick="return confirm('確定要刪除嗎？')" /></td>
                </tr>
                  
            </table>
               <hr />
              <asp:Label ID="Label1" runat="server" Text='<%# Eval("MemberID") %>' Visible="false"></asp:Label>
            
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="">WaitVerifyID:
            <asp:Label ID="WaitVerifyIDLabel" runat="server" Text='<%# Eval("WaitVerifyID") %>' />
            <br />
            Time:
            <asp:Label ID="TimeLabel" runat="server" Text='<%# Eval("Time") %>' />
            <br />
            Reason:
            <asp:Label ID="ReasonLabel" runat="server" Text='<%# Eval("Reason") %>' />
<br />
            <br />
            </span>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [WaitVerifyMember]"></asp:SqlDataSource>
</asp:Content>

