<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div id="jtopbar-wrapper-outer"></div>

    <!-- Sidebar -->
    <div id="jsidebar-wrapper-outer">
        <div id="jsidebar-wrapper">
            <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
                <ul class="nav sidebar-nav">
                    <li class="sidebar-brand">
                        <a class="btn-jmenu" href="#">
                            <i class="fa fa-fire"></i>&nbsp; 个人网站
                        </a>
                    </li>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li>
                            <a class="sidebar_users btn-jmenu" href="<c:url value='/admin/userslist/page'/>"
                               funcModel="users" funcInit="initpage_userslist"><i class="fa fa-users"></i>&nbsp;
                                用户列表</a>
                        </li>
                    </sec:authorize>
                    <li>
                        <a class="sidebar_addnews btn-jmenu" href="<c:url value='/addnews/page'/>"
                           funcModel="news" funcInit="initpage_addnews">
                            <i class="fa fa-newspaper-o"></i>&nbsp; 新增资讯</a>
                    </li>
                    <li>
                        <a class="btn-jmenu" href="#">文章</a>
                    </li>
                    <li>
                        <a class="btn-jmenu" href="#">讨论</a>
                    </li>
                    <li class="dropdown jsidebar-dropdown">
                        <a href="#" class="dropdown-toggle">Demo <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li class="dropdown-header">技术研究</li>
                            <li><a class="sidebar_jstreedemo btn-jmenu"
                                   funcModel="jstree_demo" funcInit="initpage_jstreedemo"
                                   href="<c:url value='/demo/jstree/page'/>">Jstree</a></li>
                            <li><a class="btn-jmenu" href="#">JqueryFileUpload</a></li>
                            <li><a class="btn-jmenu" href="#">等待</a></li>
                            <li><a class="btn-jmenu" href="#">等待</a></li>
                            <li><a class="btn-jmenu" href="#">等待</a></li>
                            <li class="dropdown jsidebar-dropdown">
                                <a href="#" class="dropdown-toggle">三级菜单 <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li class="dropdown-header">三级菜单</li>
                                    <li><a class="btn-jmenu" href="#">你好</a></li>
                                    <li><a class="btn-jmenu" href="#">我是</a></li>
                                    <li><a class="btn-jmenu" href="#">吴</a></li>
                                    <li><a class="btn-jmenu" href="#">仙</a></li>
                                    <li><a class="btn-jmenu" href="#">杰</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>

                    <li class="dropdown jsidebar-dropdown">
                        <a href="#" class="dropdown-toggle">测试 <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li class="dropdown-header">测试研究</li>
                            <li><a class="btn-jmenu" href="#">稍等</a></li>
                            <li><a class="btn-jmenu" href="#">稍等</a></li>
                            <li><a class="btn-jmenu" href="#">等待</a></li>
                            <li><a class="btn-jmenu" href="#">等待</a></li>
                            <li><a class="btn-jmenu" href="#">等待</a></li>
                        </ul>
                    </li>

                    <li>
                        <a class="btn-jmenu" href="#">联系</a>
                    </li>
                    <li>
                        <a class="btn-jmenu" href="#">关注</a>
                    </li>
                </ul>
            </nav>

            <button type="button" class="hamburger is-closed">
                <span class="hamb-top"></span>
                <span class="hamb-middle"></span>
                <span class="hamb-bottom"></span>
            </button>
        </div>
    </div>
    <!-- /#sidebar-wrapper -->

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