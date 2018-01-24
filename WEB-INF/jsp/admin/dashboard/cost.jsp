<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../header.jsp"/>
<jsp:include page="../sidebar.jsp"/>
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
                Dashboard
                <small>
                    <i class="ace-icon fa fa-angle-double-right"></i>
                    花费
                </small>
            </h1>
        </div>
        <div class="control-group">

            <div id="main" style="width: 1000px;height:400px;"></div>
            <script type="text/javascript">
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));

                var option = {
                    title: {
                        text: '金币支出数据',
                    },
                    tooltip: {
                        trigger: 'axis'
                    },
                    legend: {
                        data: ['金币花费','总花费','分享任务','搜索','团队分红','徒弟活跃','宝箱']
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
                    xAxis: {
                        type: 'category',
                        boundaryGap: false,
                        inverse: true,
                        data: [
                            <c:forEach items="${statsCosts}" var="statsCost" varStatus="st"><c:if test="${st.index != 0}">, </c:if>"${statsCost.date}"</c:forEach>
                        ]
                    },
                    yAxis: {
                        type: 'value'
                    },
                    series: [
                        {
                            name: '金币花费',
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
                                <c:forEach items="${statsCosts}" var="statsCost" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${statsCost.totalCoinCost}</c:forEach>
                            ]
                        },
                        {
                            name: '总花费',
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
                                <c:forEach items="${statsCosts}" var="statsCost" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${statsCost.appCost + statsCost.marketCost}</c:forEach>
                            ]
                        },
                        {
                            name: '分享任务',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    color: "#4bffe6",
                                    lineStyle: {
                                        color: "#4bffe6"
                                    }
                                }
                            },
                            data: [
                                <c:forEach items="${statsCosts}" var="statsCost" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${statsCost.shareTaskCoin}</c:forEach>
                            ]
                        },
                        {
                            name: '搜索',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    color: "#bcff1e",
                                    lineStyle: {
                                        color: "#bcff1e"
                                    }
                                }
                            },
                            data: [
                                <c:forEach items="${statsCosts}" var="statsCost" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${statsCost.searchTaskCoin}</c:forEach>
                            ]
                        },
                        {
                            name: '团队分红',
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
                                <c:forEach items="${statsCosts}" var="statsCost" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${statsCost.teamTaskCoin}</c:forEach>
                            ]
                        },
                        {
                            name: '徒弟活跃',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    color: "#ffb52d",
                                    lineStyle: {
                                        color: "#ffb52d"
                                    }
                                }
                            },
                            data: [
                                <c:forEach items="${statsCosts}" var="statsCost" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${statsCost.friendActiveCoin}</c:forEach>
                            ]
                        },
                        {
                            name: '宝箱',
                            type: 'line',
                            itemStyle: {
                                normal: {
                                    color: "#55b2ff",
                                    lineStyle: {
                                        color: "#55b2ff"
                                    }
                                }
                            },
                            data: [
                                <c:forEach items="${statsCosts}" var="statsCost" varStatus="st"><c:if test="${st.index != 0}">, </c:if>${statsCost.boxCoin}</c:forEach>
                            ]
                        }
                    ]
                };

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            </script>
            <div class="controls">
                <input type="text" id="startTime" data-oval="" class="start_time input-large"/>
                <input type="hidden" name="start_time" id="start_time_hidden"/>
                -
                <input type="text" id="endTime" data-oval="" class="start_time input-large" width="10px"/>
                <input type="hidden" name="end_time" id="end_time_hidden"/>
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
                            <th width="8%">总花费</th>
                            <th width="8%">市场花费</th>
                            <th width="8%">应用内花费</th>
                            <th width="8%">总金币</th>
                            <th width="8%">阅读文章(师+徒)</th>
                            <th width="7%">加速阅读</th>
                            <th width="8%">阅读推送</th>
                            <th width="8%">分享任务(师+徒)</th>
                            <th width="8%">搜索</th>
                            <th width="8%">收徒奖励</th>
                            <th width="8%">新手奖励</th>
                            <th width="5%">红包</th>
                            <th width="7%">团队分红</th>
                            <th width="5%">签到</th>
                            <th width="8%">评论(回复+赞)</th>
                            <th width="8%">采集阅读</th>
                            <th width="8%">采集图片点赞</th>
                            <th width="8%">资源兑换</th>
                            <th width="7%">福利活动</th>
                            <th width="7%">分享快马</th>
                            <th width="7%">徒弟活跃</th>
                            <th width="7%">绑定师傅</th>
                            <th width="7%">宝箱</th>
                            <th width="7%">举报</th>
                            <th width="7%">系统奖励</th>
                            <th width="5%">汇率</th>
                            <th width="5%">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${statsCosts}" var="statsCost" varStatus="st">
                            <tr>
                                <td><a target="_blank"
                                       href="admin/tj/coin?start_time=${statsCost.addedTime}">${statsCost.date}</a></td>
                                <td><suishen_fmt:formatNumber value="${statsCost.appCost + statsCost.marketCost}"/></td>
                                <td>${statsCost.marketCost}</td>
                                <td>${statsCost.appCost}</td>
                                <td>${statsCost.totalCoinCost}</td>
                                <td>${statsCost.readArticleCoin}</td>
                                <td>${statsCost.accelerateReadArticleCoin}</td>
                                <td>${statsCost.readPushCoin}</td>
                                <td>${statsCost.shareTaskCoin}</td>
                                <td>${statsCost.searchTaskCoin}</td>
                                <td>${statsCost.inviteRegisterCoin + statsCost.inviteFriendCoin}</td>
                                <td>${statsCost.juniorCoin}</td>
                                <td>${statsCost.redpackCoin}</td>
                                <td>${statsCost.teamTaskCoin}</td>
                                <td>${statsCost.checkinCoin}</td>
                                <td>${statsCost.commentCoin + statsCost.likeCoin}</td>
                                <td>${statsCost.readPostCoin}</td>
                                <td>${statsCost.postImgBeLikedCoin}</td>
                                <td>${statsCost.resourceBeExchangedCoin}</td>
                                <td>${statsCost.fuliActCoin}</td>
                                <td>${statsCost.shareKuaimaCoin}</td>
                                <td>${statsCost.friendActiveCoin}</td>
                                <td>${statsCost.bindInviteRelationCoin}</td>
                                <td>${statsCost.boxCoin}</td>
                                <td>${statsCost.reportCoin}</td>
                                <td>${statsCost.systemRewardCoin}</td>
                                <td>${statsCost.coinExchange}</td>
                                <td><a class="set_top update"
                                       href="admin/dashboard/reloadCost?added_time=${statsCost.addedTime}"
                                       style="color: #4f99c6; text-decoration: none;"> <span
                                        class="blue"> <span>重算</span></span></a> ---
                                <a class="set_top update"
                                       href="admin/dashboard/fillCost?added_time=${statsCost.addedTime}"
                                       style="color: #4f99c6; text-decoration: none;"> <span
                                        class="blue"> <span>编辑</span></span></a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    Note: <br/>
                    2017-07-20日以前收徒奖励 = 师傅邀请奖励 + 徒弟注册奖励<br/>
                    新手奖励 = 新手登陆奖励 + 新手阅读 + 新手搜索 + 阅读新手教程<br/>
                    签到 = 正常签到 + 普通签到(阳光普照)<br/>
                    举报 = 采集文章举报奖励 + 资源举报补偿<br/>
                    汇率: 1700金币=1元
                </div>
            </div>
        </div>
    </div>
    <div class="popover-mask"></div>
    <jsp:include page="../foot.jsp"/>
