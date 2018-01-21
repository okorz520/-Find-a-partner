<%@ Page Title="新增論帖" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Forum-add.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style5 {
            width: 308px;
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
                <td>
               <asp:FileUpload ID="FileUpload1" runat="server" onchange="previewFile()"/>
           </td> </tr>
          
            <tr>
              
                <td>標題：</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>類型：</td>
                <td class="auto-style5">
                    <asp:DropDownList ID="DropDownList2" runat="server">
                          <asp:ListItem>類型</asp:ListItem>
            <asp:ListItem>動畫</asp:ListItem>
            <asp:ListItem>漫畫</asp:ListItem>
            <asp:ListItem>小說</asp:ListItem>
            <asp:ListItem>遊戲</asp:ListItem>
                    </asp:DropDownList> </td>
            </tr>
           
             <tr>
                <td>發布人：</td>
               <td class="auto-style5">
                    <asp:HyperLink ID="HyperLink5" runat="server"></asp:HyperLink>
                 </td>
            </tr> 
            <tr>
            <td><asp:Label ID="Label2" runat="server" Text="Label">時間:</asp:Label></td>
            <td class="auto-style5"><asp:Label ID="Label1" runat="server" ></asp:Label></td>
        </tr>
            <tr>
                <td>詳細內容：</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Height="39px" Width="320px"></asp:TextBox>
                    </td>
            </tr>
             <tr align="right">
                 <td colspan="2">
                     <asp:Button ID="Button1" runat="server" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''" Text="確認送出" OnClick="Button1_Click" />
        <br />
        
             </tr>
        </table>
</asp:Content>

