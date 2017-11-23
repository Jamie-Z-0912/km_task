var items = new Object();
var user;
//显示加载器
function showLoader() {
    //显示加载器.for jQuery Mobile 1.2.0
    $.mobile.loading('show', {
        text: '加载中...', //加载器中显示的文字
        textVisible: true, //是否显示文字
        theme: 'a',        //加载器主题样式a-e
        textonly: false,   //是否只显示文字
        html: ""           //要显示的html内容，如图片等
    });
}

//隐藏加载器.for jQuery Mobile 1.2.0
function hideLoader() {
    //隐藏加载器  
    $.mobile.loading('hide');
}

function setBankList() {
    $("#tixian_bank").empty();
    bankList.forEach(function (b) {
        $("#tixian_bank").append('<option value="' + b.type + '">' + b.name + '</option>');
    })
}

function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg);  //匹配目标参数
    if (r != null) return unescape(r[2]);
    return null; //返回参数值
}

var openApp = function (url) {
    window.location = url;
}

//评论任务提交
var commentCertain = function (task_id) {
    confirmDialog("温馨提示", "请确定您已经完成了评论任务", "", "确定提交", "还没完成", function (a) {
        if (a) {
            getComCert(task_id, function (d) {
                if (d.status == 1000) {
                    confirmDialog("提交成功", "请耐心等待我们的审核", "", "确定并返回首页", "", function (b) {
                        if (b) {
                            window.location.href = "#page_main"
                        }
                    })
                } else {
                    confirmDialog("提交失败", "请稍后再试", "", "确定", "", function (c) {
                        if (c) {
                            window.location.href = "#page_comment_detail"
                        }
                    })
                }
            })
        }
    })
}

var getComCert = function (task_id, callback) {
    $.ajax({
        type: "GET",
        url: kuaima_api + "api/order/submit?uid=" + user.uid + "&idfa=" + idfa + "&task_id=" + task_id,
        dataType: "jsonp",
        jsonpCallback: "jsonp7",
        beforeSend: showLoader,
        complete: hideLoader,
        success: callback
    })
}

var gotoAppstoreSearch = function (keyword) {
    window.location = kuaima_api + "skip?idfa=" + idfa + "&keyword=" + encodeURIComponent(keyword);
}

var format = function (price) {
    var priceNum = parseFloat(price);
    if (priceNum >= 10 || priceNum <= -10) {
        return priceNum.toFixed(1);
    } else {
        return priceNum.toFixed(2);
    }
}
var checkTelephoneFormat = function (telephone) {
    var re = /^1\d{10}$/
    return re.test(telephone);
}

var getFriendNum = function (callback) {
    $.ajax({
        type: "GET",
        url: kuaima_api + "api/invite/friend_num?uid=" + user.uid + "&idfa=" + idfa,
        dataType: "jsonp",
        jsonpCallback: "jsonp1",
        beforeSend: showLoader,
        complete: hideLoader,
        success: callback
    })
}

var copy = function (keyword, callback) {
    $.ajax({
        type: "GET",
        url: kuaima_api + "api/copy?uid=" + user.uid + "&idfa=" + idfa + "&keyword=" + encodeURIComponent(keyword),
        dataType: "jsonp",
        jsonpCallback: "jsonp2",
        beforeSend: showLoader,
        complete: hideLoader,
        success: callback
    })
}

var bindTelephone = function (telephone, verify_code, callback) {
    $.ajax({
        type: "GET",
        url: kuaima_api + "api/user/bind_phone?verify_code=" + verify_code + "&phone=" + telephone + "&uid=" + user.uid + "&idfa=" + idfa,
        dataType: "jsonp",
        jsonpCallback: "jsonp3",
        beforeSend: showLoader,
        complete: hideLoader,
        success: callback
    })
}
var getBindVerifyCode = function (btn) {
    var telephone = $("#bind_phone").val();
    if (checkTelephoneFormat(telephone)) {
        getPhoneCode(telephone, 1, function (data) {
            if (data.status == 1000) {
                grayBtn(btn);
            } else if (data.status == 1008) {
                confirmDialog("发送失败", "您输入的手机号已绑定", "", "确定", "", function (a) {
                })
            }
        })
    } else {
        confirmDialog("验证失败", "您输入的手机号有误，请重新填写", "", "确定", "", function (a) {
        })
    }

}


