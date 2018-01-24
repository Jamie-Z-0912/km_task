
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
			    活动用户
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/optActivity/actUsers" method="get" id="basic_validate" name="basic_validate"
                                                  class="form-horizontal" novalidate="novalidate">
                      <input type="hidden" name="activityId" id="activityId" value="${activityId}"/>
                      <div class="control-group">
                          <label class="control-label">用户状态</label>
                          <div class="controls">
                              <select name="status" id="status" style="width: 120px;">
                                  <option value="0" <c:if test="${0 == status}">selected</c:if>>报名</option>
                                  <option value="1" <c:if test="${1 == status}">selected</c:if>>已结算</option>
                              </select>
                          </div>
                       </div>
                       <div class="control-group">
                         <label class="control-label">奖励金额</label>
                         <div class="controls">
                             <select name="isReward" id="isReward" style="width: 120px;">
                                 <option value="-1" <c:if test="${-1 == isReward}">selected</c:if>>默认</option>
                                 <option value="1" <c:if test="${1 == isReward}">selected</c:if>>大于0</option>
                                 <option value="0" <c:if test="${0 == isReward}">selected</c:if>>未获得奖励</option>
                             </select>
                         </div>
                      </div>
                       <div class="form-actions">
                           <button class="btn btn-info" type="submit">
                               <i class="icon-ok"></i> 查询
                           </button>
                       </div>
                </form>
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th width="10%">活动名称</th>
							<th width="10%">uid</th>
							<th width="10%">手机号</th>
							<th width="10%">总徒弟数</th>
							<th width="10%">赏金徒弟数</th>
							<th width="10%">活动奖励</th>
							<th width="10%">状态</th>
							<th width="10%">报名时间</th>
							<th width="10%">结算时间</th>
							<th width="10%">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="actUser" varStatus="st">
							<tr>
								<td>
                                    ${actUser.activityName}
                                </td>
								<td>
								    <a target="_blank" href="admin/users/base?uid=${actUser.uid}">${actUser.uid}</a>
								</td>
								<td>${actUser.phone}</td>
								<td>${actUser.totalSonNum}</td>
								<td>${actUser.validSonNum}</td>
								<td>${actUser.reward}</td>
								<td>
								    <c:if test="${actUser.status == 0}">报名</c:if>
								    <c:if test="${actUser.status == 1}">已结算</c:if>
								</td>
                                <td><suishen_fmt:formatDate value="${actUser.addedTime}" /></td>
                                <td><suishen_fmt:formatDate value="${actUser.updateTime}" /></td>
                                <td>
                                    <c:if test="${actUser.status == 0}">
                                        <a class="set_top update" onclick="pay(${actUser.activityId}, ${actUser.uid})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>结算</span></span></a>
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
$("#menu_activity").addClass('active open');
$("#submenu_optActivity").addClass('active');

function pay(actId, uid) {
    if (confirm("确认结算此用户？")) {
        $.ajax({
            url : href="admin/optActivity/payUser?activityId=" + actId + "&uid=" + uid,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败, " + data.desc);
                } else {
                    window.location="admin/optActivity/actUsers?activityId="+actId;
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
	var href = "admin/optActivity/actUsers?activityId=${activityId}&status=${status}&isReward=${isReward}&page=" + page;
	window.location.href = href;
}
</script>
</html>