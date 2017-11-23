 //UE.getEditor('uedit')
	    var ueditor = null;
	    var uploadedImgArray = [];
	    
		$(document).ready(function(){
		    loadEditor();
		});
		function loadEditor(callback){
			if(!ueditor){
				ueditor = new UE.ui.Editor();
				ueditor.render("addNoteArea");
				ueditor.ready(function(){
					setUeditorHeight();
					$(window).resize(function(){
						setUeditorHeight();
					});
					ueditor.setOpt.customDomain = document.domain;
					editor = ueditor;
					$("#edui1").width(545);
					$("#edui1_iframeholder").show();
				});
			}
		}
	    function setUeditorHeight(){
	    	if(!ueditor.ui.isFullScreen()){
	    		var $container = $(ueditor.container);
	    	 	var $toolBar = $container.children(":first");
	    	 	var $iframe = $toolBar.next();
	    	 	//
	    	 	var allHeight = $("#addNoteArea").height();
	    	 	$container.height(allHeight);
	    	 	$iframe.height(allHeight - $toolBar.height()-2);
	    	 	var cwidth = $("#addNoteArea").width();
	    	 	$container.width(cwidth-3);
	    	 	$iframe.width(cwidth-5);
	    	}
	    }

	    function setSubmitData(isCross,callbck,type){
	    	var iframe = $("iframe[id^='edui'][id$='_iframe']")[0];
	    	getAuth(isCross,function(d){
	    		if(d.status=="1000"){
	    			if(!!d.data.IMAGE){
	    				iframe.contentWindow.submitData = {			
	    					"path":d.data.IMAGE.path,
	    					"policy":d.data.IMAGE.policy,
	    					"signature":d.data.IMAGE.signature
	    				};
	    			}
	    			if(!!d.data.FILE){
	    				iframe.contentWindow.submitData = {			
	    					"path":d.data.FILE.path,
	    					"policy":d.data.FILE.policy,
	    					"signature":d.data.FILE.signature
	    				};
	    			}
	    			if(!!callbck)
	    				callbck();
	    		}
	    	},type);
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

	    function toJSONString(jsonObj){
	    	var str = " { ";
	    	for(i in jsonObj){
	    		str += "\"" + i + "\":";

	            if (typeof jsonObj[i] == "number") {
	                str += jsonObj[i] + ",";
	            } else if (typeof jsonObj[i] == "string") {
	                str += "\"" + jsonObj[i] + "\",";
	            } else if (!jsonObj[i] || jsonObj[i] == true) {
	                str += jsonObj[i] + ",";
	            } else if (typeof jsonObj[i] == "function") {
	                str += jsonObj[i].toString() + ",";
	            } else if (typeof jsonObj[i] == "object") {
	                if (jsonObj[i].constructor == Array) {
	                    str += jsonObj[i].toJSONString() + ",";
	                } else if (jsonObj[i].constructor == Object) {
	                    str += jsonObj[i].toString() + ",";
	                }
	            }
	        }
	        return str.substring(0, str.length-1)+" } ";
	    }