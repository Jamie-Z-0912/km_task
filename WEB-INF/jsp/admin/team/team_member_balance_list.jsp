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
			<h1><span>团队分红列表</span>
            </h1>
		</div>
		<div class="row-fluid">
		    <form action="admin/team/team_member_balance_list" method="get" id="basic_validate" name="basic_validate"
                                          class="form-horizontal" novalidate="novalidate">



                <div class="control-group">
                    <label class="control-label">团队id</label>
                    <div class="controls">
                        <input type="text" id="teamId" name="teamId" value="<c:if test="${0 != teamId}">${teamId}</c:if>" class="input-large" maxlength="50"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">成员uid</label>
                    <div class="controls">
                        <input type="text" id="uid" name="uid" value="<c:if test="${0 != uid}">${uid}</c:if>" class="input-large" maxlength="50"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">日期</label>
                    <div class="controls">
                        <input type="text"  name="searchDate" id="searchDate" data-oval="" class="searchDate input-large" />
                    </div>
                </div>

                <div class="form-actions">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 查询
                    </button>
                </div>
            </form>
			<div class="row-fluid">
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
                            <th>日期</th>
                            <th>团队id</th>
                            <th>成员uid</th>
                            <th>任务</th>
                            <th>分红</th>
                            <th>创建时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${teamMemberBalances}" var="art" varStatus="st">
							<tr>
								<td>${art.date}</td>
                                <td>
                                        ${art.teamId}

                                </td>
                                <td>${art.uid}</td>


                                <td>
                                    <c:forEach items="${tasks}" var="orn" varStatus="st">
                                        <c:if test="${orn.taskCode == art.taskCode}">${orn.taskName}</c:if>
                                    </c:forEach>
                                </td>

                                <td>${art.coin}</td>
                                <td><suishen_fmt:formatDate value="${art.addedTime}" /></td>

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
</div></div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_team").addClass('active open');
$("#submenu_team_member_balance_list").addClass('active');


$("#searchDate").slTime({
    callback:function(){
        gx();
    }
});
if($("#searchDate").length > 0){
    if('${searchDate}'==null ||  '${searchDate}' ==''){
        $("#searchDate").val("");
    }else{
        $("#searchDate").val('${searchDate}');

    }

}

function gx(){
    $("#searchDate").val(new Date($("#searchDate").val().replace(/-/g,   "/")).format("yyyy-MM-dd"));
}

function turnPage(page) {
	// 分页列表URL
	var href = "admin/team/team_member_balance_list?teamId=${teamId}&uid=${uid}&searchDate=${searchDate}&page=" + page;
	window.location.href = href;
}
</script>
</html>