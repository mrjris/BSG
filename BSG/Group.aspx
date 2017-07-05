<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Group.aspx.cs" Inherits="BSG.Group" MasterPageFile="~/Site.Master" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <h1 style="padding-top: 50px">Group</h1>
    <hr />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $('.datefield').datepicker({
            });
        });
    </script>
    <asp:TextBox runat="server" ID="txtGroupID" Visible="false" />
    <fieldset class="divfieldset">
        <div class="row">
            <div class="divFilter">
                <table style="width: 100%">
                    <tr>
                        <td>Mã nhóm: 
                        <asp:DropDownList ID="ddlGroupCode" runat="server" DataSourceID="SqlDataSource2" DataTextField="GroupCode" DataValueField="GroupCode" CssClass="ddl" AutoPostBack="false" AppendDataBoundItems="true" OnSelectedIndexChanged="ddlGroupCode_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="0" Text="Tất cả" />
                        </asp:DropDownList>
                            <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:BSGConnectionString %>' SelectCommand="SELECT DISTINCT * FROM [Group] ORDER BY [GroupCode]"></asp:SqlDataSource>
                        </td>
                        <td>Người tạo
                        <input type="text" id="txtCreatedPerson" name="groupID" value="" />
                        </td>
                        <td>Mô tả
                        <input type="text" id="txtDescription" name="groupID" value="" />
                        </td>
                        <td>Trạng thái
                        <asp:DropDownList ID="ddlStatus" runat="server">
                            <asp:ListItem Text="Tất cả" />
                            <asp:ListItem Text="Active" />
                            <asp:ListItem Text="Inactive" />
                        </asp:DropDownList>
                        </td>
                        <td style="text-align: right">
                            <asp:Button Text="Tìm kiếm" ID="Search" CssClass="btn btn-default-bkav" OnClick="Search_Click" runat="server" />
                            <asp:Button Text="Thêm" runat="server" CssClass="btn btn-default btn-default-bkav btn-bkav btn-bkav-right" data-toggle="modal" data-target="#AddModal" />
                        </td>
                    </tr>
                </table>

            </div>
        </div>
        <div class="row">
            <div class="divTable">
                <asp:GridView ID="gdvGroups" runat="server" CssClass="table table-bordered table-default table-font-customt table-font-default  table-bkav-w " BackColor="White" AllowPaging="True" AllowSorting="True" PagerStyle-CssClass="pagination-bkav" PageSize="20" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" HeaderStyle-BackColor=" #1967b2" HeaderStyle-ForeColor="white" OnRowCommand="gdvGroups_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="GroupID" HeaderText="GroupID" InsertVisible="False" ReadOnly="True" SortExpression="GroupID" Visible="False" />
                        <asp:TemplateField HeaderText="GroupCode" SortExpression="GroupCode">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("GroupCode") %>'></asp:Label>
                                <%-- <asp:HiddenField ID="GroupID" runat="server" Value="<%# Eval("GroupID") %>" />--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:BoundField DataField="CreatedPerson" HeaderText="CreatedPerson" SortExpression="CreatedPerson" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        <asp:TemplateField HeaderText="Sim" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton Text="" runat="server" data-toggle="modal" data-target="#SendSimConfigModal">
                                    <asp:image imageurl="~/Images/icon/icon-info.png" runat="server" />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Người gửi" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton Text="" runat="server" data-toggle="modal" data-target="#SendAccountConfigModal">
                                    <asp:image imageurl="~/Images/icon/icon-userOnline.png" runat="server" />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Người nhận" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton Text="" runat="server" data-toggle="modal" data-target="#ReceiveAccountConfigModal">
                                    <asp:image ImageUrl="~/Images/icon/icon-userOffline.png" runat="server" />
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Chức năng" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton Text="" runat="server" data-toggle="modal" data-target="#EditModal">
                                   <asp:image imageurl="~/Images/icon/icon-edit.png" runat="server" />
                                </asp:LinkButton>
                                &nbsp;<asp:ImageButton ID="btnDelete" runat="server" CausesValidation="False" CommandName="myDelete" ImageUrl="~/Images/icon/icon-delete.png" Text="Delete" OnClientClick='<%# Eval("GroupCode", "return confirm(\"Bạn có chắc chắn muốn xóa nhóm {0}?\");") %>'
                                    CommandArgument='<%# Eval("GroupId") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false">
                            <ItemTemplate>
                                <asp:LinkButton Text='<%#Eval("GroupID") %>' runat="server" CommandName="SelectGroup" CommandArgument='<%# Eval("GroupID") %>' />

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                    <HeaderStyle BackColor="#1967B2" ForeColor="White"></HeaderStyle>

                    <PagerStyle CssClass="pagination-bkav" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BSGConnectionString %>" SelectCommand="SELECT [GroupID], [GroupCode], [Description], [Status], [CreatedPerson] FROM [Group] ORDER BY [GroupCode]"></asp:SqlDataSource>
            </div>
        </div>
    </fieldset>
    <hr />
    <div class="modal fade" id="AddModal" role="dialog" aria-hidden="true" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1>Thêm mới<asp:Button Text="x" CssClass="btn float-right" runat="server" data-dismiss="modal" /></h1>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-4">Mã nhóm <span class="divStar"><a>*</a>:</span></div>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtInputGroupCode" placeholder="Mã nhóm" runat="server" />
                            <asp:RequiredFieldValidator ErrorMessage="Mã nhóm không được để trống" ControlToValidate="txtInputGroupCode" runat="server" />
                            <asp:CustomValidator ID="GroupCode" ErrorMessage="Mã nhóm bị trùng. Mời nhập mã nhóm khác." ControlToValidate="txtInputGroupCode" OnServerValidate="GroupCode_ServerValidate" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">Mô tả</div>
                        <div class="col-sm-8">
                            <asp:TextBox TextMode="MultiLine" ID="txtInputDescription" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">Hiệu lực</div>
                        <div class="col-sm-8">
                            <div class="row">
                                <input type="radio" name="yesno" id="noCheck" checked="checked" onclick="javascript: yesnoCheck();" value="" />
                                Vô thời hạn
                            </div>
                            <div class="row">
                                <input type="radio" name="yesno" id="yesCheck"  onclick="javascript: yesnoCheck();" value="" />Có thời hạn
                            </div>
                            <br />
                            <div id="ifYes" style="display: none">
                                <p>
                                    Từ ngày:
                                    <asp:TextBox ID="txtFromDate" CssClass="datefield" runat="server" />
                                <br />
                                <p>
                                    Đến ngày:
                                    <asp:TextBox ID="txtToDate" CssClass="datefield" runat="server" />
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <asp:Button Text="Cập nhật" ID="AddGroup" CssClass="btn btn-default-bkav" OnClick="AddGroup_Click" runat="server" />
                    <button type="button" class="btn btn-default btn-default-bkav" data-dismiss="modal">Bỏ qua</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="EditModal" role="dialog" aria-hidden="true" tabindex="-2">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1>Sửa thông tin<asp:Button Text="x" CssClass="btn float-right" runat="server" data-dismiss="modal" /></h1>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-4">Mã nhóm <span class="divStar"><a>*</a>:</span></div>
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtInputGroupCode2" placeholder="Mã nhóm" runat="server" />
                            <asp:RequiredFieldValidator ErrorMessage="Mã nhóm không được để trống" ControlToValidate="txtInputGroupCode2" runat="server" />
                            <asp:CustomValidator ID="CustomValidator1" ErrorMessage="Mã nhóm bị trùng. Mời nhập mã nhóm khác." ControlToValidate="txtInputGroupCode2" OnServerValidate="GroupCode_ServerValidate" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">Mô tả</div>
                        <div class="col-sm-8">
                            <asp:TextBox TextMode="MultiLine" ID="txtInputDescription2" runat="server" />
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4">Hiệu lực</div>
                        <div class="col-sm-8">
                            <div class="row">
                                <input type="radio" name="yesno" id="noCheck2" checked="checked" onclick="javascript: yesnoCheck();" autofocus="autofocus" />
                                Vô thời hạn
                            </div>
                            <div class="row">
                                <input type="radio" name="yesno" id="yesCheck2"  onclick="javascript: yesnoCheck();" />Có thời hạn
                            </div>
                            <br />
                            <div id="ifYes2" style="display: none">
                                <p>
                                    Từ ngày:
                                    <asp:TextBox ID="txtFromDate2" CssClass="datefield" runat="server" />
                                </p>
                                <br />
                                <p>
                                    Đến ngày:
                                    <asp:TextBox ID="txtToDate2" CssClass="datefield" runat="server" />
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <asp:Button Text="Cập nhật" ID="EditGroup" OnClick="EditGroup_Click" CssClass="btn btn-default-bkav" runat="server" />
                    <button type="button" class="btn btn-default btn-default-bkav" data-dismiss="modal">Bỏ qua</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="SendSimConfigModal" role="dialog" aria-hidden="true" tabindex="-3">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    Cập nhật sim
                    <button type="button" class="btn btn-default btn-default-bkav float-right" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-4">
                            <asp:ListBox ID="ListBox2" runat="server" DataSourceID="SqlDataSource3" DataTextField="Phone" DataValueField="Phone" CssClass="list-group" Width="100%" Height="300" AutoPostBack="false"></asp:ListBox>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BSGConnectionString %>" SelectCommand="SELECT DISTINCT [Phone] FROM [Sim] WHERE ([Status] = @Status)">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="true" Name="Status" Type="Boolean" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="col-sm-1">
                            <asp:Button Text=">" runat="server" Width="25px" CssClass="btn btn-default-bkav btn-bkav" />
                            <asp:Button Text="<" runat="server" Width="25px" CssClass="btn btn-default-bkav btn-bkav" />
                            <asp:Button Text=">>" runat="server" Width="25px" CssClass="btn btn-default-bkav btn-bkav" />
                            <asp:Button Text="<<" runat="server" Width="25px" CssClass="btn btn-default-bkav btn-bkav" />
                        </div>
                        <div class="col-sm-4 col-sm-offset-1">
                            <asp:ListBox runat="server" CssClass="list-group" Width="100%" Height="300"></asp:ListBox>
                        </div>
                        <div class="col-sm-1">
                            <asp:Button Text="x" runat="server" Width="25px" CssClass="btn btn-default-bkav btn-bkav" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default btn-default-bkav">Cập nhật</button>
                    <button type="button" class="btn btn-default btn-default-bkav" data-dismiss="modal">Bỏ qua</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="SendAccountConfigModal" role="dialog" aria-hidden="true" tabindex="-4">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    Cấu hình danh sách account được gửi tin nhắn
                    <button type="button" class="btn btn-default btn-default-bkav float-right" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <asp:ListBox ID="lbxSender" runat="server"></asp:ListBox>
                        <asp:Button Text="Thêm" runat="server" />
                    </div>
                    <div class="row">
                        <asp:GridView ID="gdvSender" runat="server"></asp:GridView>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default btn-default-bkav">Cập nhật</button>
                    <button type="button" class="btn btn-default btn-default-bkav" data-dismiss="modal">Bỏ qua</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ReceiveAccountConfigModal" role="dialog" aria-hidden="true" tabindex="-5">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    Cấu hình danh sách account được nhận tin nhắn
                    <button type="button" class="btn btn-default btn-default-bkav float-right" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <asp:ListBox ID="lbxReceiver" runat="server"></asp:ListBox>
                        <asp:Button Text="Thêm" runat="server" />
                    </div>
                    <div class="row">
                        <asp:GridView ID="gdvReceiver" runat="server"></asp:GridView>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default btn-default-bkav">Cập nhật</button>
                    <button type="button" class="btn btn-default btn-default-bkav" data-dismiss="modal">Bỏ qua</button>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">

        function yesnoCheck() {
            if (document.getElementById('yesCheck').checked) {
                document.getElementById('ifYes').style.display = 'block';
            }
            else {
                document.getElementById('ifYes').style.display = 'none';
            }
            if (document.getElementById('yesCheck2').checked) {
                document.getElementById('ifYes2').style.display = 'block';
            }
            else {
                document.getElementById('ifYes2').style.display = 'none';

            }
        }
    </script>
</asp:Content>

