function initApp() { bindSlideShow(), bindSortProduct(), bindSearchPro() } function bindSlideShow() { $("#dSlideHome").length && $("#dSlideHome").carouFredSel({ prev: "#prevSLHome", next: "#nextSLHome", pagination: "#dPaginghome", auto: !0, scroll: { duration: 700, pauseOnHover: "immediate" } }) } function bindSortProduct() { var t = $(".sortListProducts"); t.length && t.change(chooseSortMethod) } function chooseSortMethod() { var t = $(this).val(); window.location = t } function bindSearchPro() { $("#txtSearchPro").length && $("#txtSearchPro").bind("keypress", PressKey); var t = $("#btnSearchPro"); t.length && t.click(searchProduct) } function searchProduct() { var t = $("#txtSearchPro"); if (t.length && "" != $.trim(t.val())) { var e = encodeURI(t.val()), o = strPathLink + "tim-kiem.html?search=" + e; window.location = o } } function PressKey(t) { var e = t ? t : window.event, o = $("#" + this.id); if (o && ("13" == e.keyCode || "13" == e.which || "13" == e.charCode)) { try { o.click() } catch (t) { } switch (this.id) { case "txtSearchPro": searchProduct() } return !1 } } strPathLink = "http://www.halica.vn/", $(document).ready(initApp);