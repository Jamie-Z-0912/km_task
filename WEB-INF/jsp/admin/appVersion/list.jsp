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
			<h1>
			应用版本列表
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/appVersion/list" method="get" id="basic_validate" name="basic_validate"
                                  class="form-horizontal" novalidate="novalidate">
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
                        <label class="control-label">设备平台</label>
                        <div class="controls">
                            <select name="platform" id="platform" style="width: 120px;">
                                <c:forEach items="${platforms}" var="plt">
                                    <option value="${plt}" <c:if test="${plt == platform}">selected</c:if>>${plt}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok"></i> 查询
                        </button>
                        <a href="javascript:add();" class="btn btn-success btn-info" > <i class="icon-edit"></i>新增</a>
                    </div>
                </form>
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th width="8%">ID</th>
							<th>应用</th>
							<th>平台</th>
                            <th>版本号</th>
                            <th>最后修改时间</th>
							<th width="8%">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="appVersion" varStatus="st">
							<tr>
								<td>${appVersion.id}</td>
								<td>
								    <c:if test="${appVersion.application == ''}">
                                        所有
                                    </c:if>
                                    <c:if test="${appVersion.application != ''}">
                                        ${appVersion.application}
                                    </c:if>
                                </td>
                                <td>
                                    ${appVersion.platform}
                                </td>
                                <td>
                                    ${appVersion.version}
                                </td>
                                <td><suishen_fmt:formatDate value="${appVersion.updateTime}" /></td>
								<td>
                                    <a class="set_top update" href="admin/appVersion/update?id=${appVersion.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>编辑</span></span></a><br/>
                                </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			    </div>
			</div>
		</div>
	</div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
    $("#menu_app").addClass('active open');
    $("#menu_appVersion").addClass('active');

    function add() {
        var v = $("#application").val();
        window.location = "admin/appVersion/add?application=" + v;
    }
</script>
</html>