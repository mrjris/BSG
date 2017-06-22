<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Group.aspx.cs" Inherits="BSG.Group" MasterPageFile="~/Site.Master" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h1>Group</h1>
    <hr />
    <fieldset class="divfieldset">
        <div class="row row-eq-height divFilter">
            <div class="col-xs-9">
                Mã nhóm:
                <input type="text" id="txtGroupID" name="groupID" value="" />
                Người tạo
                <input type="text" id="txtCreatedPerson" name="groupID" value="" />
                Mô tả
                <input type="text" id="txtDescription" name="groupID" value="" />
                Trạng thái
                <input type="text" id="txtStatus" name="groupID" value="" />
            </div>
            <div class="col-xs-1 pull-right">
                <asp:Button Text="Thêm" runat="server" CssClass="btn btn-primary btn-default-bkav" />
            </div>
            <div class="col-xs-1 pull-right">
                <asp:Button Text="Tìm kiếm" runat="server" CssClass="btn btn-primary btn-default-bkav" />
            </div>
        </div>
        <div class="row">
            <div class="divTable">
                <asp:GridView runat="server" CssClass="table table-default table-bkav-w" BackColor="White" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="GroupCode" HeaderText="GroupCode" SortExpression="GroupCode" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:BoundField DataField="CreatedPerson" HeaderText="CreatedPerson" SortExpression="CreatedPerson" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BSGConnectionString %>" SelectCommand="SELECT [GroupCode], [Description], [Status], [CreatedPerson] FROM [Group] ORDER BY [GroupCode]"></asp:SqlDataSource>
            </div>
        </div>
    </fieldset>

</asp:Content>
