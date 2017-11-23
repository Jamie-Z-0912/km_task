<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../header.jsp" />
<jsp:include page="../sidebar.jsp" />
<!-- 页面 -->
<div id="main-content" class="clearfix">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>
                Dashboard
                <small>
                    <i class="ace-icon fa fa-angle-double-right"></i>
                    收徒分享
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
                            <th width="16%">日期</th>
                            <th width="16%">分享数</th>
                            <th width="17%">点击数</th>
                            <th width="17%">注册数</th>
                            <th width="17%">总宝箱数</th>
                            <th width="17%">开宝箱数</th>
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
                                <td>${statsShareInviteAct.totalBoxNum}</td>
                                <td>${statsShareInviteAct.openBoxNum}</td>
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
        $("#menu_home").addClass('active open');
        $("#menu_inviteAct").addClass('active');

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
            window.location.href = "admin/dashboard/inviteAct?start_time=" + starttime + "&end_time=" + endtime;
        }

        function expt(){
            var starttime = $("#start_time_hidden").val();
            var endtime = $("#end_time_hidden").val();
            window.location.href = "admin/dashboard/export?start_time=" + starttime + "&end_time=" + endtime;
        }
    </script>
    </html>