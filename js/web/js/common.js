$(function(){
    var ku_www = 'http://www.kuaima.cn/';
    var isPC= function(){
        var userAgentInfo = navigator.userAgent;  
        var Agents = new Array("Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod");  
        var flag = true;  
        for (var v = 0; v < Agents.length; v++) {  
            if (userAgentInfo.indexOf(Agents[v]) > 0) { flag = false; break; }  
        }  
        return flag; 
    };
    var isKM = function(){ 
        var myNav = navigator.userAgent; return /KuaiMa/.test(myNav);
    }
    var is_weixin = function(){  
        var ua = navigator.userAgent.toLowerCase();  
        if(ua.match(/MicroMessenger/i)=="micromessenger") {  
            return true;  
        }else {  
            return false;  
        }  
    }
    var getQueryValue = function(key) {
        var q = location.search,
            keyValuePairs = new Array();

        if (q.length > 1) {
            var idx = q.indexOf('?');
            q = q.substring(idx + 1, q.length);
        } else {
            q = null;
        }
        if (q) {
            for (var i = 0; i < q.split("&").length; i++) {
                keyValuePairs[i] = q.split("&")[i];
            }
        }
        for (var j = 0; j < keyValuePairs.length; j++) {
            if (keyValuePairs[j].split("=")[0] == key) {
                // 这里需要解码，url传递中文时location.href获取的是编码后的值
                // 但FireFox下的url编码有问题
                return decodeURI(keyValuePairs[j].split("=")[1]);
            }
        }
        return '';
    }
    if(isPC()){
        $('#recommend a').on('click', function() {
            var url = $(this).data('url'),
                id = $(this).data('id');
            window.location.href = url;
        });
        if($('#top').length > 0){
            $('#top').remove();
        }
        $('body').append('<div style="position:fixed; top:15%; right:0; z-index:9999; border:4px solid #86C9E2;background: #fff;">'+
            '<img style="display:block;" width="130" src="http://api.kuaima.cn/km_task/js/web/img/kmQr.png" alt="" />'+
            '<h2 style="text-align:center;">扫一扫下载</br>能赚钱的浏览器</h2>'+
            '</div>');
    }else{
        if(isKM()){
            $('#recommend li .ui-list-info').append('<span class="tag red-tag">热门</span>');
            $('#recommend a').on('click', function() {
                var url = $(this).data('url'),
                    id = $(this).data('id');
                window.location.href = 'kmb://recommend?url=' + url + '&id=' + id;
            })
        }else{
            $('#recommend li .ui-list-info').append('<span class="tag red-tag">打开快马浏览器阅读</span>');

            var linkLength = $('#recommend li').length;
            for (var i = 0; i < linkLength; i++) {
                var id = '#rec_' + i;
                var options = new Object();
                options["mlink"] = 'http://a.mlinks.cc/AaiE';
                options["button"] = document.querySelectorAll('a'+id);
                options["params"] = {'detailid':$(id).data('id'), 'detailurl':$(id).data('url')};
                // console.log(options)
                new Mlink(options);
            }
        }

    }

    $('a[target="_blank"]').each(function(){
        if($(this).text() == '站长统计'){
            $(this).text('');
        }
    });

});