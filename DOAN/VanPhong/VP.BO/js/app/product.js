$(document).ready(initProd);
function initProd() {
    if ($("#ulListThumbPhoto").length && $("#ulListThumbPhoto a").length > 0) {
        $("#ulListThumbPhoto a").hover(bindZoomHover);
    }
};

function bindZoomHover() {
    var srcImg = $(this).find("img").attr("src");
    $("#zoom1").attr("href", srcImg.replace("/Small/", "/Zoom/"));
    $("#zoom1").children("img").attr("src", srcImg.replace("/Zoom/", "/Large/"));
    
    var imgHover = new Image();
    imgHover.src = srcImg.replace("/Small/", "/Zoom/");
    zoomImage = imgHover;
};