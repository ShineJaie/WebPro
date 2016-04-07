<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>侧边栏</title>

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
    <div id="jtopbar-wrapper-outer">
        <div id="jtopbar-wrapper">
            <nav class="navbar navbar-default navbar-inverse" id="topbar-wrapper" role="navigation">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                data-target="#bs-topbar-navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="topbar_home navbar-brand btn-jmenu-top" href="<c:url value='/home'/>"
                           funcModel="home" funcInit="initpage_home">
                            <i class="fa fa-rocket"></i>&nbsp; Shine Jaie</a>
                    </div>

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-topbar-navbar-collapse">
                        <ul class="nav navbar-nav">
                            <li>
                                <a class="topbar_home btn-jmenu-top"
                                   funcModel="home" funcInit="initpage_home"
                                   href="<c:url value='/home'/>">
                                    <i class="fa fa-home"></i>&nbsp; 首页</a>
                            </li>
                            <li><a class="btn-jmenu-top" href="#">研究</a></li>
                            <li class="dropdown jtopbar-dropdown">
                                <a href="#" class="dropdown-toggle">你懂得
                                    <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a class="btn-jmenu-top" href="#">Java</a></li>
                                    <li><a class="btn-jmenu-top" href="#">JavaScript</a></li>
                                    <li><a class="btn-jmenu-top" href="#">Bootstrap</a></li>
                                    <li class="divider"></li>
                                    <li><a class="btn-jmenu-top" href="#">MySQL</a></li>
                                    <li class="divider"></li>
                                    <li><a class="btn-jmenu-top" href="#">Redis</a></li>
                                </ul>
                            </li>
                        </ul>

                        <div class="navbar-form navbar-left">
                            <div class="form-group">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="全局搜索">

                                    <div class="input-group-btn">
                                        <button class="btn btn-block"><i class="fa fa-search"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="nav navbar-nav navbar-right">

                            <sec:authorize access="hasRole('ROLE_USER')">

                                <c:url value="/j_spring_security_logout" var="logoutUrl"/>

                                <form class="navbar-right" action="${logoutUrl}" method="post">
                                    <p class="navbar-text"><i class="fa fa-user"></i>&nbsp; 用户名:
                                        <a class="navbar-link pa-userinfo" href="#"
                                           style="padding-left: 5px;">
                                                ${pageContext.request.userPrincipal.name}</a>
                                    </p>

                                    <p class="navbar-text" style="color: #d2d2d2; padding-left: 5px;">|</p>

                                    <a class="btn btn-link" type="submit" style="padding-top: 15px;"
                                       href="${logoutUrl}"><i class="fa fa-leaf"></i>&nbsp; 安全退出</a>

                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                </form>

                                <p class="navbar-text navbar-right" style="color: #d2d2d2; padding-left: 5px;">|</p>

                                <a class="btn btn-link go2reg" style="padding-top: 15px"
                                   href="<c:url value='/register/page'/>">
                                    <i class="fa fa-registered"></i>&nbsp; 用户注册
                                </a>
                            </sec:authorize>

                        </div>
                        <!-- /.navbar-collapse -->
                    </div>
                    <!-- /.container-fluid -->
                </div>
            </nav>
        </div>
    </div>
    <!-- /#topbar-wrapper -->

    <!-- Sidebar -->
    <div id="jsidebar-wrapper-outer"></div>

    <%--<div class="overlay"></div>--%>

    <!-- Page Content -->
    <div id="page-content-wrapper-outer">
        <div id="page-content-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <h1>孙子兵法 始计篇</h1>

                        <p>始计篇</p>

                        <p>故经之以五事，校之以计而索其情：一曰道，二曰天，三曰地，四曰将，五曰法。
                            道者，令民与上同意也，故可以与之死，可以与之生，而不畏危。天者，阴阳、寒暑、时制也。地者，远近、险易、广狭、死生也。
                            将者，智、信、仁、勇、严也。法者，曲制、官道、主用也。凡此五者，将莫不闻，知之者胜，不知者不胜。
                            故校之以计而索其情，曰：主孰有道？将孰有能？天地孰得？法令孰行？兵众孰强？士卒孰练？赏罚孰明？吾以此知胜负矣。</p>

                        <p>将听吾计，用之必胜，留之；将不听吾计，用之必败，去之。</p>

                        <p>计利以听，乃为之势，以佐其外。势者，因利而制权也。兵者，诡道也。故能而示之不能，用而示之不用，近而示之远，远而示之近；
                            利而诱之，乱而取之，实而备之，强而避之，怒而挠之，卑而骄之，佚而劳之，亲而离之。攻其无备，出其不意。此兵家之胜，不可先传也。</p>

                        <p>　夫未战而庙算胜者，得算多也；未战而庙算不胜者，得算少也。多算胜，少算不胜，而况于无算乎！吾以此观之，胜负见矣。</p>
                    </div>
                </div>

                <div class="row">
                    <div class="text-center">
                        <i class="fa fa-copyright"></i> <em>copyright from Shine Jaie</em>
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

    });
</script>


</body>
</html>