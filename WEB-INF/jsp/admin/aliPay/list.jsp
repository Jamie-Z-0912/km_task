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
                支付宝账号邮箱黑名单
            </h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <form action="admin/aliPay/list" method="get" id="basic_validate" name="basic_validate"
                      class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                        <label class="control-label">类型</label>
                        <div class="controls">
                            <select name="type" id="type" style="width: 180px;">
                                <option value="0">所有</option>
                                <c:forEach items="${types}" var="to" varStatus="st">
                                        <option value="${to.type}"
                                                <c:if test="${to.type== type}">selected</c:if>>${to.desc}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">姓名/邮箱域名</label>
                        <div class="controls">
                            <input type="text" id="name" name="name" value="${name}" class="input-xlarge" maxlength="80"/>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok"></i> 查询
                        </button>
                        <button class="btn btn-info" type="button" onclick="add();">
                            添加异常姓名/邮箱域名
                        </button>
                    </div>
                </form>

                <table class="table table-bordered table-striped">
                    <thead>
                    <tr>
                        <th width="10%">ID</th>
                        <th width="10%">名称</th>
                        <th width="10%">类型</th>
                        <th width="10%">操作日期</th>
                        <th width="15%" id="option">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${accountList}" var="account" varStatus="st">
                        <tr>
                            <td>${account.id}</td>
                            <td>${account.name}</td>
                            <td>
                                    <c:forEach items="${types}" var="to" varStatus="st">
                                       <c:if test="${to.type== account.type}">${to.desc}</c:if>
                                    </c:forEach>
                           </td>
                            <td><suishen_fmt:formatDate value="${account.addedTime}" /></td>
                            <td>
                                <c:if test="${grayUser.status == 1}">
                                    <a class="set_top update" href="javascript:cancel(${grayUser.id}, 0);" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue">  <span>解除</span></span></a></br>
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
    $("#submenu_aliPay").addClass('active');

    function add() {
        window.location = "admin/aliPay/add";
    }

    function turnPage(page) {
        // 分页列表URL
        var href = "admin/aliPay/list?type=${type}&name=${name}&pageSize=${pageSize}&page=" + page;
        window.location.href = href;
    }
</script>
</html>