<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddNewsCustomer.ascx.cs" Inherits="Musicviet.Administrators.Modules.AddNewsCustomer" %>
<%@ Register TagPrefix="FCKeditorV2" Namespace="FredCK.FCKeditorV2" Assembly="FredCK.FCKeditorV2, Version=2.6.3.22452, Culture=neutral, PublicKeyToken=4f86767c9b519a06" %>
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
                     <div style="text-align: center; width: 100%">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <asp:Label ID="lblError" runat="server" ForeColor="Red" EnableViewState="False" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div style="margin: 2px 10px 2px 10px; text-align: center;">
        <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="false">
            <ProgressTemplate>
                <img src="../Images/ajax-loader.gif" /><asp:Label ID="lblLoading" runat="server"
                    Text="Đang tải dữ liệu..." />
            </ProgressTemplate>
        </asp:UpdateProgress>
    </div>
    <asp:Panel ID="pnDetail" runat="server" GroupingText="Thông tin chi tiết CSKH">
        <table cellpadding="5" cellspacing="0">
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSaveTop" runat="server" Text="Lưu lại" OnClick="btnSave_Click"
                        Width="80px"></asp:Button>
                </td>
            </tr>
            <tr>
                <td width="120px">
                    Thuộc chuyên mục:
                </td>
                <td>
                    <asp:DropDownList ID="ddlCategory" runat="server" Width="300px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Tên CSKH:
                </td>
                <td>
                    <asp:TextBox ID="txtTitle" runat="server" Text="" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="descriptionValidator" runat="server" ControlToValidate="txtTitle"
                        ErrorMessage="Value is required" Display="Dynamic" SetFocusOnError="True" ValidationGroup="ValidateEdit">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    Tiêu đề phụ:
                </td>
                <td>
                    <asp:TextBox ID="txtSubTitle" runat="server" Text="" Width="300px"></asp:TextBox>
                    <asp:CheckBox ID="chkShowSubTitle" runat="server" Text="Hiển thị" />
                </td>
            </tr>
            <tr>
                <td valign="top">
                    Tóm tắt:
                </td>
                <td>
                    <asp:TextBox ID="txtSumary" runat="server" MaxLength="500" TextMode="MultiLine" Width="470px"
                        Rows="8"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    CSKH chi tiết:
                </td>
                <td>
                    <FCKeditorV2:FCKeditor ID="txtDetailText" BasePath="fckeditor/"  runat="server" Width="600" Height="300" >
                    </FCKeditorV2:FCKeditor>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    Tác giả:
                </td>
                <td>
                    <asp:TextBox ID="txtAuthor" runat="server" Text="" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    Nguồn:
                </td>
                <td>
                    <asp:TextBox ID="txtSource" runat="server" Text="" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="120px">
                    Hình mô tả:
                </td>
                <td>
                    <asp:Image ID="img1" runat="server" AlternateText="" />&nbsp;
                    <asp:Label ID="lblImg1" runat="server" Font-Italic="true" ForeColor="#ffffff" Text="<%=imageName %>"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="120px">
                    &nbsp;
                </td>
                <td>
                    <asp:FileUpload ID="upImg1" runat="server" EnableViewState="true" /><asp:LinkButton
                        ID="lbtnImg1" runat="server" OnClick="lbtnImg1_Click">[Upload]</asp:LinkButton>
                </td>
            </tr>
             <tr>
                <td width="120px">
                    Đường dẫn file:
                </td>
                <td>
                   <asp:Label ID="Label1" runat="server" Font-Italic="True" ForeColor="Black"></asp:Label>
                </td>
            </tr>
             <tr>
                <td width="120px">
                    &nbsp;Upload file
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" EnableViewState="true" />
                    <asp:LinkButton
                        ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">[Upload]</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSave" runat="server" Text="Lưu lại" OnClick="btnSave_Click" Width="80px">
                    </asp:Button>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <asp:Panel ID="pnAdminInfo" runat="server" GroupingText="Thông tin quản trị">
        <table cellpadding="5" cellspacing="0">
            <tr>
                <td width="120px">
                    Tạo bởi:
                </td>
                <td width="120px">
                    <asp:Label ID="lblCreatedBy" runat="server" />
                </td>
                <td width="120px">
                    Ngày tạo:
                </td>
                <td width="120px">
                    <asp:Label ID="lblCreatedDate" runat="server" />
                </td>
            </tr>
            <tr>
                <td width="120px">
                    Sửa lần cuối:
                </td>
                <td width="120px">
                    <asp:Label ID="lblModifiedBy" runat="server" />
                </td>
                <td width="120px">
                    Ngày sửa cuối:
                </td>
                <td width="120px">
                    <asp:Label ID="lblModifiedDate" runat="server" />
                </td>
            </tr>
            <tr>
                <td width="120px">
                    Duyệt bởi:
                </td>
                <td width="120px">
                    <asp:Label ID="lblApprovedBy" runat="server" />
                </td>
                <td width="120px">
                    Ngày duyệt:
                </td>
                <td width="120px">
                    <asp:Label ID="lblApprovedDate" runat="server" />
                </td>
            </tr>
        </table>
    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
</div>
