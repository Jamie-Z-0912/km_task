<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../header.jsp" />
<jsp:include page="../sidebar.jsp" />
<!-- 页面 -->
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts</title>
    <!-- 引入 echarts.js -->
    <script src="assets/js/echarts.min.js"></script>
</head>
<body>
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

            <div id="main" style="width: 1000px;height:400px;"></div>
            <script type="text/javascript">
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));

                // 指定图表的配置项和数据
                var option = {
                    title : {
                        text: '各项收入所占比例',
                        x:'center'
                    },
                    tooltip : {
                        trigger: 'item',
                        formatter: "{a} <br/>{b} : {c} ({d}%)"
                    },
                    toolbox: {
                        feature: {
                            saveAsImage: {}
                        }
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                        data: ['广点通','推啊','变现猫','搜狗','联想','欧朋','360','小说','H5广告','麦田广告','斐凡','内部收入','众智嘉能','其他','百度搜索','清空余额']
                    },
                    series : [
                        {
                            name: '访问来源',
                            type: 'pie',
                            radius : '55%',
                            center: ['50%', '60%'],
                            data:[
                                {value:'${gdtIncome}', name:'广点通'},
                                {value:'${tuiAIncome}', name:'推啊'},
                                {value:'${bxmIncome}', name:'变现猫'},
                                {value:'${sogouSearchIncome}', name:'搜狗'},
                                {value:'${lianxiangSearchIncome}', name:'联想'},
                                {value:'${operaIncome}', name:'欧朋'},
                                {value:'${qihuSearchIncome}', name:'360'},
                                {value:'${novelIncome}', name:'小说'},
                                {value:'${H5Income}', name:'H5广告'},
                                {value:'${maitianIncome}', name:'麦田广告'},
                                {value:'${feifanIncome}', name:'斐凡'},
                                {value:'${innerIncome}', name:'内部收入'},
                                {value:'${zzjnIncome}', name:'众智嘉能'},
                                {value:'${otherIncome}', name:'其他'},
                                {value:'${baiduSearchIncome}', name:'百度搜索'},
                                {value:'${clearYueIncome}', name:'清空余额'},
                            ],
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            </script>

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
                            <th width="5%">众智嘉能</th>
                            <th width="5%">百度搜索</th>
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
                                <td>${tj.zzjnIncome}</td>
                                <td>${tj.baiduSearchIncome}</td>
                                <td>
                                <fmt:formatNumber value="${tj.otherIncome + tj.wbIncome + tj.salesIncome + tj.shenmaSearchIncome}" pattern="#0.00" />
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