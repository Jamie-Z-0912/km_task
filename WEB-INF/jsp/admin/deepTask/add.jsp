<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="suishen_fmt" uri="suishen.libs/fmt" %>
<jsp:include page="../header_v2.jsp"/>
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {ace.settings.check('main-container', 'fixed')} catch (e) {}
    </script>
    <jsp:include page="../sidebar_v2.jsp"/>
    <!-- 页面 -->
    <div class="main-content">
        <!-- here area:basics/content.breadcrumbs -->
        <div id="page-content" class="page-content">
            <div class="page-content-area">
                <div class="page-header">
                    <h1>创建任务</h1>
                </div>
                <div class="row">
                    <div class="col-xs-11">
                        <!-- PAGE CONTENT BEGINS -->
                        <form action="admin/deepTask/add" class="form-horizontal" id="myform" role="form" method="post">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">任务名称</label>
                                <div class="col-sm-10 pl0">
                                    <input name="name" id="name" type="text"
                                           <c:if test="${not empty deepTask}">value="${deepTask.name}" </c:if> class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">任务单价</label>
                                <div class="col-sm-4 pl0">
                                    <input name="rewardCoin" id="rewardCoin" type="text" placeholder="单位：金币"
                                           <c:if test="${not empty deepTask}">value="${deepTask.rewardCoin}" </c:if> class="form-control">
                                </div>
                                <label class="col-sm-2 control-label">投放数量</label>
                                <div class="col-sm-4 pl0">
                                    <input name="totalNum" id="totalNum" type="text"
                                           <c:if test="${not empty deepTask}">value="${deepTask.totalNum}" </c:if> class="form-control">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">任务类型</label>
                                <div class="col-sm-4 pl0">
                                    <select name="catName" id="catName" style="width: 180px;">
                                        <c:forEach items="${cats}" var="cat" varStatus="st">
                                            <option value="${cat.name}"
                                            <c:if test="${cat.name == deepTask.catName}">selected</c:if>>${cat.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <label class="col-sm-2 control-label">投放平台</label>
                                <div class="col-sm-4 pl0">
                                    <select name="platform" id="platform" style="width: 180px;">
                                        <c:forEach items="${platforms}" var="pt" varStatus="st">
                                            <option value="${pt}" <c:if test="${pt == deepTask.platform}">selected</c:if> >${pt}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">发布账号</label>
                                <div class="col-sm-4 pl0">
                                    <select name="publisher_nick" id="publisher" style="width: 180px;">
                                        <c:forEach items="${publishers}" var="publisher" varStatus="st">
                                            <option value="${publisher.publisherNick}">${publisher.publisherNick}</option>
                                        </c:forEach>
                                    </select>
                                    <input type="hidden" name="publisher_avatar">
                                    <div class="avatar" id="pubIMgs">
                                        <c:forEach items="${publishers}" var="publisher" varStatus="st">
                                            <img src="${publisher.publisherAvatar}" <c:if test="${st.first}">style="display:block" </c:if> />
                                        </c:forEach>
                                    </div>
                                </div>
                                <label class="col-sm-2 control-label">是否置顶</label>

                                <div class="col-sm-4 pl0">
                                    <select name="rank" id="rank" style="width: 180px;">
                                        <option value="0" <c:if test="${0 == deepTask.rank}">selected</c:if>>否</option>
                                        <option value="1" <c:if test="${1 == deepTask.rank}">selected</c:if>>是</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">任务描述</label>
                                <div class="col-sm-10 pl0">
                                    <textarea name="description" id="description" cols="30" rows="3" class="form-control"><c:if test="${not empty deepTask.msg}">${deepTask.msg}</c:if>
                                    </textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">开始时间</label>
                                <div class="col-sm-4 pl0">
                                    <input type="text" id="start_time" data-date-format="yyyy-mm-dd hh:ii:ss">
                                    <!-- 用于提交表单 -->
                                    <input type="hidden" id="startTime" name="startTime">
                                </div>

                                <label class="col-sm-2 control-label">结束时间</label>
                                <div class="col-sm-4 pl0">
                                    <input type="text" id="end_time" data-date-format="yyyy-mm-dd hh:ii:ss"/>
                                    <!-- 用于提交表单 -->
                                    <input type="hidden" id="endTime" name="endTime">
                                </div>
                            </div>
                            <h4 class="header smaller col-xs-12">
                                <span class="col-xs-8">任务步骤</span>
                                <span class="col-xs-4">
                                    <a href="javascript:;" class="btn btn-sm btn-info pull-right" id="addStep">添加步骤</a>
                                </span>
                            </h4>

                            <div id="stepWrap">
                                <div class="row">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label name">步骤一</label>
                                        <div class="col-sm-10 pl0">
                                            <textarea cols="30" rows="2" class="form-control step_desc"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">附链接</label>
                                        <div class="col-sm-10 pl0">
                                            <input class="form-control step_url">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">附图</label>
                                        <div class="pictures">
                                            <input type="hidden" class="step_img">
                                            <div class="col-sm-2 js-file pl0">
                                                <input class="js-file-input" type="file"/>
                                            </div>
                                            <div class="col-sm-2 js-addimg pl0">
                                                <div class="ace-file-input ace-file-multiple">
                                                    <span class="ace-file-container" data-title="添加图片">
                                                        <span class="ace-file-name">
                                                        <i class="ace-icon glyphicon glyphicon-plus"></i>
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <h4 class="header smaller col-xs-12">
                                <span class="col-xs-8">提交条件</span>
                                <span class="col-xs-4">
                                    <a href="javascript:;" class="btn btn-sm btn-info pull-right" id="addFactor">添加条件</a>
                                </span>
                            </h4>
                            <div id="factorWrap">
                                <div class="row">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label name">条件一</label>
                                        <div class="col-sm-3 pl0">
                                            <select style="width: 180px;" class="fac_rule">
                                                <option value="">无(格式校验)</option>
                                                <c:forEach items="${rules}" var="rule" varStatus="st">
                                                    <option value="${rule.code}">${rule.desc}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col-sm-5 pl0">
                                            <input class="form-control fac_desc" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <h4 class="header smaller col-xs-12">
                                <span class="col-xs-8">示例图</span>
                            </h4>
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label"> </label>
                                    <div class="pictures">
                                        <input type="hidden" id="example_img">
                                        <div class="col-sm-2 js-file pl0">
                                            <input class="js-file-input" type="file"/>
                                        </div>
                                        <div class="col-sm-2 js-addimg pl0">
                                            <div class="ace-file-input ace-file-multiple">
                                                <span class="ace-file-container" data-title="添加图片">
                                                    <span class="ace-file-name">
                                                    <i class="ace-icon glyphicon glyphicon-plus"></i>
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="finishSteps">
                            <input type="hidden" name="commitInfo">
                            <input type="hidden" name="examplePhoto">
                            <div class="clearfix form-actions">
                                <div class="col-md-offset-3 col-md-9">
                                    <button class="btn btn-info" id="submitForm" type="button">
                                        <i class="ace-icon fa fa-check bigger-110"></i> 提交
                                    </button>
                                    &nbsp; &nbsp; &nbsp;
                                    <button class="btn" type="reset">
                                        <i class="ace-icon fa fa-undo bigger-110"></i> 重填
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="popover-mask"></div>
<jsp:include page="../foot_v2.jsp"/>
<script>
    $("#menu_deeptask").addClass('active open');
    $("#deeptask_list").addClass('active');
</script>
<script src="assets_v2/js/add_picture.js"></script>
<script>
    $(function () {
        var time_opts = {
            showSecond: true,
            timeFormat: 'hh:mm:ss'
       }
        $('#start_time,#end_time').datetimepicker(time_opts);
        $('#start_time').on('change', function (ev, val) {
            var _day = this.value;
            $('#startTime').val(new Date(_day).getTime());
            $('#end_time').datetimepicker('setDate', _day);
            $('#end_time').datetimepicker({
                minDate: 0
            });
        });
        $('#end_time').on('change', function (ev) {
            var _day = this.value;
            $('#endTime').val(new Date(_day).getTime());
        });
        /*时间 end*/
        var step = $('#stepWrap .row').clone();
        var factor = $('#factorWrap .row').clone();
        var numString = ['', '一', '二', '三', '四', '五', '六', '七', '八', '九', '十'];
        var el = '.js-file-input';
        var file_opt = {
            style: 'well',
            btn_choose: '选择图片',
            no_icon: 'fa fa-picture-o',
            allowExt: ["jpeg", "jpg", "png", "gif", "bmp"],
            allowMime: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"],
            btn_change: null,
            thumbnail: 'fit',
            preview_error: function (filename, error_code) {
            }
        };
        new upload(el, file_opt, 3, function (d) {
            console.log(d);
        });
        $('#addStep').on('click', function () {
            var len = $('#stepWrap .row').length;
            if (len == 10) {
                $.gritter.add({
                    text: '最多添加十个步骤',
                    class_name: 'gritter-error gritter-center gritter-light',
                    time: '1000'
                });
                return;
            }
            var has_val = $('#stepWrap .row').eq(len - 1).find('textarea').val();
            if ($.trim(has_val) == '') {
                $.gritter.add({
                    text: '第' + len + '步骤还未填写',
                    class_name: 'gritter-error gritter-center gritter-light',
                    time: '1000'
                });
            }else{
                var _new = step.clone();
                _new.find('.name').text('步骤' + numString[len + 1]);
                $('#stepWrap').append(_new);
                $(el).ace_file_input(file_opt);
            }
        })
        $('#addFactor').on('click', function () {
            var len = $('#factorWrap .row').length;
            if (len == 10) {
                $.gritter.add({
                    text: '最多添加十个条件',
                    class_name: 'gritter-error gritter-center gritter-light',
                    time: '1000'
                });
                return;
            }
            var has_val = $('#factorWrap .row').eq(len - 1).find('.fac_desc').val();
            if ($.trim(has_val) == '') {
                $.gritter.add({
                    text: '第' + len + '条件还未填写',
                    class_name: 'gritter-error gritter-center gritter-light',
                    time: '1000'
                });
            } else {
                var _new = factor.clone();
                _new.find('.name').text('条件' + numString[len + 1]);
                $('#factorWrap').append(_new);
            }
        });
        /*步骤和条件 end*/
        $('#publisher').on('change', function(e){
            var i = $(this).children('option:selected').index();
            $('#pubIMgs img').eq(i).show().siblings().hide();
            $('input[name="publisher_avatar"]').val($('#pubIMgs img').eq(i).attr('src'))
        });
        $('.fac_rule').on('change', function(){
            var _self = $(this),
                $par = $(this).parents('.form-group');
            $par.find('.fac_desc').val(_self.find("option:selected").text());
        })
        function isEmpty(val,txt){
            if($.trim(val) == ''){
                $.gritter.add({
                    text: txt+'不能为空',
                    class_name: 'gritter-error gritter-center gritter-light',
                    time: '1300'
                });
                return true;
            }else{
                return false;
            }
        }
        /*发布账号 end*/
        $('#submitForm').on('click', function(){
            if (isEmpty($('#name').val(),'任务名称')) return;
            if (isEmpty($('#rewardCoin').val(),'任务单价')) return;
            if (isEmpty($('#totalNum').val(),'任务数量')) return;
            if (isEmpty($('#description').val(),'任务描述')) return;
            if (isEmpty($('#startTime').val(),'开始时间')) return;
            if (isEmpty($('#endTime').val(),'结束时间')) return;

            var facArr=[], stepArr=[];
            $('#factorWrap .row').each(function(){
                var _self = $(this);
                var obj = {
                    rule: _self.find('.fac_rule').val(),
                    desc: _self.find('.fac_desc').val()
                };
                facArr.push(obj);
            });
            $('#stepWrap .row').each(function(){
                var _self = $(this),
                    step_img = _self.find('.step_img').val(),
                    step_url = _self.find('.step_url').val();
                var obj = {
                    imgs: step_img==''?[]:step_img.split(','),
                    urls: step_url==''?[]:step_url.split(','),
                    desc: _self.find('.step_desc').val()
                };
                stepArr.push(obj);
            });
            $('input[name="finishSteps"]').val(JSON.stringify(stepArr));
            $('input[name="commitInfo"]').val(JSON.stringify(facArr));
            var exa_img = $('#example_img').val();
            $('input[name="examplePhoto"]').val(JSON.stringify(exa_img==''?[]:exa_img.split(',')));
            $('#myform').submit();
        })
    });

</script>
</body>
</html>