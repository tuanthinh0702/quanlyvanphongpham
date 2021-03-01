<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pay.ascx.cs" Inherits="Musicviet.Module.Pay" %>
<%@ Register Src="../Control/LinkFacebooks.ascx" TagName="LinkFacebooks" TagPrefix="uc6" %>
<%@ Register Src="../Control/ProductRight.ascx" TagName="ProductRight" TagPrefix="uc7" %>
<%@ Register Src="../Control/NewsRight.ascx" TagName="NewsRight" TagPrefix="uc8" %>
<div id="contentleft">
    <div id="contentleftwrapcontent">
        <asp:Panel ID="panelSuccess" runat="server">
            <div class="textnews">
                <span>Thanh toán thành công </span>
            </div>
            <div style="text-align: center; color: white; width: 550px; margin-left: 0px; margin-right: 0px;
                padding: 15px 65px 20px; font-size: 15px;">
                Cảm ơn bạn đã mua hàng tại musicviet.vn chúng tôi sẽ kiểm tra lại thông tin và giao
                hàng cho quý khách hàng trong thời gian nhanh nhất.
            </div>
        </asp:Panel>
        <asp:Panel ID="panelFail" runat="server" Visible="false">
            <div class="textnews">
                <span>Thanh toán thất bại </span>
            </div>
            <div style="text-align: center; color: white; width: 550px; margin-left: 0px; margin-right: 0px;
                padding: 15px 65px 20px; font-size: 15px;">
                <p>
                    Xin lỗi vì sự cố xảy ra khi thanh toán đơn hàng của quý khách. Chúng tôi sẽ kiểm
                    tra lại.</p>
                <p>
                    Cảm ơn bạn đã mua hàng tại musicviet.vn chúng tôi sẽ kiểm tra lại thông tin và giao
                    hàng cho quý khách hàng trong thời gian nhanh nhất.</p>
            </div>
        </asp:Panel>
    </div>
</div>
<div id="contentrighttwrapcontent">
    <table>
        <tr>
            <td>
                <uc6:LinkFacebooks ID="LinkFacebooks1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <uc7:ProductRight ID="ProductRight1" runat="server" />
            </td>
        </tr>
    </table>
</div>
