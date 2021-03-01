<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CatePro.ascx.cs" Inherits="Musicviet.Administrators.Modules.CatePro" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=4.1.60623.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<style>
    fieldset {
        border: 1px solid #888; 
    }
    legend {
        margin-left: 20px;
    }
</style>
<div class="container" id="actualbody">
    <div class="row">
        <div class="widget clearfix">
            <h2>
                Cài đặt hệ thống
            </h2>
            <div class="widget_inside">
                <div class="col_12">
<div style="margin:2px 10px 2px 10px;text-align:center;">
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="false">
            <ProgressTemplate>
                    <img src="../Images/ajax-loader.gif" /><asp:Label ID="lblLoading" runat="server" Text="Đang tải dữ liệu..." />
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
    <table cellpadding="2" cellspacing="2" border="0" style="padding-left:15px;">
        <tr valign="top">
            <td>
                <asp:UpdatePanel ID="udpCategoryList" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="pnCategoryList" runat="server" GroupingText="Chuyên mục" Width="350px" ScrollBars="Auto">
                            <asp:TreeView ID="tvwCategory" runat="server" pathseparator="/" expanddepth="FullyExpand" ToolTip="Click để chọn chỉnh sửa"
                                onselectednodechanged="tvwCategory_SelectedNodeChanged">
                            </asp:TreeView>
                            <asp:Panel id="pnlEmptyManufacturer" runat="server">Chưa có chuyên mục nào, hãy thêm mới.</asp:Panel>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnUpdate" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td>
                <asp:UpdatePanel ID="pnCategoryDetail" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:Panel ID="Panel1" runat="server" GroupingText="Thêm mới/cập nhật danh mục">
                            <div style="margin:5px"><asp:Label ID="lblError" runat="server" ForeColor="Red" /></div>
                            <table cellpadding="2" cellspacing="2" border="0">
                                <tr valign="top">
                                    <td width="100px">Tên chuyên mục:</td>
                                    <td><asp:TextBox ID="txtCategoryName" runat="server" Width="150px" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="txtCategoryName" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr valign="top">
                                    <td>Thuộc chuyên mục:</td>
                                    <td>
                                        <asp:DropDownList ID="ddlCategoryParent" runat="server" />
                                    </td>
                                </tr>
                                <tr valign="top">
                                    <td>Mô tả:</td>
                                    <td>
                                        <asp:TextBox id="txtDescription" runat="server" textmode="MultiLine" rows="5"  width="150px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                   <td>Hình mô tả:</td>
                                   <td>
                                       <asp:Image ID="img1" runat="server" AlternateText=""  Width="50px"/>&nbsp;
                                       <asp:Label ID="lblImg1" runat="server" Font-Italic="true" ForeColor="#ffffff" Text="<%=imageName %>"></asp:Label>
                                   </td>
                                </tr>
                                 <tr>
                                <td> &nbsp;</td>
                                  <td>
                                       <asp:FileUpload ID="upImg1" runat="server" EnableViewState="true" 
                                           Width="182px" />
                                       <asp:Button ID="btnUpload" runat="server" Text="[Upload]" Width="61px" 
                                           onclick="btnUpload_Click"/>
                                  </td>
                               </tr>
                                <tr valign="top">
                                    <td width="100px">Thứ tự sắp xếp:</td>
                                    <td><asp:TextBox ID="txtOrderNo" runat="server" Width="60px" />
                                        <ajaxToolkit:FilteredTextBoxExtender FilterType="Numbers" runat="server" ID="filterNumber1" TargetControlID="txtOrderNo" />
                                    </td>
                                </tr>
                                <tr valign="top">
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Button ID="btnAdd" runat="server" Text="Thêm mới" Width="80px" 
                                            onclick="btnAdd_Click" />&nbsp;&nbsp;
                                        <asp:Button ID="btnUpdate" runat="server" Text="Cập nhật" Width="80px" 
                                            onclick="btnUpdate_Click" />&nbsp;&nbsp;
                                        <asp:Button ID="btnDelete" runat="server" Text="Xóa" Width="80px" 
                                            onclick="btnDelete_Click" OnClientClick="return confirm('Bạn có thực sự muốn xóa bản ghi này không ');" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnUpdate" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="btnDelete" EventName="Click" />
                        <asp:AsyncPostBackTrigger ControlID="tvwCategory" EventName="SelectedNodeChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
       </div>
            </div>
        </div>
    </div>
</div>
