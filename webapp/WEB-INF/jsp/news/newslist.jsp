<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/common/htmlpart">
    <c:param name="type" value="1"></c:param>
    <c:param name="active" value="2"></c:param>
</c:import>

</head>
<body>

<c:import url="/common/htmlpart">
    <c:param name="type" value="2"></c:param>
    <c:param name="active" value="2"></c:param>
</c:import>

<div class="container" style="margin: 30px auto;">

    <div class="col-md-9">

        <c:forEach items="${newslist}" var="item">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        <a href="<c:url value="/newsdetail?newsid=${item.getId()}"/>">${item.getTitle()}</a>
                    </h3>
                </div>

                <div class="panel-body">
                        ${item.getContent()}
                </div>

                <div class="panel-footer">发布:${item.getPubtime()} 作者:${item.getPubuser()} 阅读:${item.getClicknum()}</div>
            </div>
        </c:forEach>

        <c:import url="/common/pagination">
            <c:param name="sum" value="${sum}"></c:param>
            <c:param name="cp" value="${page}"></c:param>
            <c:param name="max" value="10"></c:param>
            <c:param name="size" value="${size}"></c:param>
            <c:param name="url" value="/newslist"></c:param>
        </c:import>

    </div>

    <div class="col-md-3">
        <div class="list-group">
            <span class="list-group-item">
                <span class="btn">
                    <span class="glyphicon glyphicon-heart"></span>
                </span>
                <a href="#" style="font-size: larger; color: #080808;">最热新闻</a>
            </span>

            <ul class="nav list-group-item">
                <li><a href="#">最热新闻1</a></li>
                <li><a href="#">最热新闻2</a></li>
                <li><a href="#">最热新闻3</a></li>
                <li><a href="#">最热新闻4</a></li>
            </ul>
        </div>
    </div>

</div>

<c:import url="/common/htmlpart">
    <c:param name="type" value="3"></c:param>
    <c:param name="active" value="2"></c:param>
</c:import>

<script>
    require(['<c:url value="/resource/myscripts/main.js"/>'], function (main) {
        require(['domReady!'], function (doc) {
            require(['jquery', 'bootstrap', 'jquery.validate'], function ($, bootstrap, jquery_validate) {
            });
        });
    });
</script>

</body>
</html>