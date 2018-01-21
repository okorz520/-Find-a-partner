<%@ Page Title="新增案件" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Case-add.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style5 {
            width: 334px;
        }
    </style>
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
    </header>
    <table align="center" style="padding-top:50px;padding-bottom:150px;line-height:50px;font-family:'微軟正黑體'">
       <tr> <td> <asp:Image ID="Image1" runat="server" Height="145px" Width="127px" /> </td> 
           <td class="auto-style5">
               <asp:FileUpload ID="FileUpload1" runat="server" onchange="previewFile()"/>
               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*此欄位不可為空白" ControlToValidate="FileUpload1" ForeColor="Red">*</asp:RequiredFieldValidator>
           </td> </tr>
        <tr>
           <td><asp:Label ID="Label2" runat="server" Text="Label">標題:</asp:Label> </td>
           <td class="auto-style5"><asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*此欄位不可為空白" ControlToValidate="TextBox1" ForeColor="Red">*</asp:RequiredFieldValidator> </td>    
           </tr>
        <tr>
            <td><asp:Label ID="Label5" runat="server" Text="Label">狀態:</asp:Label> </td>
           <td class="auto-style5">
               <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatLayout="Flow">
                   <asp:ListItem Selected="True">招募中</asp:ListItem>
               </asp:RadioButtonList></td>    
        </tr>
  <tr>
      <td class="auto-style7"><asp:Label ID="Label3" runat="server" Text="風格:"></asp:Label></td>
      <td class="auto-style5">
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
          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*此欄位不可為空白" ControlToValidate="ListBox1" ForeColor="Red">*</asp:RequiredFieldValidator>
      </td>
   <tr>
       <td>
           <asp:Label ID="Label7" runat="server" Text="Label">類型:</asp:Label></td>
       <td class="auto-style5">
           <asp:ListBox ID="ListBox2" runat="server"  Rows="1">
             
               <asp:ListItem>動畫</asp:ListItem>
               <asp:ListItem>漫畫</asp:ListItem>
               <asp:ListItem>小說</asp:ListItem>
               <asp:ListItem>遊戲</asp:ListItem>
           </asp:ListBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*此欄位不可為空白" ControlToValidate="ListBox2" ForeColor="Red">*</asp:RequiredFieldValidator>
       </td>
   </tr>

   <tr>
       <td><asp:Label ID="Label8" runat="server" Text="Label">發布人:</asp:Label></td>
       <td class="auto-style5">
           <asp:HyperLink ID="HyperLink5" runat="server"></asp:HyperLink>
       </td>
   </tr>
        
   <tr>
       <td><asp:Label ID="Label11" runat="server" Text="Label">招募:</asp:Label></td>
       <td class="auto-style5"><asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
           <asp:ListItem>繪圖</asp:ListItem>
           <asp:ListItem>故事</asp:ListItem>
           <asp:ListItem>程式</asp:ListItem>
           <asp:ListItem>影片製作</asp:ListItem>
           </asp:CheckBoxList>
       </td>
   </tr>    
        <tr>
            <td><asp:Label ID="Label1" runat="server" Text="Label">時間:</asp:Label></td>
            <td class="auto-style5"><asp:Label ID="Label4" runat="server" ></asp:Label></td>
        </tr>
           <tr>
               <td><asp:Label ID="Label9" runat="server" Text="Label">詳細內容:</asp:Label></td>
               <td class="auto-style5">
                   <asp:TextBox ID="TextBox5" runat="server" Height="132px" TextMode="MultiLine" Width="334px" ></asp:TextBox></td>
           </tr>
      <tr align="right" >
          <td ></td>
          <td><asp:Button ID="Button1" runat="server" Text="確認送出" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" OnClick="Button1_Click" /></td> 
          </tr>
       
        </table>  
</asp:Content>

