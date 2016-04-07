(function () {

    var timeoutFlag;

    /**
     * 去除字符串前后空隔, 判断空字符串
     * @param str 内容
     * @returns {*|XML|void|string} string
     */
    var myTrim = function (str) {
        return str.replace(/(^\s+)|(\s+$)/g, "");
    };

    /**
     * 根据 id=myAlert 的 div 构建 bootstrap 警告框
     * 若用户 5 秒后还未点击关闭，则自动关闭
     * @param type 告警类型(数字), 1: success, 2: info, 3: warning, 4: danger.
     * @param info 告警内容
     */
    var myAlert = function (type, info) {
        if (timeoutFlag) {
            clearTimeout(timeoutFlag);
        }
        var className = 'alert-';
        var title = '';
        switch (type) {
            case 1:
                title = '成功!';
                className += 'success';
                break;
            case 2:
                title = '提示!';
                className += 'info';
                break;
            case 3:
                title = '警告!';
                className += 'warning';
                break;
            case 4:
                title = '错误!';
                className += 'danger';
                break;
            default :
                title = '提示!';
                className += 'info';
                break;
        }

        var html = '<div class="alert ' + className + ' alert-dismissible" id="autoClose" role="alert">'
            + '<button type="button" class="close" data-dismiss="alert" aria-label="Close">' +
            '<span aria-hidden="true">&times;</span></button>'
            + '<strong>' + title + '</strong> ' + info + '</div>';

        $('#myAlert').addClass('navbar-fixed-top').empty().append(html);

        timeoutFlag = setTimeout("$('#autoClose').alert('close')", 5000); // 5秒后自动关闭
    };

}());