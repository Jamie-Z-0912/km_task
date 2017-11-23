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
			弹窗列表
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/popup/list" method="get" id="basic_validate" name="basic_validate"
                                  class="form-horizontal" novalidate="novalidate">
                        <div class="control-group">
                          <label class="control-label">投放平台</label>
                          <div class="controls">
                              <select name="platform" id="platform" style="width: 120px;">
                                  <c:forEach items="${platforms}" var="plt">
                                    <option value="${plt}" <c:if test="${plt == platform}">selected</c:if>>${plt}</option>
                                  </c:forEach>
                              </select>
                          </div>
                       </div>

                       <div class="control-group">
                            <label class="control-label">投放位置</label>
                            <div class="controls">
                                <select name="location" id="location" style="width: 120px;">
                                    <c:forEach items="${popupLocations}" var="pl" varStatus="st">
                                        <option value="${pl.location}" <c:if test="${pl.location == location}">selected</c:if>>${pl.desc}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                    <div class="control-group">
                        <label class="control-label">弹窗状态</label>
                        <div class="controls">
                            <select name="status" id="status" style="width: 120px;">
                                <option value="-1" <c:if test="${-1 == status}">selected</c:if>>所有</option>
                                <option value="0" <c:if test="${0 == status}">selected</c:if>>新建</option>
                                <option value="1" <c:if test="${1 == status}">selected</c:if>>下架</option>
                                <option value="2" <c:if test="${2 == status}">selected</c:if>>上架</option>
                            </select>
                        </div>
                     </div>

                    <div class="control-group">
                        <label class="control-label">开始时间<br /></label>
                        <div class="controls">
                            <input type="text" id="startTime" data-oval="" class="start_time input-large" />
                            <input type="hidden" name="startTime" id="start_time_hidden" />
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">结束时间<br /></label>
                        <div class="controls">
                            <input type="text" id="endTime" data-oval=""  />
                            <input type="hidden" name="endTime" id="end_time_hidden" />
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
							<th>弹窗标题</th>
                            <th>图片</th>
                            <th>投放平台</th>
                            <th>投放位置</th>
                            <th>投放用户组</th>
                            <th>是否要登陆</th>
                            <th>弹窗次数</th>
                            <th>状态</th>
							<th>开始时间</th>
                            <th>结束时间</th>
                            <th>添加时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="popup" varStatus="st">
                            <tr>
                                <td>
                                   <a href="${popup.url}">${popup.title}</a>
                                </td>
                                <td><img src="${popup.image}" /></td>
                                <td>
                                    ${popup.platform}
                                </td>
                                <td>
                                    <c:forEach items="${popupLocations}" var="pl" varStatus="st">
                                        <c:if test="${pl.location == popup.location}">
                                            ${pl.desc}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                    <c:forEach items="${userGroups}" var="userGroup" varStatus="st">
                                        <c:if test="${userGroup.group == popup.userGroups}">${userGroup.groupName}</c:if>
                                    </c:forEach>
                                    <c:if test="${popup.userGroups == ''}">所有用户</c:if>
                                </td>
                                <td>
                                    <c:if test="${popup.needLogin}">
                                        是
                                    </c:if>
                                    <c:if test="${!popup.needLogin}">
                                        否
                                    </c:if>
                                </td>
                                <td>
                                    ${popup.num}
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${0 == popup.status}">
                                            <span style="color:gray">新建</span>
                                        </c:when>
                                        <c:when test="${1 == popup.status}">
                                            <span>下架</span>
                                        </c:when>
                                        <c:when test="${2 == popup.status}">
                                            <span style="color:lightgreen">上架</span>
                                        </c:when>
                                        <c:when test="${now > popup.endTime}">
                                            <span style="color:gray">过期</span>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td><suishen_fmt:formatDate value="${popup.startTime}" /></td>
                                <td><suishen_fmt:formatDate value="${popup.endTime}" /></td>
                                <td><suishen_fmt:formatDate value="${popup.addedTime}" /></td>
                                <td>
                                        <a class="set_top update" href="admin/popup/update/${popup.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>编辑</span></span></a><br/>
                                    <c:if test="${popup.status == 1 || popup.status == 0}">
                                        <a class="set_top update" onclick="up(${popup.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>上架</span></span></a><br/>
                                    </c:if>
                                    <c:if test="${popup.status == 2}">
                                        <a class="set_top update" onclick="down(${popup.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>下架</span></span></a><br/>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
					</tbody>
				</table>
				<div class="row-fluid">
				<div class="span12">
					<div class="dataTables_paginate paging_bootstrap pagination">
					共<b>${totalPage}</b>页
						<ul>
							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/popup/list?page=${page - 1}&location=${location}&status=${status}&startTime=${startTime}&endTime=${endTime}&platform=${platform}">&lt;&lt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">&lt;&lt;</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page gt 1}">
									<li><a
										href="admin/popup/list?page=1&location=${location}&status=${status}&startTime=${startTime}&endTime=${endTime}&platform=${platform}">1</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">1</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 2 and page ne 2}">
									<li><a
										href="admin/popup/list?page=2&location=${location}&status=${status}&startTime=${startTime}&endTime=${endTime}&platform=${platform}">2</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">2</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${totalPage ge 3 and page ne 3}">
									<li class=""><a href="admin/popup/list?page=3&location=${location}&status=${status}&startTime=${startTime}&endTime=${endTime}&platform=${platform}">3</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">3</a></li>
								</c:otherwise>
							</c:choose>

							<c:choose>
								<c:when test="${page lt totalPage}">
									<li class="next"><a
										href="admin/popup/list?page=${page + 1}&location=${location}&status=${status}&startTime=${startTime}&endTime=${endTime}&platform=${platform}">&gt;&gt;</a></li>
								</c:when>
								<c:otherwise>
									<li class="prev disabled"><a href="javascript:void(0);">&gt;&gt;</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
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
$("#menu_popup").addClass('active');
function add() {
    var v = $("#application").val();
    window.location = "admin/popup/add?application=" + v;
}
function down(id) {
    if (confirm("您确认要下架此弹窗吗？")) {
        $.ajax({
            url : "admin/popup/down?id=" + id,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！");
                } else {
                    location.reload();
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

function up(id) {
    if (confirm("您确认要下架此弹窗吗？")) {
        $.ajax({
            url : "admin/popup/up?id=" + id,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！");
                } else {
                    location.reload();
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

if($("#startTime").length > 0){
    $("#startTime").val(new Date(${startTime}).format("yyyy-MM-dd hh:mm:ss"));
    $("#endTime").val(new Date(${endTime}).format("yyyy-MM-dd hh:mm:ss"));
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
</script>
</html>