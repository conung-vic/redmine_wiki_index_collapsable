var DOM;
var Opera;
var IE;
var Firefox;

function do_some(src, evt) {
    if (!Firefox) {
        cls = src.children[1].className;
        if (cls=='open_list') {
            src.children[1].className = 'close_list';
            src.className = 'close_item';
        } else {
            src.children[1].className = 'open_list';
            src.className = 'open_item';
        }
        window.event.cancelBubble = true;
    } else {
        if (evt.eventPhase!=3) {
            cls = src.className;
            if (cls=='open_item') {
                src.childNodes[3].className = 'close_list';
                src.className = 'close_item';
            } else {
                src.childNodes[3].className = 'open_list';
                src.className = 'open_item';
            }
        }
    }
}

function Check() {
    if (!Firefox) {
        window.event.cancelBubble = true;
    }
}

DOM = document.getElementById;
Opera = window.opera && DOM;
IE = document.all && !Opera;
Firefox = navigator.userAgent.indexOf("Gecko") >= 0;