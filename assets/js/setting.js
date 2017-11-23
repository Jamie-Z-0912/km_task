	//网站路径的变量
	var authData = null;
	
	var imgLoadFinish = true;
	function upfileBind(upfile){
		if(window.attachEvent){
			upfile.onpropertychange=function(){
				updateCommon(upfile);
			};
		}else{  
		   	upfile.onchange=function(){
		   		updateCommon(upfile);
		   	};
		}
		function updateCommon(upfile){
			if(upfile.value!=""&&checkImg(upfile)&&imgLoadFinish){
				imgLoadFinish = false;
				if(authData==null){
					getAuth(false,function(d){
						authData = d;
						updateAvatar(authData,upfile);
					},"");
				}else{
					if((authData.expire_at-10)*1000<=new Date().getTime()){//10秒的误差
						getAuth(false,function(d){
							authData = d;
							updateAvatar(authData,upfile);
						},"");
					}else{
						updateAvatar(authData,upfile);
					}
				}
			}
		}
		
		function checkImg(upfile){
			var filePath = upfile.value;
			
			//检查文件格式
			//Get a file extension
			var imgFormat = filePath.substr(filePath.lastIndexOf('.')).toLowerCase();
			//Check extension to image types.
			var imgFNumb = '.gif,.jpg,.png,.jpeg,.ico,'.indexOf(imgFormat+',');
			if( imgFNumb<= -1){
				alert("文件类型不对(现在支持的图片文件类型有：gif,jpg,png,jpeg,ico)");
				return false;
			}
			/******************************************************************/
			//var maxsize = 5*1024;
			var maxsize = 500;
			
			if(window.attachEvent){
				//IE TODO: IE check file szie;
			}else{
				var file=upfile.files[0];
				if((file.size/1024)>maxsize){
					alert("不能上传大于500KB的图片");
				    return false;
				}
			}
		    return true;
		}
	}
	
