<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="User.ascx.cs" Inherits="Musicviet.Administrators.Modules.User" %>
<%@ Register TagPrefix="ajaxc" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=4.1.60623.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<div class="container" id="actualbody">
    <div class="row">
        <div class="widget clearfix">
            <h2>
                Cập nhật/ Thêm mới người dùng</h2>
            <div class="widget_inside">
                <div class="col_12">
                    <div style="width: 100%; text-align: center">
                         <asp:Label ID="lblError" runat="server" ForeColor="Red" EnableViewState="False" />
                    </div>
                    <asp:PlaceHolder ID="plhMain" runat="server">
        <table width="100%" cellpadding="2" cellspacing="2" border="0">
            <tr valign="top">
                <td>
                    <asp:Panel ID="pnUserList" runat="server" GroupingText="Danh sách người dùng" Width="400px">
                        <table cellpadding="2" cellspacing="2" border="0" style="margin-left:5px;margin-right:5px;">
                            <tr>
                                <td width=120>Tên đăng nhập</td>
                                <td>
                                    <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>&nbsp;&nbsp;
                                    <asp:Button ID="btnSearch" runat="server" Text="Tìm" OnClick="btnSearch_Click" Width="80px" />
                                </td>
                            </tr>
                        </table>
                        <asp:UpdatePanel ID="udpGrvUser" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <ajaxc:TabContainer ID="tbcGrvUser" runat="server" AutoPostBack="true"></ajaxc:TabContainer>
                                 <asp:GridView ID="grvUser" runat="server" 
                                    Width="100%" 
                                    PageSize="10"
                                    AllowPaging="true"
                                    AutoGenerateColumns="False" 
                                    PagerSettings-PreviousPageText="Prev" 
                                    PagerStyle-CssClass="pagerText" 
                                    OnRowCommand="grvUser_RowCommand"
                                    OnRowDeleting="grvUser_RowDeleting"
                                    OnRowEditing="grvUser_RowEditing" 
                                    EmptyDataText = "Không có bản ghi nào"
                                    OnPageIndexChanging="grvUser_PageIndexChanging" >
                                    <PagerSettings PageButtonCount="10" Position="Bottom" Visible="true" />
                                    <FooterStyle BackColor="#1EB5DD" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#1EB5DD" ForeColor="White" />
                                    <RowStyle BackColor="#8ec0dc" ForeColor="#333333" HorizontalAlign="Center" Height="20px" VerticalAlign="Middle" />
                                    <SelectedRowStyle BackColor="Silver" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderStyle BackColor="#1EB5DD" Font-Bold="True" ForeColor="White" Height="22px" VerticalAlign="Middle" />
                                    <EditRowStyle BackColor="#999999" />
                                    <AlternatingRowStyle BackColor="#a4e4f5" ForeColor="#284775" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="STT">
                                            <ItemTemplate><%# Container.DataItemIndex + 1 %></ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Tên đăng nhập" ItemStyle-HorizontalAlign="left">
                                            <ItemTemplate><%# Eval("UserName")%></ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left"></ItemStyle>
                                        </asp:TemplateField> 
                                        <asp:TemplateField>
                                            <HeaderTemplate>Sửa</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lkbEdit" runat="server" CausesValidation="false" CommandName="Edit" Text="Sửa" CommandArgument='<%# Eval("UserName") %>'></asp:LinkButton>
                                            </ItemTemplate>    
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>Mật khẩu</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lkbResetPass" runat="server" CausesValidation="false" CommandName="Reset" Text="Đặt lại" CommandArgument='<%# Eval("UserName") %>'></asp:LinkButton>
                                            </ItemTemplate>    
                                        </asp:TemplateField>   
                                       <asp:TemplateField>
                                            <HeaderTemplate>Xóa</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lkbDelete" runat="server" CausesValidation="false" CommandName="Delete" Text="Xóa" CommandArgument='<%# Eval("UserName") %>'></asp:LinkButton>
                                                <ajaxc:ConfirmButtonExtender ID="cfbDeleteConfirm" runat="server" TargetControlID="lkbDelete" ConfirmText='Bạn đã chắc chắn muốn xóa?' />
                                            </ItemTemplate>    
                                        </asp:TemplateField>	
                                    </Columns>
                                </asp:GridView>
                                <div style="padding-top:5px;"><asp:Button ID="btnNew" runat="server" Width="80px" Text="Thêm mới" onclick="btnNew_Click" /></div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="grvUser" EventName="PageIndexChanging" />
                                 <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </asp:Panel>
                </td>
                <td>
                    <asp:UpdatePanel ID="udpDetail" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:MultiView ID="mvDetail" runat="server">
                                <asp:View ID="vDetail" runat="server">
                                    <asp:Panel ID="pnDetail" runat="server" Width="350" Enabled="false" EnableViewState="true" GroupingText="Thông tin chi tiết người dùng">
                                        <table border="0" cellpadding="2" cellspacing="2" style="padding-left:5px">
                                            <tr>
                                                <td>Tên đăng nhập:</td>
                                                <td><asp:TextBox ID="txtUserName" runat="server" Width="150px" MaxLength="50" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                        ControlToValidate="txtUserName" ErrorMessage="*" SetFocusOnError="True" 
                                                        EnableClientScript="false"></asp:RequiredFieldValidator></td>
                                            </tr>
                                            <asp:Panel ID="pnPass" runat="server">
                                             <tr>
                                                <td>Mật khẩu:</td>
                                                <td><asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Width="150px" MaxLength="50" /></td>
                                            </tr>
                                            </asp:Panel>
                                            <tr>
                                                <td>Email:</td>
                                                <td><asp:TextBox ID="txtEmail" runat="server" Width="150px" MaxLength="50" /></td>
                                            </tr>
                                            <tr>
                                                <td>Mobile:</td>
                                                <td><asp:TextBox ID="txtMobile" runat="server" Width="150px" MaxLength="50" /></td>
                                            </tr>
                                            <tr>
                                                <td>Chức vụ:</td>
                                                <td><asp:TextBox ID="txtTitle" runat="server" Width="150px" MaxLength="50" /></td>
                                            </tr>
                                            <tr>
                                                <td>Đăng nhập gần nhất:</td>
                                                <td><asp:Label ID="lblLastLogin" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td>Tạo bởi:</td>
                                                <td><asp:Label ID="lblCreatedBy" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td>Ngày tạo:</td>
                                                <td><asp:Label ID="lblCreatedDate" runat="server" /></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><asp:Button ID="btnSave" runat="server" Width="80px" Text="Lưu lại" 
                                                        onclick="btnSave_Click" /></td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:View>
                                <asp:View ID="vResetPass" runat="server">
                                    <asp:Panel ID="pnChangePass" runat="server" Width="350px" GroupingText="Đặt lại mật khẩu cho người dùng">
                                        <table border="0" cellpadding="2" cellspacing="2" style="padding-left:5px">
                                            <tr>
                                                <td>Tên đăng nhập:</td>
                                                <td><asp:TextBox ID="txtUserNameCP" runat="server" Width="150px" MaxLength="50" Enabled="false" /></td>
                                            </tr>
                                             <tr>
                                                <td>Mật khẩu mới:</td>
                                                <td><asp:TextBox ID="txtPasswordCP" TextMode="Password" runat="server" Width="150px" MaxLength="50" /></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td><asp:Button ID="btnReset" runat="server" Width="80px" Text="Đặt lại" 
                                                        onclick="btnReset_Click" />&nbsp;<asp:Button ID="btnCancel" runat="server" 
                                                        Width="80px" Text="Hủy bỏ" onclick="btnCancel_Click" /></td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </asp:View>
                                </asp:MultiView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="grvUser" EventName="RowCommand" />
                            <asp:AsyncPostBackTrigger ControlID="btnNew" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnReset" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </asp:PlaceHolder>
                </div>
            </div>
        </div>
    </div>
</div>