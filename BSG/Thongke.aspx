<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Thongke.aspx.cs" Inherits="BSG.Thongke" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="background-color: white; width: 100%">


        <h1 style="padding-top: 15px">Thống kê</h1>
        <hr />
        <div class="row">
            <div class="divFilter">
                <div class="col-sm-3">
                    Từ ngày:
                    <asp:TextBox ID="txtFromDate" CssClass="input-text-bkav" runat="server" />
                    <span data-toggle="collapse" data-target="#calendar1">
                        <asp:Image ImageUrl="~/Images/Calendar.png" runat="server" />
                    </span>
                    <div class="collapse" id="calendar1">
                        <asp:Calendar ID="FromDateCalendar" runat="server" OnSelectionChanged="FromDateCalendar_SelectionChanged"></asp:Calendar>
                    </div>
                </div>
                <div class="col-sm-3">
                    Đến ngày:
                    <asp:TextBox ID="txtToDate" CssClass="input-text-bkav" runat="server" />
                    <span data-toggle="collapse" data-target="#calendar2">
                        <asp:Image ImageUrl="~/Images/Calendar.png" runat="server" />
                    </span>
                    <div class="collapse" id="calendar2">
                        <asp:Calendar ID="ToDateCaledar" OnSelectionChanged="ToDateCaledar_SelectionChanged" runat="server"></asp:Calendar>
                    </div>
                </div>
                <div class="col-sm-3">
                    Nội dung:
                    <input class="input-text-bkav" type="text" name="txtContent" value="" />
                </div>
                <div class="col-sm-3">
                    Account gửi:
                    <asp:DropDownList CssClass="ddl" runat="server" DataSourceID="SqlDataSource2" DataTextField="SendUser" DataValueField="SendUser" AppendDataBoundItems="true">
                        <asp:ListItem Selected="True" Value="0" Text="Tất cả" />
                    </asp:DropDownList><asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:BSGConnectionString %>' SelectCommand="SELECT DISTINCT [SendUser] FROM [Send_SMS] ORDER BY [SendUser]"></asp:SqlDataSource>
                </div>
            </div>
        </div>
        <div class="row divFilter">
            <asp:Button ID="btnSearch" OnClick="Page_Load" CssClass="btn btn-default-bkav btn-bkav btn-bkav-right float-right" Text="Tìm kiếm" runat="server" />
        </div>
        <asp:GridView runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1" CssClass="table table-default table-bordered table-bkav-w" BackColor="White" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="SendTime" HeaderText="SendTime" SortExpression="SendTime"></asp:BoundField>
                <asp:BoundField DataField="Content" HeaderText="Content" SortExpression="Content"></asp:BoundField>
                <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber"></asp:BoundField>
                <asp:BoundField DataField="SendUser" HeaderText="SendUser" SortExpression="SendUser"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:BSGConnectionString %>' SelectCommand="SELECT [SendTime], [Content], [PhoneNumber], [SendUser] FROM [Send_SMS] ORDER BY [SendTime] DESC"></asp:SqlDataSource>
    </div>
</asp:Content>
