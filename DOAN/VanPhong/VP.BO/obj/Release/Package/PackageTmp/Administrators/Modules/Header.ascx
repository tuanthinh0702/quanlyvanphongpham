<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="Musicviet.Administrators.Modules.Header" %>
<%@ Register TagPrefix="FCKeditorV2" Namespace="FredCK.FCKeditorV2" Assembly="FredCK.FCKeditorV2, Version=2.6.3.22452, Culture=neutral, PublicKeyToken=4f86767c9b519a06" %>
<div class="container" id="actualbody">
    <div class="row">
        <div class="widget clearfix">
            <h2>
                Cập nhật logo</h2>
            <div class="widget_inside">
                <div class="col_12">
                    <div style="width: 100%; text-align: center">
                         <asp:Label ID="lblError" runat="server" ForeColor="Red" EnableViewState="False" />
                    </div>
                    <table style="width: 100%;">
                        <tr>
                            <td class="style6">
                                Ảnh thay thế</td>
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
                            </td>
                            <td class="style1">
                                </td>
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
                        <tr>
                            <td class="style6">
                                &nbsp;</td>
                            <td class="style3">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>