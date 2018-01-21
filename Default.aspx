<%@ Page Title="尋找小伙伴首頁" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
      
.card {
    position:relative;
    width: 100%;
    height: 600px;
    overflow: hidden;
}
.card .imgBx,
.card .details {
    width: 100%;
    height: 100%;
    position: absolute;
    transition: .5s;
}
.card .imgBx {
    top: 0;
    left: 0;
}
.card:hover .imgBx {
    top: 0;
    left: -100%;
}
.card .imgBx img {
    width: 100%;
}
.card .details {
    top: 0;
    left: 100%;
}

.card:hover .details {
    top: 0;
    left: 0%;
    
}
    </style>
    <div class="card">
            <div class="imgBx">
                   <asp:Image ID="Image1" runat="server" ImageUrl="~/img/尋找小伙伴-首頁圖.png" />
            </div>
            <div class="details">
                  <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/img/尋找小伙伴-首頁介紹.png" Width="100%" />
            </div>
        </div>
</asp:Content>

