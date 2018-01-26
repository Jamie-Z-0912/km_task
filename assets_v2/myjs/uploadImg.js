/* jamie 2017-01-25 */
(function($ , undefined) {
	var uploadUrl = 'http://v0.api.upyun.com/',
		uploadData = {
			"expire_at": 'expire_at',
	        "policy": 'policy',
	        "signature": 'signature'
		};
    $.ajax({
        url: "http://test.kuaima.cn/km_task/upload_preparing?image_req=1&cross=1",
        type: "get",
        dataType: "json",
        success: function(d){
	        uploadUrl += d.data.IMAGE.path +'/';
	        uploadData = {
	            "expire_at": d.data.IMAGE.policy,
	            "policy": d.data.IMAGE.policy,
	            "signature": d.data.IMAGE.signature
	        };
        }
    });
	var Img_File_Input = function(element, settings) {
		var self = this;
		this.settings = $.extend({}, $.fn.uploadImg.defaults, settings);

		this.$element = $(element);
		this.disabled = false;
		this.element = element;
		self.$element.off('change').on('change', function(e , ace_inner_call){
			if(self.disabled) return;
			var file_list = self.element.files || [self.element.value];/** make it an array */
			self.show_file(file_list);
		});
		self.apply_settings();
	};
	Img_File_Input.prototype.apply_settings = function(){
		var self = this;
		var parent_label = self.$element.closest('label').css({'display':'block'})
		var tagName = parent_label.length == 0 ? 'label' : 'span';
		self.$element.wrap('<'+tagName+' class="img-file-input"/>');
		this.$element.after('<span class="img-file-name" data-text="'+this.settings.btn_choose+'"> <i class="ace-icon fa fa-picture-o"></i></span>');
		this.$label = this.$element.next();

		var remove_btn = !!self.settings.icon_remove;
		if(remove_btn) {
			var mypar = self.$element.parent();
			var btn = $('<a class="remove" href="javascript:;"><i class="ace-icon fa fa-times"></i></a>').appendTo(mypar);
			btn.on(ace.click_event, function(e){
				e.preventDefault();
				$.isFunction(self.settings.before_remove)&&self.settings.before_remove(self);
				mypar.find('.img-file-name').removeClass('hide-placeholder')
					.attr({'data-title':''}).children('img').remove();
			});
		}
	}

	Img_File_Input.prototype.show_file = function($files) {
		var self = this, files = $files;
		if(!files || files.length == 0) return;

        var formData = new FormData();
        formData.append('file', files[0]);
        for(var i in uploadData){
            formData.set(i, uploadData[i]);
        }
        function flightHandler(data){
        	if(data.status!=1000){
	    		$.gritter.add({
					text: data.desc,
					class_name: 'gritter-error gritter-center gritter-light',
					time:'1000'
				});
        	}else{
        		self.setImg(data.data.url);
				$.isFunction(self.settings.success)&&self.settings.success(data, self);
        	}
        }
        //测试用
        // flightHandler({status:1000,data:{url:'http://t.kuaima.cn/browser/image/mycard_7.png'}});

        $.ajax({
            url: uploadUrl,  
            type: 'POST',  
            data: formData,  
            contentType: false,  
            processData: false,  
            success: function (res) { eval(res) },
            error: function (returndata) {  
                console.log(returndata);  
            }  
        });
		return true;
	}
	Img_File_Input.prototype.setImg = function(img_src){
		var self = this, img_name = img_src.split('/');
    	img_name = img_name[img_name.length-1];
		self.$label.addClass('hide-placeholder').attr({'data-title':img_name});
		self.$label.children('img').remove();
		self.$label.append('<img src="'+img_src+'"/>');
	}
	Img_File_Input.prototype.disable = function() {
		this.disabled = true;
		this.$element.attr('disabled', 'disabled').addClass('disabled');
	}
	Img_File_Input.prototype.enable = function() {
		this.disabled = false;
		this.$element.removeAttr('disabled').removeClass('disabled');
	}

	$.fn.uploadImg = function (option) {
		var is_multiple = option.is_multiple || false,
			max_num = option.max_num || 3,
			parEl = option.parEl || '.js-file';

		var $set = this.each(function () {
			var $this = $(this);
			var options = typeof option === 'object' && option;
			if(!$this.parent().hasClass('img-file-input')){
				if(is_multiple && max_num>1 && $this.parent().parent().find('.add-img').length==0){
					var input_par = $this.parent(),
						clone = input_par.clone();
					input_par.after(clone.clone());
					var addImgBtn = input_par.next();
					addImgBtn.addClass('add-img');
					addImgBtn.html('<label class="img-file-input"><span class="img-file-name" data-text="添加图片"><i class="ace-icon glyphicon glyphicon-plus"></i></span></label>');
					addImgBtn.on(ace.click_event, function(){
				        var _self = $(this), par = $(this).parent(), n = par.find(parEl).length;
				        if(_self.prev().find('img').length==0){
				    		$.gritter.add({
								text: '还有未上传图片的空位',
								class_name: 'gritter-error gritter-center gritter-light',
								time:'1000'
							});
				        }else{
					        _self.before(clone.clone());
							new Img_File_Input(_self.prev().find('input[type="file"]'), options);
					        if(n==max_num) _self.remove();
				        }
					})
				}
				new Img_File_Input(this, options);
			}
		});
		return $set;
	};
	$.fn.uploadImg.defaults = {
		parEl:'.js-file',
		is_multiple: false,
		max_num: 3,
        btn_choose: '选择图片',
        icon_remove: true,
        allowExt: ["jpeg", "jpg", "png", "gif", "bmp"],
        allowMime: ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/bmp"],
		//callbacks
		before_remove:null,
		success: null
    }

})(window.jQuery);