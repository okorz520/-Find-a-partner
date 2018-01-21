<%@ Page Title="修改個人資料" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Interface-modify.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style5 {
            height: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <header runat="server">
         <script type="text/javascript">
        function previewFile() {
            var preview = document.querySelector('#<%=ImageButton3.ClientID %>');
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
    <table align="center" >
          
            <tr>
                <td rowspan="7">  
                    <asp:ImageButton ID="ImageButton3" runat="server" Width="200px" height=""  />
                <td></td>
                <td>暱稱：</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
             <tr>
                 <td></td>
                <td>擅長：</td>
                <td>
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem>繪畫</asp:ListItem>
                        <asp:ListItem>寫作</asp:ListItem>
                        <asp:ListItem>程式</asp:ListItem>
                        <asp:ListItem>修圖</asp:ListItem>
                        <asp:ListItem>影片剪輯</asp:ListItem>
                    </asp:CheckBoxList>
                 </td>
            </tr>
             <tr>
                 <td></td>
                <td>自介：</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="368px" Height="100px"></asp:TextBox>
                 </td>
            </tr>
             <tr>
                 <td></td>
                <td>信箱：</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Height="19px"></asp:TextBox>
                </td>
            </tr> 
            <tr>
                 <td></td>
                <td>作品：</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                 </td>
            </tr>
            <tr>
                 <td class="auto-style5"></td>
                <td class="auto-style5">團隊：</td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox5" runat="server" ></asp:TextBox>
                 </td>
            </tr>
        <tr>
             <td></td>
                <td>檔案上傳：</td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" onchange="previewFile()"/>
                 </td>
            
        </tr>
             <tr align="right">
                 <td colspan="10">
                     <asp:Button ID="Button1" runat="server" Text="確認送出" BackColor="Black"  BorderStyle="Ridge"  Font-Names="微軟正黑體" Font-Size="12pt" ForeColor="White" onmouseover="this.style.fontWeight='bold'"  onmouseout="this.style.fontWeight=''"  OnClick="Button1_Click"/>
                     </td>
             </tr>
        </table>
</asp:Content>

