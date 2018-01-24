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
			<h1>提现</h1>
			<a <c:if test="${status == 6 && type == 2}">style="color:gray"</c:if>
                   href="admin/withdraw/list?status=6&type=2&uid=${uid}&isFast=${isFast}&isDuiba=${isDuiba}&startTime=${startTime}&endTime=${endTime}&region=${region}" >待审核</a>|
            <a <c:if test="${status == 10 && type == 2}">style="color:gray"</c:if>
                    href="admin/withdraw/list?status=10&type=2&uid=${uid}&isFast=${isFast}&isDuiba=${isDuiba}&startTime=${startTime}&endTime=${endTime}&region=${region}" >打款中</a>|
            <a <c:if test="${status == 5 && type == 2}">style="color:gray"</c:if>
                    href="admin/withdraw/list?status=5&type=2&uid=${uid}&isFast=${isFast}&isDuiba=${isDuiba}&startTime=${startTime}&endTime=${endTime}&region=${region}" >异常订单</a>|
            <a <c:if test="${status == 2}">style="color:gray"</c:if>
                    href="admin/withdraw/list?status=2&sort_desc=true&type=0&uid=${uid}&isFast=${isFast}&isDuiba=${isDuiba}&startTime=${startTime}&endTime=${endTime}&region=${region}" >成功订单</a>|
            <a <c:if test="${status == 3}">style="color:gray"</c:if>
                    href="admin/withdraw/list?status=3&sort_desc=true&type=0&uid=${uid}&isFast=${isFast}&isDuiba=${isDuiba}&startTime=${startTime}&endTime=${endTime}&region=${region}" >失败订单</a>
            <a href="admin/withdraw/export_order" class="btn btn-success btn-small"
               style="float: right"> <i class="icon-download"></i>  导出</a>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/withdraw/list" method="get" id="basic_validate" name="basic_validate"
                                  class="form-horizontal" novalidate="novalidate">
                  <input type="hidden" id="status" name="status" value="${status}" class="input-xlarge" maxlength="40"/>
                  <input type="hidden" id="type" name="type" value="${type}" class="input-xlarge" maxlength="40"/>
                  <input type="hidden" id="sort_desc" name="sort_desc" value="${sortDesc}" class="input-xlarge" maxlength="40"/>
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
                    <label class="control-label">提现区间</label>
                        <div class="controls">
                            <select name="region" id="region" style="width: 120px;">
                                <option value="" <c:if test="${region == ''}">selected</c:if>>所有</option>
                                <option value="10-30" <c:if test="${region == '10-30'}">selected</c:if>>10-30</option>
                                <option value="30-50" <c:if test="${region == '30-50'}">selected</c:if>>30-50</option>
                                <option value="50-100" <c:if test="${region == '50-100'}">selected</c:if>>50-100</option>
                                <option value="100-0" <c:if test="${region == '100-0'}">selected</c:if>>100以上</option>
                            </select>
                        </div>
                     </div>

                     <div class="control-group">
                      <label class="control-label">是否兑吧订单</label>
                          <div class="controls">
                              <select name="isDuiba" id="isDuiba" style="width: 120px;">
                                  <option value="0" <c:if test="${isDuiba == '0'}">selected</c:if>>否</option>
                                  <option value="1" <c:if test="${isDuiba == '1'}">selected</c:if>>是</option>
                              </select>
                          </div>
                      </div>

                     <div class="control-group">
                        <label class="control-label">提现类型</label>
                        <div class="controls">
                             <select name="isFast" id="isFast" style="width: 120px;">
                                 <option value="0" <c:if test="${isFast == '0'}">selected</c:if>>普通提现</option>
                                 <option value="1" <c:if test="${isFast == '1'}">selected</c:if>>快速提现</option>
                             </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">开始时间<br />
                        </label>
                        <div class="controls">
                            <input type="text" id="startTime" data-oval=""  />
                            <input type="hidden" name="startTime" id="start_time_hidden" />
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">结束时间<br />
                        </label>
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
							<th width="7%" style="min-width:70px">
                                <label><input type="checkbox" name="checkAll" id="checkAll" /><span class="lbl">ID</span></label>
                            </th>
                            <th width="5%">UID</th>
							<th width="7%">收款人</th>
                            <th width="8%">银行</th>
							<th width="10%">提现账号</th>
							<c:if test="${isDuiba == 1}">
							    <th width="10%">兑吧订单号</th>
							</c:if>
                            <th width="5%">金额</th>
                            <th width="5%">手续费</th>
							<th width="10%">申请时间</th>
							<th width="10%">最后操作时间</th>
							<th width="5%">类型</th>
                            <th width="8%">状态</th>
                            <c:if test="${status==3 || status==5 || status==6 || status==7 || status == 8}">
                                <th width="10%">失败原因</th>
                            </c:if>
							<th width="15%" id="option">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${wd_list}" var="wd" varStatus="st">
							<tr>
								<td>
                                    <input name="chkItem" type="checkbox" value="<c:if test="${status == 6 && type == 2}">${wd.id}:${wd.duibaOrderNum}</c:if><c:if test="${status != 6}">${wd.id}</c:if>" />&nbsp;<span class="lbl">${wd.id}</span>
                                </td>
                                <td><a target="_blank" href="admin/users/base?uid=${wd.uid}">${wd.uid}</a></td>
								<td>${wd.bankAccountName}</td>
								<td>
                                    <c:choose>
                                        <c:when test="${wd.type == 1}">
                                            ${wd.bankName}
                                        </c:when>
                                        <c:otherwise>
                                            支付宝
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>${wd.bankCard}</td>
                                <c:if test="${isDuiba == 1}">
                                    <td><a target="_blank" href="admin/duibaOrders/list?duibaOrderNum=${wd.duibaOrderNum}">${wd.duibaOrderNum}</a></td>
                                </c:if>
                                <td>${wd.amount}</td>
                                <td>${wd.spendAmount - wd.amount}</td>
								<td><suishen_fmt:formatDate value="${wd.addedTime}" /></td>
								<td><suishen_fmt:formatDate value="${wd.modifiedTime}" /></td>
                                <td>
                                    <c:choose>
                                    <c:when test="${wd.isFast==0}">
                                        普通
                                    </c:when>
                                    <c:when test="${wd.isFast==1}">
                                        快速
                                    </c:when>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:forEach items="${statusList}" var="sl" varStatus="st">
                                         <c:if test="${sl.status == wd.status}">${sl.desc}</c:if>
                                    </c:forEach>
                                </td>
                                    <c:if test="${status==5 || status==6 || status==7 || status == 8 || status == 10}">
                                        <td>
                                            <input id="sub_input_${wd.id}" type="input" />
                                        </td>
                                    </c:if>
                                    <c:if test="${status==3}">
                                        <td>
                                            ${wd.failReason}
                                        </td>
                                    </c:if>
								<td>
								    <c:if test="${__LOGINUSER.userName == 'lijiao' || __LOGINUSER.userName == 'yanghaiyan' || __LOGINUSER.userName == 'admin'}">
                                        <c:if test="${wd.status==7 || wd.status == 8}">
                                            <a class="set_top update" href="javascript:success(${wd.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>成功</span></span></a><br/>
                                            <a class="set_top update" href="javascript:fail(${wd.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>失败</span></span></a></br>
                                            <a class="set_top update" href="admin/blackUser/add?blackAccount=${wd.uid}" style="color: #4f99c6; text-decoration: none;"><span class="blue">拉黑</span></span></a>
                                        </c:if>
                                        <c:if test="${wd.status==6}">
                                            <c:if test="${wd.duibaOrderNum != ''}">
                                                <a class="set_top update" href="javascript:fail(${wd.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>失败</span></span></a>|
                                                <a class="set_top update" href="admin/blackUser/add?blackAccount=${wd.uid}" style="color: #4f99c6; text-decoration: none;"><span class="blue">拉黑</span></span></a>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${wd.status==5}">
                                                <a class="set_top update" href="javascript:fail(${wd.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>失败</span></span></a>
                                        </c:if>
                                        <c:if test="${wd.status==10 && wd.duibaOrderNum != ''}">
                                                <a class="set_top update" href="javascript:fail(${wd.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>失败</span></span></a>
                                                <a class="set_top update" href="javascript:success(${wd.id})" style="color: #4f99c6; text-decoration: none;"> <span class="blue"> <span>成功</span></span></a><br/>
                                        </c:if>
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
				<c:if test="${__LOGINUSER.userName == 'lijiao' || __LOGINUSER.userName == 'yanghaiyan' || __LOGINUSER.userName == 'admin'}">
                    <c:if test="${status == 6 && isDuiba == 1}">
                        <button class="btn btn-info" type="submit" onclick="autoVerify();">
                            <i class="icon-ok"></i>自动审核
                        </button>
                        <button class="btn btn-info" type="submit" onclick="batchVerifySuccess();">
                            <i class="icon-ok"></i>审核通过
                        </button>
                    </c:if>
                </c:if>
                <c:if test="${__LOGINUSER.userName == 'admin'}">
                    <c:if test="${status == 6 && isDuiba == 1}">
                        <button class="btn btn-info" type="button" onclick="handleWaitVerifyOrder();">
                            处理待审核订单
                        </button>
                    </c:if>
                    <c:if test="${status == 10 && isDuiba == 1}">
                        <button class="btn btn-info" type="button" onclick="handlePayingOrder();">
                            处理提现中订单
                        </button>
                    </c:if>
                    <c:if test="${status == 5 && isDuiba == 1}">
                        <button class="btn btn-info" type="button" onclick="handleExceptionOrder();">
                            处理异常订单
                        </button>
                    </c:if>
                </c:if>
			</div>
		</div>
	</div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_withdraw").addClass('active open');//左侧导航栏选中状态
