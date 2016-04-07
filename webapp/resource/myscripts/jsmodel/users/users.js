define(['jquery', 'bootstrap', 'config', 'jquery.history', 'nprogress', 'sweetalert', 'datatables', 'dataTables.colReorder', 'listtable', 'popupdialog'],
    function ($, bootstrap, config, History, NProgress, sweetalert, datatables, dataTables_colReorder, listtable, popupdialog) {

        var userslistUrl = '/WebPro/admin/userslist/data';

        var initpage_userslist = function () {

            NProgress.start();

            $('#page-content-wrapper-outer').load(config.urlConfig.usersListPageUrl, {}, function () {

                config.setBrowserHistory('users', 'initpage_userslist', 'sidebar_users', '用户列表',
                    config.urlConfig.usersListPageUrl.split(' ')[0]);


                $('.btn-openmodal').off('click').on('click', function () {

                    //var targetModal = $(this).attr('modal_target_name');
                    //$('#' + targetModal).modal({
                    //    backdrop: 'static',
                    //    keybard: false,
                    //    show: true
                    //});

                    popupdialog.drawPopupModal({
                        'level': 1,
                        'title': '一级模态框',
                        'width': '90%'
                    }, function ($modal) {

                        $modal.find('.my_bs_modal_content').load(config.urlConfig.registerPageUrl, {}, function () {

                            $modal.find('.dbtn-confirm').off('click').on('click', function () {

                                popupdialog.drawPopupModal({
                                    'level': 2,
                                    'title': '二级模态框',
                                    'width': '70%'
                                }, function ($modal2) {

                                    $modal2.find('.my_bs_modal_content').load(config.urlConfig.jstreeDemoUrl, {}, function () {

                                        $modal2.find('.dbtn-jstree').off('click').on('click', function () {
                                            swal('good job!', '多级modal', 'success');
                                        });
                                    });
                                })
                            });
                        });
                    });

                });


                //// 配合 css(.modal-wide) 实现可视窗口内的内容滚动条
                //$('#my_ajax_modal_1').off('show.bs.modal').on('show.bs.modal', function () {
                //    var height = $(window).height() - 200;
                //    $(this).find(".modal-body").css("max-height", height);
                //});

                //popupdialog.fixMultiModal();

                drawTable();

                addDynamicDataTable();

                NProgress.done();
            });
        };

        var addDynamicDataTable = function () {

            var data = [];

            // 获取数据
            $('.btn-get-tbldata').off('click').on('click', function () {

                console.log($('#dynamic-tbl').DataTable().data());

            });

            $('.btn-add-tbldata').off('click').on('click', function () {

                var item = {};
                item.name = 'name_' + new Date();
                item.info = 'info_' + new Date();

                data.push(item);

                console.log(data);

                $('#dynamic-tbl').DataTable().destroy();

                var tableConfig = {
                    lengthMenu: [5, 10, 25, 50],
                    pageLength: 5,
                    data: data,
                    columns: [
                        {
                            data: 'name',
                            render: function (data, type, full, meta) {
                                if (type === 'display') {
                                    return '<input class="form-control input-sm can-edt-val" value="' + data + '" style="width: 100%;">';
                                } else {
                                    return data;
                                }
                            }
                        },
                        {data: 'info'}
                    ]
                };

                var finalTableConfig = $.extend(true, listtable.dataTablesConfig, tableConfig);

                $('#dynamic-tbl').DataTable(finalTableConfig).draw().on('draw.dt', function () {

                    // 编辑数据
                    $('#dynamic-tbl').off('blur', '.can-edt-val').on('blur', '.can-edt-val', function () {

                        var index = $('#dynamic-tbl').DataTable().row($(this).closest('tr')).index();

                        console.log(index);

                        var value = $(this).val();

                        console.log(value);

                        data[index].name = value;

                        $('#dynamic-tbl').DataTable().destroy();

                        var tableConfig = {
                            lengthMenu: [5, 10, 25, 50],
                            pageLength: 5,
                            data: data,
                            columns: [
                                {
                                    data: 'name',
                                    render: function (data, type, full, meta) {
                                        if (type === 'display') {
                                            return '<input class="can-edt-val" value="' + data + '" style="width: 100%;">';
                                        } else {
                                            return data;
                                        }
                                    }
                                },
                                {data: 'info'}
                            ]
                        };

                        var finalTableConfig = $.extend(true, listtable.dataTablesConfig, tableConfig);

                        $('#dynamic-tbl').DataTable(finalTableConfig).draw();

                    });

                });
            });
        };

        var drawTable = function () {

            listtable.drawTable_dataTables($('.userstable'), {

                title: '用户列表',

                heads: ['用户名', '创建时间', '修改时间', '性别', '邮箱', '是否启用', '操作'],

                aftdrawfunc: function (datatable) {

                    searchAction(datatable);
                    editAction(datatable);
                },

                tableConfig: {

                    colReorder: true, // 启用拖拽插件
                    //responsive: true, // 启用响应式插件

                    stateSave: false, // 关闭状态保存
                    processing: true, // 显示数据加载时的提示
                    serverSide: true, // 由服务器进行数据操作
                    ordering: false, // 取消排序功能
                    searching: false, // 取消搜索功能
                    ajax: {
                        dataSrc: "data", // json 数据在哪个属性内, 默认 data
                        url: userslistUrl,
                        type: "POST",
                        data: function (d) {

                            // 额外的参数
                            var searchParam = {};
                            $('.my_search_value').each(function () {
                                searchParam[$(this).attr('param_name')] = $(this).val();
                            });

                            // 表格本身的参数
                            listtable.datatables2server(d);

                            return $.extend(true, {}, d, searchParam);
                        }
                    },
                    columns: [
                        {
                            data: 'username'
                        }, {
                            data: 'createdate'
                        }, {
                            data: 'modifydate'
                        }, {
                            data: 'sex',
                            render: function (data, type, full, meta) {
                                if (data == 1) {
                                    return '<span style="color:#3498DB">男</span>';
                                } else {
                                    return '<span style="color:#E74C3C">女</span>';
                                }
                            }
                        }, {
                            data: 'email'
                        }, {
                            data: 'enable',
                            render: function (data, type, full, meta) {
                                if (data == 1) {
                                    return '<span style="color:#3498DB" title="已经启用">已经启用</span>';
                                } else {
                                    return '<span style="color:#E74C3C" title="已经禁用">已经禁用</span>';
                                }
                            }

                        }, {
                            data: null,
                            orderable: false,
                            render: function (data, type, full, meta) {

                                var res = '<div class="btn-xs btn btn-info tbtn-edit" userid="' +
                                    full['id'] + '"><i class="fa fa-edit"></i>&nbsp; 编辑</div>';

                                if (full['enable'] == 0) {
                                    res += '&nbsp; <div class="btn btn-xs btn-success btn-userenable" userid="' + full["id"] + '"willenable="false">' +
                                        '<i class="fa fa-check"></i>&nbsp; 启用</div>';
                                } else {
                                    res += '&nbsp; <div class="btn btn-xs btn-danger btn-userenable" userid="' + full["id"] + '"willenable="true">' +
                                        '<i class="fa fa-remove"></i>&nbsp; 禁用</div>';
                                }

                                // su 才可以重置所有用户密码
                                if (true) {
                                    res += '&nbsp; <div class="btn btn-xs btn-primary tbtn-repass" userid="' + full['id'] + '">' +
                                        '<i class="fa fa-wrench"></i>&nbsp; 密码重置</div>';
                                } else if (full['username'] == $('.data_list').attr('curusername')) {
                                    res += '&nbsp; <div class="btn btn-xs btn-primary tbtn-repass" userid="' + full['id'] + '">' +
                                        '<i class="fa fa-wrench"></i>&nbsp; 密码重置</div>';
                                }

                                return res;
                            }
                        }
                    ]
                }
            });

        };

        var editAction = function (datatable) {
            $('.userstable').off('click', '.tbtn-edit').on('click', '.tbtn-edit', function () {

                var $this = $(this).closest('tr');

                var d = datatable.row($this).data();

                //var id = $this.attr('userid');

                console.log('editor...', d);

                listtable.drawSubPanel($('.userstable'), '编辑用户信息', function ($container) {

                    console.log($container);
                });
            });
        };

        var searchAction = function (datatable) {

            // 按回车键实现查询
            $('.my_search_value[param_name="username"]').off('keypress').on('keypress', function (event) {
                if (event.keyCode == 13) {
                    datatable.ajax.reload();
                }
            });

            $('.dbtn-search').off('click').on('click', function () {

                datatable.ajax.reload();
            });
        };

        return {
            initpage_userslist: initpage_userslist
        }

    }
)
;