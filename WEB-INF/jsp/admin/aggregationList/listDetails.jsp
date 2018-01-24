
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
			    列表页详情
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/aggregation/details" method="get" id="basic_validate" name="basic_validate"
                                                  class="form-horizontal" novalidate="novalidate">
                       <div class="form-actions">
                            <a href="javascript:add();" class="btn btn-success btn-info" > <i class="icon-edit"></i>新增</a>
                       </div>
                </form>
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th width="10%">列表id</th>
							<th width="10%">内容id</th>
							<th width="10%">内容类型</th>
							<th width="10%">标题</th>
							<th width="10%">图片</th>
							<th width="10%">布局方式</th>
							<th width="10%">保留字段</th>
							<th width="10%">修改时间</th>
							<th width="10%">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="details" varStatus="st">
							<tr>
								<td>
								    ${details.listId}
								</td>
								<td>
                                    ${details.contentId}
                                </td>
								<td>
                                    <c:forEach items="${contentTypes}" var="cType" varStatus="st">
                                        <c:if test="${cType.type == details.contentType}">${cType.desc}</c:if>
                                    </c:forEach>
                                </td>
								<td>${details.title}</td>
								<td>
								    <c:forEach items="${details.imagesList}" var="img" varStatus="st">
								        <img src="${img}" id="avatar" name="avatar" style="width: 130px;" />
								    </c:forEach>
								</td>
								<td>
                                    <c:forEach items="${layouts}" var="layout" varStatus="st">
                                        <c:if test="${layout.layout == details.layout}">${layout.desc}</c:if>
                                    </c:forEach>
                                </td>
								<td>${details.reservedColumn}</td>
                                <td><suishen_fmt:formatDate value="${details.updateTime}" /></td>
                                <td>
                                    <a class="set_top update" href="admin/aggregation/updateDetails/${details.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>编辑</span></span></a><br/>
                                    <a class="set_top update" onclick="del('${details.id}');" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>删除</span></span></a><br/>
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
$("#menu_activity").addClass('active open');
$("#submenu_aggregation").addClass('active');

function add() {
    window.location = "admin/aggregation/addDetails?listId=${listId}";
}

function del(id) {
    var msg = "确认要删除此列表页数据？";
    if (confirm(msg)){
        window.location = "admin/aggregation/delDetails/" + id;
    } else {
        return false;
    }
}

function turnPage(page) {
	// 分页列表URL
	var href = "admin/aggregation/details?id=${listId}&page=" + page;
	window.location.href = href;
}
</script>
</html>