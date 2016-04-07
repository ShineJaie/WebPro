// 创建立即调用函数表达式来包装我们的代码
(function () {

    /**
     * 动态加载 javascript 文件
     *
     * @param url js 所在的相对路径
     * @param callback 回调函数
     */
    this.sjLoadScript = function (url, callback) {


        var script = document.createElement("script");
        script.type = "text/javascript";

        // 绑定事件到回调函数, 处理浏览器兼容性问题
        if (script.readyState) {  //IE
            script.onreadystatechange = function () {
                if (script.readyState == "loaded" ||
                    script.readyState == "complete") {
                    script.onreadystatechange = null;
                    // 判断 callback 是函数时再执行回调函数
                    if (callback && typeof callback === "function") {
                        callback();
                    }
                }
            };
        } else {  //Others
            script.onload = function () {
                if (callback && typeof callback === "function") {
                    callback();
                }
            };
        }

        script.src = url;
        document.getElementsByTagName("head")[0].appendChild(script);
    }

}());
