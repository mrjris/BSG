<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Group.aspx.cs" Inherits="BSG.Group" MasterPageFile="~/Site.Master" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">

    <h1 style="padding-top: 50px">Group</h1>
    <hr />
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
                            <asp:Button Text="Tìm kiếm" runat="server" CssClass="btn btn-default btn-default-bkav btn-bkav btn-bkav-right" />
                            <asp:Button Text="Thêm" runat="server" CssClass="btn btn-default btn-default-bkav btn-bkav btn-bkav-right" data-toggle="modal" data-target="#addModal" />
                        </td>
                    </tr>
                </table>
                <div class="modal fade" id="addModal" role="dialog" aria-hidden="true" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
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
                                            <input type="radio" name="yesno" id="yesCheck" onclick="javascript: yesnoCheck();" value="" />Co thoi han
                                        </div>
                                        <br />
                                        <div id="ifYes" style="display: none">
                                            <p>Từ ngày: <input class="datefield"  id="fromDate" type="text" /></p>
                                            <br />
                                            <p>Đến ngày: <input class="datefield" id="toDate"  type="text" /></p>
                                        </div>
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
            </div>
        </div>

        <div class="row">
            <div class="divTable">
                <asp:GridView runat="server" CssClass="table table-bordered table-default table-font-customt table-font-default  table-bkav-w " BackColor="White" AllowPaging="True" AllowSorting="True" PagerStyle-CssClass="pagination-bkav" PageSize="20" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" HeaderStyle-BackColor=" #1967b2" HeaderStyle-ForeColor="white">
                    <Columns>
                        <asp:BoundField DataField="GroupCode" HeaderText="GroupCode" SortExpression="GroupCode" />
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                        <asp:BoundField DataField="CreatedPerson" HeaderText="CreatedPerson" SortExpression="CreatedPerson" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        <asp:CommandField ButtonType="Image" DeleteImageUrl="~/Images/icon/icon-delete.png" EditImageUrl="~/Images/icon/icon-edit.png" ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:ButtonField ButtonType="Image" ImageUrl="~/Images/icon/icon-info.png" Text="Sim" />
                        <asp:ButtonField ButtonType="Image" ImageUrl="~/Images/icon/icon-userOnline.png" Text="Người gửi" />
                        <asp:ButtonField ButtonType="Image" ImageUrl="~/Images/icon/icon-userOffline.png" Text="Người nhận" />
                    </Columns>
                    <PagerStyle CssClass="pagination-bkav" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BSGConnectionString %>" SelectCommand="SELECT [GroupCode], [Description], [Status], [CreatedPerson] FROM [Group] ORDER BY [GroupCode]"></asp:SqlDataSource>
            </div>
        </div>
    </fieldset>
    <hr />
    <script type="text/javascript">

        function yesnoCheck() {
            if (document.getElementById('yesCheck').checked) {
                document.getElementById('ifYes').style.display = 'block';
                
            }
            else {
                document.getElementById('ifYes').style.display = 'none';
               
            }

        }
    </script>
    <script>    $(function () {
        // This will make every element with the class "date-picker" into a DatePicker element
        $('.datefield').datepicker();
    })</script>


</asp:Content>

