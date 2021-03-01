<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="News.ascx.cs" Inherits="Musicviet.Module.News" %>
 <%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>
<div id="fix_tim_giua">
<div class="boxgiua_wrap header_danhmuc_12">
<div class="header_layer_1">
     <div class="header_layer_2">
         <p class="header_box">
              <span><asp:Label runat="server" ID="lblCatename" CssClass="divtitletext"></asp:Label></span>
         </p>
     </div>
</div>
<div class="box_content_layer_l">
<div class="box_content_layer_2">
<div class="boxgiua">
<div class="boxgiua_lop1">
<div class="boxgiua_lop2" style="min-height: 1490px;">
    <asp:Label runat="server" ID="lblError" ForeColor="red"></asp:Label>
<div class="sanpham_table">
    <div class="sanpham_row">
       <ul>
           <asp:Repeater runat="server" ID="rptBynews">
               <ItemTemplate>
                   <li>
                       <div class="liimg"><a href="<%#GenerateNewsURL(Eval("NewsID"),Eval("Title")) %>"><img src="<%=imagePath%><%#Eval("ImagePath")%>" alt="<%#Eval("Title")%>" width="245px" height="135px"/></a></div>
                       <div class="licontent">
                           <div class="licontenttitle"><a href="<%#GenerateNewsURL(Eval("NewsID"),Eval("Title")) %>"><%#CatChuoi(Eval("Title"),8)%></a></div>
                           <div class="licontenttext"><%#CatChuoi(Eval("Summary"),40)%></div>
                       </div>
                   </li>
               </ItemTemplate>
           </asp:Repeater>
       </ul>
    </div>
</div>
</div>
</div>
<div class="phan_trang_sanpham">
 <cc1:CollectionPager ID="clpNews"  PagingMode="PostBack" FirstText="Đầu" LastText="Cuối" BackText="« Trước &amp;nbsp;"
          BackNextLinkSeparator="" BackNextLocation="Split" PageNumbersDisplay="Numbers"
          ShowFirstLast="True" NextText=" &amp;nbsp; Sau »" LabelText="" runat="server" ResultsLocation="None">
 </cc1:CollectionPager>
</div>
</div>
</div>
</div>
</div>
</div>
