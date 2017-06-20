<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BSG.Login" MasterPageFile="~/Site.Master" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="row" id="content">
        <div class="left"></div>
        <div class="right">
            <div id="inputForm">
                <div class="row">
                    <h1 id="divTitle">Đăng nhập</h1>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-user"></i></span>
                            <asp:TextBox ID="txtAccount" CssClass="form-control" runat="server" placeholder="Tên đăng nhập" MaxLength="20"/>  
                        </div>
                         <asp:RequiredFieldValidator 
                                ErrorMessage="Không được để trống tên đăng nhập" 
                                ControlToValidate="txtAccount" 
                                ForeColor="Red"
                                runat="server" />
                    </div>

                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <div class="input-group">
                            <span class="input-group-addon" id="basic-addon2"><i class="glyphicon glyphicon-lock"></i></span>
                            <asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" runat="server" placeholder="Mật khẩu" MaxLength="20" />  
                        </div>
                        <asp:RequiredFieldValidator 
                            ErrorMessage="Mật khẩu không được để trống" 
                            ControlToValidate="txtPassword" 
                            ForeColor="Red"
                            runat="server" />
                                    
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <asp:CheckBox ID="chkRememberLogin" Text="Duy trì đăng nhập" CssClass="btn-left" runat="server" />
                        <asp:Button Text="Đăng nhập" CssClass="btn-right" runat="server" ID="btnLogin" OnClick="Login_Click" />
                    </div>
                </div>
                <div class="row">
                    <div class="col-xs-12">
                        <p class="has-error">
                            <asp:Label ID="lblError" ForeColor="Red" runat="server"></asp:Label>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BSGConnectionString %>" OnSelecting="SqlDataSource1_Selecting" SelectCommand="SELECT [ID], [Account], [Description], [CreatedPerson] FROM [Account]"></asp:SqlDataSource>

</asp:Content>
