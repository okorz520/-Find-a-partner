<%@ Page Title="修改案件" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Case-modify.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <header runat="server">
         <script type="text/javascript">
             function previewFile() {
                 var preview = document.querySelector('#<%=Image1.ClientID %>');
            var file = document.querySelector('#<%=FileUpload1.ClientID %>').files[0];
             var reader = new FileReader();

             reader.onloadend = function () {
                 preview.src = reader.result;
             }

             if (file) {
                 reader.readAsDataURL(file);
             } else {
                 preview.src = "";
             }
             }
    </script>
        <style>
            .button{float:left;line-height:50px;}
        </style>
    </header>
    <div class="button">
         <div>
            <asp:Button ID="Button3" runat="server" Text="修改案件資料" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''"  style="border-top-left-radius: 20px;border-bottom-right-radius: 20px;" Width="120px" PostBackUrl="~/Case-modify.aspx"/>
       </div>
       <div>
            <asp:Button ID="Button4" runat="server" Text="審核成員名單" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''"  style="border-top-left-radius: 20px;border-bottom-right-radius: 20px;" Width="120px" PostBackUrl="~/WaitVerifyMember.aspx"/>
       </div>
    </div>
       <table align="center" style="height: 355px">
            <tr> <td> <asp:Image ID="Image1" runat="server" Height="145px" Width="127px" /> </td>  <td><asp:FileUpload ID="FileUpload1" runat="server" onchange="previewFile()"/> </td> </tr>
           <tr>
           <td><asp:Label ID="Label2" runat="server" Text="Label">標題:</asp:Label> </td>
           <td><asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>  </td>    
           </tr>
  <tr>
      <td><asp:Label ID="Label3" runat="server" Text="風格:"></asp:Label></td>
      <td>
          <asp:ListBox ID="ListBox1" runat="server" Rows="1">
              
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
      </td>
   <tr>
       <td>
           <asp:Label ID="Label7" runat="server" Text="Label">類型:</asp:Label></td>
       <td>
           <asp:ListBox ID="ListBox2" runat="server" Height="16px" Rows="1">
             
               <asp:ListItem>動畫</asp:ListItem>
               <asp:ListItem>漫畫</asp:ListItem>
               <asp:ListItem>小說</asp:ListItem>
               <asp:ListItem>遊戲</asp:ListItem>
           </asp:ListBox>
       </td>
   </tr>

   <tr>
       <td><asp:Label ID="Label8" runat="server" Text="Label">發布人:</asp:Label></td>
       <td>
           <asp:HyperLink ID="HyperLink5" runat="server"></asp:HyperLink>
       </td>
   </tr>
        
   <tr>
       <td><asp:Label ID="Label11" runat="server" Text="Label">招募:</asp:Label></td>
       <td><asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
           <asp:ListItem>繪圖</asp:ListItem>
           <asp:ListItem>故事</asp:ListItem>
           <asp:ListItem>程式</asp:ListItem>
           <asp:ListItem>影片製作</asp:ListItem>
           </asp:CheckBoxList>  </td>
   </tr>    
           <tr>
               <td><asp:Label ID="Label9" runat="server" Text="Label">詳細內容:</asp:Label></td>
               <td>
                   <asp:TextBox ID="TextBox5" runat="server" Height="132px" TextMode="MultiLine" Width="418px"></asp:TextBox></td>
           </tr>
      <tr>
          <td></td>
          <td><asp:Button ID="Button1" runat="server" Text="確認送出" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" OnClick="Button1_Click" />&emsp;&emsp;
              <asp:Button ID="Button2" runat="server" Text="刪除" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" OnClick="Button2_Click" OnClientClick="return confirm('確定要刪除嗎？')"/>
          </td>
           
          

      </tr>
        </table>  
</asp:Content>

