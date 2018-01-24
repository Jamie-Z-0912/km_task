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
			用户搜索记录
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/users/searchLog" method="get" id="basic_validate" name="basic_validate"
                                  class="form-horizontal" novalidate="novalidate">
                   <div class="control-group">
                      <label class="control-label">设备平台</label>
                      <div class="controls">
                          <select name="devicePlatform" id="devicePlatform" style="width: 120px;">
                              <c:forEach items="${platforms}" var="plt">
                                    <option value="${plt}" <c:if test="${plt == devicePlatform}">selected</c:if>>${plt}</option>
                              </c:forEach>
                          </select>
                      </div>
                   </div>
                   <div class="control-group">
                        <label class="control-label">是否有效搜索:</label>
                        <div class="controls">
                            <select name="isValid" id="isValid" style="width: 120px;">
                                <option value="-1" <c:if test="${isValid == '-1'}">selected</c:if>>所有</option>
                                <option value="0" <c:if test="${isValid == '0'}">selected</c:if>>否</option>
                                <option value="1" <c:if test="${isValid == '1'}">selected</c:if>>是</option>
                            </select>
                        </div>
                   </div>
                   <div class="control-group">
                      <label class="control-label">搜索来源:</label>
                      <div class="controls">
                          <select name="source" id="source" style="width: 120px;">
                            <option value="-1" <c:if test="${source == '-1'}">selected</c:if>>所有</option>
                            <option value="1" <c:if test="${source == '1'}">selected</c:if>>首页搜索框</option>
                            <option value="2" <c:if test="${source == '2'}">selected</c:if>>搜索任务热词</option>
                            <option value="3" <c:if test="${source == '3'}">selected</c:if>>首页热词</option>
                            <option value="4" <c:if test="${source == '4'}">selected</c:if>>资源搜索</option>
                          </select>
                      </div>
                  </div>
                   <div class="control-group">
                         <label class="control-label">手机号:</label>
                         <div class="controls">
                             <input type="text" id="phone" name="phone" value="${phone}" />
                         </div>
                   </div>
                   <div class="control-group">
                       <label class="control-label">uid:</label>
                       <div class="controls">
                           <input type="text" id="uid" name="uid" value="${uid}" />
                       </div>
                   </div>
                   <div class="control-group">
                      <label class="control-label">ip:</label>
                      <div class="controls">
                          <input type="text" id="ip" name="ip" value="${ip}" />
                      </div>
                   </div>
                   <div class="control-group">
                       <label class="control-label">设备标识:</label>
                       <div class="controls">
                           <input type="text" id="device" name="device" value="${device}" />
                       </div>
                   </div>
                  <div class="control-group">
                        <label class="control-label">日期<br />
                        </label>
                        <div class="controls">
                            <input type="text" id="startTime" data-oval=""  />
                            <input type="hidden" name="startTime" id="start_time_hidden" />
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
							<th>uid</th>
							<th>搜索渠道</th>
							<th>搜狗pid</th>
							<th>搜索关键字</th>
							<th>搜索来源</th>
							<th>平台</th>
							<th>Client版本</th>
							<th>设备标识</th>
							<th>ip</th>
							<th>是否有效</th>
							<th>搜索时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="log" varStatus="st">
							<tr>
								<td><a target="_blank" href="admin/users/searchLog?uid=${log.uid}">${log.uid}</a></td>
								<td>${log.platform}</td>
								<td>${log.pid}</td>
								<td>
                                   ${log.keyword}
                                </td>
                                <td>
                                    <c:if test="${log.source == 1}">
                                        首页搜索框
                                    </c:if>
                                    <c:if test="${log.source == 2}">
                                        搜索任务热词
                                    </c:if>
                                    <c:if test="${log.source == 3}">
                                        首页热词
                                    </c:if>
                                    <c:if test="${log.source == 4}">
                                        资源搜索
                                    </c:if>
                                </td>
                                <td>
                                    ${log.devicePlatform}
                                </td>
                                <td>
                                   ${log.clientVersion}
                                </td>
                                <td>
                                    <a target="_blank" href="admin/users/searchLog?device=${log.device}">${log.device}</a>
                                </td>

                                <td>
                                    <a target="_blank" href="admin/users/searchLog?ip=${log.ip}">${log.ip}</a>
                                 </td>
                                <td>
                                    <c:if test="${log.isValid == 0}">
                                        <font color="red">否</font>
                                    </c:if>
                                    <c:if test="${log.isValid == 1}">
                                        <font color="green">是</font>
                                    </c:if>
                                </td>
                                <td>
                                    <suishen_fmt:formatDate value="${log.addedTime}" />
                                </td>
                                <td><a target="_blank" href="admin/users/base?uid=${log.uid}">用户信息</a></td>
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
$("#menu_stat").addClass('active open');
$("#submenu_search_log").addClass('active');

if($("#startTime").length > 0){
    $("#startTime").val(new Date(${startTime}).format("yyyy-MM-dd hh:mm:ss"));
    gx();
    $("#startTime").slTime({
        callback:function(){
            gx();
        }
    });
}
function gx(){
    var start = new Date($("#startTime").val().replace(/-/g,   "/")).getTime();
    $("#start_time_hidden").val(start);
}
function turnPage(page) {
	// 分页列表URL
	var href = "admin/users/searchLog?uid=${uid}&source=${source}&startTime=${startTime}&ip=${ip}&device=${device}&devicePlatform=${devicePlatform}&isValid=${isValid}&page=" + page;
	window.location.href = href;
}
</script>
</html>