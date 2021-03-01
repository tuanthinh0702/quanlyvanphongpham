<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SettingMgr.ascx.cs" Inherits="Musicviet.Administrators.Modules.SettingMgr" %>
<div class="container" id="actualbody">
    <div class="row">
        <div class="widget clearfix">
            <h2>
                Cài đặt hệ thống
            </h2>
            <div class="widget_inside">
                <div class="col_12">
                   
                </div>
                    <div style="text-align: center; width: 100%">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
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
<%--    <p> <asp:Button ID="btnDel" runat="server" Text="Xóa" OnClick="btnDel_Click" OnClientClick="return confirm('Bạn có thực sự muốn xóa bản ghi này không ');" /></p>--%>
                 <asp:UpdatePanel runat="server" ID="pnDadsta" UpdateMode="Conditional">
                    <ContentTemplate>
                        <%--Danh sách bản lịch sử đã nạp--%>
                        <div class="col_12">
                    <asp:Panel runat="server" ID="pnData" Visible="True">
                                <asp:GridView runat="server" ID="grData" GridLines="None" AutoGenerateColumns="False"
                                     CssClass="dataTable"
                                    Width="100%" EmptyDataText="No Data" AllowPaging="True" 
                                   PageSize='10'>
                                    <Columns>
                                        <asp:TemplateField HeaderText="STT">
                                            <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                            <ItemTemplate>
                                                <%#Container.DataItemIndex + 1%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderTemplate>
                                                Mã cài đặt
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%#Eval("CodeSetting")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField>
                                            <HeaderTemplate>
                                               Giá trị cài đặt
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                            <%#Eval("ValueSetting")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                           <ItemTemplate>
                                               <a href="Home.aspx?module=Setting&id=<%#Eval("ID") %>" title="Chỉnh sửa sản phẩm"><img src="Images/edit.gif" /></a> |  <input type="checkbox" id="cbxDel" runat="server" value='<%# Eval("ID") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                               </Columns>
                                    <PagerStyle CssClass="pagerClass" />
                                </asp:GridView>
                            </asp:Panel>
                        </div>
                    </ContentTemplate>
                   
                </asp:UpdatePanel>
            </div>
        </div>
    </div>
</div>