</body>
<script>
    $("#menu_home").addClass('active open');
    $("#menu_statsCost").addClass('active');

    if ($("#startTime").length > 0) {
        $("#startTime").val(new Date(${start_time}).format("yyyy-MM-dd hh:mm:ss"));
        $("#endTime").val(new Date(${end_time}).format("yyyy-MM-dd hh:mm:ss"));
        gx();
        $("#startTime").slTime({
            callback: function () {
                gx();
            }
        });
        $("#endTime").slTime({
            callback: function () {
                gx();
            }
        });
    }

    function gx() {
        var start = new Date($("#startTime").val().replace(/-/g, "/")).getTime();
        var end = new Date($("#endTime").val().replace(/-/g, "/")).getTime();
        $("#start_time_hidden").val(start);
        $("#end_time_hidden").val(end);
    }

    function query() {
        var starttime = $("#start_time_hidden").val();
        var endtime = $("#end_time_hidden").val();
        window.location.href = "admin/dashboard/cost?start_time=" + starttime + "&end_time=" + endtime;
    }

    function expt() {
        var starttime = $("#start_time_hidden").val();
        var endtime = $("#end_time_hidden").val();
        window.location.href = "admin/dashboard/export?start_time=" + starttime + "&end_time=" + endtime;
    }
</script>
</html>