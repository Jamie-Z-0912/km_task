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
                用户现金流水
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
            <form action="admin/users/cash" method="get" id="basic_validate" name="basic_validate"
                              class="form-horizontal" novalidate="novalidate">
                <div class="control-group">
                      <label class="control-label">手机号:</label>
                      <div class="controls">
                          <input type="text" id="phone" name="phone" value="${phone}" class="input-xlarge" maxlength="40"/>
                      </div>
                  </div>                              
                <div class="control-group">
                    <label class="control-label">uid:</label>
                    <div class="controls">
                        <input type="text" id="uid" name="uid" value="${uid}" class="input-xlarge" maxlength="40"/>
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
                            <th>金额</th>
                            <th>描述</th>
                            <th>日期</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                        <tbody>
                            <c:forEach items="${list}" var="uc" varStatus="st">
                                <tr>
                                    <td>${uid}</td>
                                    <td>
                                    <c:if test="${uc.amount > 0}">
                                        + ${uc.amount}
                                    </c:if>
                                    <c:if test="${uc.amount < 0}">
                                        ${uc.amount}
                                    </c:if>
                                    </td>
                                    <td>${uc.subject}</td>
                                    <td><suishen_fmt:formatDate value="${uc.addedTime}" /></td>
                                    <td>
                                    <a class="set_top update" href="admin/users/base?uid=${uid}" style="color: #4f99c6; text-decoration: none;">
                                        <span class="blue"> <i class="icon-edit"> </i> <span>用户信息</span></span></a><br/>
                                    <c:if test="${uc.amount > 0}">
                                        <a class="set_top update" href="javascript:queryUserCoin(${uc.addedTime});" style="color: #4f99c6; text-decoration: none;">
                                       <span class="blue"> <i class="icon-edit"> </i> <span>金币数据</span></span></a><br/>
                                    </c:if>
                                    <c:if test="${uc.amount < 0}">
                                        <a class="set_top update" href="javascript:cancelCashCost('${uc.outType}', '${uc.outUniqueId}');" style="color: #4f99c6; text-decoration: none;">
                                       <span class="blue"> <i class="icon-edit"> </i> <span>取消</span></span></a><br/>
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
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
<link rel="stylesheet" href="assets/css/setting.css"/>
    <script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
    <script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>
</body>
<script>
$("#menu_stat").addClass('active open');//左侧导航栏选中状态
$("#submenu_stat_cash").addClass('active');

function queryUserCoin(time) {
    var date = new Date(time).format("yyyy-MM-dd");
    window.location = "admin/users/coin?uid=${uid}&startTime=" + date;
}

function cancelCashCost(outType, outUniqueId) {
    if (confirm("您确认要取消此流水吗？(取消后用户零钱将退还)")) {
        $.ajax({
            url : "admin/users/cash/cancel?outType=" + outType + "&outUniqueId=" + outUniqueId,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！" + data.desc);
                } else {
                    window.location="admin/users/cash?uid=" + '${uid}';
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
	var href = "admin/users/cash?uid=${uid}&phone=${phone}&page=" + page;
	window.location.href = href;
}
</script>
</html>