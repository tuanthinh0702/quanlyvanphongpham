<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PayConfirm.ascx.cs" Inherits="Musicviet.Module.PayConfirm" %>
<%@ Register TagPrefix="cc1" Namespace="Common" Assembly="Common" %>
 <%@ Register Src="../Control/LinkFacebooks.ascx" TagName="LinkFacebooks" TagPrefix="uc6" %>
 <%@ Register Src="../Control/ProductRight.ascx" TagName="ProductRight" TagPrefix="uc7" %>
 <%@ Register Src="../Control/NewsRight.ascx" TagName="NewsRight" TagPrefix="uc8" %>
<div id="contentleft">
 <div id="contentleftwrapcontent">
 <script type="text/javascript">
     $(document).ready(function () {
         try {
             $("#ddlBank").msDropDown();

         } catch (e) {
             // alert(e.message);
         }
     });
 </script>
     
</div>
</div>



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
         <div class="article-wrap"><h2>Chi tiết giỏ hàng</h2>
               <div>
                   <br />
                   <br />
                   <br />
                 <div style="text-align:center;width:100%">
                         <asp:Panel ID="pldangnhapky" runat="server" Width="100%" >
                              <asp:Button ID="btnloginoke" runat="server" Text="Đăng nhập" OnClick="btnloginoke_Click" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <asp:Button ID="btncreate" runat="server" Text="Đăng ký" OnClick="btncreate_Click" />
                         </asp:Panel>
                 </div>
                 <asp:Panel ID="plLogin" runat="server"  Width="100%" Visible="false">
                        <div class="widget clearfix">
                            <h2>Đăng nhập</h2>
                            <div class="widget_inside">
                                <p class="margin_bottom_15">Bạn cần nhập đầy đủ thông tin dưới đây</p>
                                        <table class="table table-bordered" border="0px">
                                                <tr>
                                                        <td>
                                                            Tài khoản
                                                        </td>
                                                        <td>
                                                              <input type="text" class="xlarge" id="txtUserName" runat="server"/>
                                                                  <asp:RequiredFieldValidator ID="validUsers" runat="server" 
                                                                            ControlToValidate="txtUserName" Display="Dynamic" ErrorMessage="*" 
                                                                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                          
                                                        </td>
                                                </tr>
                                                <tr>
                                                        <td>
                                                            Mật khẩu
                                                        </td>
                                                        <td>
                                                                <input type="password" class="xlarge" id="txtPassword" runat="server"/>
                                                       <asp:RequiredFieldValidator ID="validPass" runat="server"   ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="*"   SetFocusOnError="True"></asp:RequiredFieldValidator>
                          
                                                        </td>
                                                </tr>
                                                <tr>
                                                        <td>
                                                            Ghi nhớ
                                                        </td>
                                                        <td>  
                                                            <input type="checkbox" id="chkRemember" runat="server" /> Nhớ mật khẩu?
                          
                                                        </td>
                                                </tr>
                                               <tr>
                                                        <td>
                                                               &nbsp;
                                                        </td>
                                                        <td>  
                                                           <asp:LinkButton runat="server" ID="btnLogin" CssClass="button blue" onclick="btnLogin_Click" ><span>Đăng nhập</span></asp:LinkButton>    &nbsp;  &nbsp;  &nbsp; <asp:LinkButton runat="server" ID="btnReset" CssClass="button"  CausesValidation="False"  onclick="btnReset_Click" ><span>Làm lại</span></asp:LinkButton>
                          
                                                        </td>
                                                </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:Label ID="lblError1" runat="server" Text="" ForeColor="Red"></asp:Label>
                                                </td>
                                            </tr>
                                            </table>
                                   
                            </div>
                        </div>
                 </asp:Panel>
                 <br />
                    <asp:Panel ID="pldangnhapthanhcong" runat="server"  Width="100%" Visible="false">
                        <div class="widget clearfix">
                            <div class="widget_inside">
                                <p class="margin_bottom_15">Thông tin khách hàng

                                </p>
                                        <table class="table table-bordered" border="0px">
                                                <tr>
                                                        <td>
                                                            Tên tài khoản:
                                                        </td>
                                                        <td>
                                                                <asp:Label ID="lblfullname" runat="server"></asp:Label>
                          
                                                        </td>
                                                </tr>
                                                <tr>
                                                        <td>
                                                            Số điện thoại:
                                                        </td>
                                                        <td>
                                                                  <asp:Label ID="lblphone" runat="server"></asp:Label> 
                          
                                                        </td>
                                                </tr>
                                                <tr>
                                                        <td>
                                                            Địa chỉ:
                                                        </td>
                                                        <td>  
                                                             <asp:Label ID="lbladress" runat="server"></asp:Label> 
                          
                                                        </td>
                                                </tr>
                                               <tr>
                                                        <td>
                                                            Ghi chú:
                                                        </td>
                                                        <td>  
                                                          
                          
                                                        </td>
                                                </tr>
                                            </table>
                                   
                            </div>
                        </div>
                 </asp:Panel>
                 <asp:Panel runat="server"  Width="100%" ID="plcreateUsser" Visible="false" >
                   
                     <h1 class="box-title-dh">Thông tin khách hàng</h1>
            <fieldset style=" display: block; margin-left: 2px;margin-right: 2px;padding-top: 0.35em;padding-bottom: 0.625em;padding-left: 0.75em; padding-right: 0.75em;">
              <div class="table-responsive" runat="server" id="buy">
                <p style="color:red; font-weight: bold; font-size: 13px; text-align: center; margin-top: 25px;
                    margin-bottom: 18px;">
                    Quý khách vui lòng nhập đầy đủ thông tin sau đây để chúng tôi liên hệ và giao hàng đúng yêu cầu.</p>
                <table class="table table-bordered">
                    <body>
                    <tr>
                        <td>
                            Tên đăng nhập: <span  style="color: red"> (*) </span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtuser" runat="server" CssClass="inputclass"></asp:TextBox>
                        </td>
                        <td>
                              &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtuser" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                          
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Mật khẩu: <span  style="color: red"> (*) </span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtpass" runat="server" CssClass="inputclass" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtpass" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Tên khách hàng <span  style="color: red"> (*) </span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" CssClass="inputclass"></asp:TextBox>
                        </td>
                        <td>
                              &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                          
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Số điện thoại <span  style="color: red"> (*) </span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="inputclass"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtPhone" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email <span  style="color: red"> (*) </span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="inputclass"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtEmail" ErrorMessage="*" Display="Dynamic" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                ControlToValidate="txtEmail" ErrorMessage="*" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Địa chỉ <span  style="color: red"> (*) </span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="inputclass"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ErrorMessage="*" ControlToValidate="txtAddress" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Ghi chú
                        </td>
                        <td>
                            <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" CssClass="inputclassmutiline" ></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                   <tr>
                   <td></td>
                   <td><asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"></asp:Label></td>
                   </tr>
                   </body>
                </table>
               </div>
                  </fieldset>  
                 </asp:Panel>
                  <asp:Panel ID="plthanhtoan" runat="server"  Width="100%" Visible="false">
                   <fieldset style=" display: block;margin-left: 2px;margin-right: 2px;padding-top: 0.35em;padding-bottom: 0.625em;padding-left: 0.75em;padding-right: 0.75em;"><legend> Lựa chọn hình thức thanh toán</legend>
                    <div style="color:#222;">
                       <p>
                         <asp:RadioButton ID="rdoHome" runat="server" Checked="true" 
                           GroupName="select_bank" oncheckedchanged="rdoHome_CheckedChanged" 
                           AutoPostBack="True" />Thanh toán tại nhà.</p>
                       <p>
                   <asp:RadioButton ID="rdoOnline" runat="server" GroupName="select_bank" 
                     oncheckedchanged="rdoOnline_CheckedChanged" AutoPostBack="True" Visible="True" />Thanh trực tuyến.</p>
                       <div id="bank_select" runat="server" visible="true">
                         <asp:DropDownList ID="ddlBank" ClientIDMode="Static" runat="server" 
                            DataTextField="BankName" DataValueField="Logo"
                           AutoPostBack="true" OnSelectedIndexChanged="ddlBank_SelectedIndexChanged" 
                           CssClass="ddl" Width="300px" Visible="False">
                          </asp:DropDownList>
                       </div>
                      <div class="table-responsive">
                       <table class="table table-bordered">
                        <tr>
                        <td>
                            Mã bảo mật <span  style="color: red"> (*) </span>
                        </td>
                        <td>
                            <asp:TextBox ID="txtCodeValid" runat="server"></asp:TextBox>
                            &nbsp;<cc1:ImageVerifier ID="ImageVerifier1" runat="server" Width="100" Height="20" />
                            &nbsp;<asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                           <div class="nutdathang">
                              <a href="/Trang-chu.htm">
                                <input type="button" value="Mua tiếp" class="btn-send white bold" /></a> &nbsp; &nbsp; &nbsp;
                              <asp:Button ID="Button1" runat="server" Text=" Đặt hàng " CssClass="btn-send white bold" OnClick="Button1_Click" />
                           </div>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    </table>
                    </div>
                  </div>
                  </fieldset> 
                  </asp:Panel>
             </div>  
       </div>
      </div>
    </div>
</div>