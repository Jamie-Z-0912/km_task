<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt" %>
<jsp:include page="../header.jsp"/>
<jsp:include page="../sidebar.jsp"/>
<!-- 页面 -->
<div id="main-content" class="clearfix">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>
                分享任务列表
            </h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <form action="admin/browserTask/list" method="get" id="basic_validate" name="basic_validate"
                      class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                        <label class="control-label">任务名称</label>
                        <div class="controls">
                            <input type="text" id="keyword" name="keyword" width="20px" value="${keyword}"
                                   placeholder="任务名称"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">任务类型</label>
                        <div class="controls">
                            <select name="type" id="type" style="width: 120px;">
                                <option value="" <c:if test="${'' == type}">selected</c:if>>所有</option>
                                <option value="COIN_SHARE_TASK"
                                        <c:if test="${'COIN_SHARE_TASK' == type}">selected</c:if>>金币任务
                                </option>
                                <option value="CASH_SHARE_TASK"
                                        <c:if test="${'CASH_SHARE_TASK' == type}">selected</c:if>>现金任务
                                </option>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">任务状态</label>
                        <div class="controls">
                            <select name="status" id="status" style="width: 120px;">
                                <option value="-1" <c:if test="${-1 == status}">selected</c:if>>所有</option>
                                <option value="3" <c:if test="${3 == status}">selected</c:if>>展示</option>
                                <option value="2" <c:if test="${2 == status}">selected</c:if>>下架</option>
                                <option value="4" <c:if test="${4 == status}">selected</c:if>>过期</option>
                                <option value="1" <c:if test="${1 == status}">selected</c:if>>未上架</option>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">投放平台</label>
                        <div class="controls">
                            <select name="platform" id="platform" style="width: 120px;">
                                <option value="DEFAULT" <c:if test="${'DEFAULT' == platform}">selected</c:if>>所有
                                </option>
                                <option value="ANDROID" <c:if test="${'ANDROID' == platform}">selected</c:if>>ANDROID
                                </option>
                                <option value="IPHONE" <c:if test="${'IPHONE' == platform}">selected</c:if>>IPHONE
                                </option>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">开始时间<br/>
                        </label>
                        <div class="controls">
                            <input type="text" id="startTime" data-oval="" class="start_time input-large"/>
                            <input type="hidden" name="startTime" id="start_time_hidden"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">结束时间<br/>
                        </label>
                        <div class="controls">
                            <input type="text" id="endTime" data-oval="" class="end_time input-large"/>
                            <input type="hidden" name="endTime" id="end_time_hidden"/>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok"></i> 查询
                        </button>
                        <a onclick="consult()" class="btn btn-success btn-info"> <i class="icon-search"></i>当日之后任务</a>
                        <a onclick="expt()" class="btn btn-success btn-info"> <i class="icon-search"></i>导出</a>
                        <a href="javascript:add('admin/browserTask/addCoinTask');" class="btn btn-success btn-info"> <i
                                class="icon-edit"></i>金币任务</a>
                    </div>
                </form>
                <table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
                    <thead>
                    <tr>
                        <th width="5%">ID</th>
                        <th width="20%">任务内容</th>
                        <th>图片</th>
                        <th>结算方式</th>
                        <th>分享方式</th>
                        <th>投放平台</th>
                        <th>开始时间</th>
                        <th>结束时间</th>
                        <th width="5%">状态</th>
                        <th width="12%">统计</th>
                        <th width="5%">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="task" varStatus="st">
                        <tr>
                            <td>${task.id}</td>
                            <td>
                                标题: <a href="${task.originUrl}">${task.name}</a></br>
                                描述: ${task.shareDescription}</br>
                                来源: ${task.contentSource}</br>
                                总投放金额: ${task.totalAmount}</br>
                                单价: ${task.price}
                                <c:if test="${task.type == 'CASH_SHARE_TASK'}">
                                    元
                                </c:if>
                                <c:if test="${task.type == 'COIN_SHARE_TASK'}">
                                    金币
                                </c:if>
                                </br>
                            </td>
                            <td><img src="${task.image}"/></td>
                            <td>
                                <c:forEach items="${payMethods}" var="pm" varStatus="st">
                                    <c:if test="${task.payMethod == pm.method}">${pm.desc}</c:if>
                                </c:forEach>
                            </td>
                            <td>
                                <c:forEach items="${shareMethods}" var="pm" varStatus="st">
                                    <c:if test="${task.shareMethod == pm.method}">${pm.desc}</c:if>
                                </c:forEach>
                            </td>
                            <td>
                                    ${task.platform}
                            </td>
                            <td><suishen_fmt:formatDate value="${task.startTime}"/></td>
                            <td><suishen_fmt:formatDate value="${task.endTime}"/></td>
                            <td>
                                <c:choose>
                                    <c:when test="${2 == task.status}">
                                        <span style="color:gray">下架</span>
                                    </c:when>
                                    <c:when test="${now > task.endTime}">
                                        <span style="color:gray">过期</span>
                                    </c:when>
                                    <c:when test="${now > task.endTime && task.leftCount <= 0}">
                                        <span style="color:gray">售完</span>
                                    </c:when>
                                    <c:when test="${1 == task.status}">
                                        <span>上架</span>
                                    </c:when>
                                    <c:when test="${3 == task.status}">
                                        <span style="color:lightgreen">展示</span>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td>
                                总投放数: ${task.totalCount}</br>
                                剩余投放数: <font color="red">${task.leftCount}</font></br>
                                有效阅读数: ${task.validViewNum}</br>
                                总阅读数: ${task.totalViewNum}</br>
                            </td>
                            <td>
                                <a class="set_top update" href="admin/browserTask/update/${task.id}"
                                   style="color: #4f99c6; text-decoration: none;"> <span
                                        class="blue"> <span>编辑</span></span></a><br/>
                                <c:if test="${task.status == 1}">
                                    <a class="set_top update" onclick="setShow(${task.id})"
                                       style="color: #4f99c6; text-decoration: none;"> <span
                                            class="blue"> <span>展示</span></span></a><br/>
                                </c:if>
                                <c:if test="${task.status != 2}">
                                    <a class="set_top update" onclick="down(${task.id})"
                                       style="color: #4f99c6; text-decoration: none;"> <span
                                            class="blue"> <span>下架</span></span></a><br/>
                                </c:if>
                                <c:if test="${task.status == 2}">
                                    <a class="set_top update" onclick="up(${task.id})"
                                       style="color: #4f99c6; text-decoration: none;"> <span
                                            class="blue"> <span>上架</span></span></a><br/>
                                </c:if>
                                <a class="set_top update" onclick="topTask(${task.id})"
                                   style="color: #4f99c6; text-decoration: none;"> <span
                                        class="blue"> <span>置顶</span></span></a><br/>
                                <a href="admin/socialTaskOrders?taskId=${task.id}&startTime=1" class="set_top update"
                                   style="color: #4f99c6; text-decoration: none;">
                                    <span class="blue"> <span>订单</span></span></a><br/>
                                <c:if test="${task.leftCount < task.totalCount}">
                                    <a class="set_top update" href="admin/viewLogs?taskId=${task.id}"
                                       style="color: #4f99c6; text-decoration: none;"><span class="blue">阅读记录</span></a><br/>
                                </c:if>
                                <a class="set_top update" href="admin/tj/browserTask?start_time=${task.startTime}"
                                   style="color: #4f99c6; text-decoration: none;"> <span
                                        class="blue"> <span>统计</span></span></a><br/>
                                <a class="set_top update"
                                   href="admin/msg/push?type=task&id=${task.id}&platform=${task.platform}"
                                   style="color: #4f99c6; text-decoration: none;"> <span
                                        class="blue"> <span>推送</span></span></a><br/>
                                <a class="set_top update" href="admin/browserTask/newadd/${task.id}"
                                   style="color: #4f99c6; text-decoration: none;"><span class="blue">追加</span></a><br/>

                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!-- 分页 -->
                <div class="widget-box" style="margin-top: -10px;">
                    <div class="widget-header">
                        <div class="dataTables_info dataTables_paginate paging_bootstrap pagination"
                             style="margin-top: 5px; ">
                            <ul>
                                <li class="prev">
                                    <span class="previous fg-button ui-button ui-state-default ui-state-disabled">${total}条记录, 共${totalPage}页, 当前第${page}页</span>
                                </li>
                                <c:choose>
                                    <c:when test="${page!=1}">
                                        <li class="prev">
                                            <a href="javascript:turnPage(1)" title="首页"
                                               class="first ui-corner-tl ui-corner-bl fg-button ui-button ui-state-default ui-state-default"><span>首页</span></a>
                                            <a href="javascript:turnPage(${page-1})" title="上一页"
                                               class="previous fg-button ui-button ui-state-default ui-state-default"><span>上一页</span></a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev">
                                            <span class="first ui-corner-tl ui-corner-bl fg-button ui-button ui-state-default ui-state-disabled">首页</span>
                                            <span class="previous fg-button ui-button ui-state-default ui-state-disabled">上一页</span>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${page!=totalPage}">
                                        <li class="next">
                                            <a href="javascript:turnPage(${page+1})" title="下一页"
                                               class="next fg-button ui-button ui-state-default"><span>下一页</span></a>
                                            <a href="javascript:turnPage(${totalPage})" title="末页"
                                               class="last ui-corner-tr ui-corner-br fg-button ui-button ui-state-default"><span>末页</span></a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="next">
                                            <span class="next fg-button ui-button ui-state-default ui-state-disabled">下一页</span>
                                            <span class="last ui-corner-tr ui-corner-br fg-button ui-button ui-state-default ui-state-disabled">末页</span>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- 分页 -->
            </div>
        </div>
    </div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp"/>
