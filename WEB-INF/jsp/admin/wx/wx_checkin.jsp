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
                用户微信签到查询
            </h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <form action="admin/wx/wxCheckin" method="get" id="basic_validate" name="basic_validate"
                      class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                        <label class="control-label">uid:</label>
                        <div class="controls">
                            <input type="text" id="uid" name="uid" <c:if test="${uid != 0}"> value="${uid}" </c:if> class="input-xlarge" maxlength="40"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">phone:</label>
                        <div class="controls">
                            <input type="text" id="phone" name="phone" <c:if test="${phone != 0}"> value="${phone}" </c:if> class="input-xlarge" maxlength="40"/>
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
                        <th>今日是否签到</th>
                        <th>最近签到日期</th>
                        <th>连续签到天数</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <c:if test="${not empty wxDailySign}">
                            <c:if test="${wxDailySign.signDate == today}">是</c:if>
                            <c:if test="${wxDailySign.signDate != today}">否</c:if>
                            </c:if>
                        </td>
                        <td>${wxDailySign.signDate}</td>
                        <td>${wxDailySign.signNum}</td>
                    </tr>
                    </tbody>
                </table>

                <!-- 分页 -->
                <div class="widget-box" style="margin-top: -10px;">
                    <div class="widget-header">
                        <div class="dataTables_info dataTables_paginate paging_bootstrap pagination"
                             style="margin-top: 5px; ">
                            <ul>
                                <li class="prev">
                                    <span class="previous fg-button ui-button ui-state-default ui-state-disabled">${total}条记录, 共${totalPage}页, 当前第${page}页</span>
                                </li>
                                <c:choose>
                                    <c:when test="${page!=1}">
                                        <li class="prev">
                                            <a href="javascript:turnPage(1)" title="首页"
                                               class="first ui-corner-tl ui-corner-bl fg-button ui-button ui-state-default ui-state-default"><span>首页</span></a>
                                            <a href="javascript:turnPage(${page-1})" title="上一页"
                                               class="previous fg-button ui-button ui-state-default ui-state-default"><span>上一页</span></a>
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
                                            <a href="javascript:turnPage(${page+1})" title="下一页"
                                               class="next fg-button ui-button ui-state-default"><span>下一页</span></a>
                                            <a href="javascript:turnPage(${totalPage})" title="末页"
                                               class="last ui-corner-tr ui-corner-br fg-button ui-button ui-state-default"><span>末页</span></a>
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
    $("#menu_wx").addClass('active open');//左侧导航栏选中状态
    $("#wx_checkin_consult").addClass('active');//左侧导航栏选中状态
    if ($("#startTime").length > 0) {
        $("#startTime").val(new Date(${startTime}).format("yyyy-MM-dd"));
        gx();
        $("#startTime").slTime({
            callback:function(){
                gx();
            }
        });
    }
    function gx(){
        var start = new Date($("#startTime").val().replace(/-/g,   "/")).format("yyyy-MM-dd");
        $("#start_time_hidden").val(start);
        $("#startTime").val(new Date(start).format("yyyy-MM-dd"));
    }

    function turnPage(page) {
        // 分页列表URL
        var href = "admin/wx/wxCheckin?uid=${uid}&phone=${phone}&page=" + page;
        window.location.href = href;
    }
</script>
</html>