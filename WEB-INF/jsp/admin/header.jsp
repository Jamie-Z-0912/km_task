<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page language="java" import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" import="org.springframework.web.context.support.WebApplicationContextUtils"%>

<%
    String path = request.getContextPath();

    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext((request).getSession().getServletContext());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh_CN">
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Cache-Control" content="max-age=7200" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>快马</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="assets/css/bootstrap.min.css?v=20130718" />
    <link rel="stylesheet"
          href="assets/css/bootstrap-responsive.min.css?v=20130718" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css?v=20130718" />
    <link rel="stylesheet" href="assets/css/datepicker.css?v=20130718" />
    <link rel="stylesheet"
          href="assets/css/bootstrap-timepicker.css?v=20130718" />
    <link rel="stylesheet" href="assets/css/daterangepicker.css?v=20130718" />
    <link rel="stylesheet" href="assets/css/colorpicker.css?v=20130718" />
    <link rel="stylesheet" href="assets/css/ace.min.css?v=20130718" />
    <link rel="stylesheet"
          href="assets/css/ace-responsive.min.css?v=20130718" />
    <link rel="stylesheet" href="assets/css/ace-skins.min.css?v=20130718" />
    <link rel="stylesheet" href="assets/css/cs4300.css?v=20130718" />

    <link rel="stylesheet" href="assets/css/chosen.css?v=20131028" />
    <link rel="stylesheet" href="assets/css/ace.min.css?v=20131028" />
    <link rel="stylesheet" href="assets/css/wnl.css" />
    <link rel="stylesheet" href="assets/css/jquery-ui.min.css" />
    <link rel="stylesheet" href="assets/css/jquery.datetimepicker.css" />


    <!-- <script type="text/javascript" src="http://static.etouch.cn/apis/domain_settting.js"></script> -->
    <script type="text/javascript" src="assets/js/jquery.min.js?v=20130718"></script>
    <script type="text/javascript" src="assets/js/sl-time.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap-timepicker.min.js"></script>
    <script type="text/javascript" src="assets/js/jquery.datetimepicker.js"></script>
    <script type="text/javascript" src="layer/layer.js"></script>
    <script type="text/javascript" src="assets/js/jquery.form.js"></script>
</head>
<body>
	<div class="navbar navbar-inverse">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="brand" href="#"> <small> <i class="icon-leaf"></i> 快马-后台管理
				</small>
				</a>
				<ul class="nav ace-nav pull-right">
					<li class="light-blue user-profile"><a class="user-menu dropdown-toggle" href="#"
						data-toggle="dropdown"> <img alt="Jason's Photo" src="assets/avatars/avatar.png"
							width="36px" height="36px" class="nav-user-photo"> <span id="user_info"> <small>Welcome,</small>
								${__LOGINUSER.nickName}
						</span> <i class="icon-caret-down"></i>
					</a>
						<ul id="user_menu"
							class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
							<li><a href="admin/logout"><i class="icon-off"></i> 登出</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</div>