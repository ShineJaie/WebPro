<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/common/htmlpart">
    <c:param name="type" value="1"/>
    <c:param name="active" value="4"/>
</c:import>

<style>
    .img_thumb {
        width: 120px;
        height: 120px;
    }
</style>

</head>
<body>

<c:import url="/common/confirmdialog"/>

<c:import url="/common/htmlpart">
    <c:param name="type" value="2"/>
    <c:param name="active" value="4"/>
</c:import>

<div class="navbar-fixed-top" id="myAlert">

</div>

<div class="container" style="margin: 30px auto;">

    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <h1>Spring MVC - jQuery File Upload</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 col-md-offset-3" style="padding-top: 30px;">

            <div class="form-horizontal">
                <div class="form-group">

                    <div class="col-md-3">
                        <div class="btn btn-success btn-file">
                            <i class="glyphicon glyphicon-file" aria-hidden="true"></i>
                            <span>选择文件</span>
                            <!-- The file input field used as target for the file upload widget -->
                            <input id="fileupload" type="file" name="files[]" multiple>
                        </div>
                    </div>

                    <div class="col-md-9">

                        <div class="row">
                            <div class="col-md-12">
                                <img id="previewImg" class="img-thumbnail img-responsive hidden" src="#"
                                     alt="上传的图片"/>
                            </div>
                        </div>

                        <div class="row" style="margin-top: 10px;">
                            <div class="col-md-4 col-md-offset-4">
                                <button class="btn btn-info hidden" id="btn_upload">
                                    <i class="glyphicon glyphicon-upload" aria-hidden="true"></i> 开始上传
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="jumbotron" id="dropzone" style="width: 100%; height: 200px; margin-top: 10px;">
                <h1 class="text-center">
                    <small>Drop files here</small>
                </h1>
            </div>

            <div class="progress" style="margin-top: 10px;">
                <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="0"
                     aria-valuemin="0" aria-valuemax="100" style="width: 0;">
                    <span class="sr-only">0%</span>
                </div>
            </div>

            <!-- The container for the uploaded files -->
            <div id="div_filemsg" class="div_filemsg"></div>

        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped table_uploadinfo" id="uploaded-files">
                <tr>
                    <th>image</th>
                    <th>File Name</th>
                    <th>File Size</th>
                    <th>File Type</th>
                    <th>Download</th>
                    <th>Delete</th>
                </tr>
            </table>
        </div>
    </div>

</div>

<c:import url="/common/htmlpart">
    <c:param name="type" value="3"/>
    <c:param name="active" value="4"/>
</c:import>

