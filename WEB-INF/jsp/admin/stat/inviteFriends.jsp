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
                好友列表
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
            <form action="admin/inviteRelation/friends" method="get" id="basic_validate" name="basic_validate"
                              class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                    <label class="control-label">师傅uid/手机号:</label>
                    <div class="controls">
                        <input type="text" id="uid" name="uid" value="${uid}" class="input-xlarge" maxlength="40"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label">时间:<br />
                    </label>
                    <div class="controls">
                        <input type="text" id="startTime" data-oval="" class="start_time input-xlarge" />
                        <input type="hidden" name="startTime" id="start_time_hidden" />
                        -
                        <input type="text" id="endTime" data-oval="" class="start_time input-xlarge" />
                        <input type="hidden" name="endTime" id="end_time_hidden" />
                    </div>
                </div>

                <div class="control-group">
                     <label class="control-label">是否有效徒弟:</label>
                     <div class="controls">
                         <select name="isValid" id="isValid" style="width: 120px;">
                             <option value="-1" <c:if test="${'-1' == isValid}">selected</c:if>>默认</option>
                             <option value="0" <c:if test="${'0' == isValid}">selected</c:if>>否</option>
                             <option value="1" <c:if test="${'1' == isValid}">selected</c:if>>是</option>
                         </select>
                     </div>
                  </div>

                <div class="control-group">
                     <label class="control-label">排序规则:</label>
                     <div class="controls">
                         <select name="orderBy" id="orderBy" style="width: 120px;">
                             <option value="bring_profit_to_from" <c:if test="${'bring_profit_to_from' == orderBy}">selected</c:if>>给师傅带来收益</option>
                             <option value="added_time" <c:if test="${'added_time' == orderBy}">selected</c:if>>邀请时间</option>
                             <option value="recent_active_time" <c:if test="${'recent_active_time' == orderBy}">selected</c:if>>最近活跃时间</option>
                         </select>
                     </div>
                  </div>

                <div class="form-actions">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 查询
                    </button>
                </div>
            </form>

				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th width="8%">uid</th>
							<th width="10%">昵称</th>
							<th width="10%">头像</th>
							<th width="10%">是否有效徒弟</th>
							<th width="10%">带给我的金币</th>
							<th width="15%">最近活跃时间</th>
							<th width="15%">绑定好友时间</th>
							<th width="15%">注册时间</th>
						</tr>
					</thead>
					<tbody>
					    <c:forEach items="${inviteFriends}" var="iFriend" varStatus="st">
							<tr>
								<td>
								    <a class="set_top update" target="_blank" href="admin/users/base?uid=${iFriend.toUid}" style="color: #4f99c6; text-decoration: none;">${iFriend.toUid}</a>
								</td>
								<td>
								    ${iFriend.nick}
								</td>
								<td>
								    <img src="${iFriend.avatar}" />
                                </td>
                                <td>
                                    <c:if test="${iFriend.isValid == 1}">是</c:if>
                                    <c:if test="${iFriend.isValid == 0}">否</c:if>
                                </td>
								<td>
								    ${iFriend.bringProfitToFrom}
								</td>
								<td><suishen_fmt:formatDate value="${iFriend.recentActiveTime}" /></td>
                                <td><suishen_fmt:formatDate value="${iFriend.addedTime}" /></td>
                                <td><suishen_fmt:formatDate value="${iFriend.registerTime}" /></td>
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
$("#menu_stat").addClass('active open');//左侧导航栏选中状态
$("#submenu_stat_friendlist").addClass('active');
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

function turnPage(page) {
	// 分页列表URL
	var href = "admin/inviteRelation/friends?uid=${uid}&orderBy=${orderBy}&startTime=${startTime}&endTime=${endTime}&isValid=${isValid}&page=" + page;
	window.location.href = href;
}
</script>
</html>