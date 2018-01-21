<%@ Page Title="案件" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Case.aspx.cs" Inherits="Default2" %>
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
        height: 28px;
    }
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
    </style>  
<body>
    
        <table align="center" border="0" width="100%">
            <tr align="center">
                <td class="auto-style5">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" Text="案件"></asp:Label>
                </td>
            </tr>
            <tr align="center">
                <td>
                    <asp:Image ID="Image1" runat="server" Height="20px" ImageAlign="Middle" ImageUrl="~/img/放大鏡(已去底).png" />
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:ListBox ID="ListBox1" runat="server" Rows="1">
                        <asp:ListItem>風格</asp:ListItem>
                        <asp:ListItem>奇幻</asp:ListItem>
                        <asp:ListItem>玄幻</asp:ListItem>
                        <asp:ListItem>恐怖</asp:ListItem>
                        <asp:ListItem>推理</asp:ListItem>
                        <asp:ListItem>武俠</asp:ListItem>
                        <asp:ListItem>愛情</asp:ListItem>
                        <asp:ListItem>科幻</asp:ListItem>
                        <asp:ListItem>同人</asp:ListItem>
                        <asp:ListItem>歷史</asp:ListItem>
                        <asp:ListItem>其他</asp:ListItem>
                    </asp:ListBox>
                    <asp:ListBox ID="ListBox2" runat="server" Rows="1">
                        <asp:ListItem>類型</asp:ListItem>
                        <asp:ListItem>動畫</asp:ListItem>
                        <asp:ListItem>漫畫</asp:ListItem>
                        <asp:ListItem>小說</asp:ListItem>
                        <asp:ListItem>遊戲</asp:ListItem>
                    </asp:ListBox>
                    <asp:Button ID="Button1" runat="server"  BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" Text="搜尋" OnClick="Button1_Click"  />
                </td>
            </tr>
        </table>
        <asp:Label ID="Label7" runat="server"></asp:Label>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"  >
        </asp:SqlDataSource>
        <br />
        <asp:ListView ID="ListView1" runat="server" GroupItemCount="5" DataSourceID="SqlDataSource1"   >
            <AlternatingItemTemplate>
                <td runat="server" style="background-color: #FFFFFF;color: #284775;">
                      &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" CssClass="新增樣式1" ImageUrl='<%# "img/"+Eval("CasePhoto") %>' OnClick="ImageButton1_Click"/>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("CaseID") %>' Visible="false" />
                    <br />
                      <asp:Label ID="CaseNameLabel" runat="server" Text='<%# Eval("CaseName") %>' Font-Size="Large"  />
                    <br />
                    <asp:Label ID="CaseConditionLabel" runat="server" Text='<%# Eval("CaseCondition") %>' />                   
                    <br />
                      招募對象:<asp:Label ID="RecruitTltLabel" runat="server" Text='<%# Eval("RecruitTlt") %>' />
                    <br />
                      招募時間:<asp:Label ID="TimeLabel" runat="server" Text='<%# Eval("Time", "{0:D}") %>' />                  
                      <br />                    
                      <asp:Button ID="Button2" runat="server" Text="收藏❤" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" OnClick="Button2_Click"/>
                    <br />
                </td>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <td runat="server" style="background-color: #999999;">CaseName:
                    <asp:TextBox ID="CaseNameTextBox" runat="server" Text='<%# Bind("CaseName") %>' />
                    <br />
                    CaseCondition:
                    <asp:TextBox ID="CaseConditionTextBox" runat="server" Text='<%# Bind("CaseCondition") %>' />
                    <br />
                    RecruitTlt:
                    <asp:TextBox ID="RecruitTltTextBox" runat="server" Text='<%# Bind("RecruitTlt") %>' />
                    <br />
                    Time:
                    <asp:TextBox ID="TimeTextBox" runat="server" Text='<%# Bind("Time") %>' />
                    <br />
                    CasePhoto:
                    <asp:TextBox ID="CasePhotoTextBox" runat="server" Text='<%# Bind("CasePhoto") %>' />
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
                <td runat="server" style="">CaseName:
                    <asp:TextBox ID="CaseNameTextBox" runat="server" Text='<%# Bind("CaseName") %>' />
                    <br />CaseCondition:
                    <asp:TextBox ID="CaseConditionTextBox" runat="server" Text='<%# Bind("CaseCondition") %>' />
                    <br />RecruitTlt:
                    <asp:TextBox ID="RecruitTltTextBox" runat="server" Text='<%# Bind("RecruitTlt") %>' />
                    <br />Time:
                    <asp:TextBox ID="TimeTextBox" runat="server" Text='<%# Bind("Time") %>' />
                    <br />CasePhoto:
                    <asp:TextBox ID="CasePhotoTextBox" runat="server" Text='<%# Bind("CasePhoto") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="插入" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="清除" />
                    <br /></td>
            </InsertItemTemplate>
            <ItemTemplate>
                <td runat="server" style="background-color: #FFF;color: #333333;">
                    &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" CssClass="新增樣式1" ImageUrl='<%# "img/"+Eval("CasePhoto") %>' OnClick="ImageButton1_Click"/>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("CaseID") %>' Visible="false" />
                    <br />
                    <asp:Label ID="CaseNameLabel" runat="server" Text='<%# Eval("CaseName") %>' Font-Size="Large"  />
                    <br />
                    <asp:Label ID="CaseConditionLabel" runat="server" Text='<%# Eval("CaseCondition") %>'></asp:Label>
                    <br />
                    招募對象:<asp:Label ID="RecruitTltLabel" runat="server" Text='<%# Eval("RecruitTlt") %>'></asp:Label>
                    <br />
                    招募時間:<asp:Label ID="TimeLabel" runat="server" Text='<%# Eval("Time", "{0:D}") %>'></asp:Label>
                    <br />
                    <asp:Button ID="Button2" runat="server" Text="收藏❤" BackColor="Black" BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="11pt" ForeColor="White"  onmouseover="this.style.fontWeight='bold'" onmouseout="this.style.fontWeight=''" OnClick="Button2_Click" />

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
                    
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="background-color: #E2DED6;font-weight: bold;color: #333333;">CaseName:
                    <asp:Label ID="CaseNameLabel" runat="server" Text='<%# Eval("CaseName") %>' />
                    <br />CaseCondition:
                    <asp:Label ID="CaseConditionLabel" runat="server" Text='<%# Eval("CaseCondition") %>' />
                    <br />RecruitTlt:
                    <asp:Label ID="RecruitTltLabel" runat="server" Text='<%# Eval("RecruitTlt") %>' />
                    <br />Time:
                    <asp:Label ID="TimeLabel" runat="server" Text='<%# Eval("Time") %>' />
                    <br />CasePhoto:
                    <asp:Label ID="CasePhotoLabel" runat="server" Text='<%# Eval("CasePhoto") %>' />
                    <br /></td>
            </SelectedItemTemplate>
            
        </asp:ListView>
       <asp:ImageButton ID="ImageButton1" title="新增案件" runat="server" Height="45px" ImageUrl="~/新增.png" style="position:fixed;float:right; bottom:30px;" PostBackUrl="~/Case-add.aspx"/>
<asp:Label ID="lb" runat="server" ></asp:Label></body>
</asp:Content>
