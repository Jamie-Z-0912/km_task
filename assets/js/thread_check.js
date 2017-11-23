$(function(){
	//标签
	if(typeof(page) != "undefined" && page == "edit"){
		var temp = words.split(",");
		for(var i = 0 ;i < temp.length;i++){
			var nameSpan = "<div name='object_word' class='fll' style='display: block; margin:5px 5px;' value='" + temp[i] + "' ondblclick='delWord(this)'>" + temp[i] + "</div>";
			$("#wordShowDiv").append(nameSpan);
		}
	}
});

String.prototype.isEmpty = function() {
	var length = this.replace(/(^\s*)|(\s*$)/g, "").length;
	if(length==1&&this.charCodeAt(0)=='8203'){//处理 换行控制符
		length = 0;
	}
	return length == 0;
};

/**
 * 表单绑定
 */
$("#basic_validate").submit(function(){
	var $body = $($(ueditor.container).find("iframe")[0].contentWindow.document.body);
	$body = $body.clone();
	$body.find("object,audio,embed").each(function(index, obj) {
		$(obj).replaceWith(ObjReplacToSource($(obj)));
	});
	$body.find("a").attr("target", "_blank");
	var $todoInput = $body.find(".todoInput");
	for ( var i = 0; i < $todoInput.length; i++) {
		$($todoInput[i]).attr("todoValue",
				$todoInput.eq(i).val().replace(/"/g, "\""));
	}
	var content = $body.html();

	$("#addNoteArea").val(content);

});

//全选或全不选
function chkOption(type){
	$("input[name='chk_thread']").attr("checked",type);
}
//置顶
function toTop(threadId,value){
	if(threadId == -1){ //批量操作
		var threadIds = "";
		var length = $("input[name='chk_thread']:checked").length;
		for(var i = 0 ; i < length ;i ++){
			var chkObject = $("input[name='chk_thread']:checked")[i];
			var chkThreadId = $(chkObject).val();
			threadIds += chkThreadId + ",";
		}
		toOption(1,value,threadIds);
	}else{
		toOption(1,value,threadId);
	}
}
//加精
function toHighlight(threadId,value){
	if(threadId == -1){ //批量操作
		var threadIds = "";
		var length = $("input[name='chk_thread']:checked").length;
		for(var i = 0 ; i < length ;i ++){
			var chkObject = $("input[name='chk_thread']:checked")[i];
			var chkThreadId = $(chkObject).val();
			threadIds += chkThreadId + ",";
		}
		toOption(2,value,threadIds);
	}else{
		toOption(2,value,threadId);
	}
}
//处理非法帖子
function toIllThread(threadId,value){
	if(threadId == -1){ //批量操作
		var threadIds = "";
		var length = $("input[name='chk_thread']:checked").length;
		for(var i = 0 ; i < length ;i ++){
			var chkObject = $("input[name='chk_thread']:checked")[i];
			var chkThreadId = $(chkObject).val();
			threadIds += chkThreadId + ",";
		}
		toOption(3,value,threadIds);
	}else{
		toOption(3,value,threadId);
	}
}
//管理员删除的帖子  点击全部恢复   用户信息汇总页面 触发
function toVerifyNormalAll(threadId,value){
	chkOption(true);
	toVerify(-1,1);
}
//修改状态 审核 删除
function toVerify(threadId,value){
	if(threadId == -1){ //批量操作
		var threadIds = "";
		var length = $("input[name='chk_thread']:checked").length;
		for(var i = 0 ; i < length ;i ++){
			var chkObject = $("input[name='chk_thread']:checked")[i];
			var chkThreadId = $(chkObject).val();
			threadIds += chkThreadId + ",";
		}
		toOption(4,value,threadIds);
	}else{
		toOption(4,value,threadId);
	}
}
//彻底删除
function toDelete(threadId){
	if(threadId == -1){ //批量操作
		var threadIds = "";
		var length = $("input[name='chk_thread']:checked").length;
		for(var i = 0 ; i < length ;i ++){
			var chkObject = $("input[name='chk_thread']:checked")[i];
			var chkThreadId = $(chkObject).val();
			threadIds += chkThreadId + ",";
		}
		toOption(5,-1,threadIds);
	}else{
		toOption(5,-1,threadId);
	}
}
//运营管理
function toStamp(threadId,managerName){
	toOption(6,managerName,threadId);
}
//置顶、加精、删除
function toOption(type,value,threadId,illId){
	$.ajax({
		url:"thread_list",
    	type:'post',
    	data: {
    		threadId:threadId,
    		type:type,
    		value:value,
    		illId:illId
    	},
   	 	dataType:'text',
    	success:function(data){
	    	document.location.reload();
    	},
    	error:function(){ 
    	}
	});
}

/**
 * 修改热门值
 * @param threadIds
 * @param uids
 * @param hotDegreePlus
 */
function updateThreadHot(threadIds, hotDegreePlus) {
	$.ajax({
		url:"../admin/thread_hot",
		type:'post',
		data:{
			threadIds  	  	: threadIds,
			hotDegreePlus 	: hotDegreePlus
		},
		dataType:'text',
		success:function(data) {
			var operate = hotDegreePlus>0?"加热":"沉帖";
			if(data) {
				alert(operate + "成功，进入热门队列。");
			}
			else {
				alert(operate + "失败，请稍后重试！");
			}
			// 操作完成后刷新页面，显示更新后的列表。
			window.location.reload();
		},
		error:function() {
			alert("操作失败，请稍后重试！");
		}
	});
}

/**
 * 帖子页面加载完成后 获取帖子的 量话 统计数据
 * 包括展示量 点击量 点击率
 */
function getThreadReports() {
	// 获取当前页面以,分隔的帖子ID字串，截取成数组。
	var threadIds = $("#threadIds").val();
	threadIds = threadIds.substring(1, threadIds.length);
	// 全局setTimeout方法句柄，在请求数据重试成功之后，清除之。
	var timeOut;
	$.ajax({
		url:"../admin/thread_stats",
		type:'post',
		data:{
			dataType:2,			// 统计数据类型，1：美妞帖子，2：炫美帖子。
			threadIds:threadIds
		},
		dataType:'text',
		success:function(data) {
			timeOut = null;
			if(data == null || data == "") {	// 如果统计数据为空，则不尝试转为JSONArray
				return;
			}
			// 统计结果以JSON数组输出，循环数组绑定相关数据。
			var jsonArray = eval("(" + data + ")");
			var length = jsonArray.length;
			for(var i = 0;i < length;i++) {
				var jsonMeta = jsonArray[i];
				var threadId = jsonMeta.thread_id;
				$("#total_view_count_" + threadId).html(jsonMeta.total_view_count);
				$("#total_click_count_" + threadId).html(jsonMeta.total_click_count);
				$("#click_percent_" + threadId).html(jsonMeta.click_percent + "%");
			}
		},
		error:function() {
			timeOut = setTimeout("getThreadTotal()", 5000);
		}
	});
}

