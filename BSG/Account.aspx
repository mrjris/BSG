<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="BSG.Account" MasterPageFile="~/Site.Master"%>

<asp:Content ContentPlaceHolderID="MainContent" runat="server" >
    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class ="row">
                <asp:Button Text="Thêm" ID="btnAddAccount" OnClick="btnAddAccount_Click" CssClass="btn btn-primary" runat="server" />
             </div>
            <div class="row">
                <asp:GridView runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True">
                    <Columns>
                        <asp:BoundField DataField="Account" HeaderText="Account" SortExpression="Account"></asp:BoundField>
                        <asp:BoundField DataField="Description" HeaderText="Mi&#234;u tả" SortExpression="Mi&#234;u tả"></asp:BoundField>
                        <asp:BoundField DataField="Phones" HeaderText="Số điện thoại" ReadOnly="True" SortExpression="Số điện thoại"></asp:BoundField>
                        <asp:BoundField DataField="CreatedPerson" HeaderText="Người tạo" SortExpression="Người tạo"></asp:BoundField>
                        <asp:CommandField
                            ShowEditButton="true"
                            ShowDeleteButton="true" ButtonType="Image" HeaderText="Chức năng"></asp:CommandField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:BSGConnectionString %>' SelectCommand="GetAllAccount" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>
