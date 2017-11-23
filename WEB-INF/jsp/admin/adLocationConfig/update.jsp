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
            <h1>广告位开关配置</h1>
        </div>
         <div class="row-fluid">
            <div class="row-fluid">
                <form action="admin/adLocationConfig/update" method="post" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                         <label class="control-label">应用</label>
                         <div class="controls">
                             <select name="application" id="application" style="width: 160px;">
                                 <c:forEach items="${applications}" var="app">
                                     <option value="${app}" <c:if test="${app == application}">selected</c:if>>${app.appName}</option>
                                 </c:forEach>
                             </select>
                         </div>
                    </div>

                    <div class="control-group">
                          <label class="control-label">广告位</label>
                          <div class="controls">
                              <select name="location" id="location" style="width: 160px;">
                                <c:forEach items="${locations}" var="loa" varStatus="st">
                                    <c:if test="${adLocationConfig.location == loa.location}">
                                        <option value="${loa.location}" selected>${loa.desc}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                          </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">设备平台</label>
                        <div class="controls">
                            <select style="width: 160px;" name="platform" disable>
                                <c:forEach items="${platforms}" var="pt" varStatus="st">
                                    <option value="${pt}" <c:if test="${pt == adLocationConfig.platform}">selected</c:if>>${pt}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">版本</label>
                        <div class="controls">
                            <select style="width: 160px;" name="version">
                                <c:forEach items="${versions}" var="ver" varStatus="st">
                                    <c:if test="${adLocationConfig.version == ver}">
                                        <option value="${ver}">${ver}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">广告布局</label>
                        <div class="controls">
                            <select style="width: 160px;" name="layout">
                                <c:forEach items="${layouts}" var="lay" varStatus="st">
                                    <option value="${lay.layout}" <c:if test="${adLocationConfig.layout == lay.layout}">selected</c:if>>${lay.desc}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">广告渠道</label>
                        <div class="controls">
                            <select style="width: 160px;" name="adsType">
                                <c:forEach items="${adChannels}" var="channel" varStatus="st">
                                    <option value="${channel.type}" <c:if test="${adLocationConfig.adsType == channel.type}">selected</c:if>>${channel.desc}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">第三方授权AppID</label>
                        <div class="controls">
                            <input type="text" id="adAppId" name="adAppId" class="input-xxxlarge" value="${adLocationConfig.adAppId}"/>
                        </div>
                    </div>

                     <div class="control-group">
                         <label class="control-label">第三方广告位ID</label>
                         <div class="controls">
                             <input type="text" id="thirdLocationId" name="thirdLocationId" class="input-xxxlarge" value="${adLocationConfig.thirdLocationId}"/>
                         </div>
                     </div>

                    <div class="control-group">
                        <label class="control-label">备注</label>
                        <div class="controls">
                            <textarea id="remarks" name="remarks" class="input-xxxlarge" value="">${adLocationConfig.remarks}</textarea>
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
</body>
<script>
     $("#menu_app").addClass('active open');
    $("#menu_adsLocationConfig").addClass('active');
    function cancel() {
        history.go(-1);
    }
</script>
</html>