<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="header.jsp" />
<jsp:include page="sidebar.jsp" />
<!-- 页面 -->
<div id="main-content" class="clearfix">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>
                Dashboard
                <small>
                    <i class="ace-icon fa fa-angle-double-right"></i>
                    overview &amp; stats
                </small>
            </h1>
        </div>
        <div class="control-group">
            <div class="controls">
                <input type="text" id="startTime" data-oval="" class="start_time input-large" />
                <input  type="hidden" name="start_time" id="start_time_hidden" />
                -
                <input type="text" id="endTime" data-oval="" class="start_time input-large" width="10px"/>
                <input  type="hidden" name="end_time" id="end_time_hidden" />
                &nbsp;&nbsp;
                <a onclick="query()" class="btn btn-success btn-small"> <i class="icon-search"></i>查询</a>
                <a onclick="expt()" class="btn btn-success btn-small"> <i class="icon-search"></i>导出</a>
            </div>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <div class="row-fluid">
                        <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th width="5%">日期</th>
                            <th width="10%">总有效阅读数</th>
                            <th width="10%">总收入</th>
                            <th width="15%">总花费(金币兑换)</th>
                            <th width="15%">提现支出(提现+充值)</th>
                            <th width="15%">单次有效阅读收入</th>
                            <th width="10%">PV</th>
                            <th width="10%">DAU价值</th>
                            <th width="15%">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${statsSummaries}" var="statsSummary" varStatus="st">
                            <tr>
                                <c:if test="${statsSummary.date == 0}">
                                    <td>合计</td>
                                </c:if>
                                <c:if test="${statsSummary.date > 0}">
                                    <td>${statsSummary.date}</td>
                                </c:if>
                                <td>${statsSummary.articleValidReadNum}</td>
                                <td>${statsSummary.totalIncome}</td>
                                <td>${statsSummary.totalCoinCost}</td>
                                <td>${statsSummary.czCost + statsSummary.withdrawCost}</td>
                                <td>${statsSummary.oneArticleValidReadIncome}</td>
                                <td>${statsSummary.articleDetailsViewNum}</td>
                                <td>${statsSummary.dauValue}</td>
                                <td><a class="set_top update" href="admin/dashboard/updateStatsSummary?date=${statsSummary.date}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>编辑</span></span></a><br/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
        </div>
    </div>
</div>
<div class="popover-mask"></div>
<jsp:include page="foot.jsp" />
</body>
<script>
$("#menu_home").addClass('active open');
$("#menu_statsSummary").addClass('active');

if($("#startTime").length > 0){
    $("#startTime").val(new Date(${start_time}).format("yyyy-MM-dd hh:mm:ss"));
    $("#endTime").val(new Date(${end_time}).format("yyyy-MM-dd hh:mm:ss"));
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

function query(){
    var starttime = $("#start_time_hidden").val();
    var endtime = $("#end_time_hidden").val();
    window.location.href = "admin?start_time=" + starttime + "&end_time=" + endtime;
}

function expt(){
    var starttime = $("#start_time_hidden").val();
    var endtime = $("#end_time_hidden").val();
    window.location.href = "admin/dashboard/export?start_time=" + starttime + "&end_time=" + endtime;
}
</script>
</html>