//	function updateAvatar(date){
//		$(".table-picbox img").css("width","auto");
//		$("#cover_table img").attr("src","http://admin.meili.suishenyun.cn/meili_admin/manager/img/load-24.gif");
//		var data = date.data.IMAGE;
//		$.ajaxFileUpload({
//            url:'http://v0.api.upyun.com/'+date.data.IMAGE.path+'/',//处理图片脚本
//            secureuri :false,
//            fileElementId :'file',//file控件id
//            dataType: 'jsonp',
//			jsonp: "callback",
//			jsonpCallback:"flightHandler",
//            data:data,
//            success: function (data, status){
//            	console.log(data);
//            	//服务器成功响应处理函数
//            	function flightHandler(data){
//	            	var file = document.getElementById("file");
//	        		$(file).unbind();
//	            	upfileBind(file);
//	
//	            	imgLoadFinish = true;
//	            	var img = new Image();
//	                if ($.browser.msie) {
//	                    img.onreadystatechange = function() {
//	                        if (img.readyState == "complete" || img.readyState == "loaded") {
//	                        	$(".zlappend").prepend("<div class='table-pic' ondblclick='aa(this)' style='float:left;'>" +
//	                        			"<div class='table-picboxW'>" +
//	                        			"<div class='table-picbox'>" +
//	                        			"<span><img  src='"+data.data.url+"' /></span>" +
//	                        					"<input type='hidden' name='images' value='" +data.data.url+ "' />" +
//	                        					"<input type='hidden' name='w' value='" +data.data.w+ "' />" +
//	                        					"<input type='hidden' name='h' value='" +data.data.h+ "' />" +
//	                        							"<a href='javascript:;' onclick='setCover(this);return false;' class='table-picevent'>设为封面</a>" +
//	                        							"</div>" +
//	                        							"</div>" +
//	                        							"</div>");
//	                        	$("#cover_table img").attr("src","http://admin.meili.suishenyun.cn/meili_admin/manager/img/avatar.jpg!w160.jpg");
//	                        }
//	                    };
//	                } else {
//	                    img.onload = function() {
//	                        if (img.complete) {
//	                        	$(".zlappend").prepend("<div class='table-pic' ondblclick='aa(this)' style='float:left;'>" +
//	                        			"<div class='table-picboxW'>" +
//	                        			"<div class='table-picbox'>" +
//	                        			"<span><img  src='"+data.data.url+"' /></span>" +
//	                        					"<input type='hidden' name='images' value='" +data.data.url+ "' />" +
//	                        					"<input type='hidden' name='w' value='" +data.data.w+ "' />" +
//	                        					"<input type='hidden' name='h' value='" +data.data.h+ "' />" +
//	                        							"<a href='javascript:;' onclick='setCover(this);return false;' class='table-picevent'>设为封面</a>" +
//	                        							"</div>" +
//	                        							"</div>" +
//	                        							"</div>");
//	                        	$("#cover_table img").attr("src","http://admin.meili.suishenyun.cn/meili_admin/manager/img/avatar.jpg!w160.jpg");
//	                        }
//	                    };
//	                }
//	                img.src = data.data.url;
//            	}
//            	eval("("+data+")");
//            },
//            error: function (data1, status, e)//服务器响应失败处理函数
//            {
//            	imgLoadFinish = true;
//            }
//		});
//		
//	}
	
	function updateAvatar(date,upfile){
		$(".table-picbox img").css("width","auto");
		$("#cover_table img").attr("src","http://admin.meili.suishenyun.cn/meili_admin/manager/img/load-24.gif");
		var data = date.data.IMAGE;
		var fileIdName = upfile.id;
		$.ajaxFileUpload({
            url:'http://v0.api.upyun.com/'+date.data.IMAGE.path+'/',//处理图片脚本
            secureuri :false,
            fileElementId :fileIdName,//file控件id
            dataType: 'jsonp',
			jsonp: "callback",
			jsonpCallback:"flightHandler",
            data:data,
            success: function (data, status){
            	console.log(data);
            	//服务器成功响应处理函数
            	function flightHandler(data){
	            	var file = document.getElementById(fileIdName);
	        		$(file).unbind();
	            	upfileBind(file);
					var sysBefore = $(file).parents(".control-group").find(".sysBefore");
					var status = $(file).parents(".control-group").find(".avatar_status").val();
					var setCoverStr = "";
					if (status == "1") {
						setCoverStr = "<a href='javascript:;' onclick='setCover(this);return false;' class='table-picevent'>设为封面</a>";
					}

	            	imgLoadFinish = true;
	            	var img = new Image();
	                if ($.browser.msie) {
	                    img.onreadystatechange = function() {
	                        if (img.readyState == "complete" || img.readyState == "loaded") {

	                        	$(sysBefore).before("<div class='table-pic' ondblclick='aa(this)' style='float:left;'>" +
	                        			"<div class='table-picboxW'>" +
	                        			"<div class='table-picbox'>" +
	                        			"<span><img  src='"+data.data.url+"' /></span>" +
	                        					"<input type='hidden' name='images' value='" +data.data.url+ "' />" +
	                        					"<input type='hidden' name='w' value='" +data.data.w+ "' />" +
	                        					"<input type='hidden' name='h' value='" +data.data.h+ "' />" +
														setCoverStr +
	                        							"</div>" +
	                        							"</div>" +
	                        							"</div>");
	                        	$("#cover_table img").attr("src","http://admin.meili.suishenyun.cn/meili_admin/manager/img/avatar.jpg!w160.jpg");
	                        }
	                    };
	                } else {
	                    img.onload = function() {
	                        if (img.complete) {
	                        	$(sysBefore).before("<div class='table-pic' ondblclick='aa(this)' style='float:left;'>" +
	                        			"<div class='table-picboxW'>" +
	                        			"<div class='table-picbox'>" +
	                        			"<span><img  src='"+data.data.url+"' /></span>" +
	                        					"<input type='hidden' name='images' value='" +data.data.url+ "' />" +
	                        					"<input type='hidden' name='w' value='" +data.data.w+ "' />" +
	                        					"<input type='hidden' name='h' value='" +data.data.h+ "' />" +
									 					setCoverStr +
	                        							"</div>" +
	                        							"</div>" +
	                        							"</div>");
	                        	$("#cover_table img").attr("src","http://admin.meili.suishenyun.cn/meili_admin/manager/img/avatar.jpg!w160.jpg");
	                        }
	                    };
	                }
	                img.src = data.data.url;
            	}
            	eval("("+data+")");
            },
            error: function (data1, status, e)//服务器响应失败处理函数
            {
            	imgLoadFinish = true;
            }
		});
		
	}
	
	
	function myrefresh() { 
		window.location.reload(); 
	} 
	
	function clearSexValue(){
		$("#update_nickname #nickname").val("");
		//$("#update_nickname #resex a")[0].click();
		$("#update_nickname #year1 a").eq(0).click();
		$("#update_nickname #month1 a").eq(0).click();
		//$("#update_nickname #day1 a")[0].click();
		$(".selectWarp-on").removeClass("selectWarp-on");
	}
	
	$(function(){
		var upfile = document.getElementById("file");
		upfileBind(upfile);
		
		$('#thread_type').change(function(){ 
			var thread_type =  $("#thread_type").find("option:selected").val();
			checkThreadType(thread_type);
		});
	});
	
	function aa (v) {
		$(v).remove();
	}
	
	function setCover(v) {
		var url = $(v).closest(".table-picbox").find("input").eq(0).val();
		var width = $(v).closest(".table-picbox").find("input").eq(1).val();
		var height = $(v).closest(".table-picbox").find("input").eq(2).val();
		
		$("#avatar").attr("src",url);
		$("#cover").val(url);
		$("#width").val(width);
		$("#height").val(height);
	}

    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r != null) return unescape(r[2]);
        return null; //返回参数值
    }