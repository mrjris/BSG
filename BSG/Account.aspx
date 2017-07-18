<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="BSG.Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="divBody" style="background-color: white">
        <h1>Danh sách tài khoản</h1>
        <hr />

        <div class="divTable">
            <input type="button" value="Thêm" class="btn btn-primary btn-default-bkav" data-toggle="modal" data-target="#addModal" />
            <asp:UpdatePanel runat="server" ID="upAccount">
                <ContentTemplate>
                    <asp:GridView ID="dgvAccount" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" CssClass="table table-bordered table-default table-bkav-w">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
                            <asp:TemplateField HeaderText="Account" SortExpression="Account" HeaderStyle-BackColor="#1967b2" HeaderStyle-ForeColor="#ffffff">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Account") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle BackColor="#1967B2" ForeColor="White" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description" SortExpression="Description" HeaderStyle-BackColor="#1967b2" HeaderStyle-ForeColor="#ffffff">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle BackColor="#1967B2" ForeColor="White" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Phones" SortExpression="Phones" HeaderStyle-BackColor="#1967b2" HeaderStyle-ForeColor="#ffffff">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Phones") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle BackColor="#1967B2" ForeColor="White" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="CreatedPerson" SortExpression="CreatedPerson" HeaderStyle-BackColor="#1967b2" HeaderStyle-ForeColor="#ffffff">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("CreatedPerson") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle BackColor="#1967B2" ForeColor="White" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Chức năng" ShowHeader="False" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <span data-toggle="modal" data-target="#editModal">
                                        <asp:Image runat="server" ImageUrl="~/Images/icon/icon-edit.png" />
                                    </span>
                                    &nbsp;<span data-toggle="modal" data-target="#deleteModal"><asp:Image runat="server" ImageUrl="~/Images/icon/icon-delete.png"/></span>
                                </ItemTemplate>
                                <HeaderStyle BackColor="#1967B2" ForeColor="White" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers></Triggers>
            </asp:UpdatePanel>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:BSGConnectionString %>"
                DeleteCommand="DeleteAccountByID"
                InsertCommand="AddAccount"
                SelectCommand="GetAllAccount"
                UpdateCommand="UpdateAccount"
                DeleteCommandType="StoredProcedure"
                InsertCommandType="StoredProcedure"
                SelectCommandType="StoredProcedure"
                UpdateCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Account" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="CreatedPerson" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                    <asp:Parameter Name="Account" Type="String" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="CreatedPerson" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <%--AddModal start--%>
    <div class="modal fade" tabindex="-1" id="addModal"
        data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="txtAddAccount" class="col-sm-4 control-label">Account</label>
                            <div class="col-sm-8">
                                <asp:TextBox runat="server" Width="100%" CssClass="form-control" ID="txtAddAccount" placeholder="Nhập tên đăng nhập" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="txtAddPassword" class="col-sm-4 control-label">Password</label>
                            <div class="col-sm-8">
                                <asp:TextBox runat="server" TextMode="Password" Width="100%" CssClass="form-control" ID="txtAddPassword" placeholder="Nhập mật khẩu" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="txtAddDescription" class="col-sm-4 control-label">Mô tả</label>
                            <div class="col-sm-8">
                                <asp:TextBox runat="server" Width="100%" CssClass="form-control" ID="txtAddDescription" placeholder="Nhập mô tả" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="txtAddPhones" class="col-sm-4 control-label">Số điện thoại</label>
                            <div class="col-sm-8">
                                <asp:TextBox runat="server" CssClass="form-control" Width="100%" TextMode="MultiLine" Rows="7" ID="txtAddPhones" placeholder="Nhập số điện thoại, mỗi dòng một số điện thoại." />
                            </div>
                        </div>
                        <asp:Label ID="lblAddValidate" runat="server" />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button CssClass="btn btn-primary" Text="Cập nhật" ID="btnAddAccount" OnClick="btnAddAccount_Click" runat="server" />
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Bỏ qua</button>
                </div>
            </div>
        </div>
    </div>
    <%--AddModal end--%>
    <%--Edit start--%>
    <div class="modal fade" tabindex="-1" id="editModal"
        data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    Modal Edit Account
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="txtEditAccount" class="col-sm-4 control-label">Account</label>
                            <div class="col-sm-8">
                                <asp:TextBox runat="server" Width="100%" CssClass="form-control" ID="txtEditAccount" placeholder="Nhập tên đăng nhập" />
                                <asp:Label ID="lblEditAccount" Text="" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="txtEditPassword" class="col-sm-4 control-label">Password</label>
                            <div class="col-sm-8">
                                <asp:TextBox runat="server" TextMode="Password" Width="100%" CssClass="form-control" ID="txtEditPassword" placeholder="Nhập mật khẩu" />
                                <asp:Label ID="lblEditPassword" Text="" runat="server" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="txtEditDescription" class="col-sm-4 control-label">Mô tả</label>
                            <div class="col-sm-8">
                                <asp:TextBox runat="server" Width="100%" CssClass="form-control" ID="txtEditDescription" placeholder="Nhập mô tả" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="txtEditPhones" class="col-sm-4 control-label">Số điện thoại</label>
                            <div class="col-sm-8">
                                <asp:TextBox runat="server" CssClass="form-control" Width="100%" TextMode="MultiLine" Rows="7" ID="txtEditPhones" placeholder="Nhập số điện thoại, mỗi dòng một số điện thoại." />
                                <asp:Label ID="lblEditPhones" Text="" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button CssClass="btn btn-primary" Text="Cập nhật" ID="btnEditAccount" OnClick="btnEditAccount_Click" runat="server" />
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Bỏ qua</button>
                </div>
            </div>
        </div>
    </div>
    <%--EditModal end--%>
    <%--DeleteModal start--%>
    <div class="modal fade" tabindex="-1" id="deleteModal"
        data-keyboard="false" data-backdrop="static">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                </div>
                <div class="modal-body">
                    Bạn có chắc chắn muốn xóa Account?
                </div>
                <div class="modal-footer">
                    <asp:Button CssClass="btn btn-primary" Text="Xác nhận" ID="btnDeleteAccount" OnClick="btnDeleteAccount_Click" runat="server" />
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Bỏ qua</button>
                </div>
            </div>
        </div>
    </div>
    <%--DeleteModal end--%>
</asp:Content>
