<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="Musicviet.Module.Login" %>
 <script language="javascript" type="text/javascript">
     document.getElementById("idbody").className = "sub-page";
</script>
<%@ Import Namespace="Common" %>
<div id="wrapper" class="mainContent">
    <div id="promotionBanner" class="category-promotion"></div>
    <div id="siteMap" class="site-map">
        <asp:DataList runat="server" ID="dtlSitemap" RepeatDirection="Horizontal">
            <ItemTemplate>
                 <a href="<%#Eval("link") %>"><%#Eval("Title")%></a>
            </ItemTemplate>
            <SeparatorTemplate><span>&raquo;</span></SeparatorTemplate>
        </asp:DataList>
    </div>
    <div class="main-container clearfix">
        <div class="side-bar">
            <h3>Danh mục</h3>
           <ul id="categoryMenu" class="module-filter other-page">
                <li><a href="/Tin-Tuc.htm" title="Tin tức">Tin tức</a></li>
                <asp:Repeater runat="server" ID="rptnewscategory">
                    <ItemTemplate>
                        <li class=""><a href="<%#GenerateURL(Eval("Title"),Eval("NewsID")) %>" title="<%#Eval("Title") %>"><%#Eval("Title")%></a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
        <div id="pageContent" class="primary-content">
         <div class="article-wrap"><h2>Thông tin đăng nhập</h2>
             <div class="article-content">
                 <br />
                 <br />
                 <table style="height: 250px; margin-bottom: 6px;">
                      <tr>
                        <td style="width: 110px;">
                            Tên đăng nhập:
                        </td>
                        <td>
                            <asp:TextBox ID="txtusser" runat="server" Height="22px" Width="411px"></asp:TextBox>
                        </td>
                        <td>
                              &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtusser" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                          
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Mật khẩu:
                        </td>
                        <td>
                            <asp:TextBox ID="txtPass" runat="server" Height="22px" Width="411px" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtPass" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                      <tr>
                        <td >
                            <asp:Button ID="Button1" runat="server" Text="Đăng nhập" />
                        </td>
                        <td colspan="2">
                            <asp:Button ID="Button2" runat="server" Text="Thoát" />
                        </td>
                       
                    </tr>
              </table>
          </div>
       </div>
      </div>
    </div>
</div>