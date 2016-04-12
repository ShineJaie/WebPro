/**
 * 首页
 *
 */
define(['jquery', 'bootstrap', 'config', 'jquery.history', 'nprogress', 'sweetalert'],
    function ($, bootstrap, config, History, NProgress, sweetalert) {

        var initpage_home = function () {

            NProgress.start();

            $('#page-content-wrapper-outer').load(config.urlConfig.homeUrl, {}, function () {

                config.setBrowserHistory('home', 'initpage_home', 'topbar_home', '首页',
                    config.urlConfig.homeUrl.split(' ')[0])

                NProgress.done();
            });
        };

        return {
            initpage_home: initpage_home
        }

    }
);