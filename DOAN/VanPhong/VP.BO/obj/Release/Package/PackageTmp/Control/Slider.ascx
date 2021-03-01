<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Slider.ascx.cs" Inherits="Musicviet.Control.Slider" %>
<%--slider --%>
    <div class="panelPromote clearfix">
        <div class="blankCate"></div>
        <div id="slideShow" class="slidePanel">
               <div class="ulSlide" id="dSlideHome">
                 <asp:Repeater runat="server" ID="rptslider">
                     <ItemTemplate>
                              <div>
                                  <a href="<%#Eval("SliderLink")%>">
                                      <img src="<%=imagePath%><%#Eval("SliderImage")%>" alt="<%#Eval("SliderName") %>" width="480" height="400" />
                                  </a>
                              </div>
                     </ItemTemplate>
                 </asp:Repeater>
               </div>
            <a class='navSlide navPre' id='prevSLHome'><span></span></a>
            <a class='navSlide navNext' id='nextSLHome'><span></span></a>
            <div class='thumbSlide'>
                <div class='cycleNav'>
                    <div id='dPaginghome'></div>
                </div>
            </div>
        </div>

        <div class="modPromote">
            <asp:Repeater runat="server" ID="rptsevertop">
                <ItemTemplate>
                     <a href="<%#GenerateServerURL(Eval("NewsID"),Eval("Title")) %>" title="<%#Eval("Title") %>">
                       <img src="<%=imagePath%><%#Eval("ImagePath") %>" width="230" height="192" alt="<%#Eval("Title") %>" />
                     </a>
                </ItemTemplate>
            </asp:Repeater>
        </div>

   </div>
