/**
 * 基础配置
 *
 */
define(['jquery', 'bootstrap'], function ($, bootstrap) {
    console.log('init config');

    /**
     * 网站 url 配置
     *
     */
    var urlConfig = {

        sidebarUrl: '/WebPro/common/sidebar #jsidebar-wrapper', // 侧边栏
        topbarUrl: '/WebPro/common/topbar #jtopbar-wrapper', // 顶部栏

        homeUrl: '/WebPro/home #page-content-wrapper', // 首页
        registerPageUrl: '/WebPro/register/page #page-content-wrapper', // 注册页面
        usersListPageUrl: '/WebPro/admin/userslist/page #page-content-wrapper', // 用户列表页面
        addNewsPageUrl: '/WebPro/addnews/page #page-content-wrapper', // 用户列表页面

        // demo
        jstreeDemoUrl: '/WebPro/demo/jstree/page #page-content-wrapper' // jstree

    };

    /**
     * 去除字符串前后空隔
     * @param str 字符串
     * @returns {*|XML|void|string} string
     */
    var strTrim = function (str) {

        return str.replace(/(^\s+)|(\s+$)/g, "");
    };

    /**
     * 设置浏览器地址
     * @param funcModel 模块名
     * @param funcInit 模块初始化方法
     * @param barTarget 对应菜单的激活属性值
     * @param title 网页标题
     * @param url 页面地址
     */
    var setBrowserHistory = function (funcModel, funcInit, barTarget, title, url) {

        // 设置浏览器历史操作
        window.History.pushState({
            funcModel: funcModel,
            funcInit: funcInit,
            barTarget: barTarget
        }, title, url);

        window.doHistory = true;
    };

    /**
     * jQuery.ajax 的全局配置<br/>
     * statusCode 参数用来做这件事再好不过了, <br/>
     * 而且重要的是, 即使 ajax 代码中禁用了全局配置(global:false),<br/>
     * 关于 statusCode 的配置都仍然有效(这点对我们之前项目中来说很重要, 因为有很多的 ajax 都禁用了全局的遮罩效果)
     */
    var setAjaxSetup = function () {
        console.log('init ajaxSetup');

        $.ajaxSetup({
            statusCode: {
                500: function (jqXHR) {
                    var htmlText = jqXHR.responseText;
                    document.write(htmlText);
                    document.close();

                    window.history.pushState(null, null, "/WebPro/500");
                    //window.location.href = url;
                },
                404: function (jqXHR) {
                    var htmlText = jqXHR.responseText;
                    document.write(htmlText);
                    document.close();

                    window.history.pushState(null, null, "/WebPro/404");
                    //window.location.href = url;
                },
                499: function () {
                    window.location.href='/WebPro/login?status=invalid';
                }
            }
        });
    };
    setAjaxSetup();


    return {
        urlConfig: urlConfig,
        strTrim: strTrim,
        setBrowserHistory: setBrowserHistory
    }

});