$("#submenu_withdraw_order").addClass('active');

function success(id) {
    var flow_id = $("#sub_input_" + id).val();
    if(flow_id == null){
        flow_id == '';
    }
    if (confirm("您确认要设置提现成功？")) {
        $.ajax({
            url : "admin/withdraw/success?id=" + id + "&flow_id=" + flow_id,
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

function fail(id) {
    var reason = $("#sub_input_" + id).val();
    if (reason == null || reason == '') {
        alert("请填入失败原因！");
        return;
    }
    if (confirm("您确认要设置提现失败？")) {
        $.ajax({
            url : "admin/withdraw/fail?id=" + id + "&reason=" + encodeURIComponent(reason),
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

window.onload = function() {
    $("#checkAll").click(function () {
        $("input[name='chkItem']").prop("checked", this.checked);
    });

    $("input[name='chkItem']")
            .click(
            function() {
                var $subs = $("input[name='chkItem']");
                $("#checkAll")
                        .prop(
                        "checked",
                                $subs.length == $subs
                                .filter(":checked").length ? true
                                : false);
            });
}

function batchVerifySuccess() {
    var ids = "";
    $("input:checkbox[name='chkItem']:checked").each(function(){
        ids += $(this).val() + ",";
    });
    if(ids == ""){
        alert("请勾选");
        return ;
    }
    $.ajax({
        url : "admin/withdraw/batchVerify?ids=" + ids,
        type : "post",
        dataType : "json",
        success : function(data) {
            if (data.status != 1000) {
                alert("操作失败！" + data.desc);
            } else {
                alert("操作成功");
                location.reload();
            }
        },
        error : function(error) {
            console.log(error);
        }
    });
}

function autoVerify() {
    var ids = "";
    var num = 0;
    $("input:checkbox[name='chkItem']:checked").each(function(){
        ids += $(this).val() + ",";
        num++;
    });
    if (ids == "") {
        alert("请选择要自动审核的订单!");
        return ;
    }
    if (confirm("确认要自动审核选中的 " + num + " 个订单?")) {
        $.ajax({
            url : "admin/withdraw/autoVerify?ids=" + ids,
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("审核失败！" + data.desc);
                } else {
                    alert("审核成功");
                    location.reload();
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

// 处理待审核订单
function handleWaitVerifyOrder() {
    if (confirm("确认要处理待审核的提现订单?")) {
        $.ajax({
            url : "admin/withdraw/handleWaitVerifyOrder",
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！" + data.desc);
                } else {
                    alert("操作成功");
                    location.reload();
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

// 处理提现中的订单
function handlePayingOrder() {
    if (confirm("确认要处理提现中订单?")) {
        $.ajax({
            url : "admin/withdraw/handlePayingOrder",
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！" + data.desc);
                } else {
                    alert("操作成功");
                    location.reload();
                }
            },
            error : function(error) {
                console.log(error);
            }
        });
    }
}

// 处理异常订单
function handleExceptionOrder() {
    if (confirm("确认要处理异常提现订单?")) {
        $.ajax({
            url : "admin/withdraw/handleExceptionOrder",
            type : "post",
            dataType : "json",
            success : function(data) {
                if (data.status != 1000) {
                    alert("操作失败！" + data.desc);
                } else {
                    alert("操作成功");
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
	var href = "admin/withdraw/list?status=${status}&type=${type}&uid=${uid}&sort_desc=${sortDesc}&startTime=${startTime}&endTime=${endTime}&region=${region}&isFast=${isFast}&isDuiba=${isDuiba}&pageSize=${pageSize}&page=" + page;
	window.location.href = href;
}
</script>
</html>