var getVerifyCode = function (btn) {
    getPhoneCode("", 0, function (data) {
        if (data.status == 1000) {
            grayBtn(btn);
        } else if (data.status == 1009) {
            confirmDialog("发送失败", "您还没有绑定手机号，请返回“我的界面”进行绑定", "", "确定", "", function (a) {
            })
        }

    })
}

var wait = 30;
var grayBtn = function (btn) {
    var pdiv = $(btn).parent().parent(".getmoney-btn");
    var spanDiv = $(btn).parent().children("span").children("span.ui-btn-text");

    if (wait == 0) {
        $(btn).button("enable");
        $(btn).val("获取验证码");
        spanDiv.html("获取验证码");
        pdiv.removeClass("getmoney-btn-disabled");
        wait = 30;
    } else {
        $(btn).button("disable");
        $(btn).val(wait + "秒");
        spanDiv.html(wait + "秒");
        pdiv.addClass("getmoney-btn-disabled");

        wait--;
        setTimeout(function () {
                grayBtn(btn);
            },
            1000)
    }
}

var countDown = function (display, endtime) {
    var now = new Date().getTime();
    if (now > endtime) {
        $(display).html("任务已过期")
    } else {
        var t = (endtime - now) / 1000;
        var s = parseInt(t % 60);
        var m = parseInt((t - s) / 60);

        if (s < 10) {
            s = "0" + s;
        }
        if (m < 10) {
            m = "0" + m;
        }

        $(display).html("任务倒计时 " + m + ":" + s);
        setTimeout(function () {
            countDown(display, endtime);
        }, 1000)
    }

}

var getPhoneCode = function (telephone, isbind, callback) {
    $.ajax({
        type: "GET",
        url: kuaima_api + "api/user/verify_code?phone=" + telephone + "&uid=" + user.uid + "&idfa=" + idfa + "&new_phone=" + isbind,
        dataType: "jsonp",
        jsonpCallback: "jsonp",
        beforeSend: showLoader,
        complete: hideLoader,
        success: callback
    })
}

function reCharge() {
    var number = $("ul#price-phone-list li.price-active span.old").attr("faceamount");
    var telephone = $("#getmoney_phone_number").val();
    var verify_code = $("#input_verifycode_phone").val();
    if (!isNum(number)) {
        confirmDialog("", "请选择金额", "", "确定", "", function (a) {
        });
        return;
    }
    if (!isNum(verify_code)) {
        confirmDialog("验证码错误", "请重新获取验证码", "", "确定", "", function (a) {
        })
        return;
    }

    if (!checkTelephoneFormat(telephone)) {
        confirmDialog("验证失败", "您输入的手机号有误，请重新填写", "", "确定", "", function (a) {
        })
        return;
    }
    reChargefromNetwork(verify_code, telephone, number, withdrawcb);
}

function reChargefromNetwork(verify_code, telephone, number, callback) {
    $.ajax({
        type: "GET",
        url: kuaima_api + "api/cz?uid=" + user.uid + "&verify_code=" + verify_code + "&phone=" + telephone + "&num=" + number,
        dataType: "jsonp",
        jsonpCallback: "jsonp",
        beforeSend: showLoader,
        complete: hideLoader,
        success: callback
    });
}

function reChargeCard() {
    var getmoney_card_username = $("#getmoney_card_username").val();
    var getmoney_card_bank = $("#tixian_bank").find("option:selected").text();
    var getmoney_card_bank_type = $("#tixian_bank").val();
    var getmoney_card_bankaddress = $("#getmoney_card_bankaddress").val();
    var getmoney_card_number = $("#getmoney_card_number").val();
    var number = $("#getmoney_card_moneynum").val();
    var verify_code = $("#input_verifycode_card").val();

    if (isBlank(getmoney_card_username)) {
        confirmDialog("", "请填写收款人姓名", "", "确定", "", function (a) {
        })
        return;
    }
    if (isBlank(getmoney_card_bank) || isBlank(getmoney_card_bank_type)) {
        confirmDialog("", "请选择银行", "", "确定", "", function (a) {
        })
        return;
    }
    if (isBlank(getmoney_card_bankaddress)) {
        confirmDialog("", "请填写开户行名称", "", "确定", "", function (a) {
        })
        return;
    }
    if (isBlank(getmoney_card_number)) {
        confirmDialog("", "请填写银行卡号", "", "确定", "", function (a) {
        })
        return;
    }
    if (!isNum(number)) {
        confirmDialog("", "请输入金额", "", "确定", "", function (a) {
        })
        return;
    }
    if (!isNum(verify_code)) {
        confirmDialog("验证码错误", "请重新获取验证码", "", "确定", "", function (a) {
        })
        return;
    }

    if (number < 100) {
        confirmDialog("提交失败", "银行卡提现的最小金额是100元", "", "确定", "", function () {
        });
        return;
    }
    withdrawBank(getmoney_card_username, getmoney_card_bank_type, getmoney_card_bank, getmoney_card_bankaddress, getmoney_card_number, number, verify_code, withdrawcb);
}


