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

<div id="wrapper" bar-btntarget="sidebar_addnews">

    <!-- Topbar -->
    <div id="jtopbar-wrapper-outer"></div>

    <!-- Sidebar -->
    <div id="jsidebar-wrapper-outer"></div>

    <!-- Page Content -->
    <div id="page-content-wrapper-outer">
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <ol class="breadcrumb">
                    <li><a href="#">新闻资讯</a></li>
                    <li class="active">添加资讯</li>
                </ol>

                <div class="row">
                    <div id="summernote"></div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                        <button class="btn btn-default btn-destory-editor">销毁编辑器</button>
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-primary btn-getcontent-editor">获取内容</button>
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-info btn-setcontent-editor">设置内容</button>
                    </div>
                </div>

                <div class="row" style="margin-top: 15px;">
                    <button id="edit" class="btn btn-primary btn-openedit" type="button">Edit 1</button>
                    <button id="save" class="btn btn-primary btn-saveedit" type="button">Save 2</button>
                    <div class="click2edit">click2edit</div>
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
        require(['domReady', 'news'], function (domReady, news) {
            domReady(function () {
                news.initpage_addnews();
            });
        });
    });
</script>

</body>
</html>