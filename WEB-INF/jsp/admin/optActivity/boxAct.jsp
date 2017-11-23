<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt" %>
<jsp:include page="../header.jsp" />
<jsp:include page="../sidebar.jsp" />
<div id="main-content" class="clearfix">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>宝箱活动配置</h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <form action="admin/boxAct/update" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <input type="hidden" id="id" name="id" data-oval="" class="start_time input-xlarge" value="${boxActConfig.id}"/>
                    <div class="control-group">
                        <label class="control-label">活动时间</label>
                        <div class="controls">
                            <input type="text" name="startDate" data-oval="" class="input-large" value="${boxActConfig.startDate}"/>
                            ~
                            <input type="text" name="endDate" data-oval="" class="input-large" value="${boxActConfig.endDate}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">搜索得宝箱概率(<font color="red">0-100</font>)</label>
                        <div class="controls">
                            <input type="text" id="name" name="searchRewardProbability" class="input-large" value="${boxActConfig.searchRewardProbability}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">值得看得宝箱概率(<font color="red">0-100</font>)</label>
                        <div class="controls">
                            <input type="text" id="name" name="zdkReadRewardProbability" class="input-large" value="${boxActConfig.zdkReadRewardProbability}"/>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok"></i> 保存
                        </button>
                        <button class="btn" type="reset" onclick="cancel();">
                            <i class="icon-undo"></i> 取消
                        </button>
                    </div>
                </form>
            </div>
         </div>
    </div>
</div>
<jsp:include page="../foot.jsp" />
    <link rel="stylesheet" href="assets/css/setting.css"/>
    <script type="text/javascript" src="assets/js/setting.js"></script>
    <script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
    <script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>
</body>
<script>
    $("#menu_activity").addClass('active open');
    $("#submenu_boxActConfig").addClass('active');
    function cancel() {
        history.go(-1);
    }
</script>
</html>