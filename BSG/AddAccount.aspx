<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAccount.aspx.cs" Inherits="BSG.AddAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="html/sandboxed" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-group">
            <div class="col-sm-2">
                <asp:Label Text="Account *: " runat="server" CssClass="control-label pull-right" />
            </div>
            <div class="col-sm-10">
                <asp:TextBox CssClass="form-control" placeholder="Nhập tên đăng nhập" ID="txtAccount" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2">
                <asp:Label Text="Password *: " runat="server" CssClass="control-label pull-right" />
            </div>
            <div class="col-sm-10">
                <asp:TextBox CssClass="form-control" placeholder="Nhập mật khẩu" ID="txtPassword" TextMode="Password" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2">
                <asp:Label Text="Mô tả : " runat="server" CssClass="control-label pull-right" />
            </div>
            <div class="col-sm-10">
                <asp:TextBox CssClass="form-control" placeholder="Nhập mô tả" ID="txtDescription" runat="server" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-2">
                <asp:Label Text="Số điện thoại : " runat="server" CssClass="control-label pull-right" />
            </div>
            <div class="col-sm-10">
                <asp:TextBox CssClass="form-control" placeholder="Nhập số điện thoại" ID="txtPhones" runat="server" />
            </div>
        </div>
        <div class="col-sm-10 col-sm-offset-2">
            <asp:Button ID="Add" Text="Cập nhật" runat="server" OnClick="Add_Click" />
            <asp:Button ID="Cancel" Text="Bỏ qua" runat="server" OnClick="Cancel_Click" />
        </div>
    </form>
    
</body>
</html>
