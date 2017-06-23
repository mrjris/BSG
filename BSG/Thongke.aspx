<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Thongke.aspx.cs" Inherits="BSG.Thongke" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Thống kê</h1>
    <hr />
    <asp:GridView runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource1" CssClass="table table-default table-bordered table-bkav-w" BackColor="#FFFFFF">   </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</asp:Content>