//提现到银行卡
function withdrawBank(bank_account_name, bank_type, bank_name, bank_branch_name, bank_card, amount, verify_code, callback) {
    $.ajax({
        type: "GET",
        url: kuaima_api + "api/withdraw?uid=" + user.uid + "&idfa=" + idfa + "&verify_code=" + verify_code + "&bank_account_name="
        + bank_account_name + "&bank_type=" + bank_type + "&bank_name=" + bank_name + "&bank_branch_name=" + bank_branch_name +
        "&bank_card=" + bank_card + "&amount=" + amount + "&type=1",
        dataType: "jsonp",
        jsonpCallback: "jsonp",
        success: callback
    });
}

function reChargeAlipay() {
    var number = $("ul#price-alipay-list li.price-active span.old").attr("faceamount");
    var alipay_username = $("#getmoney_alipay_username").val();
    var alipay_account = $("#getmoney_alipay_account").val();
    var verify_code = $("#input_verifycode_alipay").val();

    if (isBlank(alipay_username)) {
        confirmDialog("", "请填写真实姓名", "", "确定", "", function (a) {
        })
        return;
    }
    if (isBlank(alipay_account)) {
        confirmDialog("", "请输入支付宝账号", "", "确定", "", function (a) {
        })
        return;
    }
    if (!isNum(number)) {
        confirmDialog("", "请选择金额", "", "确定", "", function (a) {
        })
        return;
    }
    if (!isNum(verify_code)) {
        confirmDialog("验证码错误", "请重新获取验证码", "", "确定", "", function (a) {
        })
        return;
    }

    withdrawAlipay(alipay_username, alipay_account, number, verify_code, withdrawcb);
}

//提现到支付宝
function withdrawAlipay(account_name, acount, amount, verify_code, callback) {
    $.ajax({
        type: "GET",
        url: kuaima_api + "api/withdraw?uid=" + user.uid + "&idfa=" + idfa + "&verify_code=" + verify_code + "&bank_account_name="
        + account_name + "&bank_card=" + acount + "&amount=" + amount + "&type=2",
        dataType: "jsonp",
        jsonpCallback: "jsonp",
        beforeSend: showLoader,
        complete: hideLoader,
        success: callback
    });
}

var withdrawcb = function (data) {
    if (data.status == 1000) {
        confirmDialog("提交成功", "请耐心等待工作人员为您处理", "", "确定", "", function (isConfirm) {
            if (isConfirm) {
                window.location.hash = "#page_my";
            }
        });
    } else if (data.status == 1010) {
        confirmDialog("", "您当前的账户余额不足", "", "确定", "", function () {
        })
    } else if (data.status == 2001) {
        confirmDialog("验证码错误", "请重新获取并输入验证码", "", "确定", "", function () {
        })
    } else if (data.status == 1009) {
        confirmDialog("提交失败", "您还没有绑定手机号，请返回“我的界面”进行绑定", "", "确定", "", function () {
        })
    } else {
        confirmDialog("提交失败", "请检查您当前的网络是否通畅", "", "确定", "", function () {
        })
    }
}

