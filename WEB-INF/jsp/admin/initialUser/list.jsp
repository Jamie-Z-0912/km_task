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
			值得看采集用户
            </h1>
		</div>
		<div class="row-fluid">
		    <form action="admin/initialUsers/list" method="get" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                    <label class="control-label">手机号</label>
                    <div class="controls">
                        <input type="text" id="phone" name="phone" value="${phone}" class="input-xlarge" maxlength="50"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">uid</label>
                    <div class="controls">
                        <input type="text" id="uid" name="uid" value="${uid}" class="input-xlarge" maxlength="50"/>
                    </div>
                </div>
                <div class="form-actions">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 查询
                    </button>
                    <a href="admin/initialUsers/add" class="btn btn-success btn-info" > <i class="icon-edit"></i>新增</a>
                </div>
            </form>
			<div class="row-fluid">
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th>ID</th>
							<th>uid</th>
							<th>手机号</th>
							<th>状态</th>
                            <th>添加时间</th>
                            <th>修改时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${zhdkInitialUserses}" var="user" varStatus="st">
							<tr>
								<td>${user.id}</td>
								<td><a target="_blank" href="admin/users/base?uid=${user.uid}">${user.uid}</a></td>
								<td>${user.phone}</td>
								<td>
								    <c:if test="${user.status == 0}">
								        <font color="red">删除</font>
								    </c:if>
                                   <c:if test="${user.status == 1}">
                                        <font color="green"> 正常</font>
                                    </c:if>
                                </td>
								<td><suishen_fmt:formatDate value="${user.addedTime}" /></td>
								<td><suishen_fmt:formatDate value="${user.updateTime}" /></td>
								<td>
								    <c:if test="${user.status == 1}">
                                        <a class="set_top update" href="admin/initialUsers/delete?id=${user.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>删除</span></span></a><br/>
                                    </c:if>
                                    <c:if test="${user.status == 0}">
                                        <a class="set_top update" href="admin/initialUsers/recover?id=${user.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>恢复</span></span></a><br/>
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
</body>
<script>
$("#menu_zhidekan").addClass('active open');
$("#submenu_initial_user").addClass('active');

function turnPage(page) {
	// 分页列表URL
	var href = "admin/initialUsers/list?uid=${uid}&phone=${phone}&page=" + page;
	window.location.href = href;
}
</script>
</html>