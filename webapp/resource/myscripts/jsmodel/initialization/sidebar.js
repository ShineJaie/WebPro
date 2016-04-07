/**
 * 初始侧边栏
 *
 */
define(['jquery', 'bootstrap', 'config', 'nprogress'], function ($, bootstrap, config, NProgress) {

    /**
     * 初始化侧边栏
     *
     */
    var initPart = function () {

        var $target = $('#jsidebar-wrapper-outer');
        var sideUrl = config.urlConfig.sidebarUrl;

        NProgress.start();

        $($target).load(sideUrl, {}, function () {

            initSideAction();

            gotoPageAction();

            NProgress.done();
        });
    };

    /**
     * 添加页面跳转事件
     *
     */
    var gotoPageAction = function () {

        // 阻止下拉按钮 a 标签的原始行为
        $('#jsidebar-wrapper-outer').off('click', '.dropdown-toggle').on('click', '.dropdown-toggle', function (e) {
            e.preventDefault();
        });

        // Avoid bootstrap dropdown menu close on click inside
        perfectDropdown();

        NProgress.start();

        $('#jsidebar-wrapper-outer').off('click', '.btn-jmenu').on('click', '.btn-jmenu', function (e) {

            window.doHistory = false; // 当点击页面按钮时，不触发 history 操作

            // 阻止 a 标签的默认行为
            e.preventDefault();

            var $this = $(this);

            /*------------------begin 实现菜单按钮激活效果-----------------*/
            // 获取伪元素的属性值
            //var div=document.querySelector('li:nth-child(2)');
            //console.log($this.parent()[0], div);

            // 1, 高亮选中
            var cssAttr = window.getComputedStyle($this.parent()[0], '::before').getPropertyValue('background-color');
            $('.btn-jmenu').css('background-color', '');
            $this.css('background-color', cssAttr);

            // 2, 关闭其它的多级菜单
            // 2.1, 关闭侧边栏其它多级菜单
            $('.jsidebar-dropdown').removeClass('open');
            // 2.2, 打开点击所在的菜单
            $this.parents('.jsidebar-dropdown').addClass('open');
            // 2.3, 关闭栏部栏选中效果
            $('.btn-jmenu-top').closest('li').removeClass('active');

            /*------------------end 实现菜单按钮激活效果--------------------*/

            /*------------------------------------------------*/
            /* 1, funcModel 引用的模块                          */
            /* 2, funcInit  加载页面的函数                       */
            /*------------------------------------------------*/
            if ($this.attr('funcModel') && $this.attr('funcInit')) {

                var funcModel = $this.attr('funcModel');
                var funcInit = $this.attr('funcInit');

                require([funcModel], function (model) {
                    model[funcInit]();
                });
            }

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
        $('.jsidebar-dropdown a').off('click').on('click', function (e) {

            $(this).parent('.jsidebar-dropdown').toggleClass('open');
        });

        // 2, Listening the clicks outside of the dropdown to close it like this :
        /*$('#sidebar-wrapper').off('click', '.btn-jmenu').on('click', '.btn-jmenu', function (e) {
         console.log('remove active');
         $('li.dropdown.jsidebar-dropdown').removeClass('open');
         });*/

        /*$("#sidebar-wrapper .btn-jmenu").not(".jsidebar-dropdown .btn-jmenu").off('click').on('click', function () {
         $('li.dropdown.jsidebar-dropdown').removeClass('open');
         });*/

    };

    /**
     * 侧边栏开关动作
     *
     */
    var initSideAction = function () {

        var $trigger = $('.hamburger');
        var $wrapper = $('#wrapper');
        var isClosed = false; // 侧边栏开关效果

        // 汉堡按钮动作
        $trigger.off('click').on('click', function () {

            if (isClosed == true) {  // 关闭
                $wrapper.removeClass('toggled');
                $trigger.removeClass('is-open');
                $trigger.addClass('is-closed');
                isClosed = false;
            } else { // 打开
                $wrapper.addClass('toggled');
                $trigger.removeClass('is-closed');
                $trigger.addClass('is-open');
                isClosed = true;
            }

        });
    };

    /*-----------------------------------------------------*/

    require(['domReady'], function (domReady) {
        domReady(function () {
            console.log('init sidebar');
            initPart();
        });
    });

});