requirejs.config({
    // RequireJS 通过一个相对的路径 baseUrl 来加载所有代码.
    // baseUrl 通常被设置成 data-main 属性.
    baseUrl: '/WebPro/resource',
    urlArgs: "bust=" + (new Date()).getTime(), // 有利于开发模式, 但正式部署前一定要删除.
    waitSeconds: 20, // 设置加载脚本的超时为20秒, 默认7秒
    // 配置 css 依赖, 直接在 shim 的 deps 节点配置需要的 css 文件
    // 以 css! 开头, 路径为相对路径
    shim: {
        // 只能用 shim 配置非 AMD 脚本, 并且脚本没有 define().
        // 注意: jquery 已经注册为一个 AMD 异常模块, 所以这里配置对 jquery 无效.
        'bootstrap': {
            deps: [
                'jquery',
                'css!../resource/dependency/bootstrap/css/bootstrap.min.css',
                'css!../resource/dependency/fontawesome/css/font-awesome.min.css',
                'css!../resource/mycss/globallayout.css'
            ]
            // exports 对于 bootstrap 不需要.
            // 因为 bootstrap 的所有 js 代码都已经作为 jquery 插件在 jquery 闭包中执行, 没有东西需要输出.
        },

        'sweetalert': {
            deps: ['css!../resource/dependency/sweetalert/dist/sweetalert.css']
        },

        'nprogress': {
            deps: ['css!../resource/dependency/nprogress/nprogress.css'],
            exports: 'NProgress'
        },

        'jstree': {
            deps: ['css!../resource/dependency/jstree/dist/themes/default/style.min.css'],
            exports: 'jstree'
        },

        'datatables': {
            deps: ['css!../resource/dependency/datatables/media/css/dataTables.bootstrap.min.css'],
            exports: 'datatables'
        },
        'dataTables.colReorder': {
            deps: ['css!../resource/dependency/colreorder/css/colReorder.bootstrap.min.css']
        },

        'icheck': {
            deps: ['css!../resource/dependency/icheck/skins/flat/blue.css'],
            exports: 'iCheck'
        },

        'jquery.validate': {
            deps: ['jquery']
        },

        'summernote': {
            deps: ['css!../resource/dependency/summernote/summernote.css'],
            exports: 'summernote'
        },
        'summernote-lang': {
            deps: ['summernote']
        },

        'ueditor.all': {
            deps: [
                'ZeroClipboard',
                'ueditor.config',
                'css!ueditor/themes/default/css/ueditor.min.css'
            ],
            exports: 'UE',
            init: function (ZeroClipboard) {
                //导出到全局变量, 供 ueditor 使用
                window.ZeroClipboard = ZeroClipboard;
            }
        },
        'ueditor.parse': {
            deps: ['ueditor.all']
        }

    },
    map: {
        '*': {
            'css': 'dependency/requirecss/css' // 配置 require-css, 实现 css! 功能
        }
    },
    // 第三方脚本模块的别名, jquery 比 libs/jquery.min.js 简洁明了.
    paths: {
        // requirejs 判断 DOM 加载完毕插件
        'domReady': 'dependency/requirejs/domReady',

        'jquery': 'dependency/js/jquery.min',
        'jquery-ui': 'dependency/js/jquery-ui.min',

        'bootstrap': 'dependency/bootstrap/js/bootstrap.min',

        // history.js
        'jquery.history': 'dependency/historyjs/scripts/bundled/html4+html5/jquery.history',

        // jquery.validate 表单验证插件配置
        'jquery.validate': 'dependency/jqueryvalidation/dist/jquery.validate.min',

        // jquery-file-upload 文件上传配置
        'jquery.ui.widget': 'dependency/jqueryfileupload/js/vendor/jquery.ui.widget', // The jQuery UI widget factory, can be omitted if jQuery UI is already included
        'jquery.iframe-transport': 'dependency/jqueryfileupload/js/jquery.iframe-transport', // he Iframe Transport is required for browsers without support for XHR file uploads
        'jquery.fileupload': 'dependency/jqueryfileupload/js/jquery.fileupload', // he basic File Upload plugin

        // ueditor 百度富文本编辑器配置
        'ueditor.all': 'dependency/ueditor/ueditor.all.min', // 编辑器源文件,
        'ueditor.config': 'dependency/ueditor/ueditor.config', // 配置文件
        'ueditor.parse': 'dependency/ueditor/ueditor.parse.min', // 数据展示解析插件
        'ZeroClipboard': 'dependency/ueditor/third-party/zeroclipboard/ZeroClipboard.min',

        // sweetalert
        'sweetalert': 'dependency/sweetalert/dist/sweetalert.min',

        // nprogress
        'nprogress': 'dependency/nprogress/nprogress',

        // jstree
        'jstree': 'dependency/jstree/dist/jstree.min',

        // DataTables
        'datatables.net': 'dependency/datatables/media/js/jquery.dataTables.min',
        'datatables': 'dependency/datatables/media/js/dataTables.bootstrap.min',
        // datatables 拖拽插件
        'dataTables.colReorder': 'dependency/colreorder/js/dataTables.colReorder.min',

        // icheck
        'icheck': 'dependency/icheck/icheck.min',

        // summernote
        'summernote': 'dependency/summernote/summernote.min',
        'summernote-lang': 'dependency/summernote/lang/summernote-zh-CN',

        'config': 'myscripts/config', // 网站基础配置

        'listtable': 'myscripts/utils/listtable', // 有关列表的的工具
        'popupdialog': 'myscripts/utils/popupdialog', // 有关弹出框工具

        // 加载侧边栏模块
        'sidebar': 'myscripts/jsmodel/initialization/sidebar',
        'topbar': 'myscripts/jsmodel/initialization/topbar',

        'home': 'myscripts/jsmodel/home/home', // 首页
        'register': 'myscripts/jsmodel/home/register', // 用户注册
        'users': 'myscripts/jsmodel/users/users', // 用户管理
        'news': 'myscripts/jsmodel/news/news', // 新闻资讯

        // demo
        'jstree_demo': 'myscripts/jsmodel/demo/jstree_demo' // jstree

    }
});

/**
 * 初始化页面布局
 */
define(['config', 'jquery', 'bootstrap', 'sidebar', 'topbar'], function (config, $, bootstrap, sidebar, topbar) {

});