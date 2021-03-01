<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Slider.ascx.cs" Inherits="Musicviet.Administrators.Modules.Slider" %>
<%@ Register TagPrefix="FCKeditorV2" Namespace="FredCK.FCKeditorV2" Assembly="FredCK.FCKeditorV2, Version=2.6.3.22452, Culture=neutral, PublicKeyToken=4f86767c9b519a06" %>
<style type="text/css">
    .style1
    {
        height: 40px;
    }
    .style2
    {
        height: 46px;
    }
    .style3
    {
        width: 675px;
    }
    .style4
    {
        height: 40px;
        width: 675px;
    }
    .style5
    {
        height: 46px;
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
</style>
<div class="container" id="actualbody">
    <div class="row">
        <div class="widget clearfix">
            <h2>
                Cập nhật Slider</h2>
            <div class="widget_inside">
                <div class="col_12">
                    <div style="width: 100%; text-align: center">
                         <asp:Label ID="lblError" runat="server" ForeColor="Red" EnableViewState="False" />
                    </div>
                    <table style="width: 100%;">
                        <tr>
                            <td class="style6">
                                Tên Slider</td>
                            <td class="style3">
                                <asp:TextBox ID="txtName" 
                                    runat="server" Height="25px" Width="320px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txtName" ErrorMessage="*" ForeColor="Red" 
                                    ValidationGroup="ad"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                Mô tả</td>
                            <td class="style3">
                                <FCKeditorV2:FCKeditor ID="txtDetailText" BasePath="fckeditor/"  runat="server" Width="600" Height="300" >
                    </FCKeditorV2:FCKeditor></td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style6">
                                Link(http://...)</td>
                            <td class="style3">
                                <asp:TextBox ID="txtLink" runat="server" Height="25px" Width="320px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="txtLink" ErrorMessage="*" ForeColor="Red" 
                                    ValidationGroup="ad"></asp:RequiredFieldValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style6">
                                Ảnh đại diện</td>
                            <td class="style3">
                                <asp:Image ID="img1" runat="server" AlternateText="" Width="85" Height="80" />
                                &nbsp;
                                <asp:Label ID="lblImg1" runat="server" Font-Italic="true" ForeColor="#ffffff" 
                                    Text="<%=imageName %>"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style7">
                                </td>
                            <td class="style4">
                               <asp:FileUpload ID="upImg1" runat="server" EnableViewState="true" /><asp:LinkButton
                        ID="lbtnImg1" runat="server" OnClick="lbtnImg1_Click">[Upload]</asp:LinkButton>
                            &nbsp;</td>
                            <td class="style1">
                                </td>
                        </tr>
                             <tr>
                            <td class="style6">
                                Kiểu chuyển động:</td>
                            <td class="style3">
                                <asp:DropDownList ID="ddlCategory" runat="server" Width="253" >
                                <asp:ListItem Value="0">Kiểu</asp:ListItem>
                                <asp:ListItem Value="cubeSize">cubeSize</asp:ListItem>
                                <asp:ListItem Value="cube">cube</asp:ListItem>
                                <asp:ListItem Value="cubeStop">cubeStop</asp:ListItem>
                                <asp:ListItem Value="cubeRandom">cubeRandom</asp:ListItem>
                                <asp:ListItem Value="showBars">showBars</asp:ListItem>
                                <asp:ListItem Value="horizontal">horizontal</asp:ListItem>               
                                </asp:DropDownList>
                              </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style8">
                                </td>
                            <td class="style5">
                                 <asp:Button ID="btnSave" runat="server" Text="Lưu lại" OnClick="btnSave_Click" 
                                     Width="80px" ValidationGroup="ad">
                    </asp:Button> </td>
                            <td class="style2">
                                </td>
                        </tr>
                   
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
