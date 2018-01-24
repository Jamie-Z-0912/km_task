	Array.prototype.remove = function(dx){
		if( isNaN(dx) || dx > this.length ){ return false; }
		for(var i = 0, n = 0; i < this.length; i++){
			if(this[i] != this[dx]){
				this[n++] = this[i];
			}
		}
		this.length -= 1;
	}
    var upload = function(el,file_opt,maxNum,callback) {
	    var file_input = $(el);
	    file_input.ace_file_input(file_opt); 
	    /* 上传图片前方法 */
	    function getAuth(isCross,fun,type){
	        if(!type) type = 'image_req';
	        var url = "http://test.kuaima.cn/km_task/upload_preparing?"+type+"=1";
	        if(isCross) { url = url + "&cross=1"; }
	        $.ajax({
	            url:url,
	            type: "get",
	            dataType: "json",
	            success: function(d){
	            	console.log(d)
	                !!fun&&$.isFunction(fun)&&fun(d);
	            }
	        });
	    }
	    getAuth(true,function(d){
	        var uploadUrl = 'http://v0.api.upyun.com/'+ d.data.IMAGE.path +'/';
	        var uploadData = {
	            "expire_at": d.data.IMAGE.policy,
	            "policy": d.data.IMAGE.policy,
	            "signature": d.data.IMAGE.signature
	        };
	        //绑定文件上传
	        $('form').on('change', el, function() {
	            var _file = this, val = _file.value;
	            console.log(_file)
	            var that = $(_file), formData = new FormData();
	            formData.append('file', this.files[0]);
	            for(var i in uploadData){
	                formData.set(i, uploadData[i]);
	            }
	            $.ajax({
	                url: uploadUrl,  
	                type: 'POST',  
	                data: formData,  
	                contentType: false,  
	                processData: false,  
	                success: function (res) {
	                    function flightHandler(data){
	                    	var $f_name = $(_file).parent().find('.ace-file-name');
	                    	var img_src = data.data.url, img_name = img_src.split('/');
	                    	img_name = img_name[img_name.length-1];
	                        $f_name.html('<img src="'+img_src+'" />')
	                        		.addClass('large')
	                        		.attr('data-title',img_name);
            				var img_input = $(el).parents('.picture').find('input[type="hidden"]'); //单图
            				var imgs_input = $(el).parents('.pictures').find('input[type="hidden"]'); //多图
            				if(img_input.length==1&&imgs_input.length==1){ alert('单图多图不能同时存在！')}
            				if(img_input.length==1){img_input.val(img_src);}
            				if(imgs_input.length==1){
            					if(imgs_input.val()==''){
            						imgs_input.val(img_src);
            					}else{
            						var img_val = imgs_input.val(),a=img_val.split(',');
            						try{
            							a.push(img_src);
            						}catch(e){
            							alert('检查多图的input值')
            						}
            						imgs_input.val(a.join(','));
            					}
            				}
	                    }
	                    eval(res);
	                },
	                error: function (returndata) {  
	                    console.log(returndata);  
	                }  
	            });
	        });
	    });

		//多图增加图片
	    var stepfile = '<div class="col-sm-2 js-file" style="padding-left:0;"><input class="js-file-input" type="file" /></div>';
	    $('form').on('click', '.js-addimg', function(){
	        var _self = $(this), par = $(this).parent(), n = par.find('.js-file').length;
	        if(_self.prev().find('img').length==0){
        		$.gritter.add({
					text: '还有未上传图片的空位',
					class_name: 'gritter-error gritter-center gritter-light',
					time:'1000'
				});
	        }else{
		        $(this).before(stepfile);
		        $('.js-file-input').ace_file_input(file_opt);
		        if(n==maxNum-1) _self.remove();
	        }
	    });  
	}