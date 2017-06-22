<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="BSG.Account" MasterPageFile="~/Site.Master" EnableEventValidation="false" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <div class="body" style="padding-top:50px;">
        <div class="col-md-10 col-md-offset-1">
            <div class="row">
                <button type="button" class="btn btn-primary btn-default-bkav" data-toggle="modal" data-target="#addModal" data-insert="true">Thêm</button>

                <div class="modal fade" tabindex="-1" id="addModal"
                    data-keyboard="false" data-backdrop="static">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    &times;
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-horizontal">
                                    <asp:TextBox Visible="true" ID="isAdd" runat="server" />
                                    <div class="form-group">
                                        <label for="txtAccont" class="col-sm-4 control-label">Account</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox runat="server" Width="100%" CssClass="form-control" ID="txtAccount" placeholder="Nhập tên đăng nhập" />
                                            <asp:RequiredFieldValidator ForeColor="Red" ErrorMessage="Tên đăng nhập không được để trống" ControlToValidate="txtAccount" runat="server" />
                                            <asp:CustomValidator OnServerValidate="txtAccount_ServerValidate" ErrorMessage="Tên đăng nhập không được quá 20 ký tự." ControlToValidate="txtAccount" runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="txtPassword" class="col-sm-4 control-label">Password</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox runat="server" TextMode="Password" Width="100%" CssClass="form-control" ID="txtPassword" placeholder="Nhập mật khẩu" />
                                            <asp:RequiredFieldValidator ErrorMessage="Mật khẩu không được để trống" ControlToValidate="txtPassword" runat="server" />
                                            <asp:CustomValidator OnServerValidate="txtPassword_ServerValidate" ErrorMessage="Mật khẩu không được quá 10 ký tự." ControlToValidate="txtPassword" runat="server" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="txtDescription" class="col-sm-4 control-label">Mô tả</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox runat="server" Width="100%" CssClass="form-control" ID="txtDescription" placeholder="Nhập mô tả" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="txtPhones" class="col-sm-4 control-label">Số điện thoại</label>
                                        <div class="col-sm-8">
                                            <asp:TextBox runat="server" CssClass="form-control" Width="100%" TextMode="MultiLine" Rows="7" ID="txtPhones" placeholder="Nhập số điện thoại, mỗi dòng một số điện thoại." />
                                            <asp:CustomValidator OnServerValidate="txtPhones_ServerValidate" ErrorMessage="Số điện thoại không được nhập quá 16 ký tự." ControlToValidate="txtPhones" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button CssClass="btn btn-primary" Text="Cập nhật" ID="Add" OnClick="Add_Click" runat="server" />
                                <button type="button" class="btn btn-primary"
                                    data-dismiss="modal">
                                    Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <asp:GridView ID="dgvAccount" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" DataKeyNames="ID" CssClass="table table-bordered table-bkav-w" BackColor="White">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" SortExpression="ID" InsertVisible="False" ReadOnly="True" Visible="False"></asp:BoundField>
                        <asp:BoundField DataField="Account" HeaderText="Account" SortExpression="Account"></asp:BoundField>
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description"></asp:BoundField>
                        <asp:BoundField DataField="Phones" HeaderText="Phones" SortExpression="Phones" ReadOnly="True"></asp:BoundField>
                        <asp:BoundField DataField="CreatedPerson" HeaderText="CreatedPerson" SortExpression="CreatedPerson" />
                        <%--<asp:TemplateField HeaderText="Chức năng">
                            <ItemTemplate>
                                <button type="button" id="edit" data-toggle="modal" data-target="#addModal"
                                    data-account="<%# Eval("Account") %>" data-insert="false">
                                    <asp:ImageButton ImageUrl="~/Images/icon/icon-edit.png" runat="server" />
                                </button>
                                <button type="button" id="delete" >
                                    <asp:ImageButton ID="Detele" ImageUrl="~/Images/icon/icon-delete.png"  runat="server" OnClick="Delete_Click"  />
                                    
                                </button>
                                
                            </ItemTemplate>
                        </asp:TemplateField>--%>


                        <asp:TemplateField>
                            
                            <ItemTemplate>
                                <asp:ImageButton ID="Edit" runat="server" 
                                    CausesValidation="False" CommandName="Edit" 
                                    ImageUrl="~/Images/icon/icon-edit.png" Text="Edit"  
                                    data-toggle="modal"
                                    data-target="@addModal"
                                    data-insert="false"
                                    
                                    />
                                &nbsp;<asp:ImageButton ID="Delete" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Images/icon/icon-delete.png" Text="Delete" />
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>


                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:BSGConnectionString %>' SelectCommand="GetAllAccount" SelectCommandType="StoredProcedure"
                    DeleteCommand="DeleteAccountByID" DeleteCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="@id" Type="Int32" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
    <script>
        $('#addModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget) // Button that triggered the modal
            var recipient = button.data('account') // Extract info from data-* attributes
            // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
            // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
            var insert = button.data('insert')
            var modal = $(this)
            modal.find('.modal-body  #MainContent_isAdd').val(insert)
            modal.find('.modal-body  #MainContent_txtAccount').val(recipient)
            
        })
    </script>
</asp:Content>
