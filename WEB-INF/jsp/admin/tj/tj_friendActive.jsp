<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<div id="main-content" class="clearfix">
	<div id="page-content" class="clearfix">
		<div class="page-header position-relative">
			<h1>徒弟活跃奖励统计</h1>
		</div>
        <div class="control-group">

            <div id="main" style="width: 1000px;height:400px;"></div>
            <script type="text/javascript">
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));
                var option = {
                    title: {
                        text: '徒弟活跃奖励统计',
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['获得奖励师傅数','活跃徒弟数', '发放金币数']
                    },
                    toolbox: {
                        show: true,
                        feature: {
                            dataZoom: {
                                yAxisIndex: 'none'
                            },
                            dataView: {readOnly: false},
                            magicType: {type: ['line', 'bar']},
                            restore: {},
                            saveAsImage: {}
                        }
                    },
                    xAxis: [
                        {
                            type: 'category',
                            boundaryGap: false,
                            inverse:true,
                            data: [
                                <c:forEach items="${tjResult}" var="tj" varStatus="st"><c:if test="${st.index != 0}">, </c:if>'${tj.date}'</c:forEach>
                            ]
                        }
                    ],
                    yAxis: {
                        type: 'value',
                    },
                    series: [
                        {
                            name: '获得奖励师父数',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    color: "#ff2c27",
                                    lineStyle: {
                                        color: "#ff2c27"
                                    }
                                }
                            },
                            data: [
                                <c:forEach items="${summaries}" var="tj" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${tj.fatherNum}</c:forEach>
                            ]
                        },
                        {
                            name: '活跃徒弟数',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    color: "#86ff21",
                                    lineStyle: {
                                        color: "#86ff21"
                                    }
                                }
                            },
                            data: [
                                <c:forEach items="${summaries}" var="tj" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${tj.activeSonNum}</c:forEach>
                            ]
                        },
                        {
                            name: '发放金币数',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    color: "#8082ff",
                                    lineStyle: {
                                        color: "#7aff4a"
                                    }
                                }
                            },
                            data: [
                                <c:forEach items="${summaries}" var="tj" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${tj.coinNum}</c:forEach>
                            ]
                        }
                    ]
                };


                console.log(option)

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            </script>

            <div class="controls">
               日期:&nbsp;&nbsp; <input type="text" id="startTime" data-oval="" class="start_time input-xlarge" />
                <input  type="hidden" name="start_time" id="start_time_hidden" />
                &nbsp;&nbsp;
                <a onclick="query()" class="btn btn-success btn-small"> <i class="icon-search"></i>查询</a>
                <div onclick="quickQuery1()" class="btn btn-success btn-small" data-id="1">昨天</div>
                <div onclick="quickQuery3()" class="btn btn-success btn-small" data-id="3">最近3天</div>
                <div onclick="quickQuery7()" class="btn btn-success btn-small" data-id="7">最近7天</div>
            </div>
        </div>
		<div class="row-fluid">
			<div class="row-fluid">
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
						    <th>日期</th>
                            <th>获得奖励师傅数</th>
                            <th>活跃徒弟数</th>
                            <th>发放金币数</th>
						</tr>
					</thead>
					<tbody>
					    <c:forEach items="${summaries}" var="tj" varStatus="st">
                            <tr>
                                <td>${tj.date}</td>
                                <td>${tj.fatherNum}</td>
                                <td>${tj.activeSonNum}</td>
                                <td>${tj.coinNum}</td>
                            </tr>
                        </c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_tj_browser").addClass('active open');//左侧导航栏选中状态
$("#submen_tj_friendActive").addClass('active');//左侧导航栏选中状态

if($("#startTime").length > 0){
    $("#startTime").val(new Date(${start_time}).format("yyyy-MM-dd hh:mm:ss"));
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

function query(){
    var starttime = $("#start_time_hidden").val();
    window.location.href = "admin/tj/friendActive?start_time=" + starttime;
}

function quickQuery1(){
var endtime = ${today_end_time};
    var starttime = endtime - (1*24*60*60*1000);
    window.location.href = "admin/tj/friendActive?start_time=" + starttime;
}

function quickQuery3(){
    var endtime = ${today_end_time};
    var starttime = endtime - (2*24*60*60*1000);
    window.location.href = "admin/tj/friendActive?start_time=" + starttime;
}

function quickQuery7(){
    var endtime = ${today_end_time};
    var starttime = endtime - (6*24*60*60*1000);
    window.location.href = "admin/tj/friendActive?start_time=" + starttime;
}
</script>
</html>