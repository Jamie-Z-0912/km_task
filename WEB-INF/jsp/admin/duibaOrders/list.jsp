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
			<h1>兑吧订单列表</h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/duibaOrders/list" method="get" id="basic_validate" name="basic_validate" class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                         <label class="control-label">手机号</label>
                         <div class="controls">
                             <input type="text" id="phone" name="phone" value="${phone}" />
                         </div>
                   </div>
                    <div class="control-group">
                        <label class="control-label">uid</label>
                        <div class="controls">
                            <input type="text" name="uid" uid="uid" value="${uid}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">兑吧订单号</label>
                        <div class="controls">
                            <input type="text" name="duibaOrderNum" uid="duibaOrderNum" value="${duibaOrderNum}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">商品类型</label>
                        <div class="controls">
                            <select name="type" id="type" style="width: 120px;">
                                <c:forEach items="${types}" var="ty">
                                    <option value="${ty.type}" <c:if test="${type == ty.type}">selected</c:if>>${ty.desc}</option>
                                </c:forEach>
                            </select>
                        </div>
                     </div>

                     <div class="control-group">
                        <label class="control-label">订单状态</label>
                        <div class="controls">
                             <select name="status" id="status" style="width: 120px;">
                                <c:forEach items="${statusList}" var="st">
                                    <option value="${st.status}" <c:if test="${status == st.status}">selected</c:if>>${st.desc}</option>
                                </c:forEach>
                             </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">开始时间<br /></label>
                        <div class="controls">
                            <input type="text" id="startTime" data-oval=""  />
                            <input type="hidden" name="startTime" id="start_time_hidden" />
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">结束时间<br /></label>
                        <div class="controls">
                            <input type="text" id="endTime" data-oval=""/>
                            <input type="hidden" name="endTime" id="end_time_hidden" />
                        </div>
                    </div>
                    <div class="form-actions">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok"></i> 查询
                        </button>
                    </div>
                </form>
				<table class="table table-bordered table-striped">
					<thead>
						<tr>
							<th width="5%">
                                ID
                            </th>
                            <th width="5%">UID</th>
                            <th width="6%">兑吧订单号</th>
							<th width="27%">订单信息</th>
                            <th width="6%">订单状态</th>
                            <th width="6%">支付状态</th>
							<th width="10%">失败原因</th>
							<th width="8%">最后操作时间</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="duibaOrder" varStatus="st">
							<tr>
								<td>
                                    ${duibaOrder.id}
                                </td>
                                <td><a target="_blank" href="admin/users/base?uid=${duibaOrder.uid}">${duibaOrder.uid}</a></td>
                                <td>${duibaOrder.duibaOrderNum}</td>
								<td>
								    描述: ${duibaOrder.description}</br>
                                    <c:if test="${type == 'virtual'}">
								        商品金额: ${duibaOrder.actualCredits / 100} 元</br>
								    </c:if>
								    <c:if test="${type != 'virtual'}">
								        商品金额: ${duibaOrder.credits / 100} 元</br>
                                    </c:if>
                                    实收用户: ${duibaOrder.actualCredits / 100} 元</br>
                                    支付兑吧: <c:if test="${type == 'virtual'}">
                                              ${duibaOrder.actualCredits / 100} 元</br>
                                          </c:if>
                                          <c:if test="${type != 'virtual'}">
                                              ${duibaOrder.actualPrice / 100} 元</br>
                                          </c:if>
                                    下单IP:  ${duibaOrder.ip}
								</td>
								<td>
                                    <c:forEach items="${statusList}" var="status">
                                        <c:if test="${duibaOrder.orderStatus == status.status}">${status.desc}</c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                    <c:forEach items="${creditsStatusList}" var="csl">
                                        <c:if test="${duibaOrder.creditsStatus == csl.status}">${csl.desc}</c:if>
                                    </c:forEach>
                                </td>
                                <td>${duibaOrder.failReason}</td>
								<td><suishen_fmt:formatDate value="${duibaOrder.modifiedTime}" /></td>
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
$("#menu_withdraw").addClass('active open');//左侧导航栏选中状态
$("#menu_duiba_order").addClass('active');

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
	var href = "admin/duibaOrders/list?status=${status}&type=${type}&uid=${uid}&phone=${phone}&startTime=${startTime}&endTime=${endTime}&page=" + page;
	window.location.href = href;
}
</script>
</html>