	//网站路径的变量
	var authData = null;
	
	var imgLoadFinish = true;
	function upfileBind(upfile){
		if(!upfile) return;
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
					getAuth(true,function(d){
						authData = d;
						updateAvatar(authData,upfile);
					},"");
				}else{
					if((authData.expire_at-10)*1000<=new Date().getTime()){//10秒的误差
						getAuth(true,function(d){
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
	
	function getAuth(isCross,callback,type){
    	if(!type)
    		type = 'image_req';
    	var url = "upload_preparing?"+type+"=1";
    	if(isCross) {
    		url = url + "&cross=1" ;
	    }
    	$.ajax({"url":url,type:"get",dataType:"json","success":function(d){
    		if(!!callback)
    			callback(d);
    		}
    	});
    }
	
	function updateAvatar(date,upfile){
		console.log(date);
		$(".table-picbox img").css("width","auto");
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
                	imgLoadFinish = true;
            		var jsondata = data;
            		console.log(data);
                	console.log(jsondata.data.url);

					$(file).parents(".table-pic").find("img").attr('src', jsondata.data.url);
                	//$(zlappend).find("#topic_image").val(jsondata.data.url);
					if($("#topic_image").val()==""){
						$("#topic_image").val(jsondata.data.url);
					}else{
						if($('#cover_table').length == 1){
							$("#topic_image").val(jsondata.data.url);
						}else{
							var arr=[];
							arr = $("#topic_image").val().split(',');
							arr.push(jsondata.data.url);
							$("#topic_image").val(arr);
						}
					}
            	}
            	eval('('+data+')');
            },
            error: function (data1, status, e)//服务器响应失败处理函数
            {
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
		if($('#file').length>0){
			var upfile = document.getElementById("file");
			upfileBind(upfile);
		}
		
		$('#thread_type').change(function(){ 
			var thread_type =  $("#thread_type").find("option:selected").val();
			checkThreadType(thread_type);
		});
		/******2017-02-08 Jamie******/
		if(/\[/.test($('#topic_image').val())) {
			var j_imgs = JSON.parse($('#topic_image').val()), j_arr = [];
			for (var i = 0; i < j_imgs.length; i++) {
				j_arr.push(j_imgs[i]);
			}
			$('#topic_image').val(j_arr.join(','));
		}

		Array.prototype.remove = function(dx){
			if( isNaN(dx) || dx > this.length ){ return false; }
			for(var i = 0, n = 0; i < this.length; i++){
				if(this[i] != this[dx]){
					this[n++] = this[i];
				}
			}
			this.length -= 1;
		}
		$('#add_imgs').on('click', '.js-deltu', function(){
			var i = $(this).parent().index();
			var imgs_val = $('#topic_image').val().split(',');
			console.log(imgs_val);
			if(imgs_val.length>i){
				imgs_val.remove(i);
				$('#topic_image').val(imgs_val.join(','));
			}
			if($(".table-pic").length==1){
				$(this).parent().find('img').attr('src','assets/img/avatar.jpg!w160.jpg');
				$('#topic_image').val('');
			}else{
				$(this).parent().remove();
			}
		});
		if($('.js-files').length>0){
			$.each($('.js-files'), function(){
				upfileBind(this);
			})
		}
		$('#addTuPian').on('click', function(){
			var $el = $(this);
			var $pic = $el.prev().clone();
			$el.before($pic);
			var f_i = $('.js-files').length-1;
			$($('.js-files')[f_i]).attr('id','file'+f_i);
			$(".table-pic").eq(f_i).find('img').attr('src','assets/img/avatar.jpg!w160.jpg');
            if(!$(".table-pic").eq(f_i).find('.js-deltu')){
                $(".table-pic").eq(f_i).append('<a href="javascript:void(0);" class="js-deltu" style="position: absolute;right:0;top:0;z-index:4;">删除</a >');
			}
			upfileBind($('.js-files')[f_i]);
		});
		/******2017-02-08 Jamie end*******/
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
	