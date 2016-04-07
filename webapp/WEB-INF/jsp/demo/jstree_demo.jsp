<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>首页</title>

    <link rel="shortcut icon" href="<c:url value='/resource/images/favicon.ico'/>">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="<c:url value='/resource/dependency/js/html5shiv.min.js'/>"></script>
    <script src="<c:url value='/resource/dependency/js/respond.min.js'/>"></script>
    <![endif]-->

</head>
<body>

<div id="wrapper" bar-btntarget="sidebar_jstreedemo">

    <!-- Topbar -->
    <div id="jtopbar-wrapper-outer"></div>

    <!-- Sidebar -->
    <div id="jsidebar-wrapper-outer"></div>

    <!-- Page Content -->
    <div id="page-content-wrapper-outer">
        <div id="page-content-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <h1 class="text-primary">Js Tree
                            <small class="text-danger">Demo</small>
                        </h1>
                    </div>
                </div>

                <div class="row" style="margin-top: 15px;">
                    <div class="text-center"><h3 class="text-info">一、使用 html 填充树</h3></div>
                    <div class="col-md-3">
                        <p class="text-success">初始实例1</p>
                        <!-- setup a container element -->
                        <div id="jstree">
                            <!-- in this example the tree is populated from inline HTML -->
                            <ul>
                                <li>Root node 1
                                    <ul>
                                        <li id="child_node_1">Child node 1</li>
                                        <li>Child node 2</li>
                                    </ul>
                                </li>
                                <li>Root node 2</li>
                            </ul>
                        </div>
                        <button class="btn btn-info dbtn-jstree">demo button</button>
                    </div>

                    <div class="col-md-3">
                        <p class="text-success">实例2, 普通的无序列表变成一颗树</p>

                        <div id="html1">
                            <ul>
                                <li class="jstree-open" id="node_1">Root node 1
                                    <ul>
                                        <li>Child node 1</li>
                                        <li><a class="jstree-clicked" href="#">Child node 2</a></li>
                                    </ul>
                                </li>
                                <li>Root node 2</li>
                            </ul>
                        </div>

                        <p>javascript: <code>$('#html1').jstree();</code></p>
                    </div>

                    <div class="col-md-3">
                        <p class="text-success">实例3, 设置初始状态和属性</p>

                        <div id="html2">
                            <ul>
                                <li data-jstree='{"opened":true,"selected":true}'>Root
                                    <ul>
                                        <li data-jstree='{"disabled":true}'>Child</li>
                                        <li data-jstree='{"icon":"<c:url value='/upload/data2demo/tree.png'/>"}'>
                                            Child
                                        </li>
                                        <li data-jstree='{"icon":"glyphicon glyphicon-leaf"}'>
                                            Child
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>

                        <p>javascript: <code>$('#html2').jstree();</code></p>
                    </div>

                    <div class="col-md-3">
                        <p class="text-success">实例4, 使用 AJAX 加载</p>

                        <div id="html3">

                        </div>

                        <p>数据配置: <code>$.jstree.defaults.core.data</code></p>
                    </div>

                </div>

                <div class="row" style="margin-top: 15px;">
                    <div class="text-center"><h3 class="text-warning">二、使用 json 数据填充树</h3></div>
                    <div class="col-md-6">
                        <p class="text-success">1, 使用 json 数据</p>

                        <div id="jsondata1">

                        </div>

                        <p>json 字符串.</p>
                    </div>

                    <div class="col-md-6">
                        <p class="text-success">2, 使用 ajax 请求 json 数据</p>

                        <div id="jsondata2">

                        </div>

                        <p>可按需返回额外自定义的数据, 供自己使用.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /#page-content-wrapper -->

</div>
<!-- /#wrapper -->

<script src="<c:url value='/resource/dependency/requirejs/require.js'/>"></script>

<script>
    require(['<c:url value="/resource/myscripts/main.js"/>'], function (main) {
        require(['domReady', 'jstree_demo'], function (domReady, jstree_demo) {
            domReady(function () {
                jstree_demo.initpage_jstreedemo();
            });
        });
    });
</script>

</body>
</html>