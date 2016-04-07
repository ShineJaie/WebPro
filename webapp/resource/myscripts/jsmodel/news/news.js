define(['jquery', 'bootstrap', 'config', 'jquery.history', 'nprogress', 'sweetalert', 'summernote', 'summernote-lang'],
    function ($, bootstrap, config, History, NProgress, sweetalert, summernote, summernote_lang) {

        var initpage_addnews = function () {

            NProgress.start();

            $('#page-content-wrapper-outer').load(config.urlConfig.addNewsPageUrl, {}, function () {

                    config.setBrowserHistory('news', 'initpage_addnews', 'sidebar_addnews', '添加资讯',
                        config.urlConfig.addNewsPageUrl.split(' ')[0]);

                    // 初始化编辑器
                    $('#summernote').summernote({
                            lang: 'zh-CN', // 语言 default: 'en-US'
                            placeholder: '编辑区域...', // 默认提示信息
                            height: 300, // 编辑器高度
                            minHeight: null, // 编辑器最小高度
                            maxHeight: null, // 编辑器最高高度
                            focus: true, // 初始化后, 将焦点设置到可编辑区域
                            toolbar: [ //自定义工具栏
                                // [groupName, [list of button]]
                                ['style', ['style']],
                                ['fontstyle', ['bold', 'italic', 'underline', 'hr']],
                                ['font', ['strikethrough', 'superscript', 'subscript']],
                                ['do', ['undo', 'redo', 'clear']],
                                ['fontname', ['fontname']],
                                ['fontsize', ['fontsize']],
                                ['color', ['color']],
                                ['paragraph', ['ul', 'ol', 'paragraph']],
                                ['height', ['height']],
                                ['table', ['table']],
                                ['insert', ['link', 'picture']],
                                ['codeview', ['codeview', 'fullscreen']]
                            ],
                            dialogsFade: true, // 模态框退出渐变效果

                            callbacks: {
                                // onInit callback
                                onInit: function () {
                                    console.log('Summernote is launched');
                                },
                                // onImageUpload callback
                                onImageUpload: function (files) {
                                    console.log('image upload...');
                                    sendFile2Server(files[0], this);
                                }
                            }
                        }
                    );

                    /**
                     * 向服务发送图片文件
                     * @param file 图片文件
                     * @param el 富文本无素(css 选择器)
                     */
                    var sendFile2Server = function (file, el) {
                        var formData = new FormData();
                        formData.append("photo", file);

                        var fileData = URL.createObjectURL(file);
                        $(el).summernote('insertImage', fileData, function ($image) {
                            $.ajax({
                                url: "/WebPro/upload/image",
                                data: formData,
                                cache: false,
                                contentType: false,
                                processData: false,
                                dataType: "json",
                                type: 'POST',
                                success: function (result) {
                                    console.log(result);

                                    if (result.status && result.status == 'error') {
                                        swal("抱歉!", result.data, "error")
                                    } else {
                                        $image.attr('src', result.src);
                                    }
                                }
                            });

                        });
                    };

                    // 销毁编辑器
                    $('.btn-destory-editor').off('click').on('click', function () {
                        $('#summernote').summernote('destroy');
                    });


                    // 获取编辑器中的内容
                    $('.btn-getcontent-editor').off('click').on('click', function () {
                        var markupStr = $('#summernote').summernote('code'); // 获取第一个编辑器中的内容
                        //var markupStr = $('.summernote').eq(1).summernote('code'); // 获取第2个编辑器中的内容
                        console.log(markupStr);

                        console.log('--------------');
                        // 纯文本
                        /*var plainText = $("#summernote").summernote('code')
                         .replace(/<\/p>/gi, "\n")
                         .replace(/<br\/?>/gi, "\n")
                         .replace(/<\/?[^>]+(>|$)/g, "")
                         .replace(/&nbsp;/g, " ")
                         .replace();*/

                        console.log(strip(markupStr));
                    });

                    // 将 html 格式文本转为纯文本
                    function strip(html) {
                        var tmp = document.createElement("DIV");
                        tmp.innerHTML = html;
                        return tmp.textContent || tmp.innerText || "";
                    }

                    // 设置编辑器中的内容
                    $('.btn-setcontent-editor').off('click').on('click', function () {
                        var markupStr = '<b>这是自定义的内容...</b>';
                        $('#summernote').summernote('code', markupStr);
                    });

                    // 点击编辑, 保存
                    $('.btn-openedit').off('click').on('click', function () {
                        $('.click2edit').summernote({focus: true});
                    });
                    $('.btn-saveedit').off('click').on('click', function () {
                        var makrup = $('.click2edit').summernote('code');
                        $('.click2edit').summernote('destroy');
                        console.log(makrup);
                    });


                    NProgress.done();
                }
            );
        };

        return {
            initpage_addnews: initpage_addnews
        }

    }
);