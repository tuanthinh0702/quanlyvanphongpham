<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsMgr.ascx.cs" Inherits="Musicviet.Administrators.Modules.NewsMgr" %>
<div class="container" id="actualbody">
    <div class="row">
        <div class="widget clearfix">
            <h2>
                Quản lý tin tức
            </h2>
            <div class="widget_inside">
                <div class="col_12">
                        <div class="links02">
        <asp:UpdatePanel ID="updatePanelSearch" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <asp:Panel runat="server" ID="pnSearch">
                    <table cellpadding="2" cellspacing="2" border="0" style="margin-left: 5px; margin-right: 5px;
                        width: 100%">
                        <tr>
                            <td>
                                Tên bài viết:
                            </td>
                            <td width="130">
                                <asp:TextBox ID="txtTilte" runat="server"></asp:TextBox>
                            </td>
                            <td width="120">
                                Thuộc chuyên mục:
                            </td>
                            <td colspan="4">
                                <asp:DropDownList ID="ddlCategory" runat="server" Width="253" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Tiêu đề phụ:
                            </td>
                            <td width="120">
                                <asp:TextBox ID="txtSubTitle" runat="server"></asp:TextBox>
                            </td>
                            <td>
                                Ngày tạo: từ ngày
                            </td>
                            <td>
                                <input id="txtStartCreate" name="txtStartCreate" style="width: 70px;" type="text"
                                    runat="server" maxlength="10" readonly="readOnly" />
                                <a onclick="if(self.gfPop)gfPop.fPopCalendar(document.getElementById('<%=txtStartCreate.ClientID %>'));return false;"
                                    href="javascript:void(0)">
                                    <img class="PopcalTrigger" height="21" src='DatePicker/datepicker.gif'
                                        width="34" align="absMiddle" border="0" style="vertical-align: top;"></a>&nbsp;
                                đến
                                <input id="txtEndCreate" name="txtEndCreate" style="width: 70px;" type="text" runat="server"
                                    maxlength="10" readonly="readOnly" />
                                <a onclick="if(self.gfPop)gfPop.fPopCalendar(document.getElementById('<%=txtEndCreate.ClientID %>'));return false;"
                                    href="javascript:void(0)">
                                    <img class="PopcalTrigger" height="21" src='DatePicker/datepicker.gif'
                                        width="34" align="absMiddle" border="0" style="vertical-align: top;"></a>
                            </td>
                            <td width="120">
                                <asp:Button ID="btnSearch" runat="server" Text="Tìm" OnClick="btnSearch_Click" Width="70px" />
                            </td>
                            <td align="right">
                                Hiển thị
                                <asp:DropDownList ID="ddlPageSize" runat="server" Width="50px" AutoPostBack="True"
                                    OnSelectedIndexChanged="ddlPageSize_SelectedIndexChanged">
                                    <asp:ListItem Value="5"></asp:ListItem>
                                    <asp:ListItem Value="10">10</asp:ListItem>
                                    <asp:ListItem Value="15">15</asp:ListItem>
                                    <asp:ListItem Value="20" Selected="True">20</asp:ListItem>
                                    <asp:ListItem Value="50" >50</asp:ListItem>
                                    <asp:ListItem Value="100">100</asp:ListItem>
                                    <asp:ListItem Value="150">150</asp:ListItem>
                                    <asp:ListItem Value="200">200</asp:ListItem>
                                    <asp:ListItem Value="1">Toàn bộ</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div style="text-align: center; width: 100%">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <asp:Label ID="lblError" runat="server" ForeColor="Red" EnableViewState="False" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div style="padding: 2px 5px 2px 5px; text-align: center;">
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="false">
            <ProgressTemplate>
                <img src="/Images/ajax-loader.gif" style="vertical-align: middle;" />
                <asp:Label ID="lblLoading" runat="server" Text="Đang tải dữ liệu..." />
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
    <div style="padding: 0px 5px 5px 5px; text-align: left;">
        <asp:UpdatePanel ID="udpButton" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <table width="100%">
                    <tr>
                        <td>
                            <asp:Button ID="btnApp" runat="server" Text="Duyệt" OnClick="btnApp_Click" />
                            <asp:Button ID="btnDel" runat="server" Text="Xóa" OnClick="btnDel_Click" OnClientClick="return confirm('Bạn có thực sự muốn xóa bản ghi này không ');" />
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:UpdatePanel ID="udpGrvNews" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div style="padding-left: 5px; padding-right: 5px;">
                <asp:GridView ID="dg" Width="100%" runat="server" CellPadding="2" PagerStyle-CssClass="pagerText"
                    EmptyDataText="Không có bản ghi nào" OnPageIndexChanging="dg_PageIndexChanging"
                    AutoGenerateColumns="False" ShowFooter="True" AllowPaging="True" PageSize='<%# int.Parse(ddlPageSize.SelectedValue) %>'
                    OnRowCommand="dg_RowCommand" CssClass="dataTable">
                    <Columns>
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Center" Width="40px" />
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderTemplate>
                                <input type="checkbox" id="cbxHeader" runat="server" value="" onclick="checkAll(this);"
                                    style="border: 0px" /></HeaderTemplate>
                            <ItemTemplate>
                                <input type="checkbox" id="cbxItem" runat="server" value='<%# Eval("NewsID") %>'
                                    onclick="Check_Click(this)" checked='<%# Convert.IsDBNull(Eval("Approved"))? false:Convert.ToBoolean(Eval("Approved")) ? true:false %>'
                                    disabled='<%# Convert.IsDBNull(Eval("Approved"))? false:Convert.ToBoolean(Eval("Approved")) ? true:false %>' /></ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="STT" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="50px">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1%></ItemTemplate>
                            <HeaderStyle Width="50px" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Left">
                            <HeaderTemplate>
                                Tên bài viết</HeaderTemplate>
                            <ItemTemplate>
                                <%--<asp:LinkButton ID="lkbEdit" runat="server" Font-Underline="false" ToolTip="Bấm vào đây để chỉnh sửa" CommandName="Edit" Text='<%# Eval("Title")%>' CommandArgument='<%# Eval("NewsID") %>'></asp:LinkButton>--%>
                                <a href="home.aspx?module=AddNews&id=<%#Eval("NewsID") %>">
                                    <%# Eval("Title")%></a>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="CategoryName" HeaderText="Thuộc chuyên mục" ItemStyle-HorizontalAlign="Left">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CreatedOn" HeaderText="Ngày tạo" ItemStyle-HorizontalAlign="Left"
                            DataFormatString="{0:dd/MM/yyyy HH:mm}" ItemStyle-Width="110">
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                            <HeaderTemplate>
                                Xóa</HeaderTemplate>
                            <ItemTemplate>
                                <input type="checkbox" id="cbxDel" runat="server" value='<%# Eval("NewsID") %>' /></ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                &nbsp;<br />
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnApp" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnDel" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="dg" EventName="PageIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ddlPageSize" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</div>
<iframe width="174" height="189" name="gToday:normal:agenda.js" id="gToday:normal:agenda.js"
    src='DatePicker/ipopeng.htm'
    scrolling="no" frameborder="0" style="visibility: visible; z-index: 999; position: absolute;
    top: -500px; left: -500px;"></iframe>