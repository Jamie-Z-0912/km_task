<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../header.jsp"/>
<jsp:include page="../sidebar.jsp"/>
<!-- 页面 -->
<div id="main-content" class="clearfix">
    <div id="page-content" class="clearfix">
        <div class="page-header position-relative">
            <h1>新增广告</h1>
        </div>
        <div class="row-fluid">
            <div class="row-fluid">
                <form action="admin/ads/add" method="post" id="basic_validate" name="basic_validate"
                      class="form-horizontal" novalidate="novalidate">
                    <div class="control-group">
                        <label class="control-label">广告标题/热词(<font color="red">必填</font>)
                            <div class="controls">
                                <c:if test="${empty ad}">
                                    <textarea id="title" name="title" class="input-xlarge" style="height: 100px;"
                                              placeholder="热词可批量添加,以英文逗号分隔,一次最多50个"></textarea>
                                </c:if>
                                <c:if test="${not empty ad}">
                                    <textarea id="title" name="title" class="input-xlarge" style="height: 100px;"
                                              placeholder="${ad.title}"></textarea>
                                </c:if>
                            </div>
                    </div>

                    <div id="add_imgs" style="margin-bottom: 30px;" class="control-group">
                        <label class="control-label">图片</label>
                        <div class="controls zlappend">
                            <c:if test="${empty ad}">
                                <div class='table-pic' style="float: left;">
                                    <div class="table-picboxW">
                                        <div class='table-picbox'>
                                        <span><img src="assets/img/avatar.jpg!w160.jpg"
                                                   id="avatar" name="avatar" style="width: 130px;"/></span> <a
                                                href="javascript:;" class="table-picevent">点击上传
                                            <input type="file" name="file" class="js-files" id="file0" value="点击上传"/>
                                        </a>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${not empty ad}">
                                <c:forEach items="${ad.imagesList}" var="img" varStatus="st">
                                    <div class='table-pic' style="float: left;">
                                        <a href="javascript:void(0);" class="js-deltu"
                                           style="position: absolute;right:0;top:0;z-index:4;">删除</a>
                                        <div class="table-picboxW">
                                            <div class='table-picbox'>
                                            <span>
                                                    <img src="${img}" id="avatar" name="avatar" style="width: 130px;"/>
                                            </span>
                                                <a href="javascript:;" class="table-picevent">点击上传
                                                    <input type="file" name="file" class="js-files" id="file${st.index}"
                                                           value="点击上传"/>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <div class="table-pic"
                                 style="float: left;cursor: pointer; font-size: 80px;text-align: center; line-height: 130px; color: #888;"
                                 id="addTuPian">＋
                            </div>
                            <input type="hidden" name="images" id="topic_image" value=""/>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">广告来源</label>
                        <div class="controls">
                            <c:if test="${empty ad}">
                                <input type="text" id="source" name="source" class="input-xlarge" value=""/>
                            </c:if>
                            <c:if test="${not empty ad}">
                                <input type="text" id="source" name="source" class="input-xlarge" value="${ad.source}"/>
                            </c:if>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">广告布局</label>
                        <div class="controls">
                            <select name="layout" id="layout" style="width: 180px;">
                                <c:forEach items="${layouts}" var="layout" varStatus="st">
                                    <c:if test="${empty ad}">
                                        <option value="${layout.layout}">${layout.desc}</option>
                                    </c:if>
                                    <c:if test="${not empty ad}">
                                        <option value="${layout.layout}"
                                                <c:if test="${layout.layout == ad.layout}">selected</c:if>>${layout.desc}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">广告原始链接</label>
                        <div class="controls">
                            <script>
                                function convert() {
                                    var txt = $('#originUrl').val();
                                    var url = 'http://browser.kuaima.cn/tongji/2feedFirstAD.html?url=https://wap.sogou.com/web/sl?bid=sogou-mobb-b4892f808f9efbd5&keyword=';
                                    $('#originUrl').val(url + encodeURI(txt));
                                }
                            </script>
                            <c:if test="${empty ad}">
                                <input type="text" id="originUrl" name="originUrl" class="input-large"
                                       class="input-xxlarge"
                                       value=""/> <a id="sogouLink" href="javascript:convert()">转成sogou链接</a>
                            </c:if>
                            <c:if test="${not empty ad}">
                                <input type="text" id="originUrl" name="originUrl" class="input-xlarge"
                                       value="${ad.originUrl}"/>
                            </c:if>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">投放应用(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <select name="application" id="application" style="width: 180px;">
                                <option value="" <c:if test="${'' == application}">selected</c:if>>默认</option>
                                <c:forEach items="${applications}" var="app">
                                    <option value="${app}"
                                            <c:if test="${app == application}">selected</c:if>>${app.appName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">投放平台(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <select name="platform" id="platform" style="width: 180px;">
                                <c:forEach items="${platforms}" var="pt" varStatus="st">
                                    <c:if test="${empty ad}">
                                        <option value="${pt}"
                                                <c:if test="${pt == 'DEFAULT'}">selected</c:if>>${pt}</option>
                                    </c:if>
                                    <c:if test="${not empty ad}">
                                        <option value="${pt}"
                                                <c:if test="${pt == ad.platform}">selected</c:if>>${pt}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">广告标识(建议2个字)</label>
                        <div class="controls">
                            <c:if test="${empty ad}">
                                <input type="text" id="tips" name="tips" class="input-xlarge" value="广告"/>
                            </c:if>
                            <c:if test="${not empty ad}">
                                <input type="text" id="tips" name="tips" class="input-xlarge" value="${ad.tips}"/>
                            </c:if>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">投放位置(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <select name="adsLocation" id="adsLocation" style="width: 180px;">
                                <c:forEach items="${adsLocations}" var="adsLocation" varStatus="st">
                                    <c:if test="${empty ad}">
                                        <option value="${adsLocation.location}">${adsLocation.desc}</option>
                                    </c:if>
                                    <c:if test="${not empty ad}">
                                        <option value="${adsLocation.location}"
                                                <c:if test="${ad.adsLocation == adsLocation}">selected</c:if>>${adsLocation.desc}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="control-group" id="div_show_num">
                        <label class="control-label">展示次数/天</label>
                        <div class="controls">
                            <c:if test="${empty ad}">
                                <input type="number" id="showNum" name="showNum" class="input-xlarge" value="0"/>
                            </c:if>
                            <c:if test="${not empty ad}">
                                <input type="number" id="showNum" name="showNum" class="input-xlarge"
                                       value="${ad.showNum}"/>
                            </c:if>
                        </div>
                    </div>
                    <script type="text/javascript">
                        $('#adsLocation').on('change', function () {
                            var v = $(this).val();
                            if (v == 'timeline_first') {
                                $('#sogouLink').show();
                            } else {
                                $('#sogouLink').hide();
                                var url;
                                var txt = $('#originUrl').val();
                                switch (v) {
                                    case 'related_recom_first': //相关推荐第一位
                                        url = 'http://browser.kuaima.cn/tongji/2feedFirstAD.html?url=';
                                        $('#originUrl').val(url + encodeURI(txt));
                                        break;
                                    case 'checkin_alert': //签到弹窗
                                        url = 'http://browser.kuaima.cn/tongji/4qianDao.html?url=';
                                        $('#originUrl').val(url + encodeURI(txt));
                                        break;
                                    case 'km_zq_banner': //我的tab 的banner
                                        url = 'http://browser.kuaima.cn/tongji/3zhuanQian.html?url=';
                                        $('#originUrl').val(url + encodeURI(txt));
                                        break;
                                    case 'announcement': //小喇叭
                                        url = 'http://browser.kuaima.cn/tongji/6taskTrumpet1_3_0.html?url=';
                                        $('#originUrl').val(url + encodeURI(txt));
                                        break;
                                    case 'km_task_banner': //任务tab的banner
                                        url = 'http://browser.kuaima.cn/tongji/5taskBanner1_3_0.html?url=';
                                        $('#originUrl').val(url + encodeURI(txt));
                                        break;
                                    case 'task_tab_upper_right_icon': //任务tab的右上角
                                        url = 'http://browser.kuaima.cn/tongji/7taskTopRight1_3_0.html?url=';
                                        $('#originUrl').val(url + encodeURI(txt));
                                        break;
                                }
                            }
                        })
                    </script>

                    <div class="control-group">
                        <label class="control-label">登陆才能点击(<font color="red">必填</font>)</label>
                        <div class="controls">
                            <select name="needLogin" id="needLogin" style="width: 180px;">
                                <c:if test="${empty ad}">
                                    <option value="0" selected>否</option>
                                    <option value="1">是</option>
                                </c:if>
                                <c:if test="${not empty ad}">
                                    <option value="0" <c:if test="${!ad.needLogin}">selected</c:if>>否</option>
                                    <option value="1" <c:if test="${ad.needLogin}">selected</c:if>>是</option>
                                </c:if>
                            </select>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">开始时间(<font color="red">必填</font>)<br/>
                        </label>
                        <div class="controls">
                            <input type="text" id="startTime" data-oval="" class="start_time input-xlarge"/>
                            <c:if test="${empty ad}">
                                <input type="hidden" name="start_time" id="start_time_hidden"/>
                            </c:if>
                            <c:if test="${not empty ad}">
                                <input type="hidden" name="start_time" id="start_time_hidden" value="${ad.startTime}"/>
                            </c:if>
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label">结束时间(<font color="red">必填</font>)<br/>
                        </label>
                        <div class="controls">
                            <input type="text" id="endTime" data-oval="" class="start_time input-xlarge"/>.
                            <c:if test="${empty ad}">
                                <input type="hidden" name="end_time" id="end_time_hidden"/>
                            </c:if>
                            <c:if test="${not empty ad}">
                                <input type="hidden" name="end_time" id="end_time_hidden" value="${ad.endTime}"/>
                            </c:if>
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
<jsp:include page="../foot.jsp"/>
<link rel="stylesheet" href="assets/css/setting.css"/>
<script type="text/javascript" src="assets/js/setting.js"></script>
<script type="text/javascript" src="assets/js/setting_add_topic.js"></script>
<script type="text/javascript" src="assets/js/ajaxfileupload.js"></script>
</body>
<script>
    $(function () {
        checkDivShowNum();

        $("#adsLocation").change(function () {
            checkDivShowNum();
        });

    })

    function checkDivShowNum() {
        var checkValue = $("#adsLocation").val();
        if (checkValue == 'first_screen_assistant') {
            $("#div_show_num").show();
        } else {
            $("#div_show_num").hide();

        }
    }

    $("#menu_app").addClass('active open');
    $("#menu_ads").addClass('active');

    function cancel() {
        history.go(-1);
    }

    if ($("#startTime").length > 0) {
        $("#startTime").val(new Date().format("yyyy-MM-dd") + " 00:00:00");
        $("#endTime").val(new Date().format("yyyy-MM-dd") + " 23:59:59");
        gx();
        $("#startTime").slTime({
            callback: function () {
                gx();
            }
        });
        $("#endTime").slTime({
            callback: function () {
                gx();
            }
        });
    }

    function gx() {
        var start = new Date($("#startTime").val().replace(/-/g, "/")).getTime();
        var end = new Date($("#endTime").val().replace(/-/g, "/")).getTime();
        $("#start_time_hidden").val(start);
        $("#end_time_hidden").val(end);
    }
</script>
</html>