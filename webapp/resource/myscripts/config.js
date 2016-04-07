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

    return {
        urlConfig: urlConfig,
        strTrim: strTrim,
        setBrowserHistory: setBrowserHistory
    }

});