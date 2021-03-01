<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddPro.ascx.cs" Inherits="Musicviet.Administrators.Modules.AddPro" %>
<%@ Register TagPrefix="FCKeditorV2" Namespace="FredCK.FCKeditorV2" Assembly="FredCK.FCKeditorV2, Version=2.6.3.22452, Culture=neutral, PublicKeyToken=4f86767c9b519a06" %>
<style type="text/css">
    .style2
    {
        height: 46px;
        width: 110px;
    }
    .style3
    {
        width: 675px;
    }
    .style6
    {
        width: 149px;
    }
    .style7
    {
        height: 40px;
        width: 149px;
    }
    .style8
    {
        height: 46px;
        width: 149px;
    }
    .style9
    {
        width: 241px;
    }
    .style10
    {
        width: 110px;
    }
    .style12
    {
        height: 46px;
        width: 73px;
    }
    .style13
    {
        width: 73px;
    }
    .style14
    {
        height: 40px;
        width: 75px;
    }
    .style15
    {
        height: 46px;
        width: 75px;
    }
    .style16
    {
        width: 75px;
    }
    .style17
    {
        width: 149px;
        height: 48px;
    }
    .style18
    {
        width: 73px;
        height: 48px;
    }
</style>

<script type="text/javascript">
    function _isIE() {
        var Browser = navigator.appName;
        var Micro = Browser.indexOf("Microsoft");
        if (Micro >= 0) {
            return true;
        }
        return false;
    }
    function BindControlEvents() {
        $('.input-amount').bind('keypress', function (event) {
            if (!_isIE()) {
                if ((event.charCode >= 48 && event.charCode <= 57) || (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 13 || event.keyCode == 35 || event.keyCode == 36 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46)) {
                    return true;
                };
            } else {
                if ((event.keyCode >= 48 && event.keyCode <= 57) || (event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 13 || event.keyCode == 35 || event.keyCode == 36 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46)) {
                    return true;
                };
            }
            return false;
        }).bind('keyup', function (event) {
            if (this.value.length <= this.maxLength) {
                var temp = this.value;
                while (temp.indexOf('.') != -1) {
                    temp = temp.replace('.', '');
                }
                var result = '';
                while (temp.length > 3) {
                    var length = temp.length;
                    result = '.' + temp.substring(length - 3, length) + result;
                    temp = temp.substring(0, length - 3);
                }
                result = temp + result;
                this.value = result;
            } else {
                return false;
            }
        });
    }
    $(document).ready(function () {
        BindControlEvents();
    });
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        BindControlEvents();
    }); 
</script>

