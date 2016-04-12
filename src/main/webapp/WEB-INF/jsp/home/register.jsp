<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户注册</title>

    <link rel="shortcut icon" href="<c:url value='/resource/images/favicon.ico'/>">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="<c:url value='/resource/dependency/js/html5shiv.min.js'/>"></script>
    <script src="<c:url value='/resource/dependency/js/respond.min.js'/>"></script>
    <![endif]-->

</head>
<body>

<div id="wrapper">

    <!-- Topbar -->
    <div id="jtopbar-wrapper-outer"></div>

    <!-- Sidebar -->
    <div id="jsidebar-wrapper-outer"></div>

    <!-- Page Content -->
    <div id="page-content-wrapper-outer">
        <div id="page-content-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2">
                        <div class="page-header">
                            <div class="alert alert-info" role="alert">
                                <h4>用户注册</h4>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">注册信息</h3>
                            </div>

                            <div class="panel-body">
                                <form id="registerForm" method="post" class="form-horizontal" action="">

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="email">邮箱</label>

                                        <div class="col-sm-5">
                                            <input type="text" class="form-control myEditValue" id="email" name="email"
                                                   placeholder="邮箱"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="username">用户名</label>

                                        <div class="col-sm-5">
                                            <input type="text" class="form-control myEditValue" id="username"
                                                   name="username"
                                                   placeholder="用户名"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="password">登录密码</label>

                                        <div class="col-sm-5">
                                            <input type="password" class="form-control myEditValue" id="password"
                                                   name="password"
                                                   placeholder="登录密码"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label" for="confirmPassword">
                                            确认密码</label>

                                        <div class="col-sm-5">
                                            <input type="password" class="form-control" id="confirmPassword"
                                                   name="confirmPassword" placeholder="确认密码"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-4 control-label">性别</label>

                                        <div class="col-sm-5">
                                            <label class="radio-inline">
                                                <input class="radioMale" type="radio" name="sex" value="1"
                                                       param_value="true">
                                                <span style="padding-left: 5px;">男</span>
                                            </label>
                                            <label class="radio-inline">
                                                <input class="radioFemale" type="radio" name="sex" value="0">
                                                <span style="padding-left: 5px;">女</span>
                                            </label>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-5 col-sm-offset-4">
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" id="agree" name="agree" value="agree"/>
                                                    接受我们的相关规定
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-sm-9 col-sm-offset-4">
                                            <button type="button" class="btn btn-primary dbtn-confirm" alue="确定">确定
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->
</div>
<script src="<c:url value='/resource/dependency/requirejs/require.js'/>"></script>

<script>
    require(['<c:url value="/resource/myscripts/main.js"/>'], function (main) {
        require(['domReady', 'register'], function (domReady, register) {
            domReady(function () {
                register.initpage_register();
            });
        });
    });
</script>
</body>
</html>