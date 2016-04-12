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

<div id="wrapper" bar-btntarget="sidebar_users">

    <!-- Topbar -->
    <div id="jtopbar-wrapper-outer"></div>

    <!-- Sidebar -->
    <div id="jsidebar-wrapper-outer"></div>

    <!-- Page Content -->
    <div id="page-content-wrapper-outer">
        <div id="page-content-wrapper">
            <div class="container-fluid">
                <ol class="breadcrumb">
                    <li><a href="#">用户管理</a></li>
                    <li class="active">用户列表</li>
                </ol>

                <h2>Stacked Bootstrap Modal Example.</h2>
                <button class="btn btn-primary btn-openmodal" modal_target_name="my_ajax_modal_1"
                        style="margin-bottom: 15px;">Launch modal
                </button>

                <div class="row">
                    <div class="col-md-6">
                        <h2>动态添加 DataTables.</h2>
                        <button class="btn btn-primary btn-add-tbldata"
                                style="margin-bottom: 15px;">Add DataTables
                        </button>
                    </div>

                    <div class="col-md-6">
                        <h2>获取数据.</h2>
                        <button class="btn btn-primary btn-get-tbldata"
                                style="margin-bottom: 15px;">Get DataTables
                        </button>
                    </div>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">动态生成数据</div>
                    <div class="panel-body">
                        <div class="table-responsive"> <!-- 响应布局 -->
                            <table id="dynamic-tbl" class="table table-striped table-bordered nowrap"
                                   cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>名称</th>
                                    <th>信息</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- 多级 modal -->
                <%--<div class="modal fade" id="my_ajax_modal_1">
                    <div class="modal-dialog" style="width: 90%;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button>
                                <h4 class="modal-title">一级模态框</h4>

                            </div>
                            <div class="container"></div>
                            <div class="modal-body" style="overflow-y: auto;">内容在这里
                                <br>
                                <br>
                                <br>

                                <p>更多内容</p><br>
                                <br>
                                <br>

                                <p>更多内容</p><br>
                                <br>
                                <br>

                                <p>更多内容</p><br>
                                <br>
                                <br>

                                <p>更多内容</p><br>
                                <br>
                                <br>

                                <p>更多内容</p><br>
                                <br>
                                <br>

                                <p>更多内容</p><br>
                                <br>
                                <br>

                                <p>更多内容</p><br>
                                <br>
                                <br>

                                <p>更多内容</p><br>
                                <br>
                                <br>

                                <p>更多内容</p><br>
                                <br>
                                <br>

                                <p>更多内容</p><br>
                                <br>
                                <br>

                                <p>更多内容</p>
                                <br>
                                <br>
                                <br>
                                <button modal_target_name="myModal2" class="btn btn-primary btn-openmodal">Launch
                                    modal2
                                </button>

                            </div>
                            <div class="modal-footer">
                                <a href="#" data-dismiss="modal" class="btn">Close</a>
                                <a href="#" class="btn btn-primary">Save changes</a>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade modal-wide" id="myModal2">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button>
                                <h4 class="modal-title">二级模态框</h4>

                            </div>
                            <div class="container"></div>
                            <div class="modal-body">内容在这里二
                                <br>
                                <br>

                                <p>更多的内容二</p>
                                <br>
                                <br>
                                <br>
                                <button modal_target_name="myModal3" class="btn btn-primary btn-openmodal">Launch
                                    modal3
                                </button>

                            </div>
                            <div class="modal-footer"><a href="#" data-dismiss="modal" class="btn">Close</a>
                                <a href="#" class="btn btn-primary">Save changes</a>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade modal-wide" id="myModal3">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button>
                                <h4 class="modal-title">三级模态框</h4>

                            </div>
                            <div class="container"></div>
                            <div class="modal-body">Content for the dialog / modal goes here.
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <button modal_target_name="myModal4" class="btn btn-primary btn-openmodal">Launch
                                    modal4
                                </button>

                            </div>
                            <div class="modal-footer"><a href="#" data-dismiss="modal" class="btn">Close</a>
                                <a href="#" class="btn btn-primary">Save changes</a>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade modal-wide" id="myModal4">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button>
                                <h4 class="modal-title">四级模态框</h4>

                            </div>
                            <div class="container"></div>
                            <div class="modal-body">Content for the dialog / modal goes here.</div>
                            <div class="modal-footer"><a href="#" data-dismiss="modal" class="btn">Close</a>
                                <a href="#" class="btn btn-primary">Save changes</a>

                            </div>
                        </div>
                    </div>
                </div>--%>

                <div class="row" style="margin-bottom: 15px;">
                    <div class="col-md-3">
                        <div class="input-group" id="adv-search">
                            <input type="text" class="form-control my_search_value" param_name="username"
                                   placeholder="用户名..."/>

                            <div class="input-group-btn">
                                <div class="btn-group" role="group">
                                    <button type="button" class="btn btn-primary dbtn-search"><span
                                            class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="userstable">
                            <%--<div class="panel panel-default">
                                <div class="panel-heading">用户列表</div>
                                <div class="panel-body">
                                    <!-- Table -->

                                    <div class="table-responsive"> <!-- 响应布局 -->
                                        <table id="userslist" class="table table-striped table-bordered nowrap"
                                               cellspacing="0" width="100%">
                                            <thead>
                                            <tr>
                                                <th>用户名</th>
                                                <th>创建时间</th>
                                                <th>修改时间</th>
                                                <th>性别</th>
                                                <th>邮箱</th>
                                                <th>是否启用</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>--%>
                        </div>
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
        require(['domReady', 'users'], function (domReady, users) {
            domReady(function () {
                users.initpage_userslist();
            });
        });
    });
</script>

</body>
</html>