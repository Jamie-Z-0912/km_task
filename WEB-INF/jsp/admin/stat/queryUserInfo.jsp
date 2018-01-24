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
                用户信息查询
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
            <form action="admin/users/base" method="get" id="basic_validate" name="basic_validate"
                              class="form-horizontal" novalidate="novalidate">
                      <div class="control-group">
                          <label class="control-label">手机号:</label>
                          <div class="controls">
                              <input type="text" id="phone" name="phone" value="${phone}" class="input-xlarge" maxlength="40"/>
                          </div>
                      </div>
                    <div class="control-group">
                        <label class="control-label">uid:</label>
                        <div class="controls">
                            <input type="text" id="uid" name="uid" value="${uid}" class="input-xlarge" maxlength="40"/>
                        </div>
                    </div>
                <div class="form-actions">
                    <button class="btn btn-info" type="submit">
                        <i class="icon-ok"></i> 查询
                    </button>
                </div>
            </form>
				<table class="table table-bordered table-striped" style="table-layout:fixed; word-break: break-all;">
					<thead>
						<tr>
							<th width="10%">uid</th>
                            <th width="25%">用户信息</th>
							<th width="10%">手机号</th>
							<th width="8%">昨日收益</th>
                            <th width="8%">总收益</th>
                            <th width="8%">账户余额</th>
                            <th width="8%">是否黑户</th>
                            <th width="7%">师傅uid</th>
                            <th width="10%">徒弟</th>
							<th width="8%">操作</th>
						</tr>
					</thead>
                    <c:if test="${userStat.uid > 0}">
                        <tbody>
                                <tr>
                                    <td>
                                        <c:if test="${alipayAccount != null}">
                                            <c:choose>
                                               <c:when test="${alipayAccount.account != userStat.phone}">
                                                    <font color="red">${userStat.uid}</font>
                                               </c:when>
                                               <c:otherwise>
                                                    <font color="green">${userStat.uid}</font>
                                               </c:otherwise>
                                            </c:choose>
                                        </c:if>
                                        <c:if test="${alipayAccount == null}">
                                            ${userStat.uid}
                                        </c:if>
                                    </td>
                                    <td>
                                    昵称: ${userStat.nickName}</br>
                                    支付宝:
                                    <c:if test="${alipayAccount != null}">
                                        </br>真实姓名: ${alipayAccount.realName} </br>支付宝账号: ${alipayAccount.account}
                                    </c:if>
                                    <c:if test="${alipayAccount == null}">
                                        未绑定
                                    </c:if>
                                    </br>
                                    注册时间: <suishen_fmt:formatDate value="${userStat.registerTime}" />
                                    </br>
                                    是否绑定微信:
                                        <c:if test="${userStat.bindWX}"><span style="color:red">是</span></c:if>
                                        <c:if test="${!userStat.bindWX}"><span style="color:red">否</span></c:if>
                                     <br/>
                                        <c:if test="${userStat.bindWX}">
                                            绑定微信时间:<suishen_fmt:formatDate value="${userStat.bindWXTime}" />
                                        </c:if>
                                    <br/>
                                        头像:<img src="${userStat.avatar}" width="100" height="100">

                                    </td>
                                    <td>${userStat.phone}</td>
                                    <td>
                                        ${userStat.yesterIncome}
                                    </td>
                                    <td>
                                        ${userStat.totalIncome}
                                    </td>
                                    <td>
                                        ${userStat.balance}
                                    </td>
                                    <td>
                                        uid: <c:if test="${userStat.blackUid}">
                                            <span style="color:red">是</span>
                                        </c:if>
                                        <c:if test="${!userStat.blackUid}">
                                            否
                                        </c:if>
                                        </br>
                                        手机: <c:if test="${userStat.blackPhone}">
                                                 <span style="color:red">是</span>
                                             </c:if>
                                             <c:if test="${!userStat.blackPhone}">
                                                 否
                                             </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${userStat.fatherUid > 0}">
                                            <a target="_blank" href="admin/users/base?uid=${userStat.fatherUid}">${userStat.fatherUid}</a>
                                        </c:if>
                                        <c:if test="${userStat.fatherUid <= 0}">
                                            无
                                        </c:if>
                                    </td>
                                    <td>
                                        徒弟数: ${userStat.sonNum}</br>
                                        有效徒弟: ${userStat.realBrowserSonNum}
                                    </td>
                                    <td>
                                        <a class="set_top update" href="admin/users/coin?uid=${userStat.uid}" style="color: #4f99c6; text-decoration: none;">
                                            <span class="blue"> <span>金币流水</span></span></a><br/>
                                        <a class="set_top update" href="admin/users/cash?uid=${userStat.uid}" style="color: #4f99c6; text-decoration: none;">
                                            <span class="blue"> <span>现金流水</span></span></a><br/>
                                        <c:if test="${userStat.sonNum > 0}">
                                        <a class="set_top update" href="admin/inviteRelation/friends?uid=${userStat.uid}" style="color: #4f99c6; text-decoration: none;">
                                            <span class="blue"> <span>好友列表</span></span></a><br/>
                                        </c:if>
                                        <a class="set_top update" href="admin/withdraw/list_find?account=${userStat.uid}" style="color: #4f99c6; text-decoration: none;">
                                            <span class="blue"> <span>提现记录</span></span></a><br/>
                                        <a class="set_top update" href="admin/socialTaskOrders?uid=${userStat.uid}" style="color: #4f99c6; text-decoration: none;">
                                            <span class="blue"> <span>分享任务</span></span></a><br/>
                                        <a class="set_top update" href="admin/users/searchLog?uid=${userStat.uid}" style="color: #4f99c6; text-decoration: none;">
                                            <span class="blue"> <span>搜索记录</span></span></a><br/>
                                        <a class="set_top update" href="admin/users/loginLog?uid=${userStat.uid}" style="color: #4f99c6; text-decoration: none;">
                                            <span class="blue"> <span>登陆日志</span></span></a><br/>
                                        <a class="set_top update" href="admin/bindPhone?uid=${userStat.uid}&phone=${userStat.phone}" style="color: #4f99c6; text-decoration: none;">
                                            <span class="blue"> <span>更改手机</span></span></a><br/>
                                        <c:if test="${!userStat.blackUid}">
                                            <a class="set_top update" href="admin/blackUser/add?blackAccount=${userStat.uid}" style="color: #4f99c6; text-decoration: none;">
                                            <span class="blue"> <span>拉黑</span></span></a><br/>
                                        </c:if>
                                        <c:if test="${userStat.blackUid}">
                                            <a class="set_top update" href="admin/blackUsers?uid=${userStat.uid}" style="color: #4f99c6; text-decoration: none;">
                                            <span class="blue"> <span>uid黑名单</span></span></a><br/>
                                        </c:if>
                                        <c:if test="${userStat.blackPhone}">
                                            <a class="set_top update" href="admin/blackUsers?uid=${userStat.phone}" style="color: #4f99c6; text-decoration: none;">
                                            <span class="blue"> <span>手机黑名单</span></span></a><br/>
                                        </c:if>
                                    </td>
                                </tr>
                        </tbody>
					</c:if>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
<link rel="stylesheet" href="assets/css/setting.css"/>
    <script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
    <script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>
</body>
<script>
$("#menu_stat").addClass('active open');//左侧导航栏选中状态
$("#submenu_stat_users").addClass('active');
if ($("#startTime").length > 0) {
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