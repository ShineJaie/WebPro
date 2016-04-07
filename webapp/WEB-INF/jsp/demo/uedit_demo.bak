<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/common/htmlpart">
    <c:param name="type" value="1"></c:param>
    <c:param name="active" value="3"></c:param>
</c:import>

</head>
<body>

<c:import url="/common/htmlpart">
    <c:param name="type" value="2"></c:param>
    <c:param name="active" value="3"></c:param>
</c:import>

<div class="container" style="margin: 30px auto;">

    <div class="row">
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        百度编辑器 编辑窗口
                    </h3>
                </div>

                <div class="panel-body" style="min-height: 500px; _height: 500px;">
                    <!-- 加载编辑器的容器 -->
                    <script id="myEditor" name="content" type="text/plain" style="height: 500px;">初始化内容</script>
                </div>

            </div>

            <button class="btn btn-info center-block showMyContent">内容展示</button>
        </div>

        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">
                        百度编辑器 展示窗口
                    </h3>
                </div>

                <div class="panel-body" style="min-height: 590px; _height: 500px;">
                    <div id="myEditorShow">

                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<c:import url="/common/htmlpart">
    <c:param name="type" value="3"></c:param>
    <c:param name="active" value="3"></c:param>
</c:import>

<script>
    require(['<c:url value="/resource/myscripts/main.js"/>'], function (main) {
        require(['domReady!'], function () {
            require(['jquery', 'bootstrap', 'ueditor.config', 'ueditor.all', 'ueditor.parse', 'ZeroClipboard'],
                    function ($, bootstrap, ueditor_config, UE, ueditor_parse, ZeroClipboard) {
                        //This function is called once the DOM is ready,
                        //notice the value for 'domReady!' is the current
                        //document.

                        var opts = {
                            //定制工具按钮
                            toolbars: [
                                ["fullscreen", "source", "undo", "redo", "|", "bold", "Italic", "Underline", "StrikeThrough",
                                    "|", "forecolor", "backcolor", "Horizontal", "|", "FontFamily", "FontSize", "|"],
                                ["LineHeight", "CustomStyle", "JustifyLeft", "JustifyRight", "JustifyCenter",
                                    "RemoveFormat", "|", 'link', 'simpleupload', 'attachment']
                            ],
                            //获取光标是，是否自动清空初始化数据
                            autoClearinitialContent: false,
                            //是否展示元素路径
                            elementPathEnabled: false,
                            //是否计数
                            wordCount: false,
                            //高度是否自动增长
                            autoHeightEnabled: false,
                            //后台接受UEditor的数据的参数名称
                            textarea: "contact_content"
                        };

                        // 实例化编辑器
                        var ue = UE.getEditor("myEditor", opts);

                        //对编辑器的操作最好在编辑器 ready 之后再做
                        ue.ready(function () {

                            $('.showMyContent').off('click').on('click', function () {
                                var html = ue.getContent();
                                var txt = ue.getContentTxt();
                                console.log(txt);

                                $('#myEditorShow').html(html);

                                // uparse 编辑内容展示
                                uParse('#myEditorShow', {
                                    rootPath: '<c:url value="/resource/dependency/ueditor"/>'
                                })
                            });

                        });
                    });
        });
    });
</script>

</body>
</html>