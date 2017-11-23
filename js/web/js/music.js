
        function MUSIC(el, opt){
            this.opt = {
                autoPlay: !1,
                mid:'',
                m_id:'',
                m_url:'',
                m_name:'',
                m_tu:'',
                m_singer:'',
                onStatusChange: function() {}
            }
            for( var i in this.opt){
                this.opt[i] = opt[i] || this.opt[i];
            }
            this.playbtn = 'qqmusic_play_'+ this.opt.m_id;
            this._status = -1;
            this.surportType = "addEventListener" in window ? 2 : 0,

            this._h5play();
            console.log(this._status);
            var html = '<span id="'+ this.playbtn +'" class="db qqmusic_area">'+
                '<span class="tc tips_global'+ (this.surportType ? '' : ' unsupport_tips') +'">'+
                '当前浏览器不支持播放音乐或语音，请在微信或其他浏览器中播放'+
                '</span>'+
                '<span class="db qqmusic_wrp">'+
                '<span class="db qqmusic_bd">'+
                '<span id="qqmusic_play_'+ this.opt.m_id +'" class="play_area">'+
                    '<i class="icon_qqmusic_switch"></i>'+
                    '<img src="img/icon_qqmusic_default.png" class="pic_qqmusic_default">'+
                    '<img src="'+ this.mThumb(opt.m_tu) +'" class="qqmusic_thumb"/>'+
                '</span>'+
                '<a id="qqmusic_home_'+ this.opt.m_id +'" href="javascript:void(0);" class="access_area">'+
                    '<span class="qqmusic_songname">'+ this.opt.m_name +'</span>'+
                    '<span class="qqmusic_singername">'+ this.opt.m_singer +'</span>'+
                    '<span class="qqmusic_source"><img src="img/icon_music.png" /></span>'+
                '</a>'+
                '</span>'+
                '</span>'+
                '</span>';
            el.append(html);
        }
        MUSIC.prototype._h5play = function(){
            1 * this.surportType > 0 && this._h5Audio ? this._h5Audio.play(): this.createM();
        }
        MUSIC.prototype.createM = function(options){
            var o = this.opt;
            this._h5Audio = document.createElement("audio");
            this._H5bindEvent();
            this._h5Audio.id = 'audio'+ o.m_id;
            this._h5Audio.setAttribute("style", "height:0;width:0;display:none");
            this._h5Audio.play();
            document.body.appendChild(this._h5Audio);
            var t = this;
            setTimeout(function() {
                t._h5Audio.src = o.m_url;
            }, 0);
        }
        MUSIC.prototype.mThumb = function(img){
            var p={
                imgroot: "https://imgcache.qq.com/music/photo/mid_album_68",
                imgroot2: "https://y.gtimg.cn/music/photo_new/T002R68x68M000#mid#.jpg"
            };
            var musicImgPart = music_imgSrc(img || "").replace(/^\s/, "").replace(/\s$/, "");
            var m = "";
            m = musicImgPart.split("/");
            try {
                m = m[m.length - 1],
                m = m.split(".")[0];
            } catch (c) {
                m = "";
            }
            var music_img = m ? p.imgroot2.replace("#mid#", m) : p.imgroot + musicImgPart;
            console.log(music_img)
            return music_img;
        }

        MUSIC.prototype._H5bindEvent = function() {
            var t = this;
            this._h5Audio.addEventListener("play", function(o) {
                t._onPlay(o);
            }, !1);
            this._h5Audio.addEventListener("ended", function(o) {
                t._onEnd(o);
            }, !1);
            this._h5Audio.addEventListener("pause", function(o) {
                t._onPause(o);
            }, !1);
        }
        MUSIC.prototype._onPlay = function(t) {
            this._status = 1;
            $('#'+ this.playbtn).addClass('qqmusic_playing');
            try {
                e(this);
            } catch (t) {}
            "function" == typeof this.opt.onStatusChange && this.opt.onStatusChange.call(this, t || {}, this._status);
        }
        MUSIC.prototype._onPause = function(t) {
            this._status = 2;
            $('#'+ this.playbtn).removeClass('qqmusic_playing');
            "function" == typeof this.opt.onStatusChange && this.opt.onStatusChange.call(this, t || {}, this._status);
        }
        MUSIC.prototype._onEnd = function(t) {
            this._status = 3;
            $('#'+ this.playbtn).removeClass('qqmusic_playing');
            "function" == typeof this.opt.onStatusChange && this.opt.onStatusChange.call(this, t || {}, this._status);
        }
        function music_imgSrc(e) {
            return e = (e || "").replace(/&/g, "&amp;").replace(/>/g, "&gt;").replace(/</g, "&lt;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/=/g, "&#61;").replace(/`/g, "&#96;");
        }