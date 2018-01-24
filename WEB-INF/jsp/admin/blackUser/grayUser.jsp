<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt"%>
<jsp:include page="../header.jsp" />
<jsp:include page="../sidebar.jsp" />
<!-- 页面 -->
<div id="main-content" class="clearfix">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>
                灰名单用户
            </h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <form action="admin/grayUsers" method="get" id="basic_validate" name="basic_validate"
                      class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                        <label class="control-label">状态</label>
                        <div class="controls">
                            <select name="grayUserStatus" id="grayUserStatus" style="width: 120px;">
                                <option value="-1" <c:if test="${-1 == grayUserStatus}">selected</c:if>>所有</option>
                                <option value="0" <c:if test="${0 == grayUserStatus}">selected</c:if>>已解除</option>
                                <option value="1" <c:if test="${1 == grayUserStatus}">selected</c:if>>观察中</option>
                                <option value="2" <c:if test="${2 == grayUserStatus}">selected</c:if>>已拉黑</option>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">账号类型</label>
                        <div class="controls">
                            <select name="grayAccountType" id="grayAccountType" style="width: 120px;">
                                <option value="">所有</option>
                                <c:forEach items="${grayAccountTypeValues}" var="bat" varStatus="st">
                                    <c:if test="${bat.type == grayAccountType}">
                                        <option value="${bat.type}" selected>${bat.type}</option>
                                    </c:if>
                                    <c:if test="${bat.type != grayAccountType}">
                                        <option value="${bat.type}">${bat.type}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">观察类型</label>
                        <div class="controls">
                            <select name="grayReasonType" id="grayReasonType" style="width: 120px;">
                                <option value="-1">所有</option>
                                <c:forEach items="${grayReasonTypeValues}" var="grt" varStatus="st">
                                    <c:if test="${grt.type == grayReasonType}">
                                        <option value="${grt.type}" selected>${grt.desc}</option>
                                    </c:if>
                                    <c:if test="${grt.type != grayReasonType}">
                                        <option value="${grt.type}">${grt.desc}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">观察账号(uid/phone/ip):</label>
                        <div class="controls">
                            <input type="text" id="uid" name="uid" value="${uid}" class="input-xlarge" maxlength="80"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">开始时间<br />
                        </label>
                        <div class="controls">
                            <input type="text" id="startTime" data-oval="" class="start_time input-xlarge" />
                            <input type="hidden" name="startTime" id="start_time_hidden" />
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">结束时间<br />
                        </label>
                        <div class="controls">
                            <input type="text" id="endTime" data-oval="" class="start_time input-xlarge" />
                            <input type="hidden" name="endTime" id="end_time_hidden" />
                        </div>
                    </div>
                    <div class="form-actions">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok"></i> 查询
                        </button>
                        <button class="btn btn-info" type="button" onclick="addGrayUser();">
                            添加灰名单
                        </button>
                    </div>
                </form>

                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th width="10%">账号</th>
                        <th width="10%">账号类型</th>
                        <th width="10%">观察类型</th>
                        <th width="20%">观察原因</th>
                        <th width="10%">状态</th>
                        <th width="10%">拉灰日期</th>
                        <th width="10%">操作人</th>
                        <th width="10%">操作日期</th>
                        <th width="15%" id="option">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${grayUsers}" var="grayUser" varStatus="st">
                        <tr>
                            <td>${grayUser.grayAccount}</td>
                            <td>${grayUser.type}</td>
                            <td>
                                <c:forEach items="${grayReasonTypeValues}" var="brt" varStatus="st">
                                    <c:if test="${brt.type == grayUser.reasonType}">
                                        ${brt.desc}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>${grayUser.addReason}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${grayUser.status == 1}">
                                        <font color="red">观察中</font>
                                    </c:when>
                                    <c:when test="${grayUser.status == 0}">
                                        <font color="green">已解除</font>
                                    </c:when>
                                    <c:when test="${grayUser.status == 2}">
                                        <font color="green">已拉黑</font>
                                    </c:when>
                                </c:choose>
                            </td>
                            <td><suishen_fmt:formatDate value="${grayUser.addedTime}" /></td>
                            <td>${grayUser.handler}</td>
                            <td><suishen_fmt:formatDate value="${grayUser.updateTime}" /></td>
                            <td>
                                <c:if test="${grayUser.status == 1}">
                                    <a class="set_top update" href="javascript:cancel(${grayUser.id}, 0);" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue">  <span>解除</span></span></a></br>
                                </c:if>
                                <c:if test="${grayUser.status == 1}">
                                    <a class="set_top update" href="javascript:update(${grayUser.id}, 1);" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue">  <span>拉黑</span></span></a></br>
                                </c:if>
                                <c:if test="${grayUser.type == 'UID'}">
                                    <a class="set_top update" href="admin/users/base?uid=${grayUser.grayAccount}" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue">  <span>用户信息</span></span></a></br>
                                </c:if>
                                <c:if test="${grayUser.type == 'PHONE'}">
                                    <a class="set_top update" href="admin/users/base?phone=${grayUser.grayAccount}" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue"><span>用户信息</span></span></a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!-- 分页 -->
                <div class="widget-box" style="margin-top: -10px;">
                    <div class="widget-header">
                        <div class="dataTables_info dataTables_paginate paging_bootstrap pagination" style="margin-top: 5px; ">
                            <ul>
                                <li class="prev">
                                    <span class="previous fg-button ui-button ui-state-default ui-state-disabled">${total}条记录, 共${totalPage}页, 当前第${page}页</span>
                                </li>
                                <c:choose>
                                    <c:when test="${page!=1}">
                                        <li class="prev">
                                            <a href="javascript:turnPage(1)" title="首页" class="first ui-corner-tl ui-corner-bl fg-button ui-button ui-state-default ui-state-default"><span>首页</span></a>
                                            <a href="javascript:turnPage(${page-1})" title="上一页" class="previous fg-button ui-button ui-state-default ui-state-default"><span>上一页</span></a>
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
                                            <a href="javascript:turnPage(${page+1})" title="下一页" class="next fg-button ui-button ui-state-default"><span>下一页</span></a>
                                            <a href="javascript:turnPage(${totalPage})" title="末页" class="last ui-corner-tr ui-corner-br fg-button ui-button ui-state-default"><span>末页</span></a>
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
<jsp:include page="../foot.jsp" />
<link rel="stylesheet" href="assets/css/setting.css"/>
<script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
<script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>
</body>
<script>
    $("#menu_black").addClass('active open');//左侧导航栏选中状态
    $("#submenu_gray_users").addClass('active');
    function cancel(id, status) {
        if (confirm("您确认要执行此操作？")) {
            $.ajax({
                url : "admin/grayUsers/" + id + "?status=" + status,
                type : "GET",
                dataType : "json",
                success : function(data) {
                    if (data.status != 1000) {
                        alert("操作失败！" + data.desc);
                    } else {
                        location.reload();
                    }
                },
                error : function(error) {
                    console.log(error);
                }
            });
        }
    }
    function update(account, type) {
        if (confirm("您确认要执行此操作？")) {
            $.ajax({
                url : "admin/blackUsers?account=" + account + "&type=" + type,
                type : "put",
                dataType : "json",
                success : function(data) {
                    if (data.status != 1000) {
                        alert("操作失败！" + data.desc);
                    } else {
                        location.reload();
                    }
                },
                error : function(error) {
                    console.log(error);
                }
            });
        }
    }
    function updateByIP(ip) {
        if (confirm("您确认要解除该ip下所有拉黑用户？")) {
            $.ajax({
                url : "admin/blackUsers/ip?ip=" + ip,
                type : "put",
                dataType : "json",
                success : function(data) {
                    if (data.status != 1000) {
                        alert("操作失败！" + data.desc);
                    } else {
                        location.reload();
                    }
                },
                error : function(error) {
                    console.log(error);
                }
            });
        }
    }
    if($("#startTime").length > 0){
        $("#startTime").val(new Date(${startTime}).format("yyyy-MM-dd hh:mm:ss"));
        $("#endTime").val(new Date(${endTime}).format("yyyy-MM-dd hh:mm:ss"));
        gx();
        $("#startTime").slTime({
            callback:function(){
                gx();
            }
        });
        $("#endTime").slTime({
            callback:function(){
                gx();
            }
        });
    }
    function gx(){
        var start = new Date($("#startTime").val().replace(/-/g,   "/")).getTime();
        var end = new Date($("#endTime").val().replace(/-/g,   "/")).getTime();
        $("#start_time_hidden").val(start);
        $("#end_time_hidden").val(end);
    }
    function addGrayUser() {
        window.location = "admin/grayUser/add";
    }

    function turnPage(page) {
        // 分页列表URL
        var href = "admin/blackUsers?uid=${uid}&grayUserStatus=${grayUserStatus}&blackAccountType=${grayAccountType}&blackReasonType=${grayReasonType}&startTime=${startTime}&endTime=${endTime}&page=" + page;
        window.location.href = href;
    }
</script>
</html>