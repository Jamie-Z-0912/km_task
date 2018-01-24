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
                白名单用户
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
            <form action="admin/whiteUser/list" method="get" id="basic_validate" name="basic_validate"
                              class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                    <label class="control-label">白名单账号(uid/ip):</label>
                    <div class="controls">
                        <input type="text" id="account" name="account" value="${account}" class="input-xxlarge" maxlength="80"/>
                    </div>
                </div>
                <div class="form-actions">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 查询
                    </button>
                    <button class="btn btn-info" type="button" onclick="addWhiteUser();">
                        添加白名单
                    </button>
                </div>
            </form>

				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th width="10%">账号(uid/ip)</th>
							<th width="20%">白名单原因</th>
							<th width="10%">是否白名单</th>
                            <th width="10%">添加日期</th>
                            <th width="10%">操作人</th>
                            <th width="10%">操作日期</th>
							<th width="10%" id="option">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${whiteList}" var="white" varStatus="st">
							<tr>
								<td>${white.account}</td>
								<td>${white.addReason}</td>
								<td>
                                    <c:choose>
                                        <c:when test="${white.status == 0}">
                                            <font color="red">否</font>
                                        </c:when>
                                        <c:when test="${white.status == 1}">
                                            <font color="green">是</font>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td><suishen_fmt:formatDate value="${white.addedTime}" /></td>
                                <td>${white.handler}</td>
								<td><suishen_fmt:formatDate value="${white.modifiedTime}" /></td>
								<td>
								    <c:if test="${white.status == 0}">
                                        <a class="set_top update" href="javascript:update(${white.account}, 1);" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue"> <span>恢复</span></span></a></br>
                                    </c:if>
                                    <c:if test="${white.status == 1}">
                                        <a class="set_top update" href="javascript:update(${white.account}, 0);" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue">  <span>取消</span></span></a></br>
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
$("#submenu_white_users").addClass('active');
function update(account, status) {
    if (confirm("您确认要执行此操作？")) {
        $.ajax({
            url : "admin/whiteUser/update?status=" + status + "&account=" + account,
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
function addWhiteUser() {
    window.location = "admin/whiteUser/add";
}

function turnPage(page) {
	// 分页列表URL
	var href = "admin/whiteUser/list?account=${account}&page=" + page;
	window.location.href = href;
}
</script>
</html>