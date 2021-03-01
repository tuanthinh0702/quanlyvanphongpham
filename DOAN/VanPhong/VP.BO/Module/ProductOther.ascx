<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductOther.ascx.cs" Inherits="Musicviet.Module.ProductOther" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
 <%@ Register Src="~/Control/LinkContent.ascx" TagName="LinkContent" TagPrefix="uc5" %>
 <%@ Register Src="../Control/LinkFacebooks.ascx" TagName="LinkFacebooks" TagPrefix="uc6" %>
 <%@ Register Src="../Control/ProductRight.ascx" TagName="ProductRight" TagPrefix="uc7" %>
 <%@ Register Src="../Control/NewsRight.ascx" TagName="NewsRight" TagPrefix="uc8" %>
 <%@ Register Src="../Control/ProductCategoryR.ascx" TagName="ProductCategoryR" TagPrefix="uc10" %>
<div id="contentleft">
<div id="contentleftwrapcontent">
    <div class="textnews">
        <span>Sản phẩm >> Thiết bị công nghệ âm nhạc </span>
    </div>
    <ul>
        <asp:Repeater ID="rptCate" runat="server" onitemdatabound="rptCate_ItemDataBound">
            <ItemTemplate>
         <asp:HiddenField runat="server" ID="hdCateId" Value='<%#Eval("CategoryID") %>'/>
                 <asp:Repeater ID="rptProduct" runat="server">
                     <ItemTemplate>
                <li>
                     <div class="productwrapcontent">
                        <div class="detailproduct">
                            <a href="#">
                                <img src='/Upload/<%#Eval("ProductImage") %>' alt="<%#Eval("ProductName") %>" width="160" />
                                <br />
                                <span><%#Eval("ProductName") %></span></a>
                            <div class="btnbuttom">
                              <a href="Default.aspx?module=ProductDetailOther&id=<%#Eval("ProductId") %>"><input type="button" class="btnDetails" value="Chi Tiết" /></a> &nbsp;&nbsp;<a href="Default.aspx?module=Cart&id=<%#Eval("ProductId") %>"><input type="button" class="btnbuy" value="Đặt hàng"/></a></div>
                        </div>
                    </div>
                   
                </li>
            </ItemTemplate>
        </asp:Repeater>
            </ItemTemplate>
        </asp:Repeater>
       
        <li class="details" style="width:100%;">
            <div>
                <span>
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Trang trước</asp:LinkButton> &nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">Trang sau</asp:LinkButton></span>
            </div>
        </li>
    </ul>
</div>
<uc5:LinkContent  ID="LinkContent1" runat="server" />
</div>
<div id="contentrighttwrapcontent">
    <table>
        <tr><td> <uc10:ProductCategoryR ID="ProductCategoryR1" runat="server"/></td></tr>
        <tr><td><uc7:ProductRight ID="ProductRight1" runat="server"/></td></tr>
        <tr><td>  <uc8:NewsRight ID="NewsRight1" runat="server"/></td></tr>
    </table>
         
          
        
</div>
