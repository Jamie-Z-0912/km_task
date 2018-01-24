<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt"%>
<jsp:include page="../header.jsp" />
<jsp:include page="../sidebar.jsp" />
<!-- 页面 -->
<div id="main-content" class="clearfix">
	<div id="page-content" class="clearfix">
		<div class="page-header position-relative">
			<h1>创建推送消息</h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
                <form action="admin/msg/push" method="post" id="basic_validate" name="basic_validate"
                                  class="form-horizontal" novalidate="novalidate" onsubmit="return validate();">
                    <input type="hidden" id="id" name="id" value="${id}" class="input-xxlarge" maxlength="80"/>
                    <input type="hidden" id="type" name="type" value="${type}" class="input-xxlarge" maxlength="80"/>

                    <div class="control-group">
                         <label class="control-label">推送应用</label>
                         <div class="controls">
                             <select name="application" id="application" style="width: 120px;">
                                 <c:forEach items="${applications}" var="app">
                                     <option value="${app}" <c:if test="${app == application}">selected</c:if>>${app.appName}</option>
                                 </c:forEach>
                             </select>
                         </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">推送平台</label>
                        <div class="controls">
                            <select name="platform" id="platform" style="width: 180px;">
                                <c:forEach items="${platforms}" var="pt" varStatus="st">
                                    <option value="${pt}" <c:if test="${pt == platform}">selected</c:if>>${pt}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">推送版本(不选全版本推送)</label>
                        <div class="controls">
                            <select class="form-control" multiple="multiple" name="versions" id="versions">
                                <c:forEach items="${versions}" var="version" varStatus="st">
                                    <option value="${version}">${version}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">消息标题(10个字以内)</label>
                        <div class="controls">
                            <input type="text" id="a" name="a" value="快马小报" class="input-xxlarge" maxlength="10"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">消息内容(30个字以内)</label>
                        <div class="controls">
                            <input type="text" id="b" name="b" value="${msg}" class="input-xxlarge" maxlength="40"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">定时发送时间<br />
                        </label>
                        <div class="controls">
                            <input type="text" id="sendTime" data-oval="" class="sendTime input-xlarge" />
                            <input  type="hidden" name="t" id="send_time_hidden" value="0" />
                            <a onclick="clearSendTime()"> 清除定时</a>
                        </div>
                    </div>
                    <div id="add_imgs" style="margin-bottom: 30px;" class="control-group">
                        <label class="control-label">通知展示图片</label>
                        <div class="controls zlappend">
                            <div class='table-pic' id="cover_table" style="float: left;">
                                <div class="table-picboxW">
                                    <div class='table-picbox'>
                                        <span><img src="${image}"
                                                   id="avatar" name="avatar" style="width: 130px;" /></span> <a
                                            href="javascript:;" class="table-picevent" id="fileWarp">点击上传
                                        <input type="file" name="file" id="file" value="点击上传" />
                                        <input type="hidden" name="image" id="topic_image" value="${image}" />

                                    </a>
                                    </div>
                                </div>
                            </div>
                            <a onclick="clearImage()"> 删除</a>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok"></i> 确定
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
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
<link rel="stylesheet" href="assets/css/setting.css"/>
<script type="text/javascript" src="assets/js/setting.js"></script>
<script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
<script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>
</body>
<script>
$("#menu_app").addClass('active open');
$("#menu_systemMsg").addClass('active');
function cancel() {
    history.go(-1);
}

$("#sendTime").slTime({
    callback:function(){
        gx();
    }
});

$(function(){
    $("#sendTime").val("");
})

function gx(){
    var start = new Date($("#sendTime").val().replace(/-/g,   "/")).getTime();
    $("#send_time_hidden").val(start);
}

function clearSendTime(){
    $("#sendTime").val("");
    $("#send_time_hidden").val(0);
}

function validate() {
    var type = "${type}";
    if (type == 'post') {
        var s = $("#versions").val();
        if (s == null || s == '') {
            alert("值得看Push,请选择推送版本!");
            return false;
        }
    }
    return true;
}
function clearImage(){
    $("#avatar").attr("src","");
    $("#topic_image").val("");
}
</script>
</html>