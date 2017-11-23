function confirmDialog(title, message, image, positivelabel, negativelabel, callback) {
    alertDialog(title, message, image, positivelabel, function () {
        callback(true)
    }, negativelabel, function () {
        callback(false)
    });
}
function alertDialog(title, message, image, ok_text, ok_event, cancel_text, cancel_event) {
    var dialogId = "tips" + new Date().getTime();
    var html = '<div id="' + dialogId + '" class="tip_hidden"><div class="ui-popup-screen ui-overlay-b in"></div>';
    html += '<div class="ui-popup-container pop in ui-popup-active" tabindex="0" style="max-width: 290px;"><div class="mission-dialog ui-popup ui-body-b ui-overlay-shadow ui-corner-all" data-overlay-theme="b" data-theme="b" style="max-width:500px;"><div class="mission-toast1"><div class="toast-title1">';
    if (title != null && title != "") {
        html += '<h1 class="font5 defcolor">' + title + '</h1>';
    }
    if (message != null && message != "") {
        html += '<h2 class="font2 color1">' + message + '</h2>';
    }
    if (image != null && image != "") {
        html += '<div class="toast-pic"><img style="width:240px;min-height:200px" src="' + image + '"/></div>';
    }
    html += '</div>';
    if (ok_text != null && ok_text != "") {
        html += '<div class="continue"><a class="optionConfirm"><h3 class="font1 bgcolor1" style="margin-bottom:8px;">' + ok_text + '</h3></a></div>';
    }
    if (cancel_text != null && cancel_text != "") {
        html += '<div class="giveup"><a class="optionCancel"><h4 class="font1 color2">' + cancel_text + '</h4></a></div>';
    }
    html += '</div></div></div>';

    var popupDialogObj = $(html).appendTo($.mobile.pageContainer);

    $('#' + dialogId + ' .optionConfirm').click(function () {
        $('#' + dialogId).remove();
        ok_event && ok_event();
    });

    $('#' + dialogId + ' .optionCancel').click(function () {
        $('#' + dialogId).remove();
        cancel_event && cancel_event();
    });
    var c_h = $('#' + dialogId + ' .ui-popup-container').height();
    var c_w = $('#' + dialogId + ' .ui-popup-container').width();

    var s_h = $('#' + dialogId + ' .ui-popup-screen').height();
    var s_w = $('#' + dialogId + ' .ui-popup-screen').width();
    var top = (s_h - c_h) / 2;
    var left = (s_w - c_w) / 2;
    $('#' + dialogId + ' .ui-popup-container').attr("style", 'max-width:290px;top:' + top + ';left:' + left)

    popupDialogObj.attr("class", "");

}

