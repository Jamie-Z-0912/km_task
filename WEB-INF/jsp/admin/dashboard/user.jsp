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
                    用户
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
                            <th width="6%">新增</th>
                            <th width="7%">日活</th>
                            <th width="7%">总注册</th>
                            <th width="8%">邀请注册</th>
                            <th width="8%">邀请注册占比</th>
                            <th width="9%">有效邀请注册</th>
                            <th width="8%">有效邀请注册比</th>
                            <th width="9%">DNU(And)</th>
                            <th width="9%">DAU(And)</th>
                            <th width="9%">次日留存(And)</th>
                            <th width="9%">DNU(IOS)</th>
                            <th width="9%">DAU(IOS)</th>
                            <th width="8%">次日留存(IOS)</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${statsUsers}" var="statsUser" varStatus="st">
                            <tr>
                                <c:if test="${statsUser.date == 0}">
                                    <td>合计</td>
                                </c:if>
                                <c:if test="${statsUser.date > 0}">
                                    <td>${statsUser.date}</td>
                                </c:if>
                                <td>${statsUser.newAndroidDevice + statsUser.newIosDevice}</td>
                                <td>${statsUser.androidActiveDevice + statsUser.iosActiveDevice}</td>
                                <td>${statsUser.totalRegister}</td>
                                <td>${statsUser.inviteRegister}</td>
                                <c:if test="${statsUser.inviteRegister > 0}">
                                    <td><fmt:formatNumber value="${statsUser.inviteRegister / statsUser.totalRegister * 100}" pattern="#0.00" />%</td>
                                </c:if>
                                <c:if test="${statsUser.inviteRegister <= 0}">
                                    <td>0%</td>
                                </c:if>

                                <td>${statsUser.validInviteRegister}</td>
                                <c:if test="${statsUser.inviteRegister > 0}">
                                    <td><fmt:formatNumber value="${statsUser.validInviteRegister / statsUser.inviteRegister * 100}" pattern="#0.00" />%</td>
                                </c:if>
                                <c:if test="${statsUser.inviteRegister <= 0}">
                                    <td>0%</td>
                                </c:if>
                                <td>${statsUser.newAndroidDevice}</td>
                                <td>${statsUser.androidActiveDevice}</td>
                                <td>${statsUser.androidDailyRetention}%</td>
                                <td>${statsUser.newIosDevice}</td>
                                <td>${statsUser.iosActiveDevice}</td>
                                <td>${statsUser.iosDailyRetention}%</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    Note:  </br>
                    邀请注册占比 = 邀请注册 / 总注册 </br>
                    有效邀请注册比 = 有效邀请注册 / 邀请注册</br>
                    有效邀请注册: 被师傅邀请注册，安装了App，并且至少读了一篇文章或做了分享任务;
                </div>
        </div>
    </div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_home").addClass('active open');
$("#menu_statsUser").addClass('active');

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
    window.location.href = "admin/dashboard/user?start_time=" + starttime + "&end_time=" + endtime;
}

function expt(){
    var starttime = $("#start_time_hidden").val();
    var endtime = $("#end_time_hidden").val();
    window.location.href = "admin/dashboard/export?start_time=" + starttime + "&end_time=" + endtime;
}
</script>
</html>