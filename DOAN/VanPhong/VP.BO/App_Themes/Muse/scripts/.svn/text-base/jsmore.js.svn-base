function SelectAllCheckboxes(spanChk) {

    // Added as ASPX uses SPAN for checkbox

    var oItem = spanChk.children;
    var theBox = (spanChk.type == "checkbox") ?
        spanChk : spanChk.children.item[0];
    xState = theBox.checked;
    elm = theBox.form.elements;

    for (i = 0; i < elm.length; i++)
        if (elm[i].type == "checkbox" &&
            elm[i].id != theBox.id) {
            //elm[i].click();

            if (elm[i].checked != xState)
                elm[i].click();
            //elm[i].checked=xState;

        }
}

function DeleteConfirmation() {
    if (confirm("Are you sure you want to delete selected records ?", "Message") == true)
        return true;
    else
        return false;
}