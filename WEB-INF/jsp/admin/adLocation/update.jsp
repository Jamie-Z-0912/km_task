<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt" %>
<jsp:include page="../header.jsp" />
<jsp:include page="../sidebar.jsp" />
<!-- 页面 -->
<div id="main-content" class="clearfix">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>新增广告位</h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <form action="admin/adLocation/update" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                         <label class="control-label">应用</label>
                         <div class="controls">
                             <select name="application" id="application" style="width: 120px;">
                                 <c:forEach items="${applications}" var="app">
                                     <option value="${app}" <c:if test="${app == application}">selected</c:if>>${app.appName}</option>
                                 </c:forEach>
                             </select>
                         </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">广告位code</label>
                        <div class="controls">
                            <input type="text" id="location" name="location" class="input-large" value="${adLocation.location}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">广告位描述</label>
                        <div class="controls">
                            <input type="text" id="desc" name="desc" class="input-large" value="${adLocation.desc}"/>
                        </div>
                    </div>

                    <div id="add_imgs" style="margin-bottom: 30px;" class="control-group">
                        <label class="control-label">图片</label>
                        <div class="controls zlappend">
                            <div class='table-pic' id="cover_table" style="float: left;">
                                <div class="table-picboxW">
                                    <div class='table-picbox'>
                                        <span><img src="${adLocation.img}"
                                                   id="avatar" name="avatar" style="width: 130px;" /></span> <a
                                            href="javascript:;" class="table-picevent" id="fileWarp">点击上传
                                        <input type="file" name="file" id="file" value="点击上传" />
                                        <input type="hidden" name="img" id="topic_image" value="${adLocation.img}" />
                                    </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">支持设备平台</label>
                        <div class="controls">
                            <input type="text" id="platform" name="platform" class="input-large" value="${adLocation.platform}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">支持版本</label>
                        <div class="controls">
                            <input type="text" id="version" name="version" class="input-large" value="${adLocation.version}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">支持布局</label>
                        <div class="controls">
                            <input type="text" id="layout" name="layout" class="input-large" value="${adLocation.layout}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">支持渠道</label>
                        <div class="controls">
                            <input type="text" id="adsType" name="adsType" class="input-large" value="${adLocation.adsType}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">备注</label>
                        <div class="controls">
                            <textarea id="remarks" name="remarks" cols=140 rows=4 >${adLocation.remarks}</textarea>
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
     $("#menu_app").addClass('active open');
    $("#menu_adsLocation").addClass('active');
    function cancel() {
        history.go(-1);
    }

    if($("#startTime").length > 0){
        $("#startTime").val(new Date().format("yyyy-MM-dd")+" 00:00:00");
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
</script>
</html>