<div class="container" id="actualbody">
    <div class="row">
        <div class="widget clearfix">
            <h2>
                Cài đặt hệ thống
            </h2>
            <div class="widget_inside">
                <div class="col_12">
                    <div style="width: 100%; text-align: center">
                         <asp:Label ID="lblError" runat="server" ForeColor="Red" EnableViewState="False" />
                    </div>
                    <table style="width: 100%;">
                        <tr>
                            <td class="style6">
                                Loại sản phẩm</td>
                            <td class="style9" colspan="3">
                                 <asp:DropDownList ID="ddlCategory" runat="server" Width="300px"> </asp:DropDownList>
                            </td>
      
                        </tr>
                        <tr>
                            <td class="style6">
                                Tên sản phẩm</td>
                            <td class="style9" colspan="3">
                                <asp:TextBox ID="txtName" runat="server" Height="25px" Width="320px"></asp:TextBox>
                            </td>

                        </tr>

                        <tr>
                            <td class="style6">
                                Mã sản phẩm</td>
                            <td class="style9" colspan="3">
                                <asp:TextBox ID="txtCode" 
                                    runat="server" Height="25px" Width="320px"></asp:TextBox>
                            </td>

                        </tr>
                        <tr>
                            <td class="style6">
                                Từ khóa SEO(Mô tả)</td>
                            <td class="style9" colspan="3">
                                <asp:TextBox ID="txtsubproductname"  runat="server" Height="100px" Width="320px" TextMode="MultiLine" MaxLength="160"></asp:TextBox>
                            </td>

                        </tr>

                        <tr>
                            <td class="style6"> Chất liệu</td>
                            <td class="style9" colspan="3">
                                <asp:TextBox ID="txtMaterial" 
                                    runat="server" Height="25px" Width="320px"></asp:TextBox>
                            
                            </td>
                        </tr>

                        <tr>
                            <td class="style6">
                                Nhà sản xuất</td>
                            <td class="style15">
                                <asp:DropDownList ID="ddlProvider" runat="server" >
                                </asp:DropDownList>
                            </td>
                            <td class="style10"> Xuất sứ</td>
                            <td>
                                 <asp:DropDownList ID="ddlMade" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>

                        <tr>
                             <td class="style6">
                                Mầu sắc sản phẩm</td>
                            <td class="style15">
                                <asp:DropDownList ID="ddlcolor" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td class="style10">Kích thước(cỡ) sản phẩm</td>
                            <td class="style2">
                                 <asp:DropDownList ID="ddlsize" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>

                        <tr>
                             <td class="style6">
                                Đơn vị sản phẩm:</td>
                            <td class="style12" colspan="3">
                                <asp:DropDownList ID="ddlunit" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                          <tr>
                            <td class="style6">
                                Giá sản phẩm</td>
                            <td class="style13" colspan="3">
                                <asp:TextBox ID="txtPrice" runat="server" Height="25px" Width="320px" CssClass="input-amount" MaxLength="11"></asp:TextBox>
                           &nbsp;- vnđ

                        </tr>
                         <tr>
                            <td class="style17">
                                Giảm giá</td>
                            <td class="style18" colspan="3">
                                <asp:TextBox ID="txtDiscount" runat="server" Height="25px" Width="320px" CssClass="input-amount" MaxLength="11"></asp:TextBox>
                            &nbsp;- vnđ

                        </tr>
                        <tr>
                            <td class="style6">
                                Bảo hành</td>
                            <td class="style13" colspan="3">
                                <asp:TextBox ID="txtWarranty" runat="server" Height="25px" Width="320px"></asp:TextBox>
                            
                            </td>
                            <td class="style10">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style6">
                                Thông tin SP</td>
                            <td class="style3" colspan="3" >
                                <FCKeditorV2:FCKeditor ID="txtDetailText" BasePath="fckeditor/"  runat="server" Width="600" Height="300" ></FCKeditorV2:FCKeditor>
                            </td>

                        </tr>
                        <tr>
                            <td class="style6">
                                Tình trạng sản phẩm</td>
                            <td class="style16" colspan="3">
                                <asp:TextBox ID="txtStatus" runat="server" Height="25px" Width="320px"></asp:TextBox>
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="style7">
                                </td>
                            <td class="style14" colspan="3">
                               <asp:FileUpload ID="file_upload" class="multi" runat="server"/><asp:LinkButton
                               ID="lbtnImg1" runat="server" OnClick="lbtnImg1_Click">[Upload]</asp:LinkButton>
                            </td>
                            
                        </tr>
                        <tr>
                            <td class="style7">
                                Ảnh sản phẩm&nbsp;</td>
                            <td class="style14" colspan="3">
                                <asp:datagrid ID="grvImage" runat="server" AutoGenerateColumns="False" 
                                    OnItemCommand="grvImage_RowCommand">
                                    <Columns>
                                            <asp:TemplateColumn>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkSelect" runat="server" CommandName="select"
                                                CommandArgument='<%# Eval("ImagePath") %>'>Chọn</asp:LinkButton></ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn>
                                            <ItemTemplate>
                                                  <img alt="" src='/Upload/<%#Eval("ImagePath") %>' style="vertical-align: middle;width: 80px" />
                                            </ItemTemplate>
                                          
                                          </asp:TemplateColumn>
                                        <asp:TemplateColumn>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="delete"
                                                CommandArgument='<%# Eval("ImagePath") %>'>Xóa</asp:LinkButton></ItemTemplate>
                                        </asp:TemplateColumn>
                                    </Columns>
                                </asp:datagrid>
                            &nbsp;<span>  Ảnh đại diện : 
                                <img alt="" src='/Upload/<%=imageNameOne %>' width="80px"/></span></td>
                   
                        </tr>
                        <tr>
                            <td class="style8">
                                Hiển thị</td>
                            <td class="style15" colspan="3">
                                 <asp:RadioButton ID="rdoShow" runat="server" Text="Hiển thị" GroupName="sh" />
                                    &nbsp;&nbsp;&nbsp;
                                 <asp:RadioButton ID="rdoHide" runat="server" GroupName="sh" 
                                     Text="Không hiển thị" />
                            </td>
                      
                        </tr>
                        <tr>
                            <td class="style8">
                                Sản phẩm top</td>
                            <td class="style15" colspan="3">
                                 <asp:RadioButton ID="rdoTopOk" runat="server" GroupName="tt" 
                                     Text="Sản phẩm top" />
                                 <asp:RadioButton ID="rdoNormal" runat="server" GroupName="tt" 
                                     Text="Sản phẩm thường" />
                            </td>
                        </tr>
                        <tr>
                            <td class="style8">
                                </td>
                            <td class="style15" colspan="3">
                                 <asp:Button ID="btnSave" runat="server" Text="Lưu lại" OnClick="btnSave_Click" 
                                     Width="80px" ValidationGroup="ad">
                    </asp:Button> </td>
                        
                        </tr>
                        <tr>
                            <td class="style6">
                                &nbsp;</td>
                            <td class="style16" colspan="3">
                                &nbsp;</td>
                    
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
