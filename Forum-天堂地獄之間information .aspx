<%@ Page Title="論帖內容" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Forum-天堂地獄之間information .aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <table align="center" style="padding-top:50px;padding-bottom:150px;line-height:50px;font-family:'微軟正黑體';width:900px">
        <tr > <td rowspan="5"> <asp:Image ID="Image1" runat="server" Height="273px" Width="253px" />  </td> </tr>
        <tr>
            
            <td style="width:100px">
                <asp:Label ID="Label2" runat="server" Text="Label">標題:</asp:Label>
            </td>
            <td>
                <asp:Label ID="Label10" runat="server" ></asp:Label>
                </td>
             <td><asp:Button ID="Button4" runat="server" Text="轉發分享" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" />  </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="Label3" runat="server" Text="類型:"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:Label ID="Label4" runat="server" ></asp:Label></td>
             <td><asp:Button ID="Button1" runat="server" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" Text="收藏論帖" OnClick="Button1_Click" />  </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Label">發布人:</asp:Label>
            </td>
            <td>
                <asp:HyperLink ID="HyperLink5" runat="server" href="other.aspx"></asp:HyperLink>
            </td>
             <td><asp:Button ID="Button2" runat="server" Text="管理論帖" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''"  OnClick="Button2_Click" />  </td>
        </tr>


        <tr>
            <td style="padding-bottom:50px">
                <asp:Label ID="Label9" runat="server" Text="Label"  >詳細內容:</asp:Label>
            </td>
            <td>
                <asp:Label ID="Label6" runat="server" ></asp:Label>
            </td>

        </tr>
    </table>
    <div align="center">
        <asp:ImageButton ID="ImageButton2" runat="server" Height="100px" Width="100px" />
       <asp:TextBox ID="TextBox1" runat="server" Height="112px" TextMode="MultiLine" Width="65%"></asp:TextBox>
       <asp:Button ID="Button3" runat="server" Text="送出"  BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" OnClick="Button3_Click" /> 
    </div>
    <hr />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="MessageForumID" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <span style="">
            <asp:Label ID="timeLabel" runat="server" Text='<%# Eval("time") %>' style="float:right"/>
            <asp:ImageButton ID="ImageButton2" runat="server" Height="60px" Width="60px" ImageUrl='<%# "img/"+Eval("MemberPhoto") %>'/>
            <asp:Label ID="TextContentLabel" runat="server" Text='<%# Eval("TextContent") %>' />
            <br />
            <asp:Label ID="membernamelbl" runat="server" Text='<%# Eval("MemberName") %>'></asp:Label>
                             <asp:Label ID="MIDLabel" runat="server" Text='<%# Eval("MID") %>'  Visible="false"/>
                <hr />
            </span>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <span style="">CaseID:
            <asp:TextBox ID="CaseIDTextBox" runat="server" Text='<%# Bind("ForumID") %>' />
            <br />
            MessageCaseID:
            <asp:Label ID="MessageCaseIDLabel1" runat="server" Text='<%# Eval("MessageForumID") %>' />
            <br />
            TextContent:
            <asp:TextBox ID="TextContentTextBox" runat="server" Text='<%# Bind("TextContent") %>' />
            <br />
            time:
            <asp:TextBox ID="timeTextBox" runat="server" Text='<%# Bind("time") %>' />
            <br />
            MID:
            <asp:TextBox ID="MIDTextBox" runat="server" Text='<%# Bind("MID") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="更新" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="取消" />
            <br /><br /></span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span></span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">CaseID:
            <asp:TextBox ID="CaseIDTextBox" runat="server" Text='<%# Bind("ForumID") %>' />
            <br />TextContent:
            <asp:TextBox ID="TextContentTextBox" runat="server" Text='<%# Bind("TextContent") %>' />
            <br />time:
            <asp:TextBox ID="timeTextBox" runat="server" Text='<%# Bind("time") %>' />
            <br />MID:
            <asp:TextBox ID="MIDTextBox" runat="server" Text='<%# Bind("MID") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
            <br /><br /></span>
        </InsertItemTemplate>
        <ItemTemplate>
         <span style="">
            <asp:Label ID="timeLabel" runat="server" Text='<%# Eval("time") %>' style="float:right"/>
            <asp:ImageButton ID="ImageButton2" runat="server" Height="60px" Width="60px" ImageUrl='<%# "img/"+Eval("MemberPhoto") %>'/>
             <asp:Label ID="TextContentLabel" runat="server" Text='<%# Eval("TextContent") %>' />
            <br />
            <asp:Label ID="membernamelbl" runat="server" Text='<%# Eval("MemberName") %>'></asp:Label>
             <asp:Label ID="MIDLabel" runat="server" Text='<%# Eval("MID") %>'  Visible="false"/>
             <hr />
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
                </span>
           </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="">CaseID:
            <asp:Label ID="CaseIDLabel" runat="server" Text='<%# Eval("ForumID") %>' />
            <br />
            MessageCaseID:
            <asp:Label ID="MessageCaseIDLabel" runat="server" Text='<%# Eval("MessageForumID") %>' />
            <br />
            TextContent:
            <asp:Label ID="TextContentLabel" runat="server" Text='<%# Eval("TextContent") %>' />
            <br />
            time:
            <asp:Label ID="timeLabel" runat="server" Text='<%# Eval("time") %>' />
            <br />
            MID:
            <asp:Label ID="MIDLabel" runat="server" Text='<%# Eval("MID") %>' />
            <br />
<br /></span>
        </SelectedItemTemplate>
    </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [MessageCase]"></asp:SqlDataSource>

</asp:Content>

