$(function(){
	/**
	 * 时间处理
	 */
	if($("#start_time").length > 0){
		/**
		 * 填充时间控件
		 */
		$("#start_time").slTime({
			callback:function(){
				 var startTime = $("#start_time").val();
				 var startTimeStr = startTime.replace(/-/g,"/");
				 startTime = new Date(new Date(startTimeStr).setSeconds(1));
				 $("#start_time").val(startTime.format("yyyy-MM-dd hh:mm:ss"));
				
				 var endTime = new Date (startTime.setDate(startTime.getDate()+1));
				 endTime = new Date(endTime.setHours(23, 59,59));
				 $("#stop_time").val(endTime.format("yyyy-MM-dd hh:mm:ss"));
			}
		});
		$("#stop_time").slTime({
			callback:function(){//时间控件回填时触发
				var endTime = $("#stop_time").val();
				var endTimeStr = endTime.replace(/-/g,"/");
				endTime = new Date(new Date(endTimeStr).setSeconds(59));
				$("#stop_time").val(endTime.format("yyyy-MM-dd hh:mm:ss"));
				checkTimeOK($("#start_time").val(),$("#stop_time").val());
			}
		});
	}
	
	var nowTime = new Date();
	$("#start_time").val(new Date(new Date($("#start_time").val()).setSeconds(1)).format("yyyy-MM-dd hh:mm:ss"));
	
	//if(gotoTypeEdit == "edit"){
		$("#stop_time").val(new Date($("#stop_time").val()).format("yyyy-MM-dd hh:mm:ss"));
//	}else{
//		$("#stop_time").val(new Date(new Date(nowTime.setDate(nowTime.getDate()+1)).setHours(23, 59,59)).format("yyyy-MM-dd hh:mm:ss"));
//	}
	
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

    	$("#form_content").val(content);
    	sumbitCheckValue();

	});
});

/**
 * 时间检查
 */
function checkTimeOK(startTime,endTime){
	var startTimeStr = startTime.replace(/-/g,"/");
	startTime=new Date(startTimeStr);
	 
	var endTimeStr = endTime.replace(/-/g,"/");
	endTime=new Date(endTimeStr);
	
	if(startTime > endTime){
		$("#stop_time").parents('.control-group').addClass('error');
		var label = $("<span/>").attr({"for":  "stop_time", generated: true}).addClass("help-inline").html("结束时间必须后于开始时间。");
		label.insertAfter($("#stop_time"));
		return false;
	}else{
		return true;
	}
}