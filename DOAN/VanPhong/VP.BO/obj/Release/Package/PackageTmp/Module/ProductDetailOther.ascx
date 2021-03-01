<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDetailOther.ascx.cs" Inherits="Musicviet.Module.ProductDetailOther" %>
<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
 <%@ Register Src="~/Control/LinkContent.ascx" TagName="LinkContent" TagPrefix="uc5" %>
 <%@ Register Src="../Control/LinkFacebooks.ascx" TagName="LinkFacebooks" TagPrefix="uc6" %>
 <%@ Register Src="../Control/ProductRight.ascx" TagName="ProductRight" TagPrefix="uc7" %>
 <%@ Register Src="../Control/NewsRight.ascx" TagName="NewsRight" TagPrefix="uc8" %>
 <%@ Register Src="../Control/ProductCategoryR.ascx" TagName="ProductCategoryR" TagPrefix="uc10" %>

<div id="contentleft">
<div id="contentleftwrapcontent">
    <asp:FormView ID="FormView1" runat="server">
        <ItemTemplate>
             <div class="textnews"><span>Sản phẩm  >> <%#Eval("CategoryName")%>    </span></div>
            <div id="contentdetailsproduct">
              <div class="imgproduct"><img src="/Upload/<%#Eval("ProductImage") %>" alt="<%#Eval("ProductName") %>" width="200"></div>
              <div class="contenttitleproduct">
                <div class="titlesp"><a href="#"><span><%#Eval("ProductName") %></span></a></div>
                <div class="rowproduct">
                   <span> Mã sản sản phẩm</span>: <%#Eval("ProductCode") %>
                </div>
                <div class="rowproduct">
                    <span>Chất liệu:</span> <%#Eval("ProductMaterial") %>
                </div>
                <div class="rowproduct">
                    <span>Xuất xứ:</span> <%#Eval("NationalBy")%>
                </div>
                <div class="rowproduct">
                  <span>  Hãng sản xuất:</span> <%#Eval("MadeBy") %>
                </div>
                <div class="rowproduct">
                   <span>Giá bán:</span> <%#Common.Util.DecimalObjectToString(Eval("ProductPrice"))%> VND
                </div>
                <div class="rowproduct">
                   <span> Bảo hành:</span> <%#Eval("Warranty")%>
                </div>
                <div class="rowproduct">
                    <span>Tình Trạng:</span> <%#Eval("ProductStatus")%>
                </div>
                  <div class="btnbuttom"><a href="Default.aspx?module=Cart&id=<%#Eval("ProductId") %>"><input type="button" class="btnbuy" value="Đặt hàng"/></a>&nbsp;&nbsp;<a href="javascript:history.back();"><input type="button" class="btnbuy" value="Quay Lại"/></a></div>
              </div>
              <div style="clear: both;"></div>
              <div class="detailsp" style="color: white">
                <div class="textdetailsp" >Thông tin sản phẩm</div>
                <br/>
             <%--   <%#Eval("Description")%>--%>
              </div>
                <div class="detailsp">
                    <div class="textdetailsp">Ý kiến về sảm phẩm</div>
                    <div style="margin-left: 15px;">
            <div class="fb-comments" data-href="http://musicviet.vn" data-width="670" data-num-posts="10"></div></div>
                </div>
            </div>
        </ItemTemplate>
    </asp:FormView>
            
            <div class="textdetailspxl">Sản phẩm liên quan </div>
            <ul>
                <asp:Repeater runat="server" ID="rptOther">
                    <ItemTemplate>
                         <li>
                    <div class="productwrapcontent">
                        <div class="detailproduct">
                            <a href="Default.aspx?module=ProductDetailOther&id=<%#Eval("ProductId") %>"><img src="/Upload/<%#Eval("ProductImage") %>" alt="<%#Eval("ProductImage") %>" width="160"/>
                                <br/>
                                <span>  <%#Eval("ProductName") %></span></a>
                            <div class="btnbuttom"><a href="Default.aspx?module=ProductDetailOther&id=<%#Eval("ProductId") %>"><input type="button" class="btnDetails" value="Chi Tiết" /></a>&nbsp;&nbsp;<a href="Default.aspx?module=Cart&id=<%#Eval("ProductId") %>"><input type="button" class="btnbuy" value="Đặt hàng"/></a></div>
                        </div>
                    </div>
                </li>
                    </ItemTemplate>
                </asp:Repeater>
               
           </ul>
        </div>
        <uc5:LinkContent  ID="LinkContent1" runat="server" />
</div>
<div id="contentrighttwrapcontent">
    <table>
        <tr>
            <td><uc10:ProductCategoryR ID="ProductCategoryR1" runat="server"/></td>
        </tr>
        <tr><td>   <uc7:ProductRight ID="ProductRight1" runat="server"/></td></tr>
        <tr><td> <uc8:NewsRight ID="NewsRight1" runat="server"/></td></tr>
    </table>
          
       
         
</div>