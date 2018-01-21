<%@ Page Title="論帖內容" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Forum-天堂地獄之間information  - 複製.aspx.cs" Inherits="Default2" %>

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
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Label ID="Label3" runat="server" Text="類型:"></asp:Label>
            </td>
            <td class="auto-style7">
                <asp:Label ID="Label4" runat="server" ></asp:Label></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Label">發布人:</asp:Label>
            </td>
            <td>
                <asp:HyperLink ID="HyperLink5" runat="server" href="other.aspx"></asp:HyperLink>
            </td>
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
 
</asp:Content>

