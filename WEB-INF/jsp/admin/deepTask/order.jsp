<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../header_v2.jsp"/>
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>
    <jsp:include page="../sidebar_v2.jsp"/>
    <!-- 页面 -->
    <div class="main-content">
        <!-- here area:basics/content.breadcrumbs -->
        <div id="page-content" class="page-content">
            <div class="page-content-area">
                <div class="page-header"><h1>深度任务订单列表</h1></div>
                <div class="row">
                    <div class="col-xs-12">
                        <form action="admin/deepTask/order" method="get" class="form-horizontal" id="myform"
                              role="form">
                            <div class="form-group">
                                <div class="col-sm-4">
                                    <label class="col-sm-4 control-label pl0">任务名称</label>
                                    <div class="col-sm-8 pl0">
                                        <input name="name" id="name" type="text" class="form-control" value="${name}">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <label class="col-sm-4 control-label pl0">任务状态</label>
                                    <div class="col-sm-8 pl0">
                                        <select name="status" id="status" class="form-control">
                                            <c:forEach items="${statusType}" var="st" varStatus="vt">
                                                <option value="${st.status}"
                                                        <c:if test="${st.status == status}">selected</c:if>>${st.desc}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <label class="col-sm-4 control-label pl0">UID</label>
                                    <div class="col-sm-8 pl0">
                                        <input type="text" name="uid" id="uid" class="form-control" value="${uid}">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4">
                                    <label class="col-sm-4 control-label pl0">任务ID</label>
                                    <div class="col-sm-8 pl0">
                                        <input type="text" name="taskId" id="taskId" value="${taskId}"
                                               class="form-control">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <label class="col-sm-4 control-label pl0">开始时间</label>
                                    <div class="col-sm-8 pl0">
                                        <input type="text" id="start_time" class="form-control"/>
                                        <!-- 用于提交表单 -->
                                        <input type="hidden" id="startTime" name="startTime" value="${startTime}">
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <label class="col-sm-4 control-label pl0">结束时间</label>
                                    <div class="col-sm-8 pl0">
                                        <input type="text" id="end_time" class="form-control"/>
                                        <!-- 用于提交表单 -->
                                        <input type="hidden" id="endTime" name="endTime" value="${endTime}">
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix form-actions">
                                <div class="col-md-offset-3 col-md-9">
                                    <button class="btn btn-info" id="submitForm" type="submit">
                                        <i class="ace-icon fa fa-check bigger-110"></i> 查询
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-xs-12">
                        <table class="table table-striped table-bordered table-hover">
                            <colgroup>
                                <col width="10%">
                                <col width="80">
                                <col width="60">
                                <col>
                                <col width="15.6%">
                                <col width="10%">
                                <col width="86">
                                <col width="86">
                                <col width="7%">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th>订单ID</th>
                                    <th>UID</th>
                                    <th>状态</th>
                                    <th>任务标题</th>
                                    <th>提交信息</th>
                                    <th>提交图片</th>
                                    <th>接任务时间</th>
                                    <th>提交时间</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${deepTaskOrders}" var="deepTaskOrder" varStatus="st">
                                <tr>
                                    <td>${deepTaskOrder.id}</td>
                                    <td>${deepTaskOrder.uid}</td>
                                    <td>
                                        <c:forEach items="${statusType}" var="st">
                                            <c:if test="${st.status == deepTaskOrder.status}">${st.desc}</c:if>
                                        </c:forEach>
                                    </td>
                                    <td>${deepTaskOrder.name}</td>
                                    <td class="sub_block">
                                        <c:forEach items="${deepTaskOrder.commitInfo}" var="var" varStatus="st">
                                            <span>${var.desc} : ${var.content} <br/></span>
                                        </c:forEach>
                                    </td>
                                    <td class="sub_block">
                                        <c:forEach items="${deepTaskOrder.examplePhoto}" var="var" varStatus="st">
                                            <span><img src="${var}" alt="" style="width: 130px;"><br/></span>
                                        </c:forEach>
                                    </td>
                                    <td><suishen_fmt:formatDate value="${deepTaskOrder.addedTime}"/></td>
                                    <td><suishen_fmt:formatDate value="${deepTaskOrder.commitTime}"/></td>
                                    <td class="sub_block">
                                        <c:if test="${status == 1}">
                                        <a class="blue" onclick="orderOn(${deepTaskOrder.id})">通过</a>
                                        <a class="blue" onclick="orderOff(${deepTaskOrder.id})">拒绝</a>
                                        </c:if>
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
    $("#deeptask_order").addClass('active');
    $(function () {
        new datetimeRange({startTime:${startTime},endTime:${endTime}});
    })

    function orderOff(orderId) {
        if (confirm("确认拒绝该订单?")) {
            $.ajax({
                url: "admin/deepTask/orderOff?order_id=" + orderId,
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (data.status != 1000) {
                        alert("操作失败！" + data.desc);
                    } else {
                        alert("操作成功");
                        location.reload();
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
    }

    function orderOn(orderId) {
        if (confirm("确认通过该订单?")) {
            $.ajax({
                url: "admin/deepTask/orderOn?order_id=" + orderId,
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (data.status != 1000) {
                        alert("操作失败！" + data.desc);
                    } else {
                        alert("操作成功");
                        location.reload();
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
    }
</script>
</body>
</html>