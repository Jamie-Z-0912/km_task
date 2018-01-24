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
                分享任务阅读记录
            </h1>
		</div>
        <div class="row-fluid">
            <form action="admin/viewLogs" method="get" id="basic_validate" name="basic_validate"
                              class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                  <label class="control-label">任务id:</label>
                  <div class="controls">
                      <input type="text" id="taskId" name="taskId" value="${taskId}" class="input-xlarge" maxlength="40"/>
                  </div>
                </div>
                <div class="control-group">
                    <label class="control-label">uid/手机号:</label>
                    <div class="controls">
                        <input type="text" id="uid" name="uid" value="${uid}" class="input-xlarge" maxlength="40"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">时间<br />
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
                    <label class="control-label">是否有效:</label>
                    <div class="controls">
                        <select name="isValid" id="isValid" style="width: 120px;">
                            <option value="-1" <c:if test="${-1 == isValid}">selected</c:if>>所有</option>
                            <option value="0" <c:if test="${0 == isValid}">selected</c:if>>否</option>
                            <option value="1" <c:if test="${1 == isValid}">selected</c:if>>是</option>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">无效原因</label>
                    <div class="controls">
                        <select name="invalidReason" id="invalidReason" style="width: 120px;">
                            <option value="0" <c:if test="${0 == invalidReason}">selected</c:if>>所有</option>
                            <option value="1" <c:if test="${1 == invalidReason}">selected</c:if>>浏览时任务状态异常(任务下架等)</option>
                            <option value="2" <c:if test="${2 == invalidReason}">selected</c:if>>浏览时任务已结束(售完或到期)</option>
                            <option value="3" <c:if test="${3 == invalidReason}">selected</c:if>>任务没有被分享</option>
                            <option value="4" <c:if test="${4 == invalidReason}">selected</c:if>>非移动设备浏览</option>
                            <option value="5" <c:if test="${5 == invalidReason}">selected</c:if>>阅读平台非qq微信微博qq空间或与投放的计费方式不匹配</option>
                            <option value="6" <c:if test="${6 == invalidReason}">selected</c:if>>无效的Cookie,疑似作弊</option>
                            <option value="7" <c:if test="${7 == invalidReason}">selected</c:if>>单用户单任务单ip限制10次有效阅读</option>
                            <option value="8" <c:if test="${8 == invalidReason}">selected</c:if>>单任务单ip限制100次有效阅读</option>
                            <option value="10" <c:if test="${10 == invalidReason}">selected</c:if>>浏览时任务订单已过期</option>
                            <option value="11" <c:if test="${11 == invalidReason}">selected</c:if>>浏览时任务订单状态异常</option>
                            <option value="12" <c:if test="${12 == invalidReason}">selected</c:if>>该指纹设备已经浏览过此任务</option>
                            <option value="13" <c:if test="${13 == invalidReason}">selected</c:if>>此次浏览缺少设备指纹</option>
                            <option value="14" <c:if test="${14 == invalidReason}">selected</c:if>>单用户每日有效阅读上限200次</option>
                            <option value="15" <c:if test="${15 == invalidReason}">selected</c:if>>该Cookie已经浏览过此任务</option>
                        </select>
                    </div>
                </div>
                <div class="form-actions">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 查询
                    </button>
                </div>
            </form>
            <table class="table table-bordered" style="table-layout:fixed; word-break: break-all;">
                <thead>
                    <tr>
                        <th width="5%">id</th>
                        <th>uid</th>
                        <th width="8%">任务ID</th>
                        <th>结算方式</th>
                        <th width="15%">浏览者信息</th>
                        <th>阅读次数</th>
                        <th>是否有效阅读</th>
                        <th>无效原因</th>
                        <th>初次阅读时间</th>
                        <th>最后阅读时间</th>
                    </tr>
                </thead>
                    <tbody>
                    <c:forEach items="${taskViewLogs}" var="tvl" varStatus="st">
                        <tr>
                            <td>
                                ${tvl.id}
                            </td>
                            <td>
                                ${tvl.uid}
                            </td>
                            <td>${tvl.taskId}</td>
                            <td>
                                <c:forEach items="${payMethods}" var="pm" varStatus="st">
                                    <c:if test="${pm.method == tvl.payMethod}">
                                        ${pm.desc}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>
                                ip: ${tvl.ip}</br>
                                城市: ${tvl.city}</br>
                                设备类型: ${tvl.devicePlatform}</br>
                                阅读平台: <c:forEach items="${sharePlatform}" var="sp" varStatus="st">
                                          <c:if test="${sp.platform == tvl.platform}">
                                              ${sp.desc}
                                          </c:if>
                                      </c:forEach></br>
                                唯一标识: ${tvl.cookie}</br>
                            </td>
                            <td>
                                ${tvl.num}
                            </td>
                            <td>
                                <c:if test="${tvl.isValid == 1}">
                                    是
                                </c:if>
                                <c:if test="${tvl.isValid == 0}">
                                    否
                                </c:if>
                            </td>
                            <td>
                                 <c:forEach items="${invalidViewReasonType}" var="reason" varStatus="st">
                                    <c:if test="${reason.type == tvl.invalidReason}">
                                        ${reason.desc}
                                    </c:if>
                                </c:forEach>
                            </td>
                            <td>
                                <suishen_fmt:formatDate value="${tvl.addedTime}" />
                            </td>
                            <td>
                                <suishen_fmt:formatDate value="${tvl.updateTime}" />
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
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
<link rel="stylesheet" href="assets/css/setting.css"/>
    <script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
    <script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>
</body>
<script>
$("#menu_task").addClass('active open');//左侧导航栏选中状态
$("#submenu_viewLogs").addClass('active');
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
	var href = "admin/viewLogs?uid=${uid}&taskId=${taskId}&startTime=${startTime}&endTime=${endTime}&page=" + page;
	window.location.href = href;
}
</script>
</html>