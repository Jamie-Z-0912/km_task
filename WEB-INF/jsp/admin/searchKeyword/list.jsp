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
			搜索补量
            </h1>
		</div>
		<div class="row-fluid">
		    <form action="admin/searchKeywords/list" method="get" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
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
				<div class="control-group">
					<label class="control-label">链接<br /></label>
					<div class="controls">
						<input type="text" name="url" id="url" data-oval=""  value="${url}"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">来源<br /></label>
					<div class="controls">
						<input type="text" name="source" id="source" data-oval=""  value="${source}"/>
					</div>
				</div>
                <div class="control-group">
                    <label class="control-label">状态<br /></label>
                    <div class="controls">
                        <select name="status" id="status" style="width: 120px;">
                            <option value="-1" <c:if test="${-1 == status}">selected</c:if>>所有</option>
                            <option value="1" <c:if test="${1 == status}">selected</c:if>>上架</option>
                            <option value="0" <c:if test="${0 == status}">selected</c:if>>下架</option>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">平台<br /></label>
                    <div class="controls">
                        <select name="platform" id="platform" style="width: 120px;">
                            <option value="DEFAULT" <c:if test="${'DEFAULT' == platform}">selected</c:if>>所有</option>
                            <option value="ANDROID" <c:if test="${'ANDROID' == platform}">selected</c:if>>ANDROID</option>
                            <option value="IPHONE" <c:if test="${'IPHONE' == platform}">selected</c:if>>IPHONE</option>
                            <option value="WEB" <c:if test="${'WEB' == platform}">selected</c:if>>WEB</option>
                            <option value="WEB_WX" <c:if test="${'WEB_WX' == platform}">selected</c:if>>WEB_WX</option>
                        </select>
                    </div>
                </div>
                <div class="form-actions" style="position:relative;">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 查询
                    </button>
                    <a href="javascript:add();" class="btn btn-success btn-info" > <i class="icon-edit"></i>新增</a>
					<button class="btn btn-info">
						总投放量:${totalPutNum}
					</button>
					<button class="btn btn-info">
						总搜索量:${totalSearchNum}
					</button>
                </div>
            </form>
			<div class="row-fluid">
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th>关键词</th>
							<th>链接</th>
							<th>投放平台</th>
							<th>来源</th>
                            <th>开始时间</th>
                            <th>结束时间</th>
                            <th>投放量</th>
                            <th>搜索量</th>
                            <th>添加时间</th>
                            <th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${searchKeywords}" var="word" varStatus="st">
							<tr>
								<td><a target="_blank" href="${word.url}">${word.keyword}</a></td>
								<td> ${word.url}</td>
								<td>${word.platform}</td>
								<td>${word.source}</td>
								<td><suishen_fmt:formatDate value="${word.startTime}" /></td>
								<td><suishen_fmt:formatDate value="${word.endTime}" /></td>
								<td><font color="red">${word.putNum}</font></td>
								<td><font color="green">${word.searchNum}</font></td>
								<td><suishen_fmt:formatDate value="${word.addedTime}" /></td>
                                <td><c:choose>
                                    <c:when test="${word.status==1}">上架</c:when>
                                    <c:otherwise>下架</c:otherwise>
                                </c:choose></td>
								<td>
                                    <a class="set_top update" href="admin/searchKeywords/update?id=${word.id}">编辑</a><br/>
                                    <c:choose>
                                        <c:when test="${word.status==0}"><a href="javascript:show(${word.id})">上架</a><br/></c:when>
                                        <c:otherwise><a href="javascript:shutdown(${word.id})">下架</a><br/></c:otherwise>
                                    </c:choose>
									<a class="set_top update" href="admin/searchKeywords/newadd?id=${word.id}">追加</a><br/>
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
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_app").addClass('active open');
$("#menu_search_keyword").addClass('active');

function add() {
    window.location = "admin/searchKeywords/add";
}

function show(id) {
    if (confirm("您确认要执行此操作？")) {
        $.ajax({
            url : "admin/searchKeywords/show?id=" + id,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！" + data.desc);
                } else {
                    alert("操作成功！");
                    location.reload();
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

function shutdown(id) {
    if (confirm("您确认要执行此操作？")) {
        $.ajax({
            url : "admin/searchKeywords/shutdown?id=" + id,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！" + data.desc);
                } else {
                    alert("操作成功！");
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

function turnPage(page) {
	// 分页列表URL
	var href = "admin/searchKeywords/list?startTime=${startTime}&endTime=${endTime}&source=${source}&url=${url}&page=" + page;
	window.location.href = href;
}
</script>
</html>