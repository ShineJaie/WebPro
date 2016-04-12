/**
 * 初始顶部栏
 *
 */
define(['jquery', 'bootstrap', 'config', 'sidebar', 'jquery.history', 'nprogress', 'sweetalert'],
    function ($, bootstrap, config, sidebar, history, NProgress, sweetalert) {

        window.doHistory = true;

        /**
         * 初始化顶部栏
         *
         */
        var initPart = function () {

            var $target = $('#jtopbar-wrapper-outer');
            var topUrl = config.urlConfig.topbarUrl;

            NProgress.start();

            $($target).load(topUrl, {}, function () {

                NProgress.done();

                var barTarget = $("#wrapper").attr('bar-btntarget');
                if (barTarget && config.strTrim(barTarget).length > 0) {
                    setBarToActive(barTarget);
                }

                perfectDropdown();

                gotoPageAction();

                registerAction();

                historyAction();

                userinfoAction();

            });
        };

        /**
         * 查看用户信息
         */
        var userinfoAction = function () {

            $('.pa-userinfo').off('click').on('click', function (e) {

                e.preventDefault();

                console.log('查看用户信息');

            });

        };

        /**
         * 浏览器回退、前进事件
         *
         */
        var historyAction = function () {
            // 监听浏览器地址栏的前进和后退事件
            window.History.Adapter.bind(window, 'statechange', function () {

                if (!window.doHistory) {

                    window.doHistory = true;
                    return;
                }

                var state = window.History.getState();

                var funcModel = state['data']['funcModel'];
                var funcInit = state['data']['funcInit'];

                if (funcModel && funcInit &&
                    config.strTrim(funcModel).length > 0 &&
                    config.strTrim(funcInit).length > 0) {

                    var barTarget = state['data']['barTarget'];

                    loadModel(funcModel, funcInit, barTarget);
                }
            });
        };

        /**
         * 注册
         *
         */
        var registerAction = function () {

            $('.go2reg').off('click').on('click', function (e) {

                e.preventDefault();

                loadModel('register', 'initpage_register', null);
            });

        };

        /**
         * 根据加载的页面激活相应顶部栏、侧边栏的效果
         *
         * @param barTarget (bar-btntarget 的属性值)
         */
        var setBarToActive = function (barTarget) {

            /*---------------------顶部栏相关激活效果---begin----------------------*/
            // 1, 清除旧效果
            // 1,1 关闭下拉框
            $('.jtopbar-dropdown').removeClass('open');
            // 1,2 取消按钮的激活效果
            $('.btn-jmenu-top').parents('li').removeClass('active');

            // 获取顶部栏相关 Dom 对象
            var topbarTarget = '.btn-jmenu-top.' + barTarget;

            // 匹配是否为激活目标 +_+
            var pattern = /\w+_\w+/g;
            var isTarget = pattern.test(barTarget);

            if (isTarget && barTarget && $(topbarTarget).length > 0) {
                // 2, 若有选中顶部栏相关组件, 则激活相应效果
                // 2.1, 激活按钮
                $(topbarTarget).parents('li').addClass('active');
                // 2.2, 打开下拉框组件
                $(topbarTarget).parents('.jtopbar-dropdown').addClass('open');
            }
            /*---------------------顶部栏相关激活效果---end----------------------*/

            /*---------------------侧边栏相关激活效果---begin-----------------------*/
            // 1, 清除旧效果
            // 1.1, 关闭下拉框组件
            $('.jsidebar-dropdown').removeClass('open');
            // 1.2, 取消按钮的激活效果
            $('.btn-jmenu').css('background-color', '');


            // 取得侧边栏相关 Dom 对象
            var sidebarTarget = '.btn-jmenu.' + barTarget;

            if (isTarget && barTarget && $(sidebarTarget).length > 0) {
                // 2, 若有选中侧边栏相关组件, 则激活相应效果
                // 2.1, 激活按钮, 效果来自伪元素
                var cssAttr = window.getComputedStyle($(sidebarTarget).parent()[0], '::before').getPropertyValue('background-color');
                $(sidebarTarget).css('background-color', cssAttr);
                // 2.2, 打开下拉框组件
                $(sidebarTarget).parents('.jsidebar-dropdown').addClass('open');

                // 2.3, 打开侧边栏
                if (!$('.hamburger').hasClass('is-open')) {
                    $('.hamburger').trigger('click');
                }
            } else {
                // 1.3, 关闭侧边栏
                if (!$('.hamburger').hasClass('is-closed')) {
                    $('.hamburger').trigger('click');
                }
            }

            /*---------------------侧边栏相关激活效果----end----------------------*/
        };

        /**
         * 添加页面跳转事件
         *
         */
        var gotoPageAction = function () {

            // 阻止下拉框 a 标签的默认行为
            $('#jtopbar-wrapper-outer').off('click', '.dropdown-toggle').on('click', '.dropdown-toggle', function (e) {
                e.preventDefault();
            });

            $('#jtopbar-wrapper-outer').off('click', '.btn-jmenu-top').on('click', '.btn-jmenu-top', function (e) {

                // 阻止 a 标签的默认行为
                e.preventDefault();

                var $this = $(this);

                // 按钮激活效果
                var target = $this.attr('class').split(' ')[0];

                if ($this.attr('funcModel') && $this.attr('funcInit')) {

                    var funcModel = $this.attr('funcModel');
                    var funcInit = $this.attr('funcInit');

                    loadModel(funcModel, funcInit, target);
                }
            });
        };

        /**
         * 加载模块, 已对 hisotry 做过处理
         * @param funcModel 引用的模块
         * @param funcInit 加载页面函数
         * @param target 激活目标
         */
        var loadModel = function (funcModel, funcInit, target) {

            window.doHistory = false;

            NProgress.start();

            /*------------------------------------------------*/
            /* 1, funcModel 引用的模块                          */
            /* 2, funcInit  加载页面的函数                       */
            /*------------------------------------------------*/
            require([funcModel], function (model) {

                model[funcInit]();

                setBarToActive(target);

                NProgress.done();
            });
        };

        /**
         * 解决下拉组件内部点击关闭的问题
         *
         */
        var perfectDropdown = function () {
            //Removing the data attribute data-toggle="dropdown"
            // and implementing the open/close of the dropdown can be a solution.

            // 1, First by handling the click on the link to open/close the dropdown like this :
            $('.dropdown.jtopbar-dropdown a').off('click').on('click', function (e) {

                $(this).parent('.jtopbar-dropdown').toggleClass('open');
            });

            // 2, Listening the clicks outside of the dropdown to close it like this :
            $('body').off('click').on('click', function (e) {

                if (!$('li.dropdown.jtopbar-dropdown').is(e.target) &&
                    $('li.dropdown.jtopbar-dropdown').has(e.target).length === 0 &&
                    $('.open').has(e.target).length === 0
                ) {
                    $('li.dropdown.jtopbar-dropdown').removeClass('open');
                }
            });

        };

        /*-----------------------------------------------------*/

        require(['domReady'], function (domReady) {
            domReady(function () {
                console.log('init topbar');
                initPart();
            });
        });

        return {
            loadModal: loadModel
        }

    });