var bindPhone = function () {
    var telephone = $("#bind_phone").val();
    var verify_code = $("#bind_verify_code").val();
    if (!isNum(verify_code)) {
        confirmDialog("验证码错误", "请重新获取验证码", "", "确定", "", function (a) {
        })
        return;
    }
    if (!checkTelephoneFormat(telephone)) {
        confirmDialog("验证失败", "您输入的手机号有误，请重新填写", "", "确定", "", function (a) {
        })
        return;
    }

    bindTelephone(telephone, verify_code, function (data) {
        if (data.status == 1000) {
            confirmDialog("", "绑定成功", "", "确定", "", function (a) {
                window.location.href = "#page_my"
            })
        } else if (data.status == 2001) {
            confirmDialog("验证码错误", "请重新获取验证码", "", "确定", "", function (a) {
            })
        } else {
            confirmDialog("绑定失败", "绑定失败，请稍后再试", "", "确定", "", function () {
            })
        }
    })
}

var getRecommentList = function (callback) {
    $.ajax({
        type: "GET",
        url: kuaima_api + "api/invite/friend_list?uid=" + user.uid + "&idfa=" + idfa,
        dataType: "jsonp",
        jsonpCallback: "jsonp7",
        success: callback
    })
}
var applyTask = function (task_id, cr_key, callback) {
    $.ajax({
        type: "GET",
        url: kuaima_api + "api/order/receive?uid=" + user.uid + "&task_id=" + task_id + "&cr_key=" + cr_key + "&idfa=" + idfa,
        dataType: "jsonp",
        jsonpCallback: "jsonp",
        beforeSend: showLoader,
        complete: hideLoader,
        success: callback
    })
}

var getOrderList = function (page, callback) {
    $.ajax({
        type: "GET",
        url: kuaima_api + "api/user/income/list?uid=" + user.uid + "&page=" + page + "&idfa=" + idfa,
        dataType: "jsonp",
        jsonpCallback: "jsonp5",
        beforeSend: showLoader,
        complete: hideLoader,
        success: callback
    })
}

var getWithdrawList = function (callback) {
    $.ajax({
        type: "GET",
        url: kuaima_api + "api/withdraw/list?uid=" + user.uid + "&idfa=" + idfa,
        dataType: "jsonp",
        jsonpCallback: "jsonp",
        beforeSend: showLoader,
        complete: hideLoader,
        success: callback
    })
}

var login = function (fu, callback) {
    $.ajax({
        type: "GET",
        url: kuaima_api + "api/user/uid?idfa=" + idfa + "&fu=" + fu,
        dataType: "jsonp",
        jsonpCallback: "jsonp",
        success: callback
    })
}
var taskState = function (task_id, task_type, callback) {
    $.ajax({
        type: "GET",
        url: kuaima_api + "api/task/state/" + task_id + "?uid=" + user.uid + "&idfa=" + idfa + "&type=" + task_type,
        dataType: "jsonp",
        jsonpCallback: "jsonp",
        beforeSend: showLoader,
        complete: hideLoader,
        success: callback
    });
}


var getTaskList = function (page, callback) {
    if (user && user.uid)$.ajax({
        type: "GET",
        url: kuaima_api + "api/task/list?uid=" + user.uid + "&idfa=" + idfa,
        dataType: "jsonp",
        jsonpCallback: "jsonp",
        success: callback
    });
}
var getUserInfo = function (callback) {
    $.ajax({
        type: "GET",
        url: kuaima_api + "api/user/user_info/" + user.uid + "?idfa=" + idfa,
        dataType: "jsonp",
        jsonpCallback: "jsonp",
        beforeSend: showLoader,
        complete: hideLoader,
        success: callback
    });
}

var getUserAccount = function (callback) {
    $.ajax({
        type: "GET",
        url: kuaima_api + "api/user/account/" + user.uid + "?idfa=" + idfa,
        dataType: "jsonp",
        jsonpCallback: "jsonp",
        beforeSend: showLoader,
        complete: hideLoader,
        success: callback
    });
}

var showCurrentItem = function () {
    taskState(0, 'APP', function (data) {
        showItem(data.data.doing_task);
    });
}

var showCurrentReview = function () {
    taskState(0, 'REVIEW', function (data) {
        showComment(data.data.doing_task);
    });
}

var checkIn = function (apple_id, task_id, callback) {
    $.ajax({
        type: "GET",
        url: kuaima_api + "callback/channel/checkin?apple_id=" + apple_id + "&idfa=" + idfa + "&task_id=" + task_id,
        dataType: "jsonp",
        jsonpCallback: "jsonp",
        beforeSend: showLoader,
        complete: hideLoader,
        success: callback
    });

}

