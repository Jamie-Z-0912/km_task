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
			广告列表
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/ads/list" method="get" id="basic_validate" name="basic_validate"
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
                          <label class="control-label">广告标题</label>
                          <div class="controls">
                              <input type="text" id="keyword" name = "keyword" width="100px" value="${keyword}"/>
                          </div>
                     </div>

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
                                <select name="adsLocation" id="adsLocation" style="width: 120px;">
                                    <c:forEach items="${adsLocations}" var="al" varStatus="st">
                                        <option value="${al.location}" <c:if test="${al.location == adsLocation}">selected</c:if>>${al.desc}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                    <div class="control-group">
                        <label class="control-label">广告状态</label>
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
                        <label class="control-label">开始时间<br />
                        </label>
                        <div class="controls">
                            <input type="text" id="startTime" data-oval="" class="start_time input-large" />
                            <input type="hidden" name="startTime" id="start_time_hidden" />
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
							<th width="7%">广告ID</th>
							<th width="20%">广告内容</th>
                            <th>图片</th>
                            <th>投放位置</th>
                            <th>投放应用</th>
                            <th>投放平台</th>
                            <th>状态</th>
							<th>开始时间</th>
                            <th>结束时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="ad" varStatus="st">
							<tr>
								<td>${ad.id}</td>
								<td>
                                   标题: <a href="${ad.originUrl}">${ad.title}</a><br/>
                                   来源: ${ad.source}<br/>
                                   布局: <c:forEach items="${layout}" var="la" varStatus="st">
                                           <c:if test="${la.layout == ad.layout}">${la.desc}</c:if>
                                       </c:forEach><br/>
                                   标识: ${ad.tips}<br/>
                                   是否要登录:<c:if test="${ad.needLogin}">
                                                 <font color="red">是</font>
                                             </c:if>
                                             <c:if test="${!ad.needLogin}">
                                                 <font color="red">否</font>
                                             </c:if>
                                </td>
                                <td>
                                    <c:forEach items="${ad.imagesList}" var="img" varStatus="st">
                                        <img src="${img}" id="avatar" name="avatar" style="width: 130px;" />
                                    </c:forEach>
                                </td>
                                <td>
                                    <c:forEach items="${adsLocations}" var="adsLocation" varStatus="st">
                                        <c:if test="${adsLocation.location == ad.adsLocation}">
                                            ${adsLocation.desc}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                    <c:if test="${ad.application == ''}">
                                          默认
                                    </c:if>
                                    <c:if test="${ad.application != ''}">
                                          ${ad.application}
                                    </c:if>
                                </td>
                                <td>
                                    ${ad.platform}
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${0 == ad.status}">
                                            <span style="color:gray">新建</span>
                                        </c:when>
                                        <c:when test="${1 == ad.status}">
                                            <span>下架</span>
                                        </c:when>
                                        <c:when test="${2 == ad.status}">
                                            <c:if test="${now >= ad.endTime}">
                                                <span style="color:gray">过期</span>
                                            </c:if>
                                            <c:if test="${now < ad.endTime}">
                                                <span style="color:lightgreen">上架</span>
                                            </c:if>
                                        </c:when>
                                    </c:choose>
                                </td>
								<td><suishen_fmt:formatDate value="${ad.startTime}" /></td>
                                <td><suishen_fmt:formatDate value="${ad.endTime}" /></td>
								<td>
                                    <a class="set_top update" href="admin/ads/update/${ad.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>编辑</span></span></a><br/>
                                    <c:if test="${ad.status == 1 || ad.status == 0}">
                                        <a class="set_top update" onclick="up(${ad.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>上架</span></span></a><br/>
                                    </c:if>
                                    <c:if test="${ad.status == 2}">
                                        <a class="set_top update" onclick="down(${ad.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>下架</span></span></a><br/>
                                        <a class="set_top update" onclick="setTop(${ad.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>置顶</span></span></a><br/>
                                    </c:if>
                                    <a class="set_top update" href="admin/ads/tj?id=${ad.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>统计</span></span></a><br/>
                                    <a class="set_top update" href="admin/ads/addmore/${ad.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>追加</span></span></a><br/>
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
</div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_app").addClass('active open');
$("#menu_ads").addClass('active');

function add() {
    var v = $("#application").val();
    window.location = "admin/ads/add?application=" + v;
}
function down(id) {
    if (confirm("您确认要下架此广告吗？")) {
        $.ajax({
            url : "admin/ads/down?id=" + id,
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
    if (confirm("您确认要上架此广告吗？")) {
        $.ajax({
            url : "admin/ads/up?id=" + id,
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

function setTop(id) {
    if (confirm("您确认要置顶此广告吗？")) {
        $.ajax({
            url : "admin/ads/top?id=" + id,
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

function turnPage(page) {
	// 分页列表URL
	var href = "admin/ads/list?keyword=${keyword}&adsLocation=${adsLocation}&status=${status}&startTime=${startTime}&endTime=${endTime}&platform=${platform}&page=" + page;
	window.location.href = href;
}
</script>
</html>