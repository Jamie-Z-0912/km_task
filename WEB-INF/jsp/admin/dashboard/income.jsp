<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../header.jsp" />
<jsp:include page="../sidebar.jsp" />
<!-- 页面 -->
<body>
<div id="main-content" class="clearfix">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>
                Dashboard
                <small>
                    <i class="ace-icon fa fa-angle-double-right"></i>
                    收入
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
                            <th width="6%">总收入</th>
                            <th width="6%">广点通</th>
                            <th width="6%">推啊</th>
                            <th width="6%">变现猫</th>
                            <th width="6%">搜狗</th>
                            <th width="6%">联想</th>
                            <th width="6%">欧朋</th>
                            <th width="6%">360</th>
                            <th width="6%">小说</th>
                            <th width="6%">H5广告</th>
                            <th width="7%">麦田广告</th>
                            <th width="5%">斐凡</th>
                            <th width="5%">内部收入</th>
                            <th width="6%">其他</th>
                            <th width="5%">清空余额</th>
                            <th width="7%">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${statsIncomes}" var="tj" varStatus="st">
                            <tr>
                                <td>${tj.date}</td>
                                <td>${tj.totalIncome}</td>
                                <td>${tj.gdtIncome}</td>
                                <td>${tj.tuiAIncome}</td>
                                <td>${tj.bxmIncome}</td>
                                <td>${tj.sogouSearchIncome}</td>
                                <td>${tj.lianxiangSearchIncome}</td>
                                <td>${tj.operaIncome}</td>
                                <td>${tj.qihuSearchIncome}</td>
                                <td>${tj.novelIncome}</td>
                                <td>
                                    <fmt:formatNumber value="${tj.baiduAdsIncome + tj.googleAdIncome}" pattern="#0.00" />
                                </td>
                                <td>
                                    ${tj.maitianIncome}
                                </td>
                                <td>
                                    <fmt:formatNumber value="${tj.feifanIncome}" pattern="#0.00" />
                                </td>
                                <td>
                                    <fmt:formatNumber value="${tj.cardIncome + tj.exchangeResourceIncome}" pattern="#0.00" />
                                </td>
                                <td>
                                <fmt:formatNumber value="${tj.otherIncome + tj.baiduSearchIncome + tj.wbIncome + tj.salesIncome + tj.shenmaSearchIncome}" pattern="#0.00" />
                                </td>
                                <td>
                                    <fmt:formatNumber value="${tj.clearYueIncome}" pattern="#0.00" />
                                </td>
                                <td><a class="set_top update" href="admin/dashboard/updateStatsIncome?date=${tj.date}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>编辑</span></span></a>
                                    <c:choose>
                                        <c:when test="${tj.remark == null or tj.remark == ''}"> </c:when>
                                        <c:otherwise><a class="show_bak" data-date="${tj.date}" href="javascript:void(0)">备注</a>
                                            <div class="hide">${tj.remark}</div>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    Note: <br/>
                    H5广告 = 百度广告收入 + Google广告收入<br/>
                    内部收入 = 卡券收入 + 资源兑换收入<br/>
                    其他 = 百度搜索 + 58 + 销售收入 + 神马搜索 + 其他
                </div>
        </div>
    </div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</div>
<div id="bakView" style="padding: 0 10px;"></div>
</body>
<script>
$("#menu_home").addClass('active open');
$("#menu_statsIncome").addClass('active');

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
    window.location.href = "admin/dashboard/income?start_time=" + starttime + "&end_time=" + endtime;
}

function expt(){
    var starttime = $("#start_time_hidden").val();
    var endtime = $("#end_time_hidden").val();
    window.location.href = "admin/dashboard/export?start_time=" + starttime + "&end_time=" + endtime;
}

$('.show_bak').on('click', function(){
    var _self = $(this), date = _self.data('date');
    var txt = _self.next().text();
    $('#bakView').text(txt);
    layer.open({
        title:date+' 备注信息',
        type: 1,
        skin: 'layui-layer-rim',
        content: $('#bakView'),
        cancel: function(){
            $('#bakView').empty();
        }
    });
})
</script>
</html>