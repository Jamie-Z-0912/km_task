//===================全局js 
/**
 * 标签添加 
 */
function addWord(){
	var wordValue = $("#select_word").find("option:selected").val();
	var wordHtml = $("#select_word").find("option:selected").html();
	var nameSpan = "<div name='object_word' class='fll' style='display: block; margin:5px 5px;' value='" + wordValue + "' ondblclick='delWord(this)'>" + wordHtml + "</div>";
	$("#wordShowDiv").append(nameSpan);
	if($("#words").val() == ","){
		$("#words").val($("#words").val() + wordValue );
	}else{
		$("#words").val($("#words").val() + "," + wordValue );
	}
		
}
/**
 * 标签删除
 * @param obj
 */
function delWord(obj){
	var words = $("div[name='object_word']");
	$("#wordShowDiv").empty();
	$("#words").val("");
	for(var i = 0; i < words.length  ; i ++){
		if($(obj).text() != $(words[i]).text()){
			$("#wordShowDiv").append(words[i]);
			$("#words").val($("#words").val() + "," + $(words[i]).attr("value"));
		}
	}
}

//全选或全不选
function chkOption(type){
	$("input[name='chk_thread']").attr("checked",type);
}

/**
 * 帖子类型切换
 * @param threadType
 */
function checkThreadType(threadType){
	if(threadType == 'PHOTO') { //PHOTO, AUDIO, VIDEO
		$("#div_text").show();
		$("#add_url").css("display","none");
		$("#add_audio").css("display","none");
		$("#add_video").css("display","none");
		$("#div_details").css("display","none");
		$("#div_stext").css("display","none");
	} else if(threadType == 'AUDIO'){
		$("#add_audio").show();
		$("#div_text").show();
		$("#div_details").css("display","none");
		$("#add_url").css("display","none");
		$("#add_video").css("display","none");
		$("#div_stext").css("display","none");
	} else if(threadType == 'VIDEO'){
		$("#add_video").show();
		$("#div_text").show();
		$("#add_url").css("display","none");
		$("#div_details").css("display","none");
		$("#add_audio").css("display","none");
		$("#div_stext").css("display","none");
	} else if(threadType == 'URL'){
		$("#add_url").show();
		$("#add_audio").css("display","none");
		$("#add_video").css("display","none");
		$("#div_text").css("display","none");
		$("#div_details").css("display","none");
		$("#div_stext").css("display","none");
	} else if(threadType == 'TASK'){
		$("#add_url").show();
		$("#add_audio").css("display","none");
		$("#add_video").css("display","none");
		$("#div_stext").css("display","none");
		$("#div_text").css("display","none");
		$("#div_details").css("display","none");
		$("#content_type").val(3);
	}else if(threadType == 'RTEXT'){
		$("#div_details").show();
		$("#add_audio").css("display","none");
		$("#add_video").css("display","none");
		$("#div_text").css("display","none");
		$("#add_url").css("display","none");
		$(".edui-editor-iframeholder").css("width","540px");
	}else if(threadType == 'VOTE'){
		$("#div_vote").show();
		$("#div_text").show();
		$("#div_details").css("display","none");
		$("#add_audio").css("display","none");
		$("#add_video").css("display","none");
		$("#add_url").css("display","none");
	}
}

function voteChange(obj){
	if($(obj).attr("checked")){
		$("#description_"+$(obj).val()).attr("readonly",false);
	}else{
		$("#description_"+$(obj).val()).attr("readonly",true);
	}
}

/**
 * 时间处理
 * @param date
 * @param pattern
 * @returns
 */
function getFormatDate(date, pattern) {
    if (date == undefined) {
        date = new Date();
    }
    if (pattern == undefined) {
        pattern = "yyyy-MM-dd hh:mm:ss";
    }
    return date.format(pattern);
}

Date.prototype.format = function (format) {
    var o = {
        "M+": this.getMonth() + 1,
        "d+": this.getDate(),
        "h+": this.getHours(),
        "m+": this.getMinutes(),
        "s+": this.getSeconds(),
        "q+": Math.floor((this.getMonth() + 3) / 3),
        "S": this.getMilliseconds()
    };
    if (/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }
    for (var k in o) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return format;
};

/**
 * 列表页面查询 div 收缩
 */
function showSearch(){
	if($("#search_condition").css("display") == 'none'){
		$("#search_condition").show();
	}else{
		$("#search_condition").hide();
	}
}