var noItemClick = function () {
    confirmDialog("任务未开始", "时间未到，请耐心等待！", "", "确定", "", function (a) {
//                  if(a){
//                 window.location.href="#page_share"
//                  }
    })
}

var doneItemClick = function (state) {
    if (state == 4 || state == 5) {
        confirmDialog("", "任务已完成", "", "确定", "", function (a) {
        })
    } else if (state == 6) {
        confirmDialog("", "任务正在审核", "", "确定", "", function (a) {
        })
    }
}

var itemClick = function (_id) {
    var i = items[_id];
    if (i) {
        if (i.status == 0 || i.status == 4 || i.status == 5) {
            confirmDialog(i.status == 0 ? "任务还未开始" : "无法领取任务", "", "", "确定", "", function (a) {
            })
        } else {
            if (i.type == "APP") {
                taskState(i.id, i.type, function (data) {
                    if (data.data.state == 1) {
                        applyTask(data.data.task.id, i.cr_key, function (d) {
                            if (d.status == 1000) {
                                showItem(data.data.task)
                            } else if (d.status == 3001) {
                                confirmDialog("任务未开始", "时间未到，请耐心等待！", "", "赚取更多", "继续等待", function (a) {
                                    if (a) {
                                        window.location.href = "#page_share"
                                    }
                                })
                            } else if (d.status == 3002) {
                                confirmDialog("任务已结束", "请选择其他任务完成", "", "确定", "", function (a) {
                                })
                            } else if (d.status == 3003) {
                                confirmDialog("领取失败", "您不是首次安装此应用", "", "确定", "", function (a) {
                                    if (a) {
                                        "#page_main"
                                    }
                                })
                            } else if (d.status == 3004) {
                                confirmDialog("任务已抢光", "请期待下一个任务", "", "确定", "", function (a) {
                                })
                            } else {
                                confirmDialog("", "领取失败", "", "确定", "", function () {
                                })
                            }
                        });
                    } else if (data.data.state == 2) {
                        showItem(data.data.task)
                    } else if (data.data.state == 3) {
                        confirmDialog("温馨提示", "是否放弃当前未完成的任务", "", "继续", "放弃", function (a) {
                            if (!a) {
                                applyTask(data.data.task.id, i.cr_key, function (d) {
                                    if (d.status == 1000) {
                                        showItem(data.data.task)
                                    } else if (d.status == 3001) {
                                        confirmDialog("任务未开始", "时间未到，请耐心等待！", "", "赚取更多", "继续等待", function (a) {
                                            if (a) {
                                                window.location.href = "#page_share"
                                            }
                                        })
                                    } else if (d.status == 3002) {
                                        confirmDialog("任务已结束", "请选择其他任务完成", "", "确定", "", function (a) {
                                        })
                                    } else if (d.status == 3003) {
                                        confirmDialog("领取失败", "您不是首次安装此应用", "", "确定", "", function (a) {
                                            if (a) {
                                                window.location.href = "#page_main"
                                            }
                                        })
                                    } else if (d.status == 3004) {
                                        confirmDialog("任务已抢光", "请期待下一个任务", "", "确定", "", function (a) {
                                        })
                                    } else {
                                        confirmDialog("", "领取失败", "", "确定", "", function () {
                                        })
                                    }
                                });
                            } else {
                                showItem(data.data.doing_task);
                            }


                        })

                    }

                })
            } else if (i.type == "PERFECT_INFO") {
                window.location.href = "#page_phone_login";
            } else if (i.type == "INVITE") {
                window.location.href = "#page_share";
            } else if (i.type == 'CHECKIN') {
                taskState(i.id, i.type, function (data) {
                    if (data.data.state == 1) {
                        applyTask(data.data.task.id, i.cr_key, function (d) {
                            if (d.status == 1000) {
                                checkIn(data.data.task.apple_id, data.data.task.id, function (d) {
                                    if (d.status == 1000) {
                                        confirmDialog("签到成功", "赶紧去完成其他任务吧", "", "确定", "", function (a) {
                                            if (a) {
                                                window.location.reload();
                                            }
                                        })
                                    } else {
                                        confirmDialog("签到失败", "请稍后再试", "", "确定", "", function (a) {
                                        })
                                    }
                                })
                            }
                        })
                    } else {
                        confirmDialog("网络异常", "请稍后再试", "", "确定", "", function (a) {
                        })
                    }
                })
            } else if (i.type == "REVIEW") {
                taskState(i.id, i.type, function (data) {
                    if (data.data.state == 1) {
                        applyTask(data.data.task.id, i.cr_key, function (d) {
                            if (d.status == 1000) {
                                showComment(d.data)
                            } else if (d.status == 3001) {
                                confirmDialog("任务未开始", "时间未到，请耐心等待！", "", "赚取更多", "继续等待", function (a) {
                                    if (a) {
                                        window.location.href = "#page_share"
                                    }
                                })
                            } else if (d.status == 3002) {
                                confirmDialog("任务已结束", "请选择其他任务完成", "", "确定", "", function (a) {
                                })
                            } else if (d.status == 3003) {
                                confirmDialog("领取失败", "您已经完成过该任务", "", "确定", "", function (a) {
                                })
                            } else if (d.status == 3004) {
                                confirmDialog("任务已抢光", "请期待下一个任务", "", "确定", "", function (a) {
                                })
                            } else {
                                confirmDialog("", "领取失败", "", "确定", "", function () {
                                })
                            }
                        });
                    } else if (data.data.state == 2) {
                        showComment(data.data.task)
                    } else if (data.data.state == 3) {
                        confirmDialog("温馨提示", "是否放弃当前未完成的任务", "", "继续", "放弃", function (a) {
                            if (!a) {
                                applyTask(data.data.task.id, i.cr_key, function (d) {
                                    if (d.status == 1000) {
                                        showComment(d.data)
                                    } else if (d.status == 3001) {
                                        confirmDialog("任务未开始", "时间未到，请耐心等待！", "", "赚取更多", "继续等待", function (a) {
                                            if (a) {
                                                window.location.href = "#page_share"
                                            }
                                        })
                                    } else if (d.status == 3002) {
                                        confirmDialog("任务已结束", "请选择其他任务完成", "", "确定", "", function (a) {
                                        })
                                    } else if (d.status == 3003) {
                                        confirmDialog("领取失败", "您已经完成过该任务", "", "确定", "", function (a) {
                                        })
                                    } else if (d.status == 3004) {
                                        confirmDialog("任务已抢光", "请期待下一个任务", "", "确定", "", function (a) {
                                        })
                                    } else {
                                        confirmDialog("", "领取失败", "", "确定", "", function () {
                                        })
                                    }
                                });
                            } else {
                                showComment(data.data.doing_task);
                            }


                        })

                    }

                })
            }
        }
    }
}

