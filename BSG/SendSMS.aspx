<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendSMS.aspx.cs" Inherits="BSG.SendSMS" MasterPageFile="~/Site.Master" ValidateRequest="false" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h1>Gửi tin nhắn</h1>
    <hr />

    <div class="row">
        <div class="col-sm-4">Nội dung tin nhắn <span class="divStar"><a>*</a>:</span></div>
        <div class="col-sm-8">
            <asp:TextBox ID="txtMessage" placeholder="Cú pháp: <Mã nhóm> <Nội dung>" TextMode="MultiLine" Width="100%" runat="server" Rows="5" />
            <asp:RequiredFieldValidator ErrorMessage="Tin nhắn không được để trống" ForeColor="Red" ControlToValidate="txtMessage" runat="server" /><br />
            <asp:CustomValidator ID="ContentValidator" OnServerValidate="ContentValidator_ServerValidate" ForeColor="Red" ErrorMessage="Nội dung tin nhắn không được để trống" ControlToValidate="txtMessage" runat="server"></asp:CustomValidator><br />
            <asp:CustomValidator ID="GroupCodeValidator" OnServerValidate="GroupCodeValidator_ServerValidate" ForeColor="Red" ErrorMessage="Mã nhóm không tồn tại. Bạn vui lòng kiểm tra lại." ControlToValidate="txtMessage" runat="server" /><br />
            <asp:CustomValidator ID="AccountValidator" OnServerValidate="AccountValidator_ServerValidate" ErrorMessage="Bạn không có quyền gửi tin nhắn tới nhóm." ControlToValidate="txtMessage" ForeColor="Red" runat="server" ></asp:CustomValidator>
        </div>
    </div>
    <div class="row">
        <asp:Button ID="Send" OnClick="Send_Click" CssClass="pull-right btn btn-primary btn-default-bkav btn-bkav btn-bkav-right" Text="Gửi tin nhắn" runat="server" />
    </div>
</asp:Content>
