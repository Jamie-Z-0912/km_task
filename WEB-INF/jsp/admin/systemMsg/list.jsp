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
			系统通知列表
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/systemMsg/list" method="get" id="basic_validate" name="basic_validate"
                                  class="form-horizontal" novalidate="novalidate">
                     <div class="control-group">
                         <label class="control-label">应用</label>
                         <div class="controls">
                             <select name="application" id="application" style="width: 120px;">
                                 <c:forEach items="${applications}" var="app">
                                     <option value="${app}" <c:if test="${app == application}">selected</c:if>>${app.appName}</option>
                                 </c:forEach>
                             </select>
                         </div>
                     </div>
                        <div class="control-group">
                          <label class="control-label">平台</label>
                          <div class="controls">
                              <select name="platform" id="platform" style="width: 120px;">
                                  <c:forEach items="${platforms}" var="plt">
                                      <option value="${plt}" <c:if test="${plt == platform}">selected</c:if>>${plt}</option>
                                  </c:forEach>
                              </select>
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
							<th width="5%">ID</th>
							<th width="25%">通知内容</th>
							<th>推送应用</th>
							<th>推送平台</th>
							<th>推送版本</th>
							<th>状态</th>
							<th width="10%">定时发送时间</th>
							<th>添加时间</th>
                            <th>发送时间</th>
							<th width="6%">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="systemMsg" varStatus="st">
                            <tr>
                                <td>${systemMsg.id}</td>
                                <td>
                                        标题: <c:if test="${systemMsg.title == ''}">
                                                   快马小报
                                              </c:if>
                                              <c:if test="${systemMsg.title != ''}">
                                                ${systemMsg.title}
                                              </c:if>
                                              </br>
                                        内容: ${systemMsg.msg}</br>
                                        点击动作: <c:forEach items="${msgActions}" var="ma" varStatus="st">
                                                                                           <c:if test="${ma.type == systemMsg.clickActionType}">${ma.desc}</c:if>
                                                                                   </c:forEach></br>
                                        跳转地址: ${systemMsg.action}</br>
                                        跳转是否要登录:    <c:if test="${systemMsg.needLogin == 1}"><font color="red">是</font></c:if>
                                                                                             <c:if test="${systemMsg.needLogin == 0}">否</c:if>
                                </td>
                                <td>
                                    <c:if test="${systemMsg.application == ''}">
                                        默认
                                    </c:if>
                                    <c:if test="${systemMsg.application != ''}">
                                        <c:forEach items="${applications}" var="app">
                                             <c:if test="${app == systemMsg.application}">${app.appName}</c:if>
                                         </c:forEach>
                                    </c:if>
                                </td>
                                <td>
                                        ${systemMsg.platform}
                                </td>
                                <td>
                                    <c:if test="${systemMsg.versions == ''}">所有版本</c:if>
                                    <c:if test="${systemMsg.versions != ''}">${systemMsg.versions}</c:if>
                                </td>
                                <td>
                                    <c:forEach items="${statusList}" var="msgStatus" varStatus="st">
                                        <c:if test="${msgStatus.status == systemMsg.status}">
                                            ${msgStatus.desc}
                                        </c:if>
                                    </c:forEach>
                                </td>

								<c:choose>
									<c:when test="${systemMsg.sendTime != 0}">
										<td><suishen_fmt:formatDate value="${systemMsg.sendTime}" /></td>
									</c:when>
									<c:otherwise>
										<td> </td>
									</c:otherwise>
								</c:choose>
								<td><suishen_fmt:formatDate value="${systemMsg.addedTime}" /></td>
                                <td><suishen_fmt:formatDate value="${systemMsg.updateTime}" /></td>
                                <td>
                                    <c:if test="${systemMsg.status == 1}">
                                        <a class="set_top update" href="admin/systemMsg/update?id=${systemMsg.id}" style="color: #4f99c6;"> <span class="blue"> <span>编辑</span></span></a><br/>
                                        <a class="set_top update" href="admin/systemMsg/delete?id=${systemMsg.id}" style="color: #4f99c6;"> <span class="blue"> <span>删除</span></span></a><br/>
                                        <a class="set_top update" onclick="send('${systemMsg.id}', '${systemMsg.application}', '${systemMsg.platform}', '${systemMsg.versions}');" <span class="blue"> <span>发送</span></span></a><br/>
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
    $("#menu_app").addClass('active open');
    $("#menu_systemMsg").addClass('active');
    function add() {
        var v = $("#application").val();
        window.location = "admin/systemMsg/add?application=" + v;
    }
	function send(id,application,platform,versions) {
	    var confirmMsg = "确认要给应用: ";
	    if (application == '') {
	        confirmMsg = confirmMsg + "默认";
	    } else {
	        confirmMsg = confirmMsg + application;
	    }
	    confirmMsg = confirmMsg + ",平台: " + platform + ",版本:" + versions + "发送通知?";
		if (confirm(confirmMsg)) {
			$.ajax({
				url : "admin/systemMsg/push?id=" + id,
				type : "post",
				dataType : "json",
				success : function(data) {
					if (data.status != 1000) {
						alert("发送失败！"+data.desc);
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

	function turnPage(page) {
    	// 分页列表URL
    	var href = "admin/systemMsg/list?status=${status}&platform=${platform}&page=" + page;
    	window.location.href = href;
    }
</script>
</html>