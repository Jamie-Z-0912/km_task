<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../header_v2.jsp" />
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>
    <jsp:include page="../sidebar_v2.jsp" />
    <!-- 页面 -->
    <div class="main-content">
        <!-- here area:basics/content.breadcrumbs -->
        <div id="page-content" class="page-content">
            <div class="page-content-area">
                <div class="page-header"> <h1>深度任务列表</h1> </div>
                <div class="row">
                    <div class="col-xs-12">
                        <form action="#" class="form-horizontal" id="myform" role="form">
                            <div class="form-group">
                                <div class="col-sm-5">
                                    <label class="col-sm-4 control-label pl0">任务名称</label>
                                    <div class="col-sm-8 pl0">
                                        <input name="name" id="name" type="text" class="form-control">
                                    </div>
                                </div>
                                <div class="col-sm-5">
                                    <label class="col-sm-4 control-label pl0">任务ID</label>
                                    <div class="col-sm-8 pl0">
                                        <input type="text" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-5">
                                    <label class="col-sm-4 control-label pl0">开始时间</label>
                                    <div class="col-sm-8 pl0">
                                        <input type="text" id="q_start_time" data-date-format="yyyy-mm-dd hh:ii:ss" class="form-control"/>
                                        <!-- 用于提交表单 -->
                                        <input type="hidden" id="q_startTime" name="startTime">
                                    </div>
                                </div>
                                <div class="col-sm-5">
                                    <label class="col-sm-4 control-label pl0">结束时间</label>
                                    <div class="col-sm-8 pl0">
                                        <input type="text" id="q_end_time" data-date-format="yyyy-mm-dd hh:ii:ss" class="form-control"/>
                                        <!-- 用于提交表单 -->
                                        <input type="hidden" id="q_endTime" name="endTime">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4">
                                    <label class="col-sm-4 control-label pl0">任务状态</label>
                                    <div class="col-sm-8 pl0">
                                        <select name="layout" id="layout" class="form-control">
                                            <option value="0">000</option>
                                            <option value="1">111</option>
                                            <option value="2">222</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <label class="col-sm-4 control-label pl0">投放平台</label>
                                    <div class="col-sm-8 pl0">
                                        <select name="layout" id="layout" class="form-control">
                                            <option value="0">000</option>
                                            <option value="1">111</option>
                                            <option value="2">222</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <label class="col-sm-4 control-label pl0">任务类型</label>
                                    <div class="col-sm-8 pl0">
                                        <select name="layout" id="layout" class="form-control">
                                            <option value="0">000</option>
                                            <option value="1">111</option>
                                            <option value="2">222</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix form-actions">
                                <div class="col-md-offset-3 col-md-9">
                                    <button class="btn btn-info" id="submitForm" type="submit">
                                        <i class="ace-icon fa fa-check bigger-110"></i> 查询
                                    </button>
                                    &nbsp; &nbsp; &nbsp;
                                    <a class="btn" href="/km_task/admin/deepTask/add">
                                        <i class="ace-icon fa fa-undo bigger-110"></i> 添加
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-xs-12">
                        <table class="table table-striped table-bordered table-hover">
                            <colgroup>
                                <col width="10%">
                                <col >
                                <col width="8%">
                                <col width="66">
                                <col width="10%">
                                <col width="86">
                                <col width="86">
                                <col width="14%">
                                <col width="7%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>任务ID</th>
                                    <th>任务标题</th>
                                    <th>类型</th>
                                    <th>单价</th>
                                    <th>投放平台</th>
                                    <th>开始时间</th>
                                    <th>结束时间</th>
                                    <th>统计</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>123123</td>
                                    <td>合计合计合计合计合计合计合计合计合计合计</td>
                                    <td>关注</td>
                                    <td>800</td>
                                    <td>安卓</td>
                                    <td>2018-01-02 15:30:00</td>
                                    <td>2018-01-12 15:30:00</td>
                                    <td class="sub_block">
                                        <span>投放800个</span>
                                        <span>已领取600个</span>
                                        <span>已提交400个</span>
                                        <span>已通过268个</span>
                                        <span>已拒绝32个</span>
                                        <span>待审核100个</span>
                                    </td>
                                    <td class="sub_block">
                                        <a class="set_top blue" href="#">下架</a>
                                        <a class="set_top update blue" href="#">审核</a>
                                        <a class="set_top update blue" href="#">追加</a>
                                        <a class="update blue" href="#">编辑</a>
                                        <a class="set_top update blue" href="#">订单</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>123123</td>
                                    <td>合计合计合计合计合计合计合计合计合计合计</td>
                                    <td>关注</td>
                                    <td>20000</td>
                                    <td>安卓</td>
                                    <td>2018-01-02 15:30:00</td>
                                    <td>2018-01-12 15:30:00</td>
                                    <td class="sub_block">
                                        <span>投放20000个</span>
                                        <span>已领取16000个</span>
                                        <span>已提交14000个</span>
                                        <span>已通过2680个</span>
                                        <span>已拒绝320个</span>
                                        <span>待审核1000个</span>
                                    </td>
                                    <td class="sub_block">
                                        <a class="set_top blue" href="#">下架</a>
                                        <a class="set_top update blue" href="#">审核</a>
                                        <a class="set_top update blue" href="#">追加</a>
                                        <a class="update blue" href="#">编辑</a>
                                        <a class="set_top update blue" href="#">订单</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>123123</td>
                                    <td>合计合计合计合计合计合计合计合计合计合计</td>
                                    <td>关注</td>
                                    <td>800</td>
                                    <td>安卓</td>
                                    <td>2018-01-02 15:30:00</td>
                                    <td>2018-01-12 15:30:00</td>
                                    <td class="sub_block">
                                        <span>投放800个</span>
                                        <span>已领取600个</span>
                                        <span>已提交400个</span>
                                        <span>已通过268个</span>
                                        <span>已拒绝32个</span>
                                        <span>待审核100个</span>
                                    </td>
                                    <td class="sub_block">
                                        <a class="set_top blue" href="#">下架</a>
                                        <a class="set_top update blue" href="#">审核</a>
                                        <a class="set_top update blue" href="#">追加</a>
                                        <a class="update blue" href="#">编辑</a>
                                        <a class="set_top update blue" href="#">订单</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot_v2.jsp" />
<script>
    $("#menu_deeptask").addClass('active open');
    $("#deeptask_list").addClass('active');
    $(function () {
        var time_opt = {
            language: 'cn',
            autoclose: true
        };
        $('#q_start_time,#q_end_time').datetimepicker(time_opt);
        $('#q_start_time').on('change', function (ev, val) {
            var _day = this.value;
            $('#q_startTime').val(new Date(_day).getTime());
            $('#q_end_time').datetimepicker('setStartDate', _day.split(' ')[0]);
        });
        $('#q_end_time').on('change', function (ev) {
            var _day = this.value;
            $('#q_endTime').val(new Date(_day).getTime());
            $('#q_start_time').datetimepicker('setEndDate', _day.split(' ')[0]);
        });
        /*时间 end*/
    })
</script>
</body>
</html>