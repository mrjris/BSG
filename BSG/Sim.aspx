<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sim.aspx.cs" Inherits="BSG.Sim" MasterPageFile="~/Site.Master" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h1>Sim</h1>
    <hr />
    <asp:TextBox ID="txtselectedID" runat="server" Visible="false"></asp:TextBox>
    <asp:TextBox ID="txtUpdate" Visible="false" runat="server" />  
    <fieldset class="divfieldset" style="background-color: white; align-items: center">
        <div class="row">

            <div class="divFilter">
                Trạng thái
            <asp:DropDownList runat="server">
                <asp:ListItem Text="Tất cả" />
                <asp:ListItem Text="Active" />
                <asp:ListItem Text="Inactive" />
            </asp:DropDownList>
                <input type="button" value="Thêm" class="btn btn-default-bkav " data-toggle="modal" data-target="#AddSimModal" />
            </div>
        </div>
        <div class="row">
            <div class="divTable">
                <asp:GridView ID="dgvSim" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="dgvSim_RowDataBound" DataKeyNames="Id" OnRowCommand="dgvSim_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="false" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" InsertVisible="False" ReadOnly="True" SortExpression="Phone" />
                        <asp:TemplateField HeaderText="Status" SortExpression="Status">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Chức năng" ShowHeader="False">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton3" runat="server" CausesValidation="False" ImageUrl="~/Images/icon/icon-edit.png" Text="Edit" data-toggle="modal" data-target="#AddSimModal" />  
                                &nbsp;<asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/Images/icon/icon-delete.png" Text="Delete" OnClientClick="return confirm('Bạn chắc chắn muốn xóa số điện thoại ?');" />
                                &nbsp;<asp:ImageButton ID="ImageButton5" runat="server" CausesValidation="False" CommandName="Update" ImageUrl="~/Images/icon/icon-refresh.png" Text="Recovery" OnClientClick="return confirm('Bạn chắc chắn muốn khôi phục số điện thoại ?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>
                <%--Lợi dụng hàm có sẵn--%>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BSGConnectionString %>"
                    SelectCommand="SELECT * FROM [Sim]"
                    InsertCommand=""
                    DeleteCommand="UPDATE [Sim] SET [Status] = 'FALSE' WHERE [Id] = @Id"
                    UpdateCommand="UPDATE [Sim] SET [Status] = 'TRUE' WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Id" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
            <div class="modal fade" role="dialog" id="AddSimModal" tabindex="-1">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <p>
                                Số điện thoại <span class="divStar"><a>*</a>: </span>
                                <asp:TextBox ID="txtPhone" CssClass="input-text-bkav" runat="server" />
                                <asp:RequiredFieldValidator ErrorMessage="Số điện thoại không được để trống" ForeColor="Red" ControlToValidate="txtPhone" runat="server" />
                            </p>
                            <div class="modal-footer">
                                <asp:Button Text="Bỏ qua" CssClass="btn btn-default btn-primary btn-default-bkav float-right btn-bkav-right" data-dismiss="modal" runat="server" />
                                <asp:Button ID="btnAdd" OnClick="btnAdd_Click" Text="Cập nhật" CssClass="btn btn-default btn-primary btn-default-bkav float-right btn-bkav-right" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </fieldset>
</asp:Content>