</body>
<script>
    $("#menu_task").addClass('active open');
    $("#browser_task").addClass('active');

    function add(url) {
        var v = $("#application").val();
        window.location = url + "?application=" + v;
    }

    function down(taskId) {
        if (confirm("您确认要下架此任务吗？")) {
            $.ajax({
                url: "admin/browserTask/down?task_id=" + taskId,
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (data.status != 1000) {
                        alert("操作失败！");
                    } else {
                        location.reload();
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
    }

    function up(taskId) {
        if (confirm("您确认要上架此任务吗？")) {
            $.ajax({
                url: "admin/browserTask/up?task_id=" + taskId,
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (data.status != 1000) {
                        alert("操作失败！");
                    } else {
                        location.reload();
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
    }

    function setShow(taskId) {
        if (confirm("您确认要展示此任务吗？")) {
            $.ajax({
                url: "admin/browserTask/show?task_id=" + taskId,
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (data.status != 1000) {
                        alert("操作失败！");
                    } else {
                        location.reload();
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
    }

    function topTask(taskId) {
        if (confirm("您确认要置顶此任务吗？")) {
            $.ajax({
                url: "admin/browserTask/top?task_id=" + taskId,
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (data.status != 1000) {
                        alert("操作失败！");
                    } else {
                        location.reload();
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
    }

    if ($("#startTime").length > 0) {
        $("#startTime").val(new Date(${startTime}).format("yyyy-MM-dd hh:mm:ss"));
        $("#endTime").val(new Date(${endTime}).format("yyyy-MM-dd hh:mm:ss"));
        gx();
        $("#startTime").slTime({
            callback: function () {
                gx();
            }
        });
        $("#endTime").slTime({
            callback: function () {
                gx();
            }
        });
    }

    function gx() {
        var start = new Date($("#startTime").val().replace(/-/g, "/")).getTime();
        var end = new Date($("#endTime").val().replace(/-/g, "/")).getTime();
        $("#start_time_hidden").val(start);
        $("#end_time_hidden").val(end);
    }

    function expt() {
        var starttime = $("#start_time_hidden").val();
        var endtime = $("#end_time_hidden").val();
        window.location.href = "admin/browserTask/export?start_time=" + starttime + "&end_time=" + endtime;
    }

    function consult() {
        var starttime = $("#start_time_hidden").val();
        window.location.href = "admin/browserTask/consult?startTime=" + starttime ;
    }

    function turnPage(page) {
        // 分页列表URL
        var href = "admin/browserTask/list?keyword=${keyword}&platform=${platform}&status=${status}&startTime=${startTime}&endTime=${endTime}&type=${type}&page=" + page;
        window.location.href = href;
    }
</script>
</html>