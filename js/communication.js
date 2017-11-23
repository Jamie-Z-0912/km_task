var Communication = {
    wsurl: kuaima_ws,
    socket: null,
    connect: function (idfa, onmessage) {
        var that = this;
        if (!window.WebSocket) {
            window.WebSocket = window.MozWebSocket;
        }
        if (window.WebSocket) {
            socket = new WebSocket(this.wsurl);
            socket.onmessage = onmessage;
            socket.onopen = function (event) {
                //链接后响应
                if (idfa) {
                    var message = new Object();
                    message.accepter = "server";
                    message.timestamp = new Date().getTime();
                    message.from = "web-" + idfa;
                    message.sign = "fafouwefjwe232df";
                    message.message = new Object();
                    message.message.action = "LOGIN";
                    this.send(JSON.stringify(message));
                }
                else {
                    confirmDialog("温馨提示", "请从马甲中打开网页才能获得任务奖励。", "", "", "下载马甲", function (a) {
                        if (a) {
                            openApp(kuaima_scheme);
                        } else {
                            openApp(kuaima_downurl);//去appstore下载
                        }

                    })
                }
            };
            socket.onclose = function (event) {
                console.log("connect closed");
                confirmDialog("链接断开", "是否重连", "", "重连", "", function (bool) {
                    if (bool) {
                        that.connect(idfa, onmessage);
                    }
                })
            };
        } else {
            confirmDialog("浏览器不支持", "请更换浏览器再尝试打开", "", "确定", "", function (a) {
            })
        }

    },
    send: function (message) {
        if (!window.WebSocket) {
            return;
        }
        if (socket.readyState == WebSocket.OPEN) {
            socket.send(message);
        } else {
            console.log("connect state error");
        }
    }
}
