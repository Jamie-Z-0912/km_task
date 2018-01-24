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
			    卡券列表
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/cards/list" method="get" id="basic_validate" name="basic_validate"
                                  class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                        <label class="control-label">卡券状态</label>
                        <div class="controls">
                            <select name="status" id="status" style="width: 120px;">
                                <c:forEach items="${statusList}" var="st">
                                    <option value="${st.status}" <c:if test="${st.status == status}">selected</c:if>>${st.desc}</option>
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
							<th>ID</th>
							<th>卡券名称</th>
							<th>卡券封面</th>
							<th>卡券类型</th>
							<th>有效天数</th>
                            <th>获取方式</th>
                            <th>原始价格</th>
                            <th>销售价格</th>
                            <th>兑吧商品URL</th>
                            <th>状态</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="card" varStatus="st">
							<tr>
								<td>${card.id}</td>
								<td>
                                   ${card.name}
                                </td>
                                <td>
                                    <img src="${card.icon}" id="icon" name="icon" style="width: 130px;" />
                                </td>
                                <td>
                                    <c:forEach items="${cardTypes}" var="cardType" varStatus="st">
                                        <c:if test="${cardType.type == card.type}">
                                            ${cardType.desc}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                   ${card.effectiveDays}
                                </td>
                                <td>
                                    <c:forEach items="${obtainMethods}" var="om" varStatus="st">
                                        <c:if test="${om.method == card.obtainMethod}">${om.desc}</c:if>
                                    </c:forEach>
                                </td>
                                <td>${card.originalPrice}</td>
                                <td>${card.sellPrice}</td>
                                <td>${card.duibaGoodsUrl}</td>
                                <td>
                                    <c:forEach items="${statusList}" var="sl" varStatus="st">
                                        <c:if test="${sl.status == card.status}">${sl.desc}</c:if>
                                    </c:forEach>
                                </td>
								<td>
                                    <a class="set_top update" href="admin/cards/update/${card.id}" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>编辑</span></span></a><br/>
                                    <c:if test="${card.status == 1 || card.status == 0}">
                                        <a class="set_top update" onclick="up(${card.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>上架</span></span></a><br/>
                                    </c:if>
                                    <c:if test="${card.status == 2}">
                                        <a class="set_top update" onclick="down(${card.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>下架</span></span></a><br/>
                                    </c:if>
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
$("#menu_card").addClass('active open');
$("#submenu_card").addClass('active');

function add() {
    window.location = "admin/cards/add";
}
function down(id) {
    if (confirm("您确认要下架此卡券吗？")) {
        $.ajax({
            url : "admin/cards/down?id=" + id,
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
    if (confirm("您确认要上架此卡券吗？")) {
        $.ajax({
            url : "admin/cards/up?id=" + id,
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

function turnPage(page) {
	// 分页列表URL
	var href = "admin/cards/list?status=${status}&page=" + page;
	window.location.href = href;
}
</script>
</html>