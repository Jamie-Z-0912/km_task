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
			<h1>更新系统配置</h1>
		</div>
		<div class="row-fluid">
			<div class="row-fluid">
                <form action="admin/systemSetting/update" method="post" id="basic_validate" name="basic_validate"
                                  class="form-horizontal" novalidate="novalidate">
                    <input type="hidden" id="id" name="id" value="${config.id}" />
                    <input type="hidden" id="addedTime" name="addedTime" value="${config.addedTime}" />

                    <div class="control-group">
                        <label class="control-label">配置项名称</label>
                        <div class="controls">
                            <input type="text" id="name" name="name" class="input-xlarge" value="${config.name}"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">配置值</label>
                        <div class="controls">
                            <textarea id="value" name="value" class="input-xlarge" style="height: 100px;" value="${config.value}">${config.value}</textarea>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">配置描述</label>
                        <div class="controls">
                            <input type="text" id="desc" name="desc" value="${config.desc}" class="input-xxlarge" maxlength="80"/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">所属模块</label>
                        <div class="controls">
                            <input type="text" id="module" name="module" value="${config.module}" class="input-xxlarge" maxlength="80"/>
                        </div>
                    </div>
                    <div class="form-actions">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok"></i> 保存
                        </button>
                        <button class="btn" type="reset" onclick="cancel();">
                            <i class="icon-undo"></i> 取消
                        </button>
                    </div>
                </form>
			</div>
			</div>
		</div>
	</div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot.jsp" />
</body>
<script>
$("#menu_config").addClass('active');
function cancel() {
        location.reload();
    }
</script>
</html>