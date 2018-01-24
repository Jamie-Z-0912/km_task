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
                宝箱收徒分享
            </h1>
        </div>
        <div class="control-group">

            <div id="main" style="width: 1000px;height:400px;"></div>
            <script type="text/javascript">
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));
                var option = {
                    title: {
                        text: '宝箱收徒分享',
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['分享数', '点击数', '注册数']
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
                                <c:forEach items="${statsShareInviteActs}" var="statsShareInviteAct" varStatus="st"><c:if test="${st.index != 0}">, </c:if>'${statsShareInviteAct.date}'</c:forEach>
                            ]
                        }
                    ],
                    yAxis: {
                        type: 'value',
                    },
                    series: [
                        {
                            name: '分享数',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    color: "#ff2118",
                                    lineStyle: {
                                        color: "#ff251e"
                                    }
                                }
                            },
                            data: [
                                <c:forEach items="${statsShareInviteActs}" var="statsShareInviteAct" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${statsShareInviteAct.shareNum}</c:forEach>
                            ]
                        },
                        {
                            name: '点击数',
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
                                <c:forEach items="${statsShareInviteActs}" var="statsShareInviteAct" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${statsShareInviteAct.clickNum}</c:forEach>
                            ]
                        },
                        {
                            name: '注册数',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    color: "#ff75a2",
                                    lineStyle: {
                                        color: "#ff75a2"
                                    }
                                }
                            },
                            data: [
                                <c:forEach items="${statsShareInviteActs}" var="statsShareInviteAct" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${statsShareInviteAct.regNum}</c:forEach>
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
                -
                <input type="text" id="endTime" data-oval="" class="start_time input-large" width="10px"/>
                <input  type="hidden" name="end_time" id="end_time_hidden" />
                &nbsp;&nbsp;
                <a onclick="query()" class="btn btn-success btn-small"> <i class="icon-search"></i>查询</a>
            </div>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <div class="row-fluid">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th width="25%">日期</th>
                            <th width="25%">分享数</th>
                            <th width="25%">点击数</th>
                            <th width="25%">注册数</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${statsShareInviteActs}" var="statsShareInviteAct" varStatus="st">
                            <tr>
                                <c:if test="${statsShareInviteAct.date == 0}">
                                    <td>合计</td>
                                </c:if>
                                <c:if test="${statsShareInviteAct.date > 0}">
                                    <td>${statsShareInviteAct.date}</td>
                                </c:if>
                                <td>${statsShareInviteAct.shareNum}</td>
                                <td>${statsShareInviteAct.clickNum}</td>
                                <td>${statsShareInviteAct.regNum}</td>
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
        $("#menu_tj_browser").addClass('active open');
        $("#submen_inviteAct").addClass('active');

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
            window.location.href = "admin/tj/inviteAct?start_time=" + starttime + "&end_time=" + endtime;
        }
    </script>
    </html>