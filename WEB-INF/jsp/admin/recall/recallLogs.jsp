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
			    召回统计
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/browserTask/list" method="get" id="basic_validate" name="basic_validate"
                                                  class="form-horizontal" novalidate="novalidate">
                    <div class="form-actions">
                        <a href="" class="btn btn-success btn-info" > 总召回用户: ${total}</a>
                        <a href="" class="btn btn-success btn-info" > 成功召回: ${successRecallUserNum} </a>
                        <a href="" class="btn btn-success btn-info" > 召回率:${recallRate}%</a>
                        <a href="" class="btn btn-success btn-info" > 清空余额:${clearYue}</a>
                    </div>
                </form>
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th width="6%">计划id</th>
							<th width="11%">uid</th>
							<th width="10%">手机号</th>
							<th width="10%">昵称</th>
                            <th width="7%">清空余额</th>
                            <th width="7%">推送次数</th>
                            <th width="7%">短信次数</th>
                            <th width="7%">召回结果</th>
                            <th width="7%">所需天数</th>
                            <th>开始召回时间</th>
                            <th>最后操作时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${recallLogs}" var="recallLog" varStatus="st">
							<tr>
								<td>
								    <a href="admin/recallPlan/list">${recallLog.recallPlanId}</a>
								</td>
								<td>
								    <a target="_blank" href="admin/users/base?uid=${recallLog.uid}">${recallLog.uid}</a>
								</td>
								<td>${recallLog.phone}</td>
								<td>${recallLog.nick}</td>
								<td>${recallLog.yue}</td>
                                <td>${recallLog.pushNum}</td>
                                <td>${recallLog.sendShortMsgNum}</td>
                                <td>
                                    <c:if test="${0 == recallLog.recallResult}">
                                        <font color="#FFA500">召回中</font>
                                    </c:if>
                                    <c:if test="${1 == recallLog.recallResult}">
                                        <font color="green">成功</font>
                                    </c:if>
                                    <c:if test="${2 == recallLog.recallResult}">
                                        <font color="red">失败</font>
                                    </c:if>
                                </td>
                                <td>${recallLog.recallSuccessDayNum}</td>
                                <td><suishen_fmt:formatDate value="${recallLog.addedTime}" /></td>
                                <td><suishen_fmt:formatDate value="${recallLog.updateTime}" /></td>
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
$("#menu_recall").addClass('active');

function turnPage(page) {
	// 分页列表URL
	var href = "admin/recallPlan/logs?recallPlanId=${recallPlanId}&page=" + page;
	window.location.href = href;
}
</script>
</html>