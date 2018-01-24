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
			广告位列表
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/adLocation/list" method="get" id="basic_validate" name="basic_validate"
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
							<th width="5%">ID</th>
							<th width="20%">广告位</th>
							<th>图片</th>
                            <th>支持应用</th>
                            <th>支持设备</th>
                            <th>支持版本</th>
                            <th>支持布局</th>
                            <th>支持渠道</th>
                            <th>最后修改时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="adLocation" varStatus="st">
							<tr>
								<td>${adLocation.id}</td>
                                <td>
                                    名称: ${adLocation.desc}</br>
                                    状态: <c:if test="${adLocation.status == 1}">
                                            正常
                                        </c:if>
                                        <c:if test="${adLocation.status == 0}">
                                            <font color="red">删除</font>
                                        </c:if>
                                </td>
                                <td>
                                    <img src="${adLocation.img}" style="width: 180px;" />
                                </td>
                                <td>
                                    <c:if test="${adLocation.application == ''}">
                                        所有
                                    </c:if>
                                    <c:if test="${adLocation.application != ''}">
                                        ${adLocation.application}
                                    </c:if>
                                </td>
                                <td>
                                    ${adLocation.platform}
                                </td>
                                <td>
                                    ${adLocation.version}
                                </td>
                                <td>
                                    ${adLocation.layout}
                                </td>
                                <td>
                                    ${adLocation.adsType}
                                </td>
                                <td><suishen_fmt:formatDate value="${adLocation.updateTime}" /></td>
								<td>
                                    <a class="set_top update" href="admin/adLocation/update?id=${adLocation.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>编辑</span></span></a><br/>
                                    <a class="set_top update" href="admin/adLocation/delete?id=${adLocation.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>删除</span></span></a><br/>
                                    <a class="set_top update" href="admin/adLocationConfig/list?location=${adLocation.location}&application=${adLocation.application}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>广告开关</span></span></a><br/>
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
    $("#menu_adsLocation").addClass('active');

    function add() {
        var v = $("#application").val();
        window.location = "admin/adLocation/add?application=" + v;
    }
</script>
</html>