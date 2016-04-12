define(['jquery', 'bootstrap', 'config', 'jquery.history', 'nprogress', 'sweetalert', 'jstree'],
    function ($, bootstrap, config, History, NProgress, sweetalert, jstree) {

        var initpage_jstreedemo = function () {

            NProgress.start();

            $('#page-content-wrapper-outer').load(config.urlConfig.jstreeDemoUrl, {}, function () {

                config.setBrowserHistory('jstree_demo', 'initpage_jstreedemo', 'sidebar_jstreedemo',
                    'jstree demo', config.urlConfig.jstreeDemoUrl.split(' ')[0]);

                initJsTree1();
                initJsTree2();
                initJsTree3();
                initJsTree4();
                initJsTree5();
                initJsTree6();

                NProgress.done();
            });
        };

        var initJsTree1 = function () {

            $('#jstree').jstree({
                // 不依赖插件的配置
                "core": {
                    "themes": {
                        "variant": "large"
                    },
                    "animation": 200, // tree 打开/关闭动画的时间, 默认 200 毫秒, false: 禁用.
                    "multiple": false // 取消多选
                },
                "checkbox": {
                    "keep_selected_style": false
                },
                // 字符串数组, 指定插件需要激活的实例
                "plugins": ["wholerow", "checkbox"]
            });

            $('#jstree').on("changed.jstree", function (e, data) {
                console.log(data.selected);
            });

            $('.dbtn-jstree').on('click', function () {
                $('#jstree').jstree(true).select_node('child_node_1');
                $('#jstree').jstree('select_node', 'child_node_1');
                $.jstree.reference('#jstree').select_node('child_node_1');
            });

        };

        var initJsTree2 = function () {
            $('#html1').jstree();
        };

        var initJsTree3 = function () {
            $('#html2').jstree();
        };

        var initJsTree4 = function () {
            $('#html3').jstree({
                'core': {
                    'data': {
                        'url': '/WebPro/upload/data2demo/jstree_nodes.html',
                        'data': function (node) {
                            console.log(node);
                            return {'id': node.id};
                        }
                    }
                }
            });
        };

        var initJsTree5 = function () {
            $('#jsondata1').jstree({
                'core': {
                    'data': [
                        {"id": "ajson1", "parent": "#", "text": "Simple root node"},
                        {"id": "ajson2", "parent": "#", "text": "Root node 2"},
                        {"id": "ajson3", "parent": "ajson2", "text": "Child 1"},
                        {"id": "ajson4", "parent": "ajson2", "text": "Child 2"}
                    ]
                }
            });
        };

        var initJsTree6 = function () {
            $('#jsondata2').jstree({
                'core': {
                    'data': {
                        'url': function (node) {
                            return node.id === '#' ?
                                '/WebPro/upload/data2demo/jstree_roots.json' :
                                '/WebPro/upload/data2demo/jstree_children.json';
                        },
                        'data': function (node) {
                            return {'id': node.id};
                        }
                    }
                }
            });
        };

        return {
            initpage_jstreedemo: initpage_jstreedemo
        }
    }
);