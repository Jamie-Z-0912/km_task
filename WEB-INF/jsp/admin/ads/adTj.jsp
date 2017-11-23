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
			广告统计数据
            </h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
			    <form action="admin/ads/tj" method="get" id="basic_validate" name="basic_validate"
                                  class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                       <label class="control-label">广告id</label>
                       <div class="controls">
                           <input type="text" id="id" name="id" value="${id}"  />
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
                              <input type="text" id="endTime" data-oval=""  />
                              <input type="hidden" name="endTime" id="end_time_hidden" />
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
						    <th>广告标题</th>
							<th>日期</th>
							<th>uv</th>
							<th>pv</th>
                            <th>点击数</th>
                            <th>点击用户数</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${tjData}" var="tj" varStatus="st">
							<tr>
							    <td>
                                   <a href="${ad.originUrl}">${ad.title}</a>
                                </td>
								<td>${tj.date}</td>
								<td>${tj.uv}</td>
								<td>${tj.viewNum}</td>
								<td>${tj.click}</td>
								<td>${tj.clickUser}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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