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
			广告位开关列表
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/adLocationConfig/list" method="get" id="basic_validate" name="basic_validate"
                                  class="form-horizontal" novalidate="novalidate">
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
                          <label class="control-label">平台</label>
                          <div class="controls">
                              <select name="platform" id="platform" style="width: 160px;">
                                  <c:forEach items="${platforms}" var="plt">
                                      <option value="${plt}" <c:if test="${plt == platform}">selected</c:if>>${plt}</option>
                                  </c:forEach>
                              </select>
                          </div>
                    </div>

                    <div class="control-group">
                          <label class="control-label">广告位</label>
                          <div class="controls">
                              <select name="location" id="location" style="width: 160px;">
                                <c:forEach items="${locations}" var="loa" varStatus="st">
                                    <option value="${loa.location}" <c:if test="${loa.location == location}">selected</c:if>>${loa.desc}</option>
                                </c:forEach>
                            </select>
                          </div>
                    </div>

                    <div class="control-group">
                          <label class="control-label">版本</label>
                          <div class="controls">
                              <select name="version" id="version" style="width: 160px;">
                                    <option value="0" <c:if test="${0 == version}">selected</c:if>>所有</option>
                                  <c:forEach items="${versions}" var="ver" varStatus="st">
                                      <option value="${ver}" <c:if test="${ver == version}">selected</c:if>>${ver}</option>
                                  </c:forEach>
                              </select>
                          </div>
                    </div>

                    <div class="form-actions">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok"></i> 查询
                        </button>
                        <a href="javascript:add();" class="btn btn-success btn-info" > <i class="icon-edit"></i>新增</a>                  <font color="red"> (修改后最多10分钟生效)</font>

                    </div>
                </form>
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th width="5%">ID</th>
							<th width="25%">广告位</th>
							<th>应用</th>
                            <th>设备平台</th>
                            <th>版本号</th>
                            <th>广告布局</th>
                            <th>状态</th>
                            <th>最后修改时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="alc" varStatus="st">
							<tr>
								<td>${alc.id}</td>
                                <td>
                                    名称: ${alc.locationDesc}</br>
                                    渠道: <c:forEach items="${adChannels}" var="adc" varStatus="st">
                                                  <c:if test="${adc.type == alc.adsType}">${adc.desc}</c:if>
                                             </c:forEach></br>
                                    第三方AppID: ${alc.adAppId}</br>
                                    第三方广告位ID: ${alc.thirdLocationId}</br>
                                </td>
                                <td>
                                    ${alc.application}
                                </td>
                                <td>
                                    ${alc.platform}
                                </td>
                                <td>
                                    ${alc.version}
                                </td>
                                <td>
                                    <c:forEach items="${layouts}" var="lay" varStatus="st">
                                        <c:if test="${lay.layout == alc.layout}">${lay.desc}</c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                    <c:if test="${alc.status == 1}">打开中</c:if>
                                    <c:if test="${alc.status == 0}">关闭中</c:if>
                                </td>
                                <td><suishen_fmt:formatDate value="${alc.updateTime}" /></td>
                                <td>
                                    <a class="set_top update" href="admin/adLocationConfig/update?id=${alc.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>编辑</span></span></a><br/>
                                    <c:if test="${alc.status == 0}">
                                        <a class="set_top update" href="javascript:up('${alc.id}');" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>打开</span></span></a><br/>
                                    </c:if>
                                    <c:if test="${alc.status == 1}">
                                        <a class="set_top update" href="javascript:down('${alc.id}');" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>关闭</span></span></a><br/>
                                    </c:if>                                </td>
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
    $("#menu_adsLocationConfig").addClass('active');

    function add() {
        var v = $("#application").val();
        window.location = "admin/adLocationConfig/add?application=" + v;
    }

    function down(id) {
        if (confirm("您确认要关闭此广告位开关吗？")) {
            $.ajax({
                url : "admin/adLocationConfig/updateStatus?id=" + id + "&status=0" ,
                type : "post",
                dataType : "json",
                success : function(data) {
                    if (data.status != 1000) {
                        alert("操作失败！");
                    } else {
                        location.reload();                    }
                },
                error : function(error) {
                    console.log(error);
                }
            });
        }
    }

    function up(id) {
        if (confirm("您确认要打开此广告位开关吗？")) {
            $.ajax({
                url : "admin/adLocationConfig/updateStatus?id=" + id + "&status=1" ,
                type : "post",
                dataType : "json",
                success : function(data) {
                    if (data.status != 1000) {
                        alert("操作失败！");
                    } else {
                        location.reload();                    }
                },
                error : function(error) {
                    console.log(error);
                }
            });
        }
    }
</script>
</html>