<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" 
            + request.getServerName() + ":" + request.getServerPort() + path + "/";
    WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext((request).getSession().getServletContext());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh_CN">
<head>
    <base href="<%=basePath%>" />
    <meta http-equiv="Cache-Control" content="max-age=7200" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title>快马后台管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <link rel="stylesheet" href="assets_v2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets_v2/css/font-awesome.min.css" />
    <!-- page specific plugin styles -->
    <!-- <link rel="stylesheet" href="assets_v2/css/jquery-ui.custom.min.css" /> -->
    <link rel="stylesheet" href="assets_v2/css/jquery-ui.min.css" />
    <link rel="stylesheet" href="assets_v2/css/jquery.gritter.css" />
    <link rel="stylesheet" href="assets_v2/css/chosen.css" />
    <link rel="stylesheet" href="assets_v2/css/datepicker.css" />
    <link rel="stylesheet" href="assets_v2/css/bootstrap-timepicker.css" />
    <link rel="stylesheet" href="assets_v2/css/daterangepicker.css" />
    <link rel="stylesheet" href="assets_v2/css/bootstrap-datetimepicker.min.css" />
    <link rel="stylesheet" href="assets_v2/css/ace-fonts.css" />
    <link rel="stylesheet" href="assets_v2/css/ace.min.css" />

    <!--[if lte IE 9]>
        <link rel="stylesheet" href="assets_v2/css/ace-part2.min.css" />
    <![endif]-->

    <link rel="stylesheet" href="assets_v2/css/ace-skins.min.css" />
    <link rel="stylesheet" href="assets_v2/css/ace-rtl.min.css" />
    <!--[if lte IE 9]>
      <link rel="stylesheet" href="assets_v2/css/ace-ie.min.css" />
    <![endif]-->
    <link rel="stylesheet" href="assets_v2/css/mymain.css" />
    <!-- inline styles related to this page -->
    <!-- ace settings handler -->
    <script src="assets_v2/js/ace-extra.min.js"></script>

    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->
    <!--[if lte IE 8]>
    <script src="assets_v2/js/html5shiv.min.js"></script>
    <script src="assets_v2/js/respond.min.js"></script>
    <![endif]-->
</head>
<body class="no-skin">
    <div id="navbar" class="navbar navbar-default">
        <script type="text/javascript">
            try{ace.settings.check('navbar' , 'fixed')}catch(e){}
        </script>

        <div class="navbar-container" id="navbar-container">
            <!-- #section:basics/sidebar.mobile.toggle -->
            <!-- <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler">
                <span class="sr-only">Toggle sidebar</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button> -->
            <!-- /section:basics/sidebar.mobile.toggle -->
            <div class="navbar-header pull-left">
                <a class="navbar-brand" href="#"> 
                    <small> <i class="fa fa-leaf"></i>快马-后台管理 </small>
                </a>
            </div>
            <div class="navbar-buttons navbar-header pull-right" role="navigation">
                <ul class="nav acr-nav">
                    <li class="light-blue">
                        <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                            <img class="nav-user-photo" src="assets_v2/avatars/user.jpg" />
                            <span class="user-info">
                                <small>Welcome,</small> ${__LOGINUSER.nickName} 
                            </span>
                            <i class="ace-icon fa fa-caret-down"></i>
                        </a>
                        <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                            <li>
                                <a href="admin/logout">
                                    <i class="ace-icon fa fa-power-off"></i>登出
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>