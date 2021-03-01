<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="About.ascx.cs" Inherits="Musicviet.Administrators.Modules.About" %>
<%@ Register TagPrefix="FCKeditorV2" Namespace="FredCK.FCKeditorV2" Assembly="FredCK.FCKeditorV2, Version=2.6.3.22452, Culture=neutral, PublicKeyToken=4f86767c9b519a06" %>
<style type="text/css">
    .style2
    {
        height: 46px;
    }
    .style3
    {
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
                Cập nhật giới thiệu</h2>
            <div class="widget_inside">
                <div class="col_12">
                    <div style="width: 100%; text-align: center">
                         <asp:Label ID="lblError" runat="server" ForeColor="Red" EnableViewState="False" />
                    </div>
                    <table style="width: 100%;">
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
