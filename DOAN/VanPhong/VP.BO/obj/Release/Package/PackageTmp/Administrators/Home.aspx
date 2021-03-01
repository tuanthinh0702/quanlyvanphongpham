<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Home" Theme="Muse" %>
<%@ Register src="Controls/Sidebar.ascx" tagname="Sidebar" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
        <title>Trang quản trị trienlong.com</title>
     <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css"
              rel="stylesheet" type="text/css" />
        <script src="Script/jquery-1.8.2.js" type="text/javascript"></script>
        <script src="Script/jquery.MultiFile.js" type="text/javascript"></script>
        </head>
    <body class="full_width">
        <form id="form1" runat="server">
            <asp:ScriptManager runat="server" ID="scripts"></asp:ScriptManager>
            <div id="sidebar" class="mobile-hide">
                <div id="faux_header">
                    <a href="#" id="logo">TRIENLONG.COM</a>
                </div>
                <uc1:Sidebar ID="Sidebar1" runat="server" />
                </div>
            <div id="wrap" class="sidebarred">
                <div id="main">
                    <header class="container">
                        <div class="row clearfix">

                            <div class="left mobile-only">
                                <a href="#" id="logo">TRIENLONG.COM</a>
                            </div>

                            <div class="right">

                                <ul id="toolbar">
                                    <li><span>Chào bạn</span> <a class="user" href="Home.aspx?module=User"><asp:Literal ID="ltrUser" runat="server"></asp:Literal> </a> | [<asp:LinkButton 
                                            ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Thoát</asp:LinkButton>]</li>
                                   
                                </ul>
                                </div>
                         </div>
                    </header>
            <asp:PlaceHolder runat="server" ID="pnCOntent"></asp:PlaceHolder>
            </div>
                <!--container -->
            </div>
         </form>
    </body>
</html>
