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
						    <th width="5%">ID</th>
							<th width="22%">弹窗内容</th>
                            <th>图片</th>
                            <th>投放平台</th>
                            <th>投放位置</th>
                            <th>投放用户组</th>
                            <th>弹窗次数</th>
                            <th>状态</th>
                            <th>添加时间</th>
							<th width="5%">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="popup" varStatus="st">
                            <tr>
                                <td>
                                   ${popup.id}
                                </td>
                                <td>
                                   标题: <a href="${popup.url}">${popup.title}</a></br>
                                   是否要登陆: <c:if test="${popup.needLogin}">
                                                  <font color="red">是</font>
                                              </c:if>
                                              <c:if test="${!popup.needLogin}">
                                                  <font color="red">否</font>
                                              </c:if></br>
                                   开始时间: <suishen_fmt:formatDate value="${popup.startTime}" /></br>
                                   结束时间: <suishen_fmt:formatDate value="${popup.endTime}" />
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
                                    <c:if test="${popup.userGroups == ''}">所有用户</c:if>
                                    <c:if test="${popup.userGroups != ''}">
                                        <c:forEach items="${userGroups}" var="userGroup" varStatus="st">
                                            <c:if test="${userGroup.group == popup.userGroups}">${userGroup.groupName}</c:if>
                                        </c:forEach>
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
                                <td><suishen_fmt:formatDate value="${popup.addedTime}" /></td>
                                <td>
                                        <a class="set_top update" href="admin/popup/update/${popup.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>编辑</span></span></a><br/>
                                    <c:if test="${popup.status == 1 || popup.status == 0}">
                                        <a class="set_top update" onclick="up(${popup.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>上架</span></span></a><br/>
                                    </c:if>
                                    <c:if test="${popup.status == 2}">
                                        <a class="set_top update" onclick="down(${popup.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>下架</span></span></a><br/>
                                    </c:if>
                                    <a class="set_top update" href="admin/popup/addmore/${popup.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>追加</span></span></a><br/>
                                </td>
                            </tr>
                        </c:forEach>
					</tbody>
				</table>
                <!-- 分页 -->
                <div class="widget-box" style="margin-top: -10px;">
                    <div class="widget-header">
                        <div class="dataTables_info dataTables_paginate paging_bootstrap pagination" style="margin-top: 5px; ">
                            <ul>
                                <li class="prev">
                                    <span class="previous fg-button ui-button ui-state-default ui-state-disabled">${total}条记录, 共${totalPage}页, 当前第${page}页</span>
                                </li>
                                <c:choose>
                                    <c:when test="${page!=1}">
                                        <li class="prev">
                                            <a href="javascript:turnPage(1)" title="首页" class="first ui-corner-tl ui-corner-bl fg-button ui-button ui-state-default ui-state-default"><span>首页</span></a>
                                            <a href="javascript:turnPage(${page-1})" title="上一页" class="previous fg-button ui-button ui-state-default ui-state-default"><span>上一页</span></a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="prev">
                                            <span class="first ui-corner-tl ui-corner-bl fg-button ui-button ui-state-default ui-state-disabled">首页</span>
                                            <span class="previous fg-button ui-button ui-state-default ui-state-disabled">上一页</span>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                     <c:when test="${page!=totalPage}">
                                        <li class="next">
                                            <a href="javascript:turnPage(${page+1})" title="下一页" class="next fg-button ui-button ui-state-default"><span>下一页</span></a>
                                            <a href="javascript:turnPage(${totalPage})" title="末页" class="last ui-corner-tr ui-corner-br fg-button ui-button ui-state-default"><span>末页</span></a>
                                        </li>
                                     </c:when>
                                     <c:otherwise>
                                        <li class="next">
                                            <span class="next fg-button ui-button ui-state-default ui-state-disabled">下一页</span>
                                            <span class="last ui-corner-tr ui-corner-br fg-button ui-button ui-state-default ui-state-disabled">末页</span>
                                        </li>
                                     </c:otherwise>
                                </c:choose>
                            </ul>
                         </div>
                    </div>
                </div>
                <!-- 分页 -->
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

/** 分页 */
function turnPage(page) {
	// 分页列表URL
	var href = "admin/popup/list?location=${location}&status=${status}&startTime=${startTime}&endTime=${endTime}&platform=${platform}&page=" + page;
	window.location.href = href;
}
</script>
</html>