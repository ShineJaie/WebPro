<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>登录页面</title>

    <link rel="shortcut icon" href="<c:url value='/resource/images/favicon.ico'/>">

    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/resource/dependency/bootstrap/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resource/loginsrc/css/font-awesome.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resource/loginsrc/css/form-elements.css'/>">
    <link rel="stylesheet" href="<c:url value='/resource/loginsrc/css/style.css'/>">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="<c:url value='/resource/dependency/js/html5shiv.min.js'/>"></script>
    <script src="<c:url value='/resource/dependency/js/respond.min.js'/>"></script>
    <![endif]-->

</head>

<body>

<!-- Top content -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong>Bootstrap</strong> 登录表单</h1>

                    <div class="description">
                        <p>
                            欢迎来到 Shine Jaie 的个人网站系统
                        </p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <h3>用户登录</h3>

                            <p>请输入用户名和密码:</p>
                        </div>
                        <div class="form-top-right">
                            <i class="fa fa-lock"></i>
                        </div>
                    </div>

                    <div class="form-bottom">

                        <c:if test="${not empty error}">
                            <div class="text-center text-danger lead">${error}</div>
                        </c:if>
                        <c:if test="${not empty msg}">
                            <div class="text-center text-danger lead">${msg}</div>
                        </c:if>

                        <form class="login-form" action="<c:url value='/j_spring_security_check'/>"
                              method='POST' role="form">
                            <div class="form-group">
                                <label class="sr-only" for="form-username">用户名</label>
                                <input type="text" name="username" placeholder="用户名..."
                                       class="form-username form-control" id="form-username">
                            </div>
                            <div class="form-group">
                                <label class="sr-only" for="form-password">密码</label>
                                <input type="password" name="password" placeholder="密码..."
                                       class="form-password form-control" id="form-password">
                            </div>
                            <button type="submit" class="btn">登录</button>

                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                        </form>
                    </div>
                </div>
            </div>
            <%--<div class="row">
                <div class="col-sm-6 col-sm-offset-3 social-login">
                    <h3>...或通过以下方式登录:</h3>

                    <div class="social-login-buttons">
                        <a class="btn btn-link-2" href="javascript:;">
                            <i class="fa fa-qq"></i> QQ
                        </a>
                        <a class="btn btn-link-2" href="javascript:;">
                            <i class="fa fa-github"></i> Github
                        </a>
                        <a class="btn btn-link-2" href="javascript:;">
                            <i class="fa fa-google-plus"></i> Google Plus
                        </a>
                    </div>
                </div>
            </div>--%>
        </div>
    </div>

</div>


<!-- Javascript -->
<script src="<c:url value='/resource/dependency/js/jquery.min.js'/>"></script>
<script src="<c:url value='/resource/dependency/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resource/loginsrc/js/jquery.backstretch.min.js'/>"></script>
<script src="<c:url value='/resource/loginsrc/js/scripts.js'/>"></script>

<!--[if lt IE 10]>
<script src="<c:url value='/resource/loginsrc/js/placeholder.js'/>"></script>
<![endif]-->

</body>
</html>
