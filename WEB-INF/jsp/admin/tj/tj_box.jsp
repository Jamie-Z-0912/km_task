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
<div id="main-content" class="clearfix">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>
                宝箱统计
            </h1>
        </div>
        <div class="control-group">

            <div id="main" style="width: 1000px;height:400px;"></div>
            <script type="text/javascript">
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));
                var option = {
                    title: {
                        text: '宝箱统计',
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['邀请收徒', '阅读值得看','搜索','参加活动','微信签到','总宝箱数','已开宝箱数']
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
                                <c:forEach items="${statsBoxs}" var="statBox" varStatus="st"><c:if test="${st.index != 0}">, </c:if>'${statBox.date}'</c:forEach>
                            ]
                        }
                    ],
                    yAxis: {
                        type: 'value',
                    },
                    series: [
                        {
                            name: '邀请收徒',
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
                                <c:forEach items="${statsBoxs}" var="statBox" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${statBox.inviteActBox}</c:forEach>
                            ]
                        },
                        {
                            name: '阅读值得看',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    color: "#86ff21",
                                    lineStyle: {
                                        color: "#7aff4a"
                                    }
                                }
                            },
                            data: [
                                <c:forEach items="${statsBoxs}" var="statBox" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${statBox.readZdkBox}</c:forEach>
                            ]
                        },
                        {
                            name: '搜索',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    color: "#261eff",
                                    lineStyle: {
                                        color: "#261eff"
                                    }
                                }
                            },
                            data: [
                                <c:forEach items="${statsBoxs}" var="statBox" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${statBox.searchBox}</c:forEach>
                            ]
                        },
                        {
                            name: '参加活动',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    color: "#fff82e",
                                    lineStyle: {
                                        color: "#fff82e"
                                    }
                                }
                            },
                            data: [
                                <c:forEach items="${statsBoxs}" var="statBox" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${statBox.actBox}</c:forEach>
                            ]
                        },
                        {
                            name: '微信签到',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    color: "#ff7f6e",
                                    lineStyle: {
                                        color: "#ff7f6e"
                                    }
                                }
                            },
                            data: [
                                <c:forEach items="${statsBoxs}" var="statBox" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${statBox.wxDailySignBox}</c:forEach>
                            ]
                        },
                        {
                            name: '总宝箱数',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    color: "#ff8343",
                                    lineStyle: {
                                        color: "#ff8343"
                                    }
                                }
                            },
                            data: [
                                <c:forEach items="${statsBoxs}" var="statBox" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${statBox.totalBoxNum}</c:forEach>
                            ]
                        },
                        {
                            name: '已开宝箱数',
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
                                <c:forEach items="${statsBoxs}" var="statBox" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${statBox.openBoxNum}</c:forEach>
                            ]
                        }
                    ]
                };


                console.log(option)

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            </script>

            <div class="controls">
                <input type="text" id="startTime" data-oval="" class="start_time input-large" />
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
                <div class="row-fluid">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>日期</th>
                            <th>邀请收徒</th>
                            <th>阅读值得看</th>
                            <th>搜索</th>
                            <th>参加活动</th>
                            <th>微信签到</th>
                            <th>总宝箱数</th>
                            <th>已开宝箱数</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${statsBoxs}" var="statBox" varStatus="st">
                            <tr>
                                <td>${statBox.date}</td>
                                <td>${statBox.inviteActBox}</td>
                                <td>${statBox.readZdkBox}</td>
                                <td>${statBox.searchBox}</td>
                                <td>${statBox.actBox}</td>
                                <td>${statBox.wxDailySignBox}</td>
                                <td>${statBox.totalBoxNum}</td>
                                <td>${statBox.openBoxNum}</td>
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
        $("#submen_tj_userBox").addClass('active');

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
            window.location.href = "admin/tj/userBox?start_time=" + starttime;
        }

        function quickQuery1(){
            var endtime = ${today_end_time};
            var starttime = endtime - (1*24*60*60*1000);
            window.location.href = "admin/tj/userBox?start_time=" + starttime;
        }

        function quickQuery3(){
            var endtime = ${today_end_time};
            var starttime = endtime - (2*24*60*60*1000);
            window.location.href = "admin/tj/userBox?start_time=" + starttime;
        }

        function quickQuery7(){
            var endtime = ${today_end_time};
            var starttime = endtime - (6*24*60*60*1000);
            window.location.href = "admin/tj/userBox?start_time=" + starttime;
        }
    </script>
    </html>