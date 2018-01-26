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
                        <form action="admin/deepTask/list" method="get" class="form-horizontal" id="myform" role="form">
                            <div class="form-group">
                                <div class="col-sm-5">
                                    <label class="col-sm-4 control-label pl0">任务名称</label>
                                    <div class="col-sm-8 pl0">
                                        <input name="name" id="name" type="text" value="${name}" class="form-control">
                                    </div>
                                </div>
                                <div class="col-sm-5">
                                    <label class="col-sm-4 control-label pl0">任务ID</label>
                                    <div class="col-sm-8 pl0">
                                        <input type="text" name="id" id="id"  value="${id}" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-5">
                                    <label class="col-sm-4 control-label pl0">开始时间</label>
                                    <div class="col-sm-8 pl0">
                                        <input type="text" id="start_time" class="form-control"/>
                                        <!-- 用于提交表单 -->
                                        <input type="hidden" id="startTime" name="startTime" value="${startTime}">
                                    </div>
                                </div>
                                <div class="col-sm-5">
                                    <label class="col-sm-4 control-label pl0">结束时间</label>
                                    <div class="col-sm-8 pl0">
                                        <input type="text" id="end_time" class="form-control"/>
                                        <!-- 用于提交表单 -->
                                        <input type="hidden" id="endTime" name="endTime" value="${endTime}">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4">
                                    <label class="col-sm-4 control-label pl0">任务状态</label>
                                    <div class="col-sm-8 pl0">
                                        <select name="status" id="status" class="form-control">
                                            <c:forEach items="${statusType}" var="st" varStatus="vt">
                                                <option value="${st.status}" <c:if test="${st.status == status}">selected</c:if>>${st.desc}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <label class="col-sm-4 control-label pl0">投放平台</label>
                                    <div class="col-sm-8 pl0">
                                        <select name="platform" id="platform" class="form-control">
                                            <c:forEach items="${platforms}" var="pf" varStatus="st">
                                                <option value="${pf}" <c:if test="${pf == platform}">selected</c:if>>${pf}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <label class="col-sm-4 control-label pl0">任务类型</label>
                                    <div class="col-sm-8 pl0">
                                        <select name="catName" id="catName" class="form-control">
                                            <option value="">所有</option>
                                            <c:forEach items="${cats}" var="cat" varStatus="st">
                                                <option value="${cat.name}" <c:if test="${cat.name == catName}">selected</c:if>>${cat.name}</option>
                                            </c:forEach>
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
                                    <th>任务名称</th>
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
                            <c:forEach items="${deepTasks}" var="deepTask" varStatus="st">
                                <tr>
                                    <td>${deepTask.id}</td>
                                    <td>${deepTask.name}</td>
                                    <td>${deepTask.catName}</td>
                                    <td>${deepTask.rewardCoin}</td>
                                    <td>${deepTask.platform}</td>
                                    <td><suishen_fmt:formatDate value="${deepTask.startTime}" /></td>
                                    <td><suishen_fmt:formatDate value="${deepTask.endTime}" /></td>
                                    <td class="sub_block">
                                        <span>投放${deepTask.totalNum}个</span>
                                        <span>已领取${deepTask.totalNum - deepTask.leftNum}个</span>
                                        <c:forEach items="${deepTask.stats}" var="var" varStatus="vt">
                                            <span>${var.key} : ${var.value}</span>
                                        </c:forEach>
                                    </td>
                                    <td class="sub_block">
                                        <a class="set_top blue" onclick="taskOff(${deepTask.id})">下架</a>
                                        <a class="set_top update blue" href="admin/deepTask/order?deep_task_id=${deepTask.id}&status=1">审核</a>
                                        <a class="set_top update blue" href="admin/deepTask/addMore?id=${deepTask.id}">追加</a>
                                        <a class="update blue" href="admin/deepTask/update?id=${deepTask.id}">编辑</a>
                                        <a class="set_top update blue" href="admin/deepTask/order?deep_task_id=${deepTask.id}&status=-1&startTime=${deepTask.startTime}&endTime=${deepTask.endTime}">订单</a>
                                    </td>
                                </tr>
                            </c:forEach>

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
<script src="assets_v2/myjs/datetime_range.js"></script>
<script>
    $("#menu_deeptask").addClass('active open');
    $("#deeptask_list").addClass('active');
    $(function () {
        new datetimeRange({startTime:${startTime},endTime:${endTime}});
    })

function taskOff(id) {
    if (confirm("确认下架该任务?")) {
        $.ajax({
            url : "admin/deepTask/taskOff?id=" + id,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！" + data.desc);
                } else {
                    alert("操作成功");
                    location.reload();
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
    }
</script>
</body>
</html>