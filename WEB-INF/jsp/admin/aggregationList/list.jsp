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
			列表页
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/aggregation/list" method="get" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                        <label class="control-label">内容类型</label>
                        <div class="controls">
                            <select name="contentType" id="contentType" style="width: 120px;">
                                <option value="-1" <c:if test="${-1 == contentType}">selected</c:if>>所有</option>
                                <option value="1" <c:if test="${1 == contentType}">selected</c:if>>文章</option>
                                <option value="2" <c:if test="${2 == contentType}">selected</c:if>>采集</option>
                            </select>
                        </div>
                     </div>
                     <div class="control-group">
                         <label class="control-label">活动ID</label>
                         <div class="controls">
                             <input type="text" id="actId" name="actId" value="${actId}" class="input-xlarge" maxlength="50"/>
                         </div>
                     </div>
                    <div class="form-actions">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok"></i> 查询
                        </button>
                        <a href="javascript:add();" class="btn btn-success btn-info" > <i class="icon-edit"></i>新增</a>
                    </div>
                </form>
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th>ID</th>
							<th>列表名称</th>
							<th>描述</th>
							<th>图片</th>
                            <th>内容类型</th>
                            <th>来源</th>
                            <th>关联活动Id</th>
                            <th>投放日期</th>
                            <th>状态</th>
							<th>添加时间</th>
                            <th>修改时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="aggregation" varStatus="st">
							<tr>
								<td>${aggregation.id}</td>
                                <td>${aggregation.name}</td>
                                <td>${aggregation.description}</td>
                                <td><img src="${aggregation.image}" id="avatar" name="avatar" style="width: 130px;" /></td>
                                <td>
                                    <c:forEach items="${contentTypes}" var="cType" varStatus="st">
                                        <c:if test="${cType.type == aggregation.contentType}">${cType.desc}</c:if>
                                    </c:forEach>
                                </td>
                                <td>${aggregation.origin}</td>
                                <td>${aggregation.actId}</td>
                                <td>${aggregation.date}</td>
                                <td>
                                    <c:if test="${aggregation.status == 0}"><font color="red">下架</font></c:if>
                                    <c:if test="${aggregation.status == 1}"><font color="green">上架</font></c:if>
                                </td>
								<td><suishen_fmt:formatDate value="${aggregation.addedTime}" /></td>
                                <td><suishen_fmt:formatDate value="${aggregation.updateTime}" /></td>
								<td>
                                    <a class="set_top update" href="admin/aggregation/update/${aggregation.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>编辑</span></span></a><br/>
                                    <c:if test="${aggregation.status == 0}">
                                        <a class="set_top update" onclick="up(${aggregation.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>上架</span></span></a><br/>
                                    </c:if>
                                    <c:if test="${aggregation.status == 1}">
                                        <a class="set_top update" onclick="down(${aggregation.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>下架</span></span></a><br/>
                                    </c:if>
                                    <a class="set_top update" href="admin/aggregation/details?id=${aggregation.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>详情</span></span></a><br/>
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
    window.location = "admin/aggregation/add";
}

function down(id) {
    if (confirm("您确认要下架此列表页吗？")) {
        $.ajax({
            url : "admin/aggregation/down?id=" + id,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！");
                } else {
                    window.location = "admin/aggregation/list";
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

function up(id) {
    if (confirm("您确认要上架此列表页吗？")) {
        $.ajax({
            url : "admin/aggregation/up?id=" + id,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！");
                } else {
                    window.location = "admin/aggregation/list";
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

function turnPage(page) {
	// 分页列表URL
	var href = "admin/aggregation/list?contentType=${contentType}&actId=${actId}&page=" + page;
	window.location.href = href;
}
</script>
</html>