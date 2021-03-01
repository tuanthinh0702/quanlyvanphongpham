<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Pay.ascx.cs" Inherits="Musicviet.Module.Pay" %>
<%@ Register Src="../Control/LinkFacebooks.ascx" TagName="LinkFacebooks" TagPrefix="uc6" %>
<%@ Register Src="../Control/ProductRight.ascx" TagName="ProductRight" TagPrefix="uc7" %>
<%@ Register Src="../Control/NewsRight.ascx" TagName="NewsRight" TagPrefix="uc8" %>
<div id="wrapper" class="mainContent" >
      <div class="main-container clearfix" style="height: 434.3px;">
      <div class="side-bar">
        </div>
        <div id="pageContent" class="primary-content" style="float:right;">
        <asp:Panel ID="panelSuccess" runat="server">
            <div class="textnews">
                <span>Thanh toán thành công </span>
            </div>
            <div style="text-align: center; color: white; width: 550px; margin-left: 0px; margin-right: 0px;
                padding: 15px 65px 20px; font-size: 15px;">
                Cảm ơn bạn đã mua hàng tại abc chúng tôi sẽ kiểm tra lại thông tin và giao
                hàng cho quý khách hàng trong thời gian nhanh nhất.
            </div>
        </asp:Panel>
      
      </div>
    </div>
</div>