function isBlank(str) {
    return str == null || str == "";
}

function isNum(str) {
    var re = /^[0-9]+$/;
    return re.test(str);
}

function formatDate1(timestamp) {
    now = new Date(timestamp);
    var month = now.getMonth() + 1;
    var date = now.getDate();
    var hour = now.getHours();
    var minute = now.getMinutes();
    var second = now.getSeconds();
    if (minute < 10) {
        minute = "0" + minute;
    }
    var cutime = new Date();
    var cumonth = cutime.getMonth() + 1;
    var cudate = cutime.getDate();
    if (month == cumonth && date == cudate) {
        return "今日" + hour + ":" + minute;
    } else if ((month == cumonth && date - 1 == cudate) || (month - 1 == cumonth && date == 1 && checkLastDate(cumonth) == cudate)) {
        return "明日" + hour + ":" + minute;
    } else {
        return date + "日" + hour + ":" + minute;
    }
}

function checkLastDate(month) {
    if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
        return 31
    } else if (month == 4 || month == 6 || month == 9 || month == 11) {
        return 30
    } else {
        return 28
    }
}

function formatDate2(timestamp) {
    now = new Date(timestamp);
    var year = now.getYear() + 1900;
    var month = now.getMonth() + 1;
    var date = now.getDate();
    var hour = now.getHours();
    var minute = now.getMinutes();
    var second = now.getSeconds();
    if (minute < 10) {
        minute = "0" + minute;
    }
    return year + "-" + month + "-" + date + " " + hour + ":" + minute;
}


function convertCanvasToImage(canvas) {
    var image = new Image();
    image.src = canvas.toDataURL("image/png");
    return image;
}