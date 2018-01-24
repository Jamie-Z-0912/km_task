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
			<h1>采集统计</h1>
		</div>
        <div class="control-group">

            <div id="main" style="width: 1000px;height:400px;"></div>
            <script type="text/javascript">
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));
                var option = {
                    title: {
                        text: '采集统计',
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['采集人数', '采集文章数', '阅读人数', '文章被阅读数', '文章被喜欢数']
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
                                <c:forEach items="${tjResult}" var="tj" varStatus="st"><c:if test="${st.index != 0}">, </c:if>'${tj.value.tjDate}'</c:forEach>
                            ]
                        }
                    ],
                    yAxis: {
                        type: 'value',
                    },
                    series: [
                        {
                            name: '采集人数',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    color: "#948ec9",
                                    lineStyle: {
                                        color: "#948ec9"
                                    }
                                }
                            },
                            data: [
                                <c:forEach items="${tjResult}" var="tj" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${tj.value.totalPostUser}</c:forEach>
                            ]
                        },
                        {
                            name: '采集文章数',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    color: "#8082ff",
                                    lineStyle: {
                                        color: "#8082ff"
                                    }
                                }
                            },
                            data: [
                                <c:forEach items="${tjResult}" var="tj" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${tj.value.totalPost }</c:forEach>
                            ]
                        },
                        {
                            name: '阅读人数',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    color: "#4749ff",
                                    lineStyle: {
                                        color: "#4749ff"
                                    }
                                }
                            },
                            data: [
                                <c:forEach items="${tjResult}" var="tj" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${tj.value.totalReadUser}</c:forEach>
                            ]
                        },
                        {
                            name: '文章被阅读数',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    color: "#ff645f",
                                    lineStyle: {
                                        color: "#ff645f"
                                    }
                                }
                            },
                            data: [
                                <c:forEach items="${tjResult}" var="tj" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${tj.value.totalRead}</c:forEach>
                            ]
                        },
                        {
                            name: '文章被喜欢数',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    color: "#ff251e",
                                    lineStyle: {
                                        color: "#ff251e"
                                    }
                                }
                            },
                            data: [
                                <c:forEach items="${tjResult}" var="tj" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${tj.value.totalLike}</c:forEach>
                            ]
                        }
                    ]
                };


                console.log(option)

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            </script>


            <div class="controls">
               开始日期:&nbsp;&nbsp; <input type="text" id="startTime" data-oval="" class="start_time input-xlarge" />
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
                            <th>采集人数</th>
                            <th>采集文章数</th>
                            <th>人均采集数</th>
                            <th>阅读人数</th>
                            <th>文章被阅读数</th>
                            <th>人均阅读数</th>
                            <th>文章被喜欢数</th>
						</tr>
					</thead>
					<tbody>
					    <c:forEach items="${tjResult}" var="tj" varStatus="st">
                            <tr>
                                <td>${tj.value.tjDate}</td>
                                <td>${tj.value.totalPostUser}</td>
                                <td>${tj.value.totalPost}</td>
                                <td>${tj.value.averagePostUser}</td>
                                <td>${tj.value.totalReadUser}</td>
                                <td>${tj.value.totalRead}</td>
                                <td>${tj.value.averageReadUser}</td>
                                <td>${tj.value.totalLike}</td>
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
$("#submen_tj_post").addClass('active');//左侧导航栏选中状态

if($("#startTime").length > 0){
    $("#startTime").val(new Date(${start_time}).format("yyyy-MM-dd"));
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
    window.location.href = "admin/tj/post?start_time=" + starttime;
}

function quickQuery1(){
    var endtime = ${today_end_time};
    var starttime = endtime - (1*24*60*60*1000);
    window.location.href = "admin/tj/post?start_time=" + starttime;
}

function quickQuery3(){
    var endtime = ${today_end_time};
    var starttime = endtime - (2*24*60*60*1000);
    window.location.href = "admin/tj/post?start_time=" + starttime;
}

function quickQuery7(){
    var endtime = ${today_end_time};
    var starttime = endtime - (6*24*60*60*1000);
    window.location.href = "admin/tj/post?start_time=" + starttime;
}
</script>
</html>