<script>
    require(['<c:url value="/resource/myscripts/main.js"/>'], function (main) {
        require(['domReady!'], function (doc) {
            require(['jquery', 'bootstrap', 'jquery.ui.widget', 'jquery.iframe-transport', 'jquery.fileupload'],
                    function ($, bootstrap, jquery_ui_widget, jquery_iframe_transport, jquery_fileupload) {
                        //This function is called once the DOM is ready,
                        //notice the value for 'domReady!' is the current
                        //document.

                        // jQueryFileUpload 配置
                        $('#fileupload').fileupload({
                            url: 'file/upload', // 文件上传请求的 url
                            dataType: 'json', // 服务器返回的数据类型
                            autoUpload: false, // 关闭文件添加时就自动上传
                            sequentialUploads: true, // 所有文件上传请求的顺序, 而不是同步
                            formData: {legalType: 1}, // 向服务器额外参数

                            /**
                             * 文件添加到上传请求队列时的回调
                             * 一旦文件被添加到 fileupload 控制时就会调用
                             */
                            add: function (e, data) {

                                // 预览图
                                if (data.files && data.files[0]) {

                                    var reader = new FileReader();

                                    reader.onload = function (e) {

                                        $('#previewImg').removeClass('hidden');
                                        $('#btn_upload').removeClass('hidden');
                                        $('#previewImg').attr('src', e.target.result);
                                    };

                                    reader.readAsDataURL(data.files[0]);
                                }

                                $("#btn_upload").off('click').on('click', function () {

                                    setUploadBtn(1);

                                    var uploadErrors = [];

                                    // 文件类型, 正则表达式
                                    var acceptFileTypes = /^image\/(gif|jpe?g|png)$/i;
                                    if (data.originalFiles[0]['type'] && !acceptFileTypes.test(data.originalFiles[0]['type'])) {
                                        uploadErrors.push('文件类型不合法, 只能是 gif, jpg, jpeg, png 类型!');
                                    }
                                    // 文件不大于 999KB
                                    if (data.originalFiles[0]['size'] && data.originalFiles[0]['size'] > 1024 * 999) {
                                        uploadErrors.push('文件大小不大于 999KB!');
                                    }

                                    if (uploadErrors.length > 0) {
                                        // myAlert(4, uploadErrors.join("\n"));
                                        showError(data.originalFiles[0].name, uploadErrors.join("\n"));
                                        setUploadBtn(0)
                                    } else {
                                        data.submit(); // 开始上传
                                    }

                                });
                            },

                            /**
                             * 成功上传的回调
                             */
                            done: function (e, data) {

                                setUploadBtn(0);

                                $("tr:has(td)").remove();
                                $.each(data.result, function (index, file) {

                                    // myAlert(1, "上传完成, 服务器<em>已过滤不合法文件上传</em>.");

                                    // 上传成功后的提示信息
                                    showSuccess(file.fileName, file.fileType, file.fileSize, "处理完成");

                                    $("#uploaded-files").append(
                                            $('<tr/>')
                                                    .append($('<td/>')
                                                            .append($('<img class="img_thumb img-thumbnail img-responsive" src="" alt="img"/>')
                                                                    .attr('src', '/WebPro' + file.src).attr('alt', file.fileName)))
                                                    .append($('<td/>').text(file.fileName))
                                                    .append($('<td/>').text(file.fileSize))
                                                    .append($('<td/>').text(file.fileType))
                                                    .append($('<td/>').html("<a class='btn btn-success' href='file/get/" + file.newFileName + "'>download</a>"))
                                                    .append($('<td/>').html("<button class='btn btn-danger btnDelete' dataName='" + file.newFileName + "'>delete</button>"))
                                    ); //end $("#uploaded-files").append()

                                    deleteAction();
                                    beginProgress();
                                });
                            },

                            /**
                             *  回调失败(中止或错误)上传请求
                             */
                            fail: function (e, data) {

                                setUploadBtn(0);

                                $.each(data.messages, function (index, error) {

                                    console.log(data);

                                    setUploadProgress(0);

                                    // 上传服务器出错后的提示信息
                                    showError(data.originalFiles[0].name, error);
                                });
                            },

                            /**
                             * 全局进度条事件的回调
                             */
                            progressall: function (e, data) {
                                var progress = parseInt(data.loaded / data.total * 100, 10);
                                setUploadProgress(progress);
                            },

                            dropZone: $('#dropzone')

                        });

                        /**
                         * 设置文件上传按钮状态
                         * @param status 0: 初始状态; 1: 上传中.
                         */
                        var setUploadBtn = function (status) {

                            if (status && status == 1) {
                                // 上传中
                                $('#btn_upload')
                                        .html('<i class="glyphicon glyphicon-refresh" aria-hidden="true"></i> 上传中...')
                                        .addClass('disabled');
                            } else {
                                // 初始状态
                                $('#btn_upload')
                                        .removeClass('disabled')
                                        .html('<i class="glyphicon glyphicon-upload" aria-hidden="true"></i> 开始上传');
                            }
                        };

                        /**
                         * 错误提示信息
                         * @param fileName
                         * @param info
                         */
                        var showError = function (fileName, info) {
                            $('#div_filemsg').empty();
                            $('<p style="color: red;">上传 ' + fileName + ' 出错: ' + info + '<i class="elusive-remove" style="padding-left:10px;"/></p>')
                                    .appendTo('#div_filemsg');
                        };

                        /**
                         * 成功提示信息
                         * @param fileName
                         * @param fileType
                         * @param fileSize
                         * @param info
                         */
                        var showSuccess = function (fileName, fileType, fileSize, info) {
                            $('#div_filemsg').empty();
                            $('<p style="color: green;">' + info + ' 文件: ' + fileName + '<i class="elusive-ok" style="padding-left:10px;"/> - 类型: ' + fileType + ' - 大小: ' + fileSize + ' byte</p>')
                                    .appendTo('#div_filemsg');
                        };

                        /**
                         * 进度条
                         * @param progress
                         */
                        var setUploadProgress = function (progress) {

                            $('.progress .progress-bar').attr('aria-valuenow', progress);

                            $('.progress .progress-bar').find('.sr-only').text(progress + '%');

                            $('.progress .progress-bar').css(
                                    'width',
                                    progress + '%'
                            );

                            if (progress == 100) {
                                $('.progress .progress-bar').removeClass('active');
                            } else {
                                $('.progress .progress-bar').addClass('active');
                            }
                        };

                        /**
                         * 上传文件时, 进度条置为 0
                         */
                        var beginProgress = function () {
                            $('.btn-file').off('click').on('click', function () {
                                setUploadProgress(0);
                            });
                        };

                        /**
                         * 删除文件
                         */
                        var deleteAction = function () {
                            $('.btnDelete').off('click').on('click', function () {

                                var $this = $(this);

                                // 弹出确认对话框
                                $('.myConfirmDialog').modal('show');

                                $('.btnConfirm').off('click').on('click', function () {

                                    // 关闭确认对话框
                                    $('.myConfirmDialog').modal('hide');

                                    $.post('<c:url value="/test/file/delete/"/>' + $this.attr('dataName').split('.')[0], {}, function (data) {

                                        if (data.status && data.status == 'success') {
                                            // myAlert(1, "删除成功.");
                                            showSuccess($this.parent().parent().find('td')[1].innerHTML, $this.parent().parent().find('td')[3].innerHTML,
                                                    $this.parent().parent().find('td')[2].innerHTML, '删除成功!');
                                            $this.parent().parent().remove();
                                        }
                                    });
                                });

                            });
                        };
                    }
            )
            ;
        });
    });
</script>

</body>
</html>