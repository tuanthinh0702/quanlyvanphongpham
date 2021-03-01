<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Search.ascx.cs" Inherits="Musicviet.Module.Search" %>
<%@ Register TagPrefix="cc1" Namespace="SiteUtils" Assembly="CollectionPager" %>
<%@ Register TagPrefix="uc5" TagName="LinkContent" Src="~/Control/LinkContent.ascx" %>
<%@ Register TagPrefix="uc9" TagName="NewsCategoryR" Src="~/Control/NewsCategoryR.ascx" %>
<%@ Register TagPrefix="uc7" TagName="ProductRight" Src="~/Control/ProductRight.ascx" %>
<%@ Register TagPrefix="uc8" TagName="NewsRight" Src="~/Control/NewsRight.ascx" %>
<div id="contentleft">
 <div id="contentleftwrapcontent">
             <div class="textnews">
            <span>  Tìm kiếm » Tin tức</span>
             </div>
                 <ul style="margin-left: 0px;">
                 <asp:Repeater ID="dtlAllNews" runat="server">
                    <ItemTemplate>
                     <li>
                         <div class="news">
                         <div class="detailnews" >
                             <div class="imageNews">
                             <a href="<%#GenerateURL(Eval("Title"),Eval("NewsID")) %>"><img src='/Upload/<%#Eval("ImagePath") %>' alt='<%#CatChuoi(Eval("Title"), 10)%>'/></a></div>
                               <div id="content">
                                   <span style="font-size: 15px;"><a href="<%#GenerateURL(Eval("Title"),Eval("NewsID")) %>"><%#CatChuoi(Eval("Title"), 10)%></a></span>
                            <div id="xg">
                                 <%#CatChuoi(Eval("Summary"),50)%>
                            </div>
                          
                              </div>
                         </div>
                         </div>
                     </li>                     
                    </ItemTemplate> 
                 </asp:Repeater>
                     <li class="details">
                         <div style="padding-left: 15px;">
                         <cc1:CollectionPager ID="clpNews" FirstText="Đầu" LastText="Cuối" BackText="« Trước &amp;nbsp;"
                            BackNextLinkSeparator="" BackNextLocation="Split" PageNumbersDisplay="Numbers"
                            ShowFirstLast="True" NextText=" &amp;nbsp; Sau »" LabelText="" runat="server"
                            ResultsLocation="None">
                          </cc1:CollectionPager>
                        </div>
                        <div style="padding: 5px;">
                            <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </div>
                     </li>
                 </ul>

        </div><!--endcontentleftwrapcontent-->
         <uc5:LinkContent  ID="LinkContent1" runat="server" />
</div>
 <div id="contentrighttwrapcontent">
     <table>
         <tr><td>  <uc9:NewsCategoryR ID="NewsCategoryR1" runat="server"/></td></tr>
         <tr><td> <uc7:ProductRight ID="ProductRight1" runat="server"/></td></tr>
         <tr><td> <uc8:NewsRight ID="NewsRight1" runat="server"/></td></tr>
     </table>
        
         
         
      </div>
