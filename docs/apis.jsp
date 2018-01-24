<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ticket = request.getParameter("kmdeveloper20161020") ;
if (ticket == null || ticket.trim().isEmpty() || !ticket.equals("1242893ASDGadfrgkayAdfakjdlg759068wifasdfasAdadWERyuLkoP")){
response.sendError(403) ;
return ;
}
String ctx = request.getContextPath();
%>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="api.css"/>
    <title>Suishen Games API Reference/Testing</title>
    <style type="text/css">
        ::-webkit-scrollbar {
            width: 10px;
            height: 7px;
        }
        ::-webkit-scrollbar-track {
            background-color: rgba(0, 0, 0, 0.0);
        }

        ::-webkit-scrollbar-track:hover {
            background-color: rgba(0, 0, 0, 0.05);
        }

        ::-webkit-scrollbar-thumb {
            background-color: rgba(0, 175, 219, 0.4);
        }

        ::-webkit-scrollbar-thumb:hover {
            background-color: rgba(0, 175, 219, 0.7);
        }
    </style>
</head>
<body class="gc-documentation">
<div id="gc-container">
    <div class="g-section g-tpl-170">
        <div class="g-unit g-first" id="gc-toc">
            <ul style="position: fixed; top: 0px; height: 100%; overflow: scroll;">
                <li>
                    <h2>Navigation</h2>
                    <ul>
                        <li><a href="#account"><strong>1. 账号相关接口</strong></a></li>
                        <li><a href="#1.1">1.1 动态密码登录</a></li>
                        <li><a href="#1.2">1.2 注销</a></li>
                        <li><a href="#1.3">1.3 获取验证码</a></li>
                        <li><a href="#1.3.1">1.3.1 获取验证码(H5)</a></li>
                        <li><a href="#1.4">1.4 邀请注册</a></li>
                        <li><a href="#1.5">1.5 获取用户推送通知别名</a></li>
                        <li><a href="#1.5.1">1.5.1 设置个推标签</a></li>
                        <li><a href="#1.6">1.6 查询账号是否已存在</a></li>
                        <li><a href="#1.7">1.7 微信服务号绑定</a></li>

                        <li><a href="#task"><strong>2. 任务相关接口</strong></a></li>
                        <li><a href="#2.1">2.1 分享任务列表</a></li>
                        <li><a href="#2.2">2.2 分享任务详情</a></li>
                        <li><a href="#2.3">2.3 获取分享链接</a></li>
                        <li><a href="#2.3.1">2.3.1 获取分享收徒得宝箱分享链接</a></li>
                        <li><a href="#2.4">2.4 领取分享任务</a></li>
                        <li><a href="#2.5">2.5 每日任务状态信息</a></li>
                        <li><a href="#2.6">2.6 新手任务状态信息</a></li>
                        <li><a href="#2.7">2.7 领取任务奖励(新手+每日任务)</a></li>
                        <li><a href="#2.8">2.8 查询各种任务奖励金币数</a></li>
                        <li><a href="#2.9">2.9 绑定邀请码</a></li>

                        <li><a href="#task"><strong>3. 用户相关接口</strong></a></li>
                        <li><a href="#3.1">3.1 我今日的任务</a></li>
                        <li><a href="#3.5">3.5 我更早的任务</a></li>
                        <li><a href="#3.2">3.2 <span style="text-decoration:line-through;">用户信息</span></a></li>
                        <li><a href="#3.2.0">3.2.0 用户信息V2</a></li>
                        <li><a href="#3.2.2">3.2.2 用户基本信息</a></li>
                        <li><a href="#3.2.1">3.2.1 修改用户信息</a></li>
                        <li><a href="#3.3">3.3 零钱收益明细</a></li>
                        <li><a href="#3.4">3.4 我的好友列表</a></li>
                        <li><a href="#3.4.1">3.4.1 鞭策好友</a></li>
                        <li><a href="#3.4.2">3.4.2 查询好友活跃信息</a></li>
                        <li><a href="#3.6">3.6 我的金币汇总</a></li>
                        <li><a href="#3.7">3.7 我的金币明细</a></li>
                        <li><a href="#3.8">3.8 搜索</a></li>
                        <li><a href="#3.8.0">3.8.0 确认有效搜索</a></li>
                        <li><a href="#3.8.1">3.8.1 查询搜索框关键字</a></li>
                        <li><a href="#3.8.2">3.8.2 查询搜索热门关键字</a></li>
                        <li><a href="#3.8.3">3.8.3 查询我的搜索任务</a></li>
                        <li><a href="#3.8.4">3.8.4 领取搜索任务奖励</a></li>
                        <li><a href="#3.9.1">3.9.1 <span style="text-decoration:line-through;">实时收益榜单</span></a></li>
                        <li><a href="#3.9.2">3.9.2 <span style="text-decoration:line-through;">昨日收益榜单</span></a></li>
                        <li><a href="#3.9.3">3.9.3 <span style="text-decoration:line-through;">总收益榜单</span></a></li>
                        <li><a href="#3.10">3.10 用户阅读记录</a></li>
                        <li><a href="#3.11">3.11 用户收藏记录</a></li>
                        <li><a href="#3.12">3.12 收藏</a></li>
                        <li><a href="#3.13">3.13 取消收藏</a></li>
                        <li><a href="#3.14">3.14 取消收藏(H5)</a></li>
                        <li><a href="#3.15">3.15 绑定微信</a></li>
                        <li><a href="#task"><strong>4. 提现相关接口</strong></a></li>
                        <li><a href="#4.1">4.1 <span style="text-decoration:line-through;">提现</span></a></li>
                        <li><a href="#4.6">4.6 <span style="text-decoration:line-through;">充值</span></a></li>
                        <li><a href="#4.2">4.2 提现/充值明细</a></li>
                        <li><a href="#4.3">4.3 绑定提现账号</a></li>
                        <li><a href="#4.4">4.4 获取用户已绑定的提现账号</a></li>
                        <li><a href="#4.5">4.5 最近的20条提现/充值记录</a></li>
                        <li><a href="#4.7">4.7 查询提现进度</a></li>
                        <li><a href="#task"><strong>6. 资讯/分类(频道)相关接口</strong></a></li>
                        <li><a href="#6.1">6.1 所有分类列表</a></li>
                        <li><a href="#6.2">6.2 用户已添加分类</a></li>
                        <li><a href="#6.3">6.3 用户未添加分类</a></li>
                        <li><a href="#6.4">6.4 添加分类</a></li>
                        <li><a href="#6.5">6.5 删除分类</a></li>
                        <li><a href="#6.6">6.6 获取分类下资讯列表</a></li>
                        <li><a href="#6.7">6.7 获取文章分享链接</a></li>
                        <li><a href="#6.8">6.8 新闻资讯top榜</a></li>
                        <li><a href="#6.9">6.9 视频资讯top榜</a></li>
                        <li><a href="#6.10">6.10 资讯详情</a></li>
                        <li><a href="#6.10.1">6.10.1 资讯详情V2</a></li>
                        <li><a href="#6.11">6.11 阅读资讯</a></li>
                        <li><a href="#6.11.1">6.11.1 阅读资讯V2</a></li>
                        <li><a href="#6.12">6.12 首页推荐资讯</a></li>
                        <li><a href="#6.13">6.13 资讯详情附加信息(相关推荐、评论)</a></li>
                        <li><a href="#6.14">6.14 阅读推送文章</a></li>
                        <li><a href="#6.15">6.15 获取头条的access_token</a></li>
                        <li><a href="#6.16">6.16 资讯信息流V2(适用各个频道,兼容头条)</a></li>
                        <li><a href="#6.17">6.17 资讯(包括快马直投广告)不喜欢</a></li>

                        <li><a href="#checkin"><strong>7. 签到相关接口</strong></a></li>
                        <li><a href="#7.1">7.1 获取签到配置信息</a></li>
                        <li><a href="#7.2">7.2 签到</a></li>
                        <li><a href="#7.2.1">7.2.1 普通签到</a></li>
                        <li><a href="#7.3">7.3 签到记录</a></li>
                        <li><a href="#redpack"><strong>8. 红包相关接口</strong></a></li>
                        <li><a href="#8.1">8.1 获取红包信息</a></li>
                        <li><a href="#8.2">8.2 领取红包</a></li>
                        <li><a href="#comment"><strong>9. 评论相关接口</strong></a></li>
                        <li><a href="#9.1">9.1 发表评论</a></li>
                        <li><a href="#9.1.1">9.1.1 查询评论基本信息</a></li>
                        <li><a href="#9.1.2">9.1.2 查询评论所属文章信息</a></li>
                        <li><a href="#9.2">9.2 查询评论详情</a></li>
                        <li><a href="#9.3">9.3 点赞</a></li>
                        <li><a href="#9.4">9.4 取消点赞</a></li>
                        <li><a href="#msg"><strong>10. 消息中心相关接口</strong></a></li>
                        <li><a href="#10.1">10.1 查询用户消息列表</a></li>
                        <li><a href="#10.1.1">10.1.1 查询系统消息列表</a></li>
                        <li><a href="#10.2">10.2 查询消息小红点</a></li>
                        <li><a href="#11.1">11.1 查询运营广告位</a></li>
                        <li><a href="#11.12">11.12 按广告位查询广告</a></li>
                        <li><a href="#11.13">11.13 查询每日新闻</a></li>
                        <li><a href="#11.2">11.2 查询弹窗</a></li>
                        <li><a href="#11.3">11.3 查询系统配置</a></li>
                        <li><a href="#msg"><strong>12. 兑吧相关接口</strong></a></li>
                        <li><a href="#12.1">12.1 获取兑吧自动登陆url</a></li>
                        <li><a href="#msg"><strong>13. 卡券相关接口</strong></a></li>
                        <li><a href="#13.1">13.1 查询可以购买的卡券列表</a></li>
                        <li><a href="#13.2">13.2 我的阅读加速信息</a></li>
                        <li><a href="#13.3">13.3 用户卡片列表</a></li>
                        <li><a href="#14.1">14.1 查询活动信息</a></li>
                        <li><a href="#14.2">14.2 领取活动奖励</a></li>
                        <li><a href="#14.3">14.3 报名参加活动</a></li>
                        <li><a href="#14.4">14.4 查询活动列表页</a></li>
                        <li><a href="#16.1">16.1 领取召回奖励</a></li>
                        <li><a href="#16.2">16.2 是否可领取召回奖励</a></li>
                        <li><a href="#box"><strong>17. 宝箱相关接口</strong></a></li>
                        <li><a href="#17.1">17.1 查询用户宝箱数</a></li>
                        <li><a href="#17.2">17.2 开宝箱</a></li>
                        <li><a href="#sgj"><strong>18. 时光机</strong></a></li>
                        <li><a href="#18.1">18.1 我的时光机数据</a></li>
                        <li><a href="#18.2">18.2 分享时光机</a></li>
                    </ul>
                </li>
            </ul>
            <div class="line"></div>
        </div>
        <div class="g-unit" id="gc-pagecontent" style="margin-left: 250px;">
            <div id="gc-header">
                <div id="search">
                    <div id="searchForm">
                        <div id="gsc-search-box">
                            <h1>Kuaima API Doc</h1>
                            <br/>
                            <div id="cs-searchresults" onclick="event.cancelBubble = true;"></div>
                            <div class="greytext">
                                updated:
                                <script language="javascript">
                                    document.write(new Date(
                                            document.lastModified));
                                </script>
                            </div>
                        </div>
                    </div>
                </div>
                <br/> <br/> <br/>
            </div>
            <a href="tips.jsp" target="_blank"><h2>API文档关键信息说明</h2></a>
            <h3 id="0.0">发送验证码接口，仅用于开发测试，手机号不一定是真实号码,验证码会直接返回</h3>
            <form action="http://test.kuaima.cn/user_center/api/inner/test/verify_code?&inner-call-secret=PjLrrcmHMkioaCOgmUTmlNJKyLSVRwCKhguDEdfRqsVmWuJHyFvrUZqDrLbpHGIR"
                  method="get">
                <input style="width: 200px" name="inner-call-secret" type="hidden"
                       value='PjLrrcmHMkioaCOgmUTmlNJKyLSVRwCKhguDEdfRqsVmWuJHyFvrUZqDrLbpHGIR'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="4">xxxxx</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="4">POST</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">phone</font></td>
                        <td>String</td>
                        <td><input style="width: 200px" name="phone" type="text"
                                   value=''/></td>
                        <td>必须是手机号，用于接受验证码</td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td></td>
                    </tr>
                </table>
            </form>
            <hr/>
            <h3 id="1.1">1.1 动态密码登陆</h3>
            <form action="<%=ctx%>/api/v1/login/dynamicPwd" method="post">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="4"><%=ctx%>/api/v1/login/dynamicPwd</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="4">POST</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">x</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="x" type="text"
                                   value=''/></td>
                        <td>用户登录信息，须使用DESede加密：<br/> {<br/>"phone":"18652946698",<br/>"pwd":"123456",<br/>"platform":"ANDROID",<br/>"idfa":"7Hi1Ho6q3obqGYtUKBr3XktWcV3MqIax"<br/>}
                        </td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                            登录成功返回:
                            {<br/>
                            "uid":100012345671, <br/>
                            "acctk":"sdjfjsndfksfnsk",<br/>
                            "nick_name":"",<br/>
                            "avatar":"",<br/>
                            "phone":""<br/>
                            "is_junior":true<br/>
                            "junior_guide_article_id":"12"<br/>
                            "team_id":1111<br/>
                            "has_posted":true<br/>
                            "is_bind_wx":true //是否绑定微信<br/>


                            }
                            <br/>
                            失败：1002参数错误；1004服务器错误；
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="1.2">1.2 注销</h3>
            <form action="<%=ctx%>/api/v1/logout" method="post">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="4"><%=ctx%>/api/v1/logout</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="4">POST</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>--------</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="1.3">1.3 获取验证码</h3>
            <form action="<%=ctx%>/api/v1/verify_code" method="get">
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="4"><%=ctx%>/api/v1/verify_code</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="4">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                    </tr>
                    
                    <tr>
                        <td>opt</td>
                        <td><font color="red">phone</font></td>
                        <td>String</td>
                        <td><input style="width: 200px" name="phone" type="text" value=''/></td>
                        <td>手机号<font color="red"></font></td>
                    </tr>
                    <tr>
                        <td>option</td>
                        <td><font color="red">uid</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="uid" type="text" value=''/></td>
                        <td>uid<font color="red"></font></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">type</font></td>
                        <td>string</td>
                        <td><select name="type">
                            <option value="SMS">SMS</option>
                            <option value="VOICE">VOICE</option>
                        </select></td>
                        <td>发送方式 VOICE:语音 SMS：短信</td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>手机号和uid必须有一个; 1002 参数错误; 2002 用户不存在; 2003 获取验证码太过频繁; 1008账号已存在;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="1.3.1">1.3.1 获取验证码(h5页面使用,邀请注册、提现)</h3>
            <form action="<%=ctx%>/api/v1/verify_code/web" method="get">
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="4"><%=ctx%>/api/v1/verify_code/web</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="4">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                    </tr>
                    
                    <tr>
                        <td>opt</td>
                        <td><font color="red">phone</font></td>
                        <td>String</td>
                        <td><input style="width: 200px" name="phone" type="text"
                                   value=''/></td>
                        <td>手机号<font color="red"></font></td>
                    </tr>
                    <tr>
                        <td>option</td>
                        <td><font color="red">uid</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="uid" type="text" value=''/></td>
                        <td>uid<font color="red"></font></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">type</font></td>
                        <td>string</td>
                        <td><select name="type">
                            <option value="SMS">SMS</option>
                            <option value="VOICE">VOICE</option>
                        </select></td>
                        <td>发送方式 VOICE:语音 SMS：短信</td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">useto</font></td>
                        <td>string</td>
                        <td>
                            <select name="useto">
                                <option value="register">register</option>
                                <option value="joinTeam">joinTeam</option>
                                <option value="bindAccount">bindAccount</option>
                            </select>
                        </td>
                        <td>验证码用途: 注册、加入团队、绑定账号</td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>手机号和uid必须有一个; 1002 参数错误; 2002 用户不存在; 2003 获取验证码太过频繁; 1008账号已存在; 9902已经加入团队;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="1.4">1.4 邀请注册</h3>
            <form action="<%=ctx%>/api/v1/register/invite" method="get">
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="4"><%=ctx%>/api/v1/register/invite</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="4">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">phone</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="phone" type="text"
                                   value='15996242646'/></td>
                        <td>手机号</td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">verify_code</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="verify_code" type="text"
                                   value='1234'/></td>
                        <td>验证码</td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">fu</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="fu" type="text"
                                   value='1235'/></td>
                        <td>邀请者uid</td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">app_key</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="app_key" type="text"
                                   value='28817749'/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>注册成功返回:{<br/>"uid":100012345671, <br/>"acctk":"sdjfjsndfksfnsk"<br/>}<br/>
                            失败：1002参数错误；1008账号已存在; 2001验证码错误;
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="1.5">1.5 获取用户推送通知别名</h3>
            <form action="<%=ctx%>/api/v1/user/alias?uid=123" method="get">
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="4"><%=ctx%>/api/v1/user/alias</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="4">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">app_key</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="app_key" type="text"
                                   value='28817749'/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>成功返回:{<br/>"alias":"c4ca4238a0b923820dcc509a6f75849b","alias_type":"kuaima"<br/>}<br/>
                            失败：1002参数错误；1004 尚未登录;
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="1.5.1">1.5.1 设置个推标签</h3>
            <form action="<%=ctx%>/api/v1/user/setTags" method="get">
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="4"><%=ctx%>/api/v1/user/setTags</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="4">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">app_key</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="app_key" type="text"
                                   value='28817749'/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">cid</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="cid" type="text"
                                   value=''/></td>
                        <td>个推cid, server用来给设备打标签</td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>1002参数错误；</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="1.6">1.6 判断账号(手机号)是否已注册</h3>
            <form action="<%=ctx%>/api/v1/account/exists" method="get">
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="4"><%=ctx%>/api/v1/account/exists</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="4">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                    </tr>
                    
                    <tr>
                        <td>must</td>
                        <td><font color="red">phone</font></td>
                        <td>String</td>
                        <td><input style="width: 200px" name="phone" type="text"
                                   value=''/></td>
                        <td>手机号<font color="red"></font></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>1002参数错误;
                             <pre>
                             {
                             data: {
                                exists: true // true 已存在; false 不存在
                             },
                             desc: "",
                             status: 1000
                             }
                             </pre>
                        </td>
                    </tr>
                </table>
            </form>
            <h3 id="1.7">1.7 微信服务号绑定</h3>
            <form action="<%=ctx%>/api/v1/register/bind_wx" method="get">
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="4"><%=ctx%>/api/v1/register/bind_wx</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="4">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                    </tr>
                    
                    <tr>
                        <td>must</td>
                        <td><font color="red">code</font></td>
                        <td>String</td>
                        <td><input style="width: 200px" name="code" type="text"
                                   value=''/></td>
                        <td>微信授权后返回的code<font color="red"></font></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">phone</font></td>
                        <td>String</td>
                        <td><input style="width: 200px" name="phone" type="text"
                                   value=''/></td>
                        <td>手机号<font color="red"></font></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">verify_code</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="verify_code" type="text"
                                   value='1234'/></td>
                        <td>验证码</td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>1002参数错误;
                             <pre>
{
    data: {
        auth_token: "fsdfsdfsdfsdfdfdsdfee"
    },
    status: 1000,
    desc: "OK"
}
                             </pre>
                        </td>
                        <td>
                            </td>
                        1000 OK;<br/>1007 服务器错误<br/>
                    </tr>
                </table>
            </form>

            <h3 id="2.1">2.1 分享任务列表</h3>
            <form action="<%=ctx%>/api/v1/tasks/socialShare" method="get">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/tasks/socialShare</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page" type="text" value=''/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page_size</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page_size" type="text"
                                   value=''/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                             <pre>
                                {
                                total: 1,
                                page: 1,
                                data: [
                                {
                                id: 2,
                                type: "COIN_SHARE_TASK", // 赏金任务类型  COIN_SHARE_TASK金币任务,单位:金币; CASH_SHARE_TASK现金任务 单位:元
                                status: 3, // 任务状态 2下架  3展示
                                name: "都说ESP很重要 真的有那么神吗？", // 任务名称
                                image: "",
                                origin_url: http://ud.xd.188021.cn/v1/article2.jsp?adid=134&taskid=281&code=68744,
                                url: http://localhost:8080/km_task/v1/article/5?code=MA==, // 任务详情地址
                                total_count: 10000, // 总投放阅读数
                                left_count: 10000, // 剩余阅读数
                                price: 0.02, // 单次阅读价格
                                task_type: 2, // 任务类型: 1普通赏金任务 2微信任务
                                pay_method: 1, // 结算方式 4:按微信内有效阅读, 5:按QQ内有效阅读, 6:按QQ空间内有效阅读, 7:按新浪微博内有效阅读 8:按朋友圈内有效阅读
                                share_method: SYSTEM, // 分享方式:SYSTEM 系统分享 DIRECT 直接分享
                                pay_method_desc: "按微信内有效阅读数", // 结算方式描述
                                task_type_desc: "微信任务", // 任务类型描述, 为空串则客户端不显示
                                area: "全国", // 投放区域
                                prompt: "分享后请至【我的】-【我的任务】中查看", // 温馨提示
                                detail: "将本文分享给朋友,有朋友阅读,立获现金", // 任务说明
                                share_description: "你真的了解ESP吗？", // 分享描述
                                content_source: "article" // 内容来源:ad广告 article文章
                                is_share: false, // 是否已分享
                                content_model: "{"project":"km_browser","table":"social_share_task","md":"10001","id":"46"}",//dmp统计
                                end_time: 1477065540000 // 截止时间
                                }
                                ],
                                status: 1000,
                                desc: "OK"
                                }
                             </pre>
                        </td>
                        <td>1000 OK;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="2.2">2.2 分享任务详情</h3>
            <form action="<%=ctx%>/api/v1/task/socialShare/1" method="get">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/task/socialShare/{taskId}</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">uid</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="uid" type="text" value=''/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                             <pre>
                                {
                                total: 1,
                                page: 1,
                                data:
                                {
                                id: 2,
                                type: "COIN_SHARE_TASK", // 赏金任务类型  COIN_SHARE_TASK金币任务,单位:金币; CASH_SHARE_TASK现金任务 单位:元
                                status: 3, // 任务状态 2下架  3展示
                                name: "都说ESP很重要 真的有那么神吗？", // 任务名称
                                image: "",
                                origin_url: http://ud.xd.188021.cn/v1/article2.jsp?adid=134&taskid=281&code=68744,
                                url: http://localhost:8080/km_task/v1/article/5?code=MA==,
                                total_count: 10000, // 总投放阅读数
                                left_count: 10000, // 剩余阅读数
                                price: 0.02, // 单次阅读价格
                                pay_method: 1, // 结算方式 4:按微信内有效阅读, 5:按QQ内有效阅读, 6:按QQ空间内有效阅读, 7:按新浪微博内有效阅读 8:按朋友圈内有效阅读
                                share_method: SYSTEM, // 分享方式:SYSTEM 系统分享 DIRECT 直接分享
                                area: "全国", // 投放区域
                                prompt: "分享后请至【我的】-【我的任务】中查看", // 温馨提示
                                detail: "将本文分享给朋友,有朋友阅读,立获现金", // 任务说明
                                share_description: "你真的了解ESP吗？", // 分享描述
                                content_source: "article" // 内容来源:ad广告 article文章
                                is_share: false, // 是否已分享
                                end_time: 1477065540000 // 截止时间
                                },
                                status: 1000,
                                desc: "OK"
                                }
                             </pre>
                        </td>
                        <td>1000 OK; </br>3013 任务不存在;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="2.3">2.3 获取分享链接</h3>
            <form action="<%=ctx%>/api/v1/task/shareUrl/1" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/task/shareUrl/{taskId}</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">uid</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="uid" type="text" value='123'/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
  "data": {
    "title": "太恐怖了",
    "image": "http://imgcom.static.suishenyun.net/crawl/background/17b8192a-ebe8-433a-8139-199d7ca492b0.png",
    "share_url": "http://localhost:8080/km_task/v1/task/2?code=MTIz",
    "share_description": "神秘偶像剧出现灵异事件，半夜拍床戏女主角竟然被“换头”太恐怖了！",
    "content_summary": "神秘偶像剧出现灵异事件，半夜拍床戏女主角竟然被“换头”太恐怖了！哈哈哈哈" // 分享内容概要
    "added_time":139000220001
  },
  "desc": "",
  "status": 1000
}
</pre>
                        </td>
                        <td>1000 OK; </br>1004 尚未登录;</br> 3013 任务不存在; </br>3002 任务已经结束<br/>3004 任务数量不足</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
        <h3 id="2.3.1">2.3.1 获取分享收徒得宝箱分享链接</h3>
        <form action="<%=ctx%>/v1/inviteAct/shareUrl" method="get">
            
            
            <table>
                <tr>
                    <th>地址</th>
                    <th colspan="5"><%=ctx%>/v1/inviteAct/shareUrl</th>
                </tr>
                <tr>
                    <th>方法</th>
                    <th colspan="5">GET</th>
                </tr>
                <tr>
                    <th>必要性</th>
                    <th>参数名</th>
                    <th>类型</th>
                    <th>测试</th>
                    <th>说明</th>
                    <th>返回码</th>
                </tr>
                <tr>
                    <td>--------</td>
                    <td>--------</td>
                    <td>--------</td>
                    <td><input name="" type="submit" value="提交"/></td>
                    <td>
<pre>
{
"data": {
"title": "太恐怖了",
"share_url": "http://localhost:8080/",
"share_description": "邀请好友,开启神秘奖励之旅",
},
"desc": "",
"status": 1000
}
</pre>
                    </td>
                    <td></td>
                </tr>
            </table>
        </form>
            <h3 id="2.4">2.4 领取分享任务</h3>
            <form action="<%=ctx%>/api/v1/task/receive/1" method="post">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/task/receive/{taskId}</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">POST</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                        </td>
                        <td>1000 OK; </br>1004 尚未登录;</br> 3013 任务不存在; </br>3002 任务已经结束<br/>3004 任务数量不足<br/>
                            3015 已达到任务领取数限制<br/> 如果已领取,直接返回成功
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="2.5">2.5 每日任务状态信息</h3>
            <form action="<%=ctx%>/api/v1/task/daily" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/task/daily</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">ver_name</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="ver_name" type="text" value='1.4.5'/></td>
                        <td>客户端版本号如:1.4.5</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
  "data": {
    "search_task_status": "100/300", // 搜索任务状态
    "show_share_km":true, // 是否显示分享快马任务
    "has_shared_km": false, // 是否已分享快马,已分享H5调用client分享schema时告诉客户端,分享后不再请求接口+金币
    "show_daily_fuli":true, // 是否显示每日福利任务,返回false不展示
    "has_join_fuli_act": false, // 是否已参与福利活动  show_daily_fuli为true才返回此字段
    "daily_fuli_task": {// 每日福利任务详情  show_daily_fuli为true才返回此字段
        "origin_url":"http://wwww"
    },
    "has_caiji_permission": false,  // 是否有采集权限
    "read_push_status": "10/60", // 阅读推送文章状态
    "has_bind_invite_code": false,  // 是否绑定了邀请码

  },
  "desc": "",
  "status": 1000
}
</pre>
                        </td>
                        <td>1000 OK; </br>1004 尚未登录;</td>
                    </tr>
                </table>
            </form>
<p>&nbsp;</p>
            <h3 id="2.6">2.6 新手任务状态信息</h3>
            <form action="<%=ctx%>/api/v1/task/junior" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/task/junior</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
  "data": {
    "show_junior_task":true, // 是否要显示新手任务, 返回false, 任务页面不展示新手任务区
    "receive_junior_reward_day_num":0,  // 已领取奖励的天数
    "can_receive_junior_reward_day_num":0,  // 可以领取新人奖励天数, 为0表示当前没有可以领取的奖励
    "has_read_tutorial": false, // 是否已阅读新手教程
    "has_first_read_article": false, // 是否已首次有效阅读文章
    "has_first_search": false,  // 是否已首次搜索
    "has_first_withdraw": false,  // 是否已首次提现
  },
  "desc": "",
  "status": 1000
}
</pre>
                        </td>
                        <td>1000 OK; </br>1004 尚未登录;</td>
                    </tr>
                </table>
            </form>
<p>&nbsp;</p>
            <h3 id="2.7">2.7 领取任务奖励(新手+每日任务)</h3>
            <form action="<%=ctx%>/api/v1/task/receiveReward" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/task/receiveReward</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">ver_name</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="ver_name" type="text" value='1.4.5'/></td>
                        <td>客户端版本号如:1.4.5</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">eventType</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="eventType" type="text" value='join_fuli_act'/></td>
                        <td>
<pre>
junior_first_day_reward // 新用户第一天登陆奖励
junior_second_day_reward
junior_third_day_reward
junior_fourth_day_reward
junior_fifth_day_reward
junior_sixth_day_reward
junior_seventh_day_reward // 第7天登陆,3天加速卡
read_tutorial // 阅读新手教程
join_fuli_act // 参与福利活动
share_kuaima // 分享快马 H5调用schema通过客户端完成分享,客户端请求接口+金币,金币数和是否已分享过由schema传给client
junior_first_withdraw // 新用户首次提现
</pre>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                        1000 OK; </br>1004 尚未登录; 1014非新用户; 1005禁止操作(已阅读新手教学、已参与新手福利等、未到奖励领取时间、金币结算时间,请稍后再来!、新手提现, 仅限一次、余额不足!) 1002 无效的金币事件 9300要领取的卡券不存在 1007领取失败
                        </td>
                        <td>
                         </td>
                    </tr>
                </table>
            </form>
<p>&nbsp;</p>
            <h3 id="2.8">2.8 查询各种任务奖励金币数</h3>
            <form action="<%=ctx%>/api/v1/task/rewardCoin" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/task/rewardCoin</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">eventType</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="eventType" type="text" value='read_tutorial'/></td>
                        <td>
<pre>
junior_first_day_reward // 新用户第一天登陆奖励
junior_second_day_reward
junior_third_day_reward
junior_fourth_day_reward
junior_fifth_day_reward
junior_sixth_day_reward
junior_seventh_day_reward // 第7天登陆,3天加速卡
read_tutorial // 阅读新手教程
join_fuli_act // 参与福利活动
share_kuaima // 分享快马
</pre>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                        查询各种任务奖励金币数,eventType不传返回所有;
                        </td>
                        <td>
                         </td>
                    </tr>
                </table>
            </form>
            <h3 id="2.9">2.9 绑定邀请码</h3>
            <form action="<%=ctx%>/api/v1/inviteRelation/bind/{inviteCode}" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/inviteRelation/bind/{inviteCode}</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
    status: 1000,
    desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>1002 参数错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>

            <h3 id="3.1">3.1 我今日的任务</h3>
            <form action="<%=ctx%>/api/v1/orders/socialShare/today" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/orders/socialShare/today</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
 <pre>
    {
      "data":
      {"today_tasks":
          [
            {
              "id": 1,
              "status": 1, // 状态 0异常  1已领取  2已完成
              "task_id": 1,
              "type": "COIN_SHARE_TASK", // 任务类型  COIN_SHARE_TASK金币任务
              "uid": 1234,
              "task_name": "都说ESP很重要 真的有那么神吗？",
              "task_image": "http://",
              "commission": 0,
              "added_time": 1476972912452,
              "expire_time": 1476972912452 // 过期时间
            }
          ],
         "today_left_share_num":4
      },
      "status": 1000,
      "desc": "OK"
    }
 </pre>
                        </td>
                        <td>1000 OK; </br>1004 尚未登录;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <h3 id="3.5">3.5 我更早的任务</h3>
            <form action="<%=ctx%>/api/v1/orders/socialShare/previous" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/orders/socialShare/previous</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page" type="text" value=''/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page_size</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page_size" type="text"
                                   value=''/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
 <pre>
    {
      "total": 1,
      "page": 1,
      "data": [
        {
          "id": 1,
          "status": 1, // 状态 0异常  1已领取  2已完成
          "task_id": 1,
          "type": "COIN_SHARE_TASK", // 任务类型  COIN_SHARE_TASK金币任务
          "uid": 1234,
          "task_name": "都说ESP很重要 真的有那么神吗？",
          "task_image": "http://",
          "commission": 0,
          "added_time": 1476972912452,
          "expire_time": 1476972912452 // 过期时间
        }
      ],
      "status": 1000,
      "desc": "OK"
    }
 </pre>
                        </td>
                        <td>1000 OK; </br>1004 尚未登录;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="3.2.0">3.2.0 用户信息V2</h3>
            <form action="<%=ctx%>/api/v2/userinfo/378627" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v2/userinfo/{uid}</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                             <pre>
                                {
                                  "data": {
                                    "uid": 1234,
                                    "phone": "159****2646",
                                    "avatar": "http://sss.jpg", // 头像
                                    "nick_name": "昵称",
                                    "yue": 0, // 余额
                                    "today_coin_income": 0, // 今日金币
                                    "post_num":3, // 采集数
                                    "son_num":3, // 徒弟数
                                    "collect_num":1, // 收藏数
                                    "is_junior":true, // 是否新用户
                                    "junior_guide_article_id":996,//新手引导文章id
                                    "is_bind_alipay": true // 是否已绑定支付宝账号
                                    "team_id": 11 // 我的团队ID
                                    "has_box":true // 是否有宝箱可开启 true是, false 否
                                    "has_posted":true
                                    "is_bind_wx":true //是否绑定微信

                                  },
                                  "status": 1000,
                                  "desc": "OK"
                                }
                             </pre>
                        </td>
                        <td>1000 OK; </br>1004 尚未登录;</br> 2002用户不存在</td>
                    </tr>
                </table>
            </form>
            <h3 id="3.2.2">3.2.2 用户基本信息</h3>
            <form action="<%=ctx%>/api/v1/userinfo/base" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/userinfo/base</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                             <pre>
                                {
                                  "data": {
                                    "phone": "159****2646",
                                    "avatar": "http://sss.jpg", // 头像
                                    "nick": "昵称",
                                    "all_income": 120.3, // 总收益
                                    "team_id": 12, // 团队id
                                    "invite_code": A78834981, // 邀请码
                                  },
                                  "status": 1000,
                                  "desc": "OK"
                                }
                             </pre>
                        </td>
                        <td>1000 OK; </br>1004 尚未登录;</br> 2002用户不存在</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="3.2.1">3.2.1 修改用户信息</h3>
            <form action="<%=ctx%>/api/v1/userinfo/update" method="post">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="4"><%=ctx%>/api/v1/userinfo/update</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="4">POST</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">body</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="x" type="text"
                                   value=''/></td>
                        <td>
                            <pre>
                            {
                                "uid" : 378627,
                                "nick_name" : "昵称",
                                "avatar" : "http://wwww.jpg"
                            }
                            修改什么传什么, 没有修改传空串
                            </pre>
                        </td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>昵称和头像必须有个不能为空; 昵称不能超过10个字符; 1012昵称已经存在; 1000修改成功,返回修改后的用户信息
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="3.3">3.3 收益明细</h3>
            <form action="<%=ctx%>/api/v1/income/list" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/income/list</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">uid</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="uid" type="text" value=''/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page" type="text" value=''/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page_size</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page_size" type="text"
                                   value=''/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
 <pre>
    {
    total: 1,
    data: [
    {
    amount: 0.5,
    subject: "完成任务:腾讯手机管家",
    image: "http://img1000.static.suishenyun.net/2.png",
    out_unique_id: "2124197",
    added_time: 1477015204080
    },
    {
    amount: 0.5,
    subject: "完成任务:签到",
    image: "http://img1000.static.suishenyun.net/.png",
    out_unique_id: "2094433",
    added_time: 1476928809226
    }
    ],
    desc: "OK",
    status: 1000,
    page: 1
    }
 </pre>
                        </td>
                        <td>1000 OK; </br>1004 尚未登录;</br> 1020 没有数据</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="3.4">3.4 我的好友列表</h3>
            <form action="<%=ctx%>/api/v1/inviteRelation/friends" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/inviteRelation/friends</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">uid</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="uid" type="text" value='118936'/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">orderBy</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="orderBy" type="text" value='added_time'/></td>
                        <td>排序字段 added_time注册时间;recent_active_time 最近活跃时间; bring_profit_to_from给师傅带来的收益;</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">order</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="order" type="text" value='desc'/></td>
                        <td>排序方式 desc降序 asc升序</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page" type="text" value=''/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page_size</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page_size" type="text"
                                   value=''/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
  "data": {
    "list": [
            {
            id: 105,
            to_uid: 261223, // 徒弟uid
            avatar: "http://xx.jpg" // 徒弟头像
            nick: "nick" // 徒弟昵称
            can_remind: true // 是否可以鞭策
            can_invite_join_team: true // 是否允许邀请入团
            remind_cost_coin: 0 // 鞭策所需金币,  小于等于0显示免费。
            recent_active_time: 1469759836462, // 最近活跃时间
            bring_profit_to_from: 0, // 给我带来的收益
            register_time:1469759836462,// 注册时间
            added_time: 1469759836462,// 绑定师傅时间
            new_active:true, // 是否处于活跃期(注册30天内)
            }
          ],
     "page":1,
     "total_page":1,
     "total": 1
   }
  "status": 1000,
  "desc": "OK"
}
</pre>
                        </td>
                        <td>1000 OK; </br>1004 尚未登录;</br> 1020 没有数据</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="3.4.1">3.4.1 鞭策好友</h3>
            <form action="<%=ctx%>/api/v1/inviteRelation/remind" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/inviteRelation/remind</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">son_uid</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="son_uid" type="text" value='118936'/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
         <pre>
            {
              "status": 1000,
              "desc": "OK"
            }
         </pre>
                        </td>
                        <td>1000 OK; </br>1004 尚未登录; </br> 2002 徒弟不存在; 9102 每个徒弟,每天只能被提醒一次哦; 9103 晚22点-早8点不能提醒徒弟哦</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="3.4.2">3.4.2 查询好友活跃天数信息</h3>
            <form action="<%=ctx%>/api/v1/inviteRelation/friends/active" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/inviteRelation/friends/active</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">son_uid</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="son_uid" type="text" value='118936'/></td>
                        <td></td>
                        <td>徒弟uid</td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
  "data": {
        had_active_day:2, // 已活跃天数
        left_active_day:28 // 剩余活跃天数
   }
  "status": 1000,
  "desc": "OK"
}
</pre>
                        </td>
                        <td>1000 OK; </br>1004 尚未登录;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="3.6">3.6 我的金币汇总</h3>
            <form action="<%=ctx%>/api/v1/coin/info?uid=123&app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/coin/info</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                             <pre>
                                {
                                  "data": {
                                    totalIncome: 100, // 总收益
                                    yue: 15.2, // 余额
                                    yesterdayIncome:  3.8,// 昨日收益
                                    yesterdayExchangeRate:0.52 // 昨日汇率,
                                    serverHour:6, // server当前小时 前端判断是否允许提现
                                  },
                                  "status": 1000,
                                  "desc": "OK"
                                }
                             </pre>
                        </td>
                        <td>1000 OK; </br>1004 尚未登录;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="3.7">3.7 我的金币明细</h3>
            <form action="<%=ctx%>/api/v1/coin/list?uid=123&app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/coin/list</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page" type="text" value=''/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page_size</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page_size" type="text"
                                   value=''/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
 <pre>
    {
    total: 1,
    data: [
        {
          "coin": 14, // 金币数
          "msg": "领取红包", // 金币收入描述
          "opt": "add", // add表示+金币, subtract表示-金币
          "added_time": 1481179025795
        }
    ],
    desc: "OK",
    status: 1000,
    page: 1
    }
 </pre>
                        </td>
                        <td>1000 OK; </br>1004 尚未登录;</br> 1020 没有数据</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="3.8">3.8 搜索</h3>
            <form action="<%=ctx%>/api/v1/search?app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/search</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">keyword</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="keyword" type="text" value=''/></td>
                        <td></td>
                        <td>搜索关键字</td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">source</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="source" type="source" value='1'/></td>
                        <td></td>
                        <td>搜索来源, source取值: 1首页搜索框 2搜索任务热词 3首页热词</td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                        </td>
                        <td>
<pre>
{
data: {
    url: "http://wap.sogou.com/web/sl?bid=sogo&keyword=ssss"
},
desc: "",
status: 1000
}
</pre>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="3.8.0">3.8.0 确认有效搜索</h3>
            <form action="<%=ctx%>/api/v1/confirmSearch?app_key=28817749" method="post">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/confirmSearch</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">POST</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">keyword</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="keyword" type="text" value=''/></td>
                        <td></td>
                        <td>搜索关键字</td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">source</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="source" type="source" value='1'/></td>
                        <td></td>
                        <td>搜索来源, source取值: 1首页搜索框 2搜索任务热词 3首页热词</td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td>
                            <input name="" type="submit" value="提交"/>
                        </td>
                        <td>
                        1004 未登录
                        </td>
                        <td>
<pre>
{
data: {
    "is_valid": true, // 是否有效搜索
    "is_junior_first_search" : true, // 是否新用户首次搜索, 为true弹toast提醒用户
    "junior_first_search_alert" : "新手搜索任务,+500金币" // toast文案
    "is_obtain_box":true // 是否获得宝箱(注意接口返回的json中有可能没有这个字段)
},
desc: "",
status: 1000
}
</pre>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="3.8.1">3.8.1 查询搜索框关键字</h3>
            <form action="<%=ctx%>/api/v1/search/keyword/box?app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/search/keyword/box</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td>
                            <input name="" type="submit" value="提交"/>
                        </td>
                        <td>
                            1020   没有结果
                        </td>
                        <td>
<pre>
{
    "data": {
       "keyword":["中邮战略","中邮信息产业","中邮信息"]
    },
    "desc":"",
    "status":1000
}
</pre>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="3.8.2">3.8.2 查询搜索热门关键字</h3>
            <form action="<%=ctx%>/api/v1/search/keyword/hot?app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/search/keyword/hot</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                        </td>
                        <td>
                            <pre>
                            {
                            data: {
                            "searchHotKeywords": [
                                "快马",
                                "快马浏览器"
                            ]
                            },
                            desc: "",
                            status: 1000
                            }
                            </pre>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="3.8.3">3.8.3 查询我的搜索任务</h3>
            <form action="<%=ctx%>/api/v1/search/task?app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/search/task</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
data: {
    searchHotKeywords: [ ], // 热门关键词
    todaySearchKeywordNum: 0, // 今日已搜索的关键词个数
    isReceiveRewardFlags: {
        10: false, // 是否已领取10个搜索关键词奖励
        20: false,
        30: false
    }
},
desc: "",
status: 1000
}
</pre>
                        </td>
                        <td>
                            1004未登录;
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="3.8.4">3.8.4 领取搜索任务奖励</h3>
            <form action="<%=ctx%>/api/v1/searchReward/receive?app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/searchReward/receive</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">searchKeywordNum</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="searchKeywordNum" type="text" value='10'/></td>
                        <td></td>
                        <td>已搜索的关键字个数(10 、 20、 30)</td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
 <pre>
 {
 status: 1002,
 desc: "无效的搜索关键词个数"
 }
 </pre>
                        </td>
                        <td>
                            1004未登录; <br/>9400 搜索任务奖励已领取; <br/>9401 未达到搜索次数; <br/>1007 服务器错误
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="3.10">3.10 用户阅读记录(显示最近阅读的100条记录)</h3>
            <form action="<%=ctx%>/api/v1/readArticles?app_key=28817749&uid=378627" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/readArticles</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
   {
   total: 1,
   data: [
       {
           id: 7,
           uid: 378627,
           article_id: 401011,
 // obj_type为2, type:1图文 2视频; obj_type为3, type:1文章 2图片 3资源; 客户端、H5根据图片url后缀判断是否是动图
           obj_type:2, // 2文章 3采集
           type: 1,
           url: "http://news.zhwnl.cn/article.html?id=401011",
           title: "在东北农村做乡村淘宝是什么体验？",
           layout: 3,
           source: "新周刊",
           view_num: 21,
           added_time: 1491389287450,
           images: [
               "https://zkres2.myzaker.com/201704/58e455d41bc8e07d51000048_640.jpg",
               "https://zkres2.myzaker.com/201704/58e455d41bc8e07d51000047_640.jpg",
               "https://zkres1.myzaker.com/201704/58e455d41bc8e07d51000049_640.jpg"
           ]
       }
   ],
   desc: "OK",
   status: 1000,
   page: 1
   }
</pre>
                        </td>
                        <td>
                            1004 未登录;
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="3.11">3.11 用户收藏列表</h3>
            <form action="<%=ctx%>/api/v1/collectArticles?app_key=28817749&uid=378627" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/collectArticles</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
   {
   total: 1,
   data: [
       {
           id: 7,
           uid: 378627,
           article_id: 401011,
           obj_type:2, // 2文章 3采集
// obj_type为2, type:1图文 2视频; obj_type为3, type:1文章 2图片 3资源; 客户端、H5根据图片url后缀判断是否是动图
           type: 1,
           url: "http://news.zhwnl.cn/article.html?id=401011",
           title: "在东北农村做乡村淘宝是什么体验？",
           layout: 3,
           source: "新周刊",
           view_num: 21,
           added_time: 1491389287450,
           images: [
               "https://zkres2.myzaker.com/201704/58e455d41bc8e07d51000048_640.jpg",
               "https://zkres2.myzaker.com/201704/58e455d41bc8e07d51000047_640.jpg",
               "https://zkres1.myzaker.com/201704/58e455d41bc8e07d51000049_640.jpg"
           ]
       }
   ],
   desc: "OK",
   status: 1000,
   page: 1
   }
</pre>
                        </td>
                        <td>
                            1004 未登录;
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="3.12">3.12 收藏</h3>
            <form action="<%=ctx%>/api/v1/collectArticles/collect?app_key=28817749&uid=378627"
                  method="post">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/collectArticles/collect</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">POST</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">articleId</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="articleId" type="text" value='141896'/></td>
                        <td>
                            收藏的文章id
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">objType</font></td>
                        <td>int</td>
                        <td><input style="width: 200px" name="objType" type="text" value='2'/></td>
                        <td>收藏对象类型 2文章 3采集 默认取2</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                            1000 OK; </br> 1002 参数错误</br> 1004尚未登录 </br>8001文章不存在或已被删除</br> 8005已收藏 9703 采集文章不存在或已被删除
                        </td>
                        <td></td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="3.13">3.13 取消收藏</h3>
            <form action="<%=ctx%>/api/v1/collectArticles/delete" method="post">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/collectArticles/delete</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">POST</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">articleId</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="articleId" type="text" value='141896'/></td>
                        <td>
                            文章id
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">objType</font></td>
                        <td>int</td>
                        <td><input style="width: 200px" name="objType" type="text" value='2'/></td>
                        <td>收藏对象类型 2文章 3采集 默认取2</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                             <pre>

                             </pre>
                        </td>
                        <td>1000 OK; </br> 1002 参数错误 </br> 1004尚未登录</br> 8006尚未收藏</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="3.14">3.14 取消收藏(H5)</h3>
            <form action="<%=ctx%>/api/v1/collectArticles/delete/1" method="get">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/collectArticles/delete/{id}</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">objType</font></td>
                        <td>int</td>
                        <td><input style="width: 200px" name="objType" type="text" value='2'/></td>
                        <td>收藏对象类型 2文章 3采集 默认取2</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                             <pre>

                             </pre>
                        </td>
                        <td>1000 OK; </br> 1002 参数错误 </br> 1004尚未登录</br> 8006尚未收藏</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="3.15">3.15 绑定微信</h3>
            <form action="<%=ctx%>/api/v1/user/bind_wx" method="get">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/user/bind_wx</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>code</td>
                        <td><font color="red">code</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="code" type="text" value='2'/></td>
                        <td>客户端申请微信授权得到的code</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                             <pre>
                             </pre>
                        </td>
                        <td>1000 OK; </br> 1002 参数错误 </br> 1004尚未登录</br> 8006尚未收藏</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="4.3">4.3 绑定提现账号</h3>
            <form action="<%=ctx%>/api/v1/withdraw/account/bind" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/withdraw/account/bind</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">uid</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="uid" type="text" value=''/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">type</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="type" type="text"
                                   value='2'/></td>
                        <td>提现类型 1银行卡 2支付宝</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">bank_card</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="bank_card" type="text" value=''/></td>
                        <td>银行卡或支付宝账号</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">account_name</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="account_name" type="text"
                                   value=''/></td>
                        <td>用户真实姓名</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">bank_type</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="bank_type" type="text"
                                   value=''/></td>
                        <td>银行类型 ICBC</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">bank_name</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="bank_name" type="text"
                                   value=''/></td>
                        <td>银行名称</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">bank_branch_name</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="bank_branch_name" type="text"
                                   value=''/></td>
                        <td>银行支行名称</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                        </td>
                        <td>1000 OK; </br>1004 尚未登录;</br> 7001无效的支付宝账号 </br> 7002 无效的银行卡号 </br> 7003 无效的真实姓名 <br/></td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="4.4">4.4 获取用户已绑定的提现账号</h3>
            <form action="<%=ctx%>/api/v1/withdraw/account/2" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/withdraw/account/{type}</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">uid</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="uid" type="text" value='1234'/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>

                        </td>
                        <td>1000 OK; </br>1004 尚未登录;</br> 7006未绑定支付宝 </br>7007未绑定银行卡</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="4.5">4.5 最近的20条提现/充值记录</h3>
            <form action="<%=ctx%>/api/v1/withdrawList/now" method="get">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/withdrawList/now</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                             <pre>
                                {
                                data: [
                                {
                                  "uid": "70**40",
                                  "amount": 20,
                                  "time": "刚刚",
                                  "type": 2 // 支付宝提现
                                },
                                {
                                  "uid": "96**22",
                                  "amount": 100,
                                  "time": "刚刚",
                                  "type": 0 // 充值
                                }
                                ],
                                desc: "OK",
                                status: 1000
                                }
                             </pre>
                        </td>
                        <td>1000 OK; </br> 1020 没有数据</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="4.6">4.6 充值</h3>
            <form action="<%=ctx%>/api/v1/cz" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/cz</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">uid</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="uid" type="text" value=''/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">num</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="num" type="text" value='10'/></td>
                        <td>充值金额 不小于10</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">phone</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="phone" type="text" value='15996242645'/></td>
                        <td>待充值手机号</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">verify_code</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="verify_code" type="text"
                                   value='1234'/></td>
                        <td>充值验证码</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                        </td>
                        <td>1000 OK; </br>1004 尚未登录;</br> 2010 新用户24小时内禁止提现</br> 2005还有未处理的提现/充值订单</br>
                            2002用户不存在</br> 1010余额不足 </br>2001验证码错误</br> 2016 只允许给自己手机号充值
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="4.7">4.7 查询提现/充值进度</h3>
            <form action="<%=ctx%>/api/v1/withdraw/progress" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/withdraw/progress</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
    {
    "data": {
        "last_withdraw_order": { // 上一次提现状态
            "status_desc": "2017-01-12 成功提现 10 元到支付宝账号 15996242646"
        },
        "current_withdraw_order": { // 当前提现状态
            "status_desc": "2017-09-11 提现 10 元到支付宝账号 15996242646",
            "progress": {// 提现进度
                {
                    date: "2017-09-19",
                    status_desc: "提交提现申请,系统正在处理"
                },
                {
                    date: "2017-09-20",
                    status_desc: "提交支付宝审核"
                },
                {
                    date: "2017-09-21",
                    status_desc: "提现失败,测试"
                }
            }
        }
    },
    "status": 1000,
    "desc": "OK"
    }
 </pre>
                        </td>
                        <td>1000 OK; </br>1004 尚未登录;</br> 1020没有提现记录</td>
                    </tr>
                </table>
            </form>
            <h3 id="6.1">6.1 所有分类列表</h3>
            <form action="<%=ctx%>/api/v1/category/all" method="get">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/category/all</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                             <pre>
{
  "data": [
    {
      "can_delete": 0,
      "category_id": 1,
      "category_name": "赏金任务",
      "category_type": 1 // 赏金任务
    },
    {
      "can_delete": 1,
      "category_id": 2,
      "category_name": "视频",
      "category_type": 2 // 资讯信息
    }
  ],
  "status": 1000,
  "desc": "OK"
}
                             </pre>
                        </td>
                        <td>1000 OK; </br> 1020 没有数据</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="6.2">6.2 用户已添加分类</h3>
            <form action="<%=ctx%>/api/v1/category/my" method="get">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/category/my</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                             <pre>
  {
    "data": [
      {
        "id": 0,
        "uid": 1234,
        "category_id": 1,
        "category_name": "赏金任务",
        "category_type": 1,
        "can_delete": 0, // 是否可以删除 0不可以 1可以
        "sort": 1
      },
      {
        "id": 0,
        "uid": 1234,
        "category_id": 2,
        "category_name": "视频",
        "category_type": 2,
        "can_delete": 1,
        "sort": 2
      }
    ],
    "status": 1000,
    "desc": "OK"
  }
                             </pre>
                        </td>
                        <td>1000 OK; </br> 1004尚未登录</br> 1020 没有数据</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="6.3">6.3 用户未添加分类</h3>
            <form action="<%=ctx%>/api/v1/category/more" method="get">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/category/more</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                             <pre>
  {
    "data": [
      {
        "can_delete": 1,
        "category_id": 9,
        "category_name": "南京",
        "category_type": 2
      },
      {
        "can_delete": 1,
        "category_id": 10,
        "category_name": "美女",
        "category_type": 2
      }
    ],
    "status": 1000,
    "desc": "OK"
  }
                             </pre>
                        </td>
                        <td>1000 OK; </br> 1004尚未登录</br> 1020 没有数据</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="6.4">6.4 批量添加分类</h3>
            <form action="<%=ctx%>/api/v1/category/batchAdd?app_key=28817749" method="post">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/category/batchAdd</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">POST</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">body</font></td>
                        <td>json</td>
                        <td><input style="width: 200px" name="" type="text" value=''/></td>
                        <td>
<pre>
{
    "categories" :
    "[{\"category_id\" : 1,\"sort\" : 2}, {\"category_id\" : 2,\"sort\" : 1}]"
}
</pre>
                        </td>
                        <td>category_id分类id; sort顺序; 新增或顺序有变化时,要将所有的分类id及排序传给服务器;</td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                        </td>
                        <td>1000 OK; </br> 1002 参数错误</br> 1004尚未登录 <br/></td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="6.5">6.5 删除添加的分类</h3>
            <form action="<%=ctx%>/api/v1/category/delete" method="post">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/category/delete</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">POST</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">categoryIds</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="categoryIds" type="text" value='1,2,4,7'/></td>
                        <td>
                            待删除的分类id,多个id以英文逗号拼接
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                            Note:禁止删除的分类是不会被删除的
                        </td>
                        <td>1000 OK; </br> 1002 参数错误 </br> 1004尚未登录</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="6.6">6.6 获取分类下的资讯列表</h3>
            <form action="<%=ctx%>/api/v1/articles/5" method="get">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/articles/{categoryId}</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">city</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="city" type="text" value=''/></td>
                        <td>
                            用户所在城市
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page" type="text" value='1'/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page_size</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page_size" type="text"
                                   value='20'/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                             <pre>
{
  "total": 1,
  "page": 1,
  "data": [
    {
      "id": 10,
      "type": 2, // article类型  1图文  2视频
      "has_viewed": false, // 是否已浏览过, true是,false否
      "title": "小车停在浮桥上 大货车旁边经过 接下来一幕让轿车司机晕了",
      "images": "[\"http://imgcom.static.suishenyun.net/crawl/background/9c7dd801-fb19-4490-b55d-2d6c424401d0.png\"]",
      "source": "秒拍", // 文章来源
      "layout": 2, // 布局 1左右单图, 2上下单图, 3上下三图
      "view_num": 0, // 浏览次数
      "comment_num": 0, // 评论数
      "origin_url": "http://gslb.miaopai.com/stream/NBNn9jShbhfzmnhX8qsa~A__.mp4?source=zhwnl", // 文章、视频原始地址
      "url": "http://test.kuaima.cn/km_task/api/v1/a/10", // 详情地址
      "content_model": "{"project":"km_browser","table":"article","md":"10001","id":"256157"}",// dmp统计
      "pub_time": "2016-11-05 08:19:52", // 发布时间
      "added_time": 1478320247254 // 添加时间
    }
  ],
  "status": 1000,
  "desc": "OK"
}
                             </pre>
                        </td>
                        <td>1000 OK; </br> 1020 没有数据</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="6.7">6.7 获取分享链接</h3>
            <form action="<%=ctx%>/api/v1/articles/shareUrl/1" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/articles/shareUrl/{id}</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">uid</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="uid" type="text" value=''/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
  "data": {
    "title" : "太恐怖了",
    "image": "http://imgcom.static.suishenyun.net/crawl/.png",
    "share_url": "http://localhost:8080/km_task/v1/a/2?code=MTIz",
    "share_description": "神秘偶像剧出现灵异事件，头”太恐怖了！",
    // 分享内容概要
    "content_summary": "神秘偶像剧出现灵异事件哈哈哈哈",
    "source":"zakker", // 文章来源
    "added_time":139000220001
  },
  "desc": "",
  "status": 1000
}
</pre>
                        </td>
                        <td>1000 OK; </br>8001 文章不存在</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="6.8">6.8 新闻资讯top榜</h3>
            <form action="<%=ctx%>/api/v1/articles/top/news" method="get">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/articles/top/news</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">city</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="city" type="text" value=''/></td>
                        <td>
                            用户所在城市
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                             <pre>
{
  "data": [
    {
      "id": 10,
      "type": 2, // article类型  1图文  2视频
      "title": "小车停在浮桥上 大货车旁边经过 接下来一幕让轿车司机晕了",
      "images": "[\"http://imgcom.static.suishenyun.net/crawl/back0.png\"]",
      "source": "秒拍", // 文章来源
      "layout": 2, // 布局 1左右单图, 2上下单图, 3上下三图
      "view_num": 0, // 浏览次数
      "origin_url": "http://gslb.miaopai.com/stream/NBNn9jShwnl", // 文章、视频原始地址
      "url": "http://test.kuaima.cn/km_task/api/v1/a/10", // 详情地址
      "pub_time": "2016-11-05 08:19:52", // 发布时间
      "added_time": 1478320247254 // 添加时间
    }
  ],
  "status": 1000,
  "desc": "OK"
}
                             </pre>
                        </td>
                        <td>1000 OK; </br> 1020 没有数据</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="6.9">6.9 视频资讯top榜</h3>
            <form action="<%=ctx%>/api/v1/articles/top/video" method="get">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/articles/top/video</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                             <pre>
    {
    "data": [
    {
      "id": 10,
      "type": 2, // article类型  1图文  2视频
      "title": "小车停在浮桥上 大货车旁边经过 接下来一幕让轿车司机晕了",
      "images": "[\"http://imgcom.static.suishenyun.net/craw.png\"]",
      "source": "秒拍", // 文章来源
      "layout": 2, // 布局 1左右单图, 2上下单图, 3上下三图
      "view_num": 0, // 浏览次数
      "origin_url": "http://gslb.miaopai.com/stream/NBN", // 文章、视频原始地址
      "url": "http://test.kuaima.cn/km_task/api/v1/a/10", // 详情地址
      "pub_time": "2016-11-05 08:19:52", // 发布时间
      "added_time": 1478320247254 // 添加时间
    }
    ],
    "status": 1000,
    "desc": "OK"
    }
                             </pre>
                        </td>
                        <td>1000 OK; </br> 1020 没有数据</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="6.10">6.10 资讯详情</h3>
            <form action="<%=ctx%>/api/v1/article/1" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/article/{id}</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
 <pre>
 此接口由1.2.0版本以前,h5页面调用, 返回资讯详情和相关推荐;

    {
      "data": {
       // 登陆用户且未浏览过此资讯时返回, 有效登陆的标识【相关推荐文章序列号】,仅对图文资讯有效
        "idx":2,
        "seconds":10, // 限制阅读的秒数,大于秒数才算有效阅读
        "recomArticles": [
          {
            "id": 70918,
            "category_id": 5,
            "type": 1,
            "title": "当心！市面上出现了“新型”百元假币",
            "source": " 央视新闻",
            "layout": 1,
            "view_num": 0,
            "comment_num": 0,
            "has_viewed": false,
            "origin_url": "https://app.myzaker.com/news/artiwnl",
            "url": "http://news.zhwnl.cn/article.html?id=70918",
            "pub_time": "2017-01-11 07:00:28",
            "added_time": 1484101203437,
            "content_type": "article",
            "tips": "",
            "images": [
              "https://zkres.myzaker.com/201701/58.jpg"
            ]
          }
        ],
        "article": {
          "id": 69299,
          "type": 1,
          "title": "男子与网友发生关系 遭其丈夫扒光勒索",
          "source": "大江网",
          "layout": 3,
          "view_num": 10,
          "has_viewed": false,
          "comment_num": 11,
          "origin_url": "https://app.myzaker.com/news/al",
          "url": "http://news.zhwnl.cn/article.html?id=69299",
          "pub_time": "2017-01-10 10:08:29",
          "content": "咸阳男子杜某在上",
          "added_time": 1484026802741,
	      "action_type": RTEXT,  //  H5、RTEXT、EXT_URL
          "images": [
            "https://zkres1.myzaker.com/201701/58743aa9.jpg",
            "https://zkres1.myzaker.com/201701/58743aa.jpg",
            "https://zkres2.myzaker.com/201701/58743aa.jpg"
          ]
        }
      },
      "desc": "",
      "status": 1000
    }
 </pre>
                        </td>
                        <td>1000 OK; </br>8001 文章不存在</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="6.10.1">6.10.1 资讯详情V2</h3>
            <form action="<%=ctx%>/api/v2/article/details/1" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v2/article/details/{id}</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
此接口由1.2.0版本及以上,h5页面调用, 仅返回资讯详情;

{
"data": {
"article": {
"id": 69299,
"type": 1,
"title": "男子与网友发生关系 遭其丈夫扒光勒索",
"source": "大江网",
"layout": 3,
"view_num": 11,
"has_viewed": false,
"comment_num": 11,
"origin_url": "https://app.myzaker.com/news/",
"url": "http://news.zhwnl.cn/article.html?id=69299",
"pub_time": "2017-01-10 10:08:29",
"content": "咸阳男子杜某在上",
"added_time": 1484026802741,
"action_type": RTEXT,  //  H5、RTEXT、EXT_URL
"images": [
"https://zkres1.myzaker.jpg",
"https://zkres1.myzaker.com/201701.jpg",
"https://zkres2.myzaker.com/2.jpg"
]
}
},
"desc": "",
"status": 1000
}
</pre>
                        </td>
                        <td>1000 OK; </br>8001 文章不存在</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="6.11">6.11 阅读资讯</h3>
            <form action="<%=ctx%>/api/v1/article/view" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/article/view</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">articleId</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="articleId" type="text" value=''/></td>
                        <td>
                            阅读的资讯的id
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">rid</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="rid" type="text" value=''/></td>
                        <td>
                            有效阅读标识[相关推荐某个资讯的id], 用idx作为序列,从0开始去取推荐资讯id, 并用Des加密算法加密
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
 <pre>
 客户端1.2.0以前版本, h5页面调用,用户阅读资讯,奖励金币。
{
    data: {
    coin_num: 10 // 阅读资讯奖励;  若coin_num为0表示没有奖励
    },
    desc: "",
    status: 1000
}
 </pre>
                        </td>
                        <td>1000 OK;</br>1004 未登陆;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="6.11.1">6.11.1 阅读资讯V2</h3>
            <form action="<%=ctx%>/api/v2/article/view" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v2/article/view</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">articleId</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="articleId" type="text" value=''/></td>
                        <td>
                            阅读的资讯的id
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">rid</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="rid" type="text" value=''/></td>
                        <td>
                            有效阅读标识[相关推荐某个资讯的id] 用详情接口返回的idx作为序列,从0开始去取推荐资讯id;
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
1.2.0及以后版本,客户端调用。用户阅读资讯,奖励金币。
coin_num 大于0弹窗, 小于等于0,什么也不提示;

完成新手任务:
{
    data: {
        "coin_num": 10 // 阅读资讯奖励;  若coin_num为0表示没有奖励
        "is_junior_first_read":true, // 是否是新用户首次阅读文章, 为true弹toast提醒用户
        "junior_first_read_alert": "新手阅读任务，+300金币", // toast文案
        "isReadAccelerating": false // 是否是阅读加速中
        "show_newcomer_remind": true, // 是否显示新手特权提醒
        "remind_type" : "alert", // alert 弹窗  popup弹出层(3s消失)
        "read_progress" : "1/40", //阅读进度
        "newcomer_remind_content" : {
            "title" : "恭喜你完成今日阅读任务",
            "subtitle" : "坚持完成任务,获得更多奖励哦",
            "buttonDesc" : "领取奖励",
            "url" : "http://www.kuaima.cn"
        }
    },
    desc: "",
    status: 1000
 }

未完成新手任务:
{
        data: {
            "coin_num": 10 // 阅读资讯奖励;  若coin_num为0表示没有奖励
            "read_progress" : "1/40", //阅读进度
            "isReadAccelerating": false // 是否是阅读加速中
            "show_newcomer_remind": true, // 是否显示新手特权提醒
            "remind_type" : "popup", // alert 弹窗  popup弹出层(3s消失)
            "newcomer_remind_content" : {
                "title" : "阅读8篇后可领取100金币",
            }
        },
    desc: "",
    status: 1000
}

非新手用户或已做完新手任务:
{
    data: {
        "coin_num": 10 // 阅读资讯奖励;  若coin_num为0表示没有奖励
        "read_progress" : "1/40", //阅读进度
        "isReadAccelerating": false // 是否是阅读加速中
        "show_newcomer_remind": false, // 是否显示新手特权提醒
    },
    desc: "",
    status: 1000
}
</pre>
                        </td>
                        <td>1000 OK;</br>1004 未登陆;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="6.12">6.12 首页推荐资讯接口</h3>
            <form action="<%=ctx%>/api/v1/timeline/recommend" method="get">
                
                <table>

                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/timeline/recommend</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">app_start_cnt</font></td>
                        <td>int</td>
                        <td><input style="width: 200px" name="app_start_cnt" type="text"
                                   value=''/></td>
                        <td>当日app启动次数</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">app_first_start_time</font></td>
                        <td>int</td>
                        <td><input style="width: 200px" name="app_first_start_time" type="text"
                                   value=''/></td>
                        <td>app安装后首次启动的时间戳</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page" type="text" value='1'/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">min_time</font></td>
                        <td>long</td>
                        <td>
                            <input style="width: 200px" name="min_time" type="text" value='0'/></td>
                        <td>
                            创建时间最小值, 第一次获取可传0; 客户端获取最新数据时,min_time传客户端本地最大的max_time值; max_time不传;
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">max_time</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="max_time" type="text" value='0'/></td>
                        <td>
                            创建时间最大值, 第一次获取可传0; 客户端获取老数据时,max_time传本地最小的min_time值, min_time不传;
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">city</font></td>
                        <td>String</td>
                        <td><input style="width: 200px" name="city" type="text" value=''/></td>
                        <td>
                            城市名称
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">is_big_img_ad_last_page</font></td>
                        <td>String</td>
                        <td><input style="width: 200px" name="is_big_img_ad_last_page" type="text" value='1'/></td>
                        <td>
                            上页是否大图广告 1是, 0否
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
    {
    data: {
    min_time: 1482116400498,
    max_time: 1482129393454,
    page: 1,
    count: 10, // 返回数据条数
    data: [
    {
    id: 43211,
    type: 1,
    title: "辣眼！郭富城林志颖互传龙虾",
    source: "ZAKER娱乐",
    layout: 2,
    view_num: 211,
    has_viewed: false,
    origin_url: "http://app.myzaker.com/news/article.php",
    url: "http://news.zhwnl.cn/article.html?id=43211",
    pub_time: "2016-12-19 13:59:46",
    added_time: 1482129393454,
    content_type: "article", // 标识内容的类型,article文章资讯, share_task赏金任务, ads广告, video视频
    content_model: "{"project":"km_browser","table":"article","md":"10001","id":"256157"}",
    tips: "",
    images: [
    "http://zkres.myzaker.com/201612/5857775677a3247d3f000039_1024.jpg"
    ]
    },
    {
    id: 1,
    title: "58到家",
    source: "",
    layout: 4, // 布局, 4单图
    view_num: 100,
    origin_url: "http://luna.58.com/m/activity?temid=S",
    content_type: "ads",
    ads_type: "km_zt", // 广告类型: km_zt baidu_sdk gdt_sdk km_ads_api, feed_big_img其中,baidu_sdk gdt_sdk由客户端从第三方sdk获取广告
    tips: "广告",
    third_location_id: "1111000002", // 第三方广告位ID
    ad_app_id:"100000009",// 第三方授权App ID
    content_model: "{"project":"km_browser","table":"ads","md":"10001","id":"0"}", // dmp统计
    added_time: 1482136841167,
    images: [
    "http://jumpluna.58.com/jump/clk?url=UWdBsHcdrjcLPj9QnjNdP1Nksyd1symVXh6LUhkhm1dVpZ-Cu7qlpZR6UMwGpZR6UhI8XyNh0h"
    ]
    },
    {  //资源
		id: 7,
		uid: 378627,
		nick_name: "",
		avatar: "",
        content_type:"resource",//post 文章， photo 图片， resource 资源
        pay_amount:0.01 ,//资源定价
        has_exchanged:false //是否兑换过
        can_report:false //是否可以举报
        secret_key:"密码",
		tag_id: 4, //标签id
		tag_name: "工具", //标签名字
		type: 1,    //1 图文 2 视频
		title: "叫MC啥……",
		status: 2,
		origin: 3,
		origin_url: "https://www.kuaishou.com/photo/20965523/2238332334",
		author_name: "爬宠馆大亮哥哥",  //源作者
		layout: 1,      //布局 1左右单图, 2上下单图, 3上下三图,4单个大图 ,5无图
		view_num: 0,
		comment_num: 0,
		praise_num: 3,
		message: "",  //下架原因
		pub_time: 1495850585002,  //上架/下架时间
		added_time: 1495695232463, //转载(申请)时间
		url: "",
		origin_icon: "",     //采集来源icon
		origin_name: "快手",  //采集来源
		has_viewed: false,
        hot_value:0, // 热力值, 为0时展示暂无
		images: ["https://zkres.myzaker.com/201701/5874d195a07aec61500210b6_320.jpg"]},
	{
    id: 1,
    content_type: "novel",
	novelType:1,  //1 :推荐小说  2 :最近收藏小说
    content_model: "{"project":"km_browser","table":"novel","md":"10001","id":"1"}", // dmp统计


    },
    desc: "",
    status: 1000
    }
                             </pre>
                        </td>
                        <td>1000 OK; count为0表示没有数据</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="6.13">6.13 资讯详情附加信息(相关推荐、评论)</h3>
            <form action="<%=ctx%>/api/v2/article/addition/1" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v2/article/addition/{id}</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
此接口由1.2.0版本及以上,客户端调用, 返回资讯相关推荐及评论信息;
{
  "data": {
    "read_full_article_button_below": {// 查看全文按钮下面广告位控制
        id: 1, // 非直投广告广告位id、直投广告id
        title: "",
        source: "",
        layout: 0,
        view_num: 0,
        origin_url: "",
        platform: "",
        content_type: "ads",
        tips: "广告",
        ads_type: "gdt_sdk",
        ads_location: "",
        need_login: false,
        content_model: "", // dmp统计需要
        added_time: 0,
        images: [
        ""
        ]
    }
    "comments": [ // 文章评论列表
      {
        "id": 13,
        "uid": 378627,
        "nick": "账7号看",
        "avatar": "http://wwww.jpg",
        "content": "这是评论 ", // 评论内容
        "comment_num": 0, // 回复数
        "son_comments": [ ], // 子回复列表
        "like_num": 0, // 点赞数
        "like": false, // 是否赞过: true是 false 否
        "added_time": 1484049173822,
        "update_time": 1484049183471,
        "comment_article_id": 69299, // 评论的文章id
        "father_comment_id": 0, // 父评论id
        "father_comment_uid": 0, // 父评论的作者
        "father_comment_nick": "", // 父评论的作者的昵称
        "reply_comment_id": 0, // 回复的评论id
        "reply_comment_uid": 0, // 回复的评论的作者
        "reply_comment_nick": "", // 回复的评论的作者的昵称
        "comment_obj_type":2 // 评论对象类型 2文章 3采集
      }
    ],
    "related_recom_last": {// 相关推荐最后一位下面广告(1.2.2版本key为:articleBigImageAd)
            id: 0, // 非直投广告广告位id、直投广告id
            title: "",
            source: "",
            layout: 0,
            view_num: 0,
            origin_url: "",
            platform: "",
            content_type: "ads",
            tips: "广告",
            ads_type: "baidu_sdk",
            ads_location: "",
            need_login: false,
            added_time: 0,
            images: [
            ""
            ]
        }
    "hasMoreComments": true, // 是否有更多评论, true 是 false 否
    "total_comment_num": 7, // 总评论个数
    "seconds":8, // 阅读时长
    "idx":2, // 登陆用户且未浏览过此资讯时返回, 有效登陆的标识【相关推荐文章序列号】,仅对图文资讯有效
    "isCollect":true, // 是否已收藏文章(登陆用户返回此标识)
    "showReadArticleProgressBar":true, // 是否展示阅读进度条 true 是 false 否
    "readArticleProgressBarShowNum": 20, // 新手阅读文章进度条展示次数, 客户端保存已展示次数,并且判断是否要再次展示
    "recomArticles": [
      {
        "id": 0,
        "title": "",
        "source": "",
        "layout": 0,
        "view_num": 0,
        "origin_url": "",
        "platform": "",
        "content_type": "ads",
        "tips": "广告",
        "ads_type": "baidu_sdk", // 广告类型: km_zt baidu_sdk gdt_sdk km_ads_api其中,baidu_sdk gdt_sdk由客户端从第三方sdk获取广告
        "added_time": 0,
        "images": [
          ""
        ]
      },
      {
        "id": 70959,
        "category_id": 5,
        "type": 1,
        "title": "王思聪去年为什么不给冯小刚面子",
        "source": "每日经济新闻",
        "layout": 3,
        "view_num": 0,
        "comment_num": 0, // 评论数
        "has_viewed": false,
        "origin_url": "https://app.myzaker.com/news/article.php?pk=5875077c9490cbfb52000000&f=zhwnl",
        "url": "http://news.zhwnl.cn/article.html?id=70959",
        "pub_time": "2017-01-11 00:09:41",
        "added_time": 1484101805711,
        "content_type": "article",
        "tips": "",
        "images": [
          "https://zkres1.myzaker.com/201701/58750780a07aec6150023d71_640.jpg",
          "https://zkres1.myzaker.com/201701/58750780a07aec6150023d6f_640.jpg",
          "https://zkres2.myzaker.com/201701/58750780a07aec6150023d70_640.jpg"
        ]
      },
      {
        "id": 70952,
        "category_id": 5,
        "type": 1,
        "title": "2岁男童被卡沟底溺亡 其父在打麻将",
        "source": "蕲春通",
        "layout": 3,
        "view_num": 0,
        "comment_num": 0,
        "has_viewed": false,
        "origin_url": "https://app.myzaker.com/news/article.php?pk=587592479490cbec52000029&f=zhwnl",
        "url": "http://news.zhwnl.cn/article.html?id=70952",
        "pub_time": "2017-01-11 10:02:47",
        "added_time": 1484101802281,
        "content_type": "article",
        "tips": "",
        "images": [
          "https://zkres1.myzaker.com/201701/58759141a07aec615002676e_640.jpg",
          "https://zkres1.myzaker.com/201701/58759141a07aec615002676f_640.jpg",
          "https://zkres1.myzaker.com/201701/58759141a07aec615002676d_640.jpg"
        ]
      },
      {
        "id": 0,
        "title": "",
        "source": "",
        "layout": 0,
        "view_num": 0,
        "origin_url": "",
        "platform": "",
        "content_type": "ads",
        "tips": "广告",
        "ads_type": "baidu_sdk",
        "added_time": 0,
        "images": [
          ""
        ]
      }
    ],
    "article": {
      "id": 69299,
      "type": 1,
      "title": "男子与网友发生关系 遭其丈夫扒光勒索",
      "source": "大江网",
      "layout": 3,
      "view_num": 0,
      "has_viewed": false,
      "comment_num": 0,
      "origin_url": "https://app.myzaker.com/news/article.php?pk=5874421d9490cbd95a000031&f=zhwnl",
      "url": "",
      "pub_time": "2017-01-10 10:08:29",
      "content": "",
      "added_time": 1484026802741,
      "images": [
        "https://zkres1.myzaker.com/201701/58743aa9a07aec6150019459_640.jpg",
        "https://zkres1.myzaker.com/201701/58743aa9a07aec615001945b_640.jpg",
        "https://zkres2.myzaker.com/201701/58743aa9a07aec615001945a_640.jpg"
      ]
    }
  },
  "desc": "",
  "status": 1000
}
</pre>
                        </td>
                        <td>1000 OK; </br>8001 文章不存在</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="6.14">6.14 阅读推送文章</h3>
            <form action="<%=ctx%>/api/v2/article/readPush" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v2/article/readPush</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">content_type</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="content_type" type="text" value=''/></td>
                        <td>
                           推送的类型 article/post   文章/采集
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">articleId</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="articleId" type="text" value=''/></td>
                        <td>
                            阅读的资讯的id
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>

coin_num 大于0弹窗, 小于等于0,什么也不提示;

{
    data: {
        "coin_num": 20 // 阅读推送奖励;  若coin_num为0表示没有奖励
    },
    desc: "",
    status: 1000
 }

</pre>
                        </td>
                        <td>1000 OK;</br>1004 未登陆;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="6.15">6.15 获取头条的access_token</h3>

            <form action="<%=ctx%>/api/v2/article/ttAccessToken" method="post">
                
                
                <font color="red">
                    除了快马所需参数外,还需要今日头条参数:<br>
                    通用参数 只要传 timestamp(单位为秒) 和 nonce和partner,可跟在url 后面<br>
                其他参数 用post 传递,Content-Type为 为application/x-www-form-urlencoded
                    </font>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v2/article/ttAccessToken</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">POST</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">category</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="category" type="text" value='__all__'/></td>
                        <td>
                              头条文档中对应的频道(系统配置中tt_category是快马接入的头条频道,使用相应的code)
                        </td>
                        <td></td>
                    </tr>


                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>


{
    data: {
        "access_token": "e2f9ef7fbb51028616b903d498d47b740013",
        "expires_in": 7491103,    // 单位为秒

    },
    desc: "",
    status: 1000
 }

</pre>
                        </td>
                        <td>1000 OK;</br>1004 未登陆;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>

            <h3 id="6.16">6.16 资讯信息流V2(适用各个频道,兼容头条)</h3>

            <form action="<%=ctx%>/api/v2/timeline/recommend" method="post">
                
                
                <font color="red">
                    除了快马所需参数外,还需要今日头条参数:<br>
                    通用参数 只要传 timestamp(单位为秒) 和 nonce和partner和 access_token,可跟在url 后面<br>
                    其他参数 用post 传递,Content-Type为 为application/x-www-form-urlencoded
                </font>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v2/timeline/recommend</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">POST</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>

                    <tr>
                        <td>opt</td>
                        <td><font color="red">category_id</font></td>
                        <td>int</td>
                        <td><input style="width: 200px" name="category_id" type="text"
                                   value=''/></td>
                        <td>快马的频道id</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">app_start_cnt</font></td>
                        <td>int</td>
                        <td><input style="width: 200px" name="app_start_cnt" type="text"
                                   value=''/></td>
                        <td>当日app启动次数</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page" type="text" value='1'/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">min_time</font></td>
                        <td>long</td>
                        <td>
                            <input style="width: 200px" name="min_time" type="text" value='0'/></td>
                        <td>
                            创建时间最小值, 第一次获取可传0; 客户端获取最新数据时,min_time传客户端本地最大的max_time值; max_time不传;
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">max_time</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="max_time" type="text" value='0'/></td>
                        <td>
                            创建时间最大值, 第一次获取可传0; 客户端获取老数据时,max_time传本地最小的min_time值, min_time不传;
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">city</font></td>
                        <td>String</td>
                        <td><input style="width: 200px" name="city" type="text" value=''/></td>
                        <td>
                            城市名称
                        </td>
                        <td></td>
                    </tr>


                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>

 {
    data: {
    min_time: 1482116400498,
    max_time: 1482129393454,
    page: 1,
    count: 10, // 返回数据条数
    data: [
    {
    id: 43211,
    type: 1,
    title: "辣眼！郭富城林志颖互传龙虾",
    source: "ZAKER娱乐",
    layout: 2,
    view_num: 211,
    comment_num: 211,
    has_viewed: false,
     from_t_t: true,  //是否来自头条
     group_id: 12343,//本字段在本地调起、点击上报时使
    item_id: 12343,//本字段在 dislike 上报时使
    origin_url: "http://app.myzaker.com/news/article.php",
    url: "http://news.zhwnl.cn/article.html?id=43211",
    pub_time: "2016-12-19 13:59:46",
    added_time: 1482129393454,
    content_type: "article", // 标识内容的类型,article文章资讯, share_task赏金任务, ads广告, video视频
    content_model: "{"project":"km_browser","table":"article","md":"10001","id":"256157"}",
    tips: "",
    images: [
    "http://zkres.myzaker.com/201612/5857775677a3247d3f000039_1024.jpg"
    ],
    tags: [
        {
            id:112,
            name:"情感"
        },
         {
            id:113,
            name:"花生"
        },
          {
            id:114,
            name:"降血压"
        }
    ]
    },
    {
    id: 1,
    title: "58到家",
    source: "",
    layout: 4, // 布局, 4单图
    view_num: 100,
    origin_url: "http://luna.58.com/m/activity?temid=S",
    content_type: "ads",
    ads_type: "km_zt", // 广告类型: km_zt baidu_sdk gdt_sdk km_ads_api, feed_big_img其中,baidu_sdk gdt_sdk由客户端从第三方sdk获取广告
    tips: "广告",
    third_location_id: "1111000002", // 第三方广告位ID
    ad_app_id:"100000009",// 第三方授权App ID
    content_model: "{"project":"km_browser","table":"ads","md":"10001","id":"0"}", // dmp统计
    added_time: 1482136841167,
    images: [
    "http://jumpluna.58.com/jump/clk?url=UWdBsHcdrjcLPj9QnjNdP1Nksyd1symVXh6LUhkhm1dVpZ-Cu7qlpZR6UMwGpZR6UhI8XyNh0h"
    ]
    },
    {  //资源
		id: 7,
		uid: 378627,
		nick_name: "",
		avatar: "",
        content_type:"resource",//post 文章， photo 图片， resource 资源
        pay_amount:0.01 ,//资源定价
        has_exchanged:false //是否兑换过
        can_report:false //是否可以举报
        secret_key:"密码",
		tag_id: 4, //标签id
		tag_name: "工具", //标签名字
		type: 1,    //1 图文 2 视频
		title: "叫MC啥……",
		status: 2,
		origin: 3,
		origin_url: "https://www.kuaishou.com/photo/20965523/2238332334",
		author_name: "爬宠馆大亮哥哥",  //源作者
		layout: 1,      //布局 1左右单图, 2上下单图, 3上下三图,4单个大图 ,5无图
		view_num: 0,
		comment_num: 0,
		praise_num: 3,
		message: "",  //下架原因
		pub_time: 1495850585002,  //上架/下架时间
		added_time: 1495695232463, //转载(申请)时间
		url: "",
		origin_icon: "",     //采集来源icon
		origin_name: "快手",  //采集来源
		has_viewed: false,
        hot_value:0, // 热力值, 为0时展示暂无
		images: ["https://zkres.myzaker.com/201701/5874d195a07aec61500210b6_320.jpg"]},
	{
    id: 1,
    content_type: "novel",
	novelType:1,  //1 :推荐小说  2 :最近收藏小说
    content_model: "{"project":"km_browser","table":"novel","md":"10001","id":"1"}", // dmp统计


    },
    desc: "",
    status: 1000
    }

</pre>
                        </td>
                        <td>1000 OK;</br>1004 未登陆;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>

            <h3 id="6.17">6.17 资讯(包括快马直投广告)不喜欢</h3>

            <form action="<%=ctx%>/api/v2/article/dislike" method="post">
                
                
                <font color="red">
                    imei，mac，imsi,idfa 参数可跟在url 后面<br>
                    以下表格参数 用post 传递,Content-Type为 为application/x-www-form-urlencoded
                </font>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v2/article/dislike</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">POST</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">id</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="id" type="text" value=''/></td>
                        <td>
                            id
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">origin</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="origin" type="text" value=''/></td>
                        <td>
                            直投广告(ads_type为km_zt的广告)为 1, 蜂巢文章为2,其他 诸如小说 非直投广告无需请求上报
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">args</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="args" type="text" value=''/></td>
                        <td>
                            保存具体的点×内容json串;其他置空串<br>

                            例子:
<pre>
{
"had_look":1
,"bad_content":1
,"source":"xxxx"
,"tags":[111,222]
}
</pre>
                            其中had_look和bad_content字段中的1代表点击,0代表未点击;
                            source字段对应的数据源,最好是中文字符串,不是缩写
                            tags字段对应的是一个id列表,对应dmp_tag中的id字段值
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>


{
    desc: "",
    status: 1000
 }

</pre>
                        </td>
                        <td>1000 OK;</br>1004 未登陆;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="7.1">7.1 获取签到配置信息</h3>
            <form action="<%=ctx%>/api/v1/checkin/setting" method="get">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/checkin/setting</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                             <pre>
{
data: {
commission: 700, // 签到奖励金币数
is_start: true, // 今日签到是否已开始
total_num: 1000, // 总份数
left_seconds: 0, // 距离开始剩余秒数
left_num: 1000, // 剩余份数
is_open_remind: true, // 是否开启自动提醒
is_checkin : false, // 今日是否已签到
checkin_type : "normal_checkin" // 签到类型,is_checkin值为false时返回此字段, normal_checkin正常签到; common_checkin普通签到
checkin_time: { // 签到时间
    hour: 10,
    minute: 0
}
},
desc: "",
status: 1000
}
                             </pre>
                        </td>
                        <td>1000 OK;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="7.2">7.2 签到(需登录)</h3>
            <form action="<%=ctx%>/api/v1/checkin?app_key=28817749" method="get">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/checkin</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                            <pre>
                                {
                                data: {
                                commission: 700, // 签到奖励金币数
                                left_num: 998 // 剩余份数
                                },
                                desc: "",
                                status: 1000
                                }
                            </pre>
                        </td>
                        <td>1000 OK;1004未登陆;3001签到未开始;3004数量不足;9001 已签到</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="7.2.1">7.2.1 普通签到(需登录)</h3>
            <form action="<%=ctx%>/api/v1/checkin/common?app_key=28817749" method="get">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/checkin/common</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                            <pre>
                                {
                                data: {
                                    commission: 10, // 普通签到奖励金币数
                                },
                                desc: "",
                                status: 1000
                                }
                            </pre>
                        </td>
                        <td>1000 OK;1004未登陆;3001签到未开始;9001 已签到</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="7.3">7.3 获取签到记录</h3>
            <form action="<%=ctx%>/api/v1/checkin/logs" method="get">
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/checkin/logs</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page" type="text" value='1'/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page_size</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page_size" type="text"
                                   value='20'/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                         <pre>
{
total: 1,
page: 1,
data: [
{
id: 2,
uid: 1,
phone: "15996142531",
income: 0.5,
added_time: 1481091679154
}
],
status: 1000,
desc: "OK"
}
                         </pre>
                        </td>
                        <td>若今日签到已开始,返回今日数据; 今日未开始,返回昨日签到数据;1000 OK; </br> 1020 没有数据</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="8.1">8.1 获取红包信息</h3>
            <form action="<%=ctx%>/api/v1/redPack/info?app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/redPack/info</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                         <pre>
    {
    data: {
    next_red_pack_seconds: 180, // 距离下个红包开启剩余秒数, 剩余描述为0,红包可以领取;
    show_red_pack_symbol: true, // 是否显示红包标志, true显示, false不显示
    is_all_receive : false // 是否已领完今日红包
    },
    desc: "",
    status: 1000
    }
                         </pre>
                        </td>
                        <td>1000 OK;1004未登陆;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="8.2">8.2 领取红包</h3>
            <form action="<%=ctx%>/api/v1/redPack/receive?app_key=28817749" method="post">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/redPack/receive</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">POST</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                        <pre>
                        {
                          "data": {
                            "coin_num": 14, // 红包奖励金币数
                            "jump_url": "", // 跳转地址 // 第一个红包返回
                            "button":"确定", // 领取后弹窗按钮文案
                            "need_login": false // 跳转是否要登陆,要登录跳转带上登陆token
                          },
                          "status": 1000,
                          "desc": "OK"
                        }
                        </pre>
                        </td>
                        <td>1000 OK;1004未登陆;9005 今日红包已领完; 9006 红包领取时间未到;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="9.1">9.1 发表评论</h3>
            <form action="<%=ctx%>/api/v1/comment/create?app_key=28817749" method="post">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/comment/create</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">POST</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">body</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="x" type="text" value=''/></td>
                        <td>
<pre>
{
    "comment_article_id" : 123, // 评论文章时传文章id
    "comment_obj_type":2 // 评论对象类型 2文章 3采集
    "father_comment_id" : 123, // 父评论id,回复评论时传
    "reply_comment_id" : 0, // 回复二级评论时传, 被回复的评论id
    "content" : "这是评论 " // 评论内容, 不能为空 5-200字符
}
comment_article_id 和 father_comment_id必须有一个有值;reply_comment_id回复二级评论是须传。
</pre>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                            1000 OK; 1004未登陆;<br/> 8101 要回复的评论不存在; 2002用户不存在; 8102 评论太过频繁; 8105 不能回复自己的评论; 9703 评论的采集内容不存在或已被删除;
                        </td>
                        <td></td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="9.1.1">9.1.1 查询评论基本信息</h3>
            <form action="<%=ctx%>/api/v1/comment/1?app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/comment/{id}</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">id</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="id" type="text" value='1'/></td>
                        <td>
                            评论id
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                            1000 OK; 1002参数错误;8101评论不存在
                        </td>
                        <td>
<pre>
{
"data":
{
    "id": 13,
    "uid": 378627,
    "nick": "账7号看", // 昵称
    "avatar": "http://wwww.jpg", // 头像
    "content": "这是评论 ", // 评论内容
    "comment_num": 0, // 回复数
    "like_num": 0, // 点赞数
    "like": false, // 是否已点赞
    "added_time": 1484049173822,
    "update_time": 1484049183471,
    "comment_article_id": 69299, // 评论的文章id
    "father_comment_id": 0, // 父评论id
    "father_comment_uid": 0, // 父评论的作者
    "father_comment_nick": "", // 父评论的作者的昵称
    "reply_comment_id": 0, // 回复的评论id
    "reply_comment_uid": 0, // 回复的评论的作者
    "reply_comment_nick": "", // 回复的评论的作者的昵称
    "comment_obj_type":2 // 评论对象类型 2文章 3采集
},
"status": 1000,
"desc": "OK"
}
</pre>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <h3 id="9.1.2">9.1.2 查询评论所属文章信息</h3>
            <form action="<%=ctx%>/api/v1/comment/article?app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/comment/article</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">commentId</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="commentId" type="text" value='1'/></td>
                        <td>
                            评论id
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                            1000 OK; 1002参数错误;8101评论不存在;8001 文章不存在
                        </td>
                        <td>
<pre>
{
"data":
{
    "article_id": 13, // 文章id
    "comment_obj_type":2, // 评论对象类型 2文章 3采集
    "url": "http://new.kuaima.cn/v.html?id=13", // 文章详情地址
},
"status": 1000,
"desc": "OK"
}
</pre>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="9.2">9.2 查询评论详情</h3>
            <form action="<%=ctx%>/api/v1/comment/details?app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/comment/details</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">articleId</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="articleId" type="text" value=''/></td>
                        <td>
                            文章/采集 id
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">commentId</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="commentId" type="text" value=''/></td>
                        <td>
                            查询评论详情传评论id
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">commentObjType</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="commentObjType" type="text" value='2'/></td>
                        <td>
                            评论对象类型 2文章 3采集, 默认取2; 查询文章/采集评论详情是需传;
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page" type="text" value='1'/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page_size</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page_size" type="text"
                                   value='20'/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                            1000 OK; 1002参数错误 articleId和commentId必须传一个;</br> 1020 没有数据
                        </td>
                        <td>
<pre>
{
  "total": 1,
  "total_num":9, // 评论总个数
  "page": 1,
  "data": [
    {
      "comments": {
        "id": 13,
        "uid": 378627,
        "nick": "账7号看", // 昵称
        "avatar": "http://wwww.jpg", // 头像
        "content": "这是评论 ", // 评论内容
        "comment_num": 0, // 回复数
        "like_num": 0, // 点赞数
        "like": false, // 是否已点赞
        "added_time": 1484049173822,
        "update_time": 1484049183471,
        "comment_article_id": 69299, // 评论的文章id
        "father_comment_id": 0, // 父评论id
        "father_comment_uid": 0, // 父评论的作者
        "father_comment_nick": "", // 父评论的作者的昵称
        "reply_comment_id": 0, // 回复的评论id
        "reply_comment_uid": 0, // 回复的评论的作者
        "reply_comment_nick": "", // 回复的评论的作者的昵称
        "comment_obj_type":2, // 评论对象类型 2文章 3采集
      },
      "has_more_son_comments": true, // 是否有更多子评论, true 是 false 否
      "son_comments": [] // 子评论
    }
  ],
  "status": 1000,
  "desc": "OK"
}
</pre>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="9.3">9.3 点赞</h3>
            <form action="<%=ctx%>/api/v1/like?app_key=28817749" method="post">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/like</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">POST</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">objId</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="objId" type="text" value='1'/></td>
                        <td>
                            点赞对象id
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">objType</font></td>
                        <td>int</td>
                        <td><input style="width: 200px" name="objType" type="text" value='1'/></td>
                        <td>
                            点赞对象类型 1评论 3采集 默认取1
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                            1000 OK; 1004未登陆; 8201 已点赞; 8203点赞太频繁;8101点赞评论不存在;8106不能点赞自己的评论;9703 采集的文章不存在或已被删除; 9704不能喜欢自己的采集;<br/>
                        </td>
                        <td>
<pre>
{
  "status": 1000,
  "desc": "OK"
}
</pre>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="9.4">9.4 取消点赞</h3>
            <form action="<%=ctx%>/api/v1/unlike?app_key=28817749" method="post">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/unlike</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">POST</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">objId</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="objId" type="text" value='1'/></td>
                        <td>
                            点赞对象id
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">objType</font></td>
                        <td>int</td>
                        <td><input style="width: 200px" name="objType" type="text" value=''/></td>
                        <td>
                            取消点赞对象类型 1评论 3采集
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                            1000 OK; 1004未登陆; 8202 尚未喜欢,无法取消;<br/>
                        </td>
                        <td>
<pre>
{
  "status": 1000,
  "desc": "OK"
}
</pre>
                        </td>
                    </tr>
                </table>
            </form>
            <h3 id="10.1">10.1 查询用户消息列表</h3>
            <form action="<%=ctx%>/api/v1/msgs?app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/msgs</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
  "total": 1,
  "page": 1,
  "data": [
    {
      "id": 0,
      "uid": 378627,
      "msg_type": 2, // 消息类型 1评论 2点赞 3好友鞭策 4提现充值 5采集权限申请被通过 6举报奖励 7召回消息 8举报资源补偿 9召回失败,余额清空
      "action": "", // 点击跳转地址
      "msg": "", // 消息内容
      "extra_content": { // 扩展内容
        "nick": "账7号看", // 评论/点赞 用户昵称
        "uid": 378627, // 评论/点赞 用户uid
        "avatar": "http://wwww.jpg", // 评论/点赞 用户头像
        "comment": "",// 被点赞或评论的内容
        "comment_id": 2, // 被评论、点赞的评论id
        "father_comment_id":3 // 被评论、点赞的父评论id
      },
      "added_time": 1484133675654
    }
  ],
  "status": 1000,
  "desc": "OK"
}
</pre>
                        </td>
                        <td>1000 OK;1004未登陆;1020没有结果</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="10.1.1">10.1.1 查询系统消息列表</h3>
            <form action="<%=ctx%>/api/v1/systemMsgs?app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/systemMsgs</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
  "total": 1,
  "page": 1,
  "data": [
    {
      "id": 0,
      "msg_type": 0, // 消息类型
      "action": "", // 点击跳转地址
      "click_action_type": 0, // 点击动作类型,0打开app; 1打开url；2打开指定页面
      "need_login": 0,  // 是否需要登陆 1需要, 0不需要
      "msg": "", // 消息内容
      "extra_content": { // 扩展内容
        "nick": "账7号看", // 昵称
        "avatar": "http://wwww.jpg", // 头像
      },
      "added_time": 1484133675654
    }
  ],
  "status": 1000,
  "desc": "OK"
}
</pre>
                        </td>
                        <td>1000 OK;1020没有结果</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="10.2">10.2 查询未读消息小红点</h3>
            <form action="<%=ctx%>/api/v1/redPoint?app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/redPoint</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
  "data": {
    "zq_tab": { // 赚钱tab
      "show": false, // 是否显示红点, true显示
      "style": "number", // 红点样式, number数字, point红点
      "num": 0 // 红点数字
    },
    "msg_center_icon": { // 消息中心入口
      "show": false,
      "style": "point",
      "num": 0
    },
    "system_msg_tab":{ // 系统消息tab
       "show": false,
      "style": "point",
      "num": 0
    },
    "zdk_tab":{ // 值得看tab
        "show": false,
        "style": "point",
        "num": 0
    }
  },
  "desc": "",
  "status": 1000
}
</pre>
                        </td>
                        <td>1000 OK;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="11.1">11.1 查询运营位广告</h3>
            <form action="<%=ctx%>/api/v1/ads/operation?app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/ads/operation</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
data: {
    km_zq_icon: [ // 任务tab(1.4.1以前版本)我的tab(1.4.1开始)固定运营icon位; 1.4.1以后我的Tab第二行icon位;
    {
        id: 11,
        title: "轻松赚钱icon",
        source: "",
        layout: 4,
        view_num: 0,
        origin_url: "http://www.kuaima.cn", // 点击跳转地址, 支持http和schema
        platform: "DEFAULT",
        content_type: "ads",
        tips: "广告",
        ads_type: "km_zt",
        ads_location: "km_zq_icon",
        need_login: true, // 是否需要登陆,true需要,用户点击,客户端做登陆检查;且跳转时url后面拼接oauth_token参数;
        added_time: 1484311532503,
        images: [ // 图标
            "http://img1000.static.suishenyun.net/2e52e1dc5ac9d868e9983bd3fd8ced1c/d7aae765ad60a781f2515039efa684a1.ico"
        ]
    }
    ],
    km_zq_banner: [// 我的tab banner运营位
    {
        id: 10,
        title: "运营banner1",
        source: "",
        layout: 4,
        view_num: 0,
        origin_url: "http://www.kuaima.cn", // 点击跳转地址, 支持http和schema
        platform: "DEFAULT",
        content_type: "ads",
        tips: "广告",
        ads_type: "km_zt",
        ads_location: "km_zq_banner", // 我的tab的banner
        need_login: false,
        added_time: 1484311212232,
        images: [ // banner大图
            "http://img1000.static.suishenyun.net/2e52e1dc5ac9d868e9983bd3fd8ced1c/96781eca962f40ee21e22622a82178f9.jpg"
        ]
    }
    ],
    announcement: [ // 小喇叭公告位(1.4.1版本以前)
        {
            id: 11,
            title: "小喇叭公告, xx中奖了!",
            source: "",
            layout: 4,
            view_num: 0,
            origin_url: "http://www.kuaima.cn", // 点击跳转地址, 支持http和schema
            platform: "DEFAULT",
            content_type: "ads",
            tips: "广告",
            ads_type: "km_zt",
            ads_location: "announcement", // 任务tab 公告小喇叭
            need_login: true, // 是否需要登陆,true需要,用户点击,客户端做登陆检查;且跳转时url后面拼接oauth_token参数;
            added_time: 1484311532503,
            images: [ // 图标
                "http://img1000.static.suishenyun.net/2e52e1dc5ac9d868e9983bd3fd8ced1c/d7aae765ad60a781f2515039efa684a1.ico"
            ]
        }
        ],
    km_task_banner: [任务Tab banner位(1.4.1版本以前)
        {
        }
    ],
    task_tab_upper_right_icon: [ // 任务tab右上角icon(1.4.1版本以前)
       {
       }
    ],
    my_tab_second_line_icon: [// 我的tab第二行运营icon位,支持2个或4个(1.4.1版本以后)
        {
            id: 11,
            title: "轻松赚钱icon",
            source: "",
            layout: 4,
            view_num: 0,
            origin_url: "http://www.kuaima.cn", // 点击跳转地址, 支持http和schema
            platform: "DEFAULT",
            content_type: "ads",
            tips: "广告",
            ads_type: "km_zt",
            ads_location: "my_tab_second_line_icon", // 任务tab固定运营位icon
            need_login: true, // 是否需要登陆,true需要,用户点击,客户端做登陆检查;且跳转时url后面拼接oauth_token参数;
            added_time: 1484311532503,
            images: [ // 图标
                "http://img1000.static.suishenyun.net/2e52e1dc5ac9d868e9983bd3fd8ced1c/d7aae765ad60a781f2515039efa684a1.ico"
            ]
        }
    ],
    post_recommend_icon: [// 值得看模块文章分类运营位,支持2个(1.4.4版本以后)
        {
            id: 11,
            title: "昨日阅读精选",
            source: "",
            layout: 4,
            view_num: 0,
            origin_url: "http://www.kuaima.cn", // 点击跳转地址, 支持http和schema
            platform: "DEFAULT",
            content_type: "ads",
            tips: "广告",
            ads_type: "km_zt",
            ads_location: "post_recommend_icon", // 运营位icon
            need_login: false, // 是否需要登陆,true需要,用户点击,客户端做登陆检查;且跳转时url后面拼接oauth_token参数;
            added_time: 1484311532503,
            images: [ // 图标
                "http://img1000.static.suishenyun.net/2e52e1dc5ac9d868e9983bd3fd8ced1c/d7aae765ad60a781f2515039efa684a1.ico"
            ]
        },
        {
            id: 12,
            title: "昨日评论精选",
            source: "",
            layout: 4,
            view_num: 0,
            origin_url: "http://www.kuaima.cn", // 点击跳转地址, 支持http和schema
            platform: "DEFAULT",
            content_type: "ads",
            tips: "广告",
            ads_type: "km_zt",
            ads_location: "post_recommend_icon", // 运营位icon
            need_login: false, // 是否需要登陆,true需要,用户点击,客户端做登陆检查;且跳转时url后面拼接oauth_token参数;
            added_time: 1484311532503,
            images: [ // 图标
                "http://img1000.static.suishenyun.net/2e52e1dc5ac9d868e9983bd3fd8ced1c/d7aae765ad60a781f2515039efa684a1.ico"
            ]
        }
    ],
    invite_friend_banner: [// 邀请好友入口,支持1个(1.5.3版本及以后)
        {
            id: 11,
            title: "邀请好友",
            source: "",
            layout: 4,
            view_num: 0,
            origin_url: "http://www.kuaima.cn", // 点击跳转地址, 支持http和schema
            platform: "DEFAULT",
            content_type: "ads",
            tips: "广告",
            ads_type: "km_zt",
            ads_location: "invite_friend_banner", // 运营位icon
            need_login: false, // 是否需要登陆,true需要,用户点击,客户端做登陆检查;且跳转时url后面拼接oauth_token参数;
            added_time: 1484311532503,
            images: [ // 图标
                "http://img1000.static.suishenyun.net/2e52e1dc5ac9d868e9983bd3fd8ced1c/d7aae765ad60a781f2515039efa684a1.ico"
            ]
        }
    ],
     invite_friend_banner: [// 用户宝箱位置,支持1个(1.5.3版本及以后)
        {
            id: 11,
            title: "宝箱",
            source: "",
            layout: 4,
            view_num: 0,
            origin_url: "http://www.kuaima.cn", // 点击跳转地址, 支持http和schema
            platform: "DEFAULT",
            content_type: "ads",
            tips: "广告",
            ads_type: "km_zt",
            ads_location: "user_box_banner", // 运营位icon
            need_login: false, // 是否需要登陆,true需要,用户点击,客户端做登陆检查;且跳转时url后面拼接oauth_token参数;
            added_time: 1484311532503,
            images: [ // 图标
                "http://img1000.static.suishenyun.net/2e52e1dc5ac9d868e9983bd3fd8ced1c/d7aae765ad60a781f2515039efa684a1.ico"
            ]
        }
    ]
},
status: 1000,
desc: ""
}
</pre>
                        </td>
                        <td>1000 OK;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="11.12">11.12 按广告位查询广告</h3>
            <form action="<%=ctx%>/api/v1/ads?app_key=28817749&location=checkin_alert" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/ads</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">location</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="location" type="text" value='checkin_alert'/></td>
                        <td></td>
                        <td>广告位: checkin_alert签到弹窗 first_screen开屏 withdraw_progress_announcement提现进度页面公告位置</td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td><pre>
{
data: [
    {
        id: 11,
        title: "",
        source: "",
        layout: 4,
        view_num: 0,
        origin_url: "http://www.kuaima.cn", // 点击跳转地址, 支持http和schema
        platform: "DEFAULT",
        content_type: "ads",
        tips: "广告",
        ads_type: "km_zt",
        ads_location: "checkin_alert", // 任务tab固定运营位icon
        need_login: true, // 是否需要登陆,true需要,用户点击,客户端做登陆检查;且跳转时url后面拼接oauth_token参数;
        added_time: 1484311532503,
        images: [ // 图标
            "http://img1000.static.suishenyun.net"
        ]
    }
],
status: 1000,
desc: ""
}

</pre>
                        </td>
                        <td>1000 OK; 1020没有结果</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="11.13">11.13 查询每日新闻</h3>
            <form action="<%=ctx%>/api/v1/top_news?app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/top_news</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page</font></td>
                        <td>int</td>
                        <td><input style="width: 200px" name="page" type="text" value="1"/></td>
                        <td></td>
                    <tr>
                        <td>----</td>
                        <td>--------</td>
                        <td>-------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td><pre>
{
    "total": 2,
    "page": 1,
    "data": [
        {
            "id": 2,
            "title": "122",
            "date": "2017-07-11",
            "tips": "广告",
            "images": [
                ""
            ]
        },
        {
            "id": 2,
            "title": "122",
            "date": "2017-07-11",
            "tips": "广告",
            "images": [
                ""
            ]
        }
    ],
    "status": 1000,
    "desc": "OK"
}
</pre></td>
                        <td>1000 OK; 1020没有结果</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="11.2">11.2 查询弹窗</h3>
            <form action="<%=ctx%>/api/v1/popup?app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/popup</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">location</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="location" type="text" value='timeline_tab'/></td>
                        <td>
                            弹窗位置: timeline_tab 首页tab; km_zq_tab 赚钱tab; zdk_tab 值得看tab;
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
  "data": {
    "timeline_tab": {
       "id" : 1, // 弹窗id
      "title": "", // 标题
      "image": "", // 图片
      "url": "", // url
      "need_login": true,  // 是否需要登陆 true需要, false不需要
    }
  },
  "status": 1000,
  "desc": "OK"
}
</pre>
                        </td>
                        <td>1000 OK;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="11.3">11.3 查询系统配置</h3>
            <form action="<%=ctx%>/api/v1/system/configs?app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/system/configs</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
data: {
    is_show_my_tab: {
        version: "1.2.4", // 版本
        is_show: 0 // 是否显示我的 0不显示  1显示
    },
    is_show_task_tab: {
        version: "1.2.4", // 版本
        is_show: 0 // 是否显示任务tab 0不显示  1显示
    },
    is_show_video_tab: {
        version: "1.2.4", // 版本
        is_show: 0 // 是否显示视频tab 0不显示  1显示
    },
    novel_keep_tab: {
        icon: "",      //小说预留tab
        is_show: 1,
        title: "预留tab名字",
        url: "www.baidu.com"
    },
    is_show_novel_tab: {
        is_show: 1,    // 是否展示
    },
    novel_good_read_tab: {
        icon: "",      //精品阅读 icon 地址
        is_show: 1,    // 是否展示
        title: "标题",
        desc: "1句文案",
        url: "www.baidu.com"
    },
    tab_show_control_new: {
        task_tab: 0,      //   任务 tab   (0 不显示 1 显示)
        resource_tab: 0,   //   资源tab

    },
    first_screen_ad_show_num: 3, // 开屏广告每日展示次数, 1.4.4版本开始返回
    team_post_url:"www.baidu.com",   //用户请求时需要带上auth_token 和 team_id 参数
    server_timestamp:1508144369661, // 服务器当前系统时间
    //快马开通的头条频道
    tt_category:[
    {
        "category_id": 1,                //快马的频道id
        "code": "__all__",               //头条的频道code
        "partner": "union_zx_kmantj",    //头条该频道的合作标识
        "desc": "推荐"                     //描述
    },
    {
        "category_id": 88,
        "code": "news_hot",
        "partner": "",
        "desc": "热点"
    },
    {
        "category_id": 21,
        "code": "news_local",
        "partner": "",
        "desc": "本地"
    },
    {
        "category_id": 3,
        "code": "video",
        "partner": "union_zx_kmansp",
        "desc": "视频"
    },
    {
        "category_id": 99,
        "code": "news_game",
        "partner": "",
        "desc": "游戏"
    }
]
},
desc: "",
status: 1000
}
</pre>
                        </td>
                        <td>1000 OK;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="12.1">12.1 查询兑吧自动登陆url</h3>
            <form action="<%=ctx%>/api/v1/duiba/autoLogin?app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/duiba/autoLogin</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">redirect</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="redirect" type="text" value=''/></td>
                        <td>
                            登录成功后的重定向地址(http://docs.duiba.com.cn/tech_doc_book/server/general_autologin_url.html)
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
data: {
    duiba_login_url: "http://www.duiba.com.cn/autoLogin/autologin?sign=ad3f9a897b6"
},
status: 1000,
desc: "OK"
}
</pre>
                        </td>
                        <td>1000 OK;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="13.1">13.1 查询可以购买的卡券列表</h3>
            <form action="<%=ctx%>/api/v1/cards?app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/cards</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
total: 1,
page: 1,
data: [
    {
        type: 1, // 阅读加速卡
        name: "阅读加速卡", // 卡券名称
        effective_days: 7, // 有效天数
        icon: "", // 卡券封面
        obtain_method: 1, // 获取方式:1 购买;2 免费领取 3系统发放
        original_price: 1400, // 原价
        sell_price: 1.1, // 售价
        duiba_goods_url: "https%3A%2F%2Fwww.duiba.com.cn%2Fmobile%2Fdetail%3FitemId%3D191" // 兑吧商品详情url
    }
],
status: 1000,
desc: "OK"
}
</pre>
                        </td>
                        <td>1000 OK; 1004尚未登录</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="13.2">13.2 我的阅读加速信息</h3>
            <form action="<%=ctx%>/api/v1/cards/my?app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/cards/my</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
data: {
    tips: "若您有多张加速卡,时间将为您自动累加",
    desc: "每日阅读前20篇文章,将获得双倍奖励",
    leftEffectiveDayNum: 2 // 剩余天数, 为0表示没有加速卡或加速卡已经失效
    startDate:20170304 // 开始加速时间
    endDate:20170305 // 结束加速时间
    isReadAccelerating:true // 现在是否加速中
},
status: 1000,
desc: "OK"
}
</pre>
                        </td>
                        <td>1000 OK; 1004 未登录</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="13.3">13.3 查询用户卡券列表</h3>
            <form action="<%=ctx%>/api/v1/cards/list?app_key=28817749" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/cards/list</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page" type="text" value='1'/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">page_size</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page_size" type="text" value='20'/></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
total: 1,
page: 1,
data: [
    {
        card_id:1, // 卡片id
        card_type: 1, // 卡片类型, 1:阅读加速卡
        card_name: "阅读加速卡", // 卡券名称
        card_effective_days: 7, // 有效天数
        card_icon: "", // 卡券封面
        obtain_method_desc: "购买", // 获取方式: 购买; 五一活动奖励; 新用户奖励;
        sell_price: 1.1, // 售价
        status: 1,//状态 0未使用 1已使用
        added_time: 0 // 获得卡片时间
    }
],
status: 1000,
desc: "OK"
}
</pre>
                        </td>
                        <td>1000 OK; 1004尚未登录</td>
                    </tr>
                </table>
            </form>
            <h3 id="14.1">14.1 查询运营活动信息</h3>
            <form action="<%=ctx%>/api/v1/activity/info?app_key=28817749&activityId=1" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/activity/info</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">activityId</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="activityId" type="text" value=''/></td>
                        <td>
                            活动id
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
    data: {
    isJoin: false,
    activity: {
        id: 1,
        name: "全民收徒",
        image: "http://static.etouch.cn/imgs/upload/1493201279.639.png",
        desc: "1、以活动期间内收取有效徒弟为准，多收多得; 2、活动有效徒弟需要重新定义;",
        act_type: 2, // 活动类型 1阅读送加速卡;2全民收徒
        rule: "2:2;5:10;10:30;15:60;20:100;30:180;60:420;100:800;300:3000;500:5000;1000:13000;200:36000;",
        start_time: 1503849600000,
        end_time: 1504195140000
    },
    leftSeconds: 222454, // 距离结束剩余秒数
    isStart: true,
    isEnd: false,
    validSonNum:0, //活动赏金徒弟个数, isJoin为true时返回
    totalSonNum:10 // 总徒弟数
    },
    desc: "",
    status: 1000
}
</pre>
                        </td>
                        <td>
                            1002 参数错误;<br/> 1013 账号异常; <br/>9500活动不存在或已被下架;
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="14.2">14.2 领取活动奖励</h3>
            <form action="<%=ctx%>/api/v1/activity/receiveReward?app_key=28817749&uid=378627&activityId=1&rewardId=1"
                  method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/activity/receiveReward</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">uid</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="uid" type="text" value='378627'/></td>
                        <td>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">activityId</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="activityId" type="text" value='1'/></td>
                        <td>
                            活动id
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">rewardId</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="rewardId" type="text" value='1'/></td>
                        <td>
                            活动奖励id
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                            1004未登录; <br/>1013 账号异常; <br/>9500活动不存在或已被下架; <br/>9501 活动尚未开始; <br/>9502 活动已经结束;<br/> 9600
                            奖励不存在
                            <br/> 9601 奖励已领取<br/> 9602未达到活动奖励条件<br/> 1007 服务器错误<br/>
                        </td>

                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="14.3">14.3 报名参加活动</h3>
            <form action="<%=ctx%>/api/v1/activity/join?app_key=28817749&activityId=1"
                  method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/activity/join</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">activityId</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="activityId" type="text" value='1'/></td>
                        <td>
                            活动id
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                            1004未登录; <br/>1013 账号异常; <br/>9500活动不存在或已被下架; <br/>9501 活动尚未开始; <br/>9502 活动已经结束;<br/> 9503
                            已经报名过<br/> 1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
<p>&nbsp;</p>
<h3 id="14.4">14.4 查询活动列表页</h3>
            <form action="<%=ctx%>/api/v1/aggregation/list?app_key=28817749&actId=3" method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/aggregation/list</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">actId</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="actId" type="text" value='3'/></td>
                        <td>
                            活动id, 51加速卡活动id为1;全民收徒活动id为3; 万年历引流活动id为5, 国庆活动id为7;
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">date</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="date" type="text" value='20170901'/></td>
                        <td>
                            日期, 不传默认取当天日期
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>opt</td>
                        <td><font color="red">needDetails</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="needDetails" type="text" value=''/></td>
                        <td>
                            是否需要查询详细数据,详细数据包括:前一个列表,后一个列表,活动信息等; 需要传1, 否则传0
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
    data: {
    // 列表页详情
    aggregationListDetails: {
        [
            {
               content_id: 2891906,
               content_type: 1, // 1文章 2采集
               title: "听说城里不让放鞭炮了？",
               layout: 2,
               reserved_column: "dddd",
               images: [
               "http://img.funshion.com/sdw?oid=b03a1680116674f49265370d734dcf09&w=0&h=0",
               "http://img1000.static.suishenyun.net/2e52e1dc5ac9d868e9983bd3fd8ced1c/bf124deb9a3f2514c4f90aa9559dcbfc.png"
               ]
            }
        ]
    },
    // 列表页
    aggregationList: {
    },
    // 前一个列表
    lastAggregationList: {
    },
    // 下一个列表
    nextAggregationList: {
    },
    desc: "",
    status: 1000
}
</pre>
                        </td>
                        <td>
                            1002 参数错误;<br/> 1020无数据,列表为空;
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="16.1">16.1 领取召回奖励</h3>
            <form action="<%=ctx%>/api/v1/recall/receiveReward?app_key=28817749"
                  method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/recall/receiveReward</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                            1004未登录; <br/>9820 非召回用户<br/>1005已领取召回奖励; 9300 要领取的卡券不存在 <br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="16.2">16.2 是否可领取召回奖励</h3>
            <form action="<%=ctx%>/api/v1/recall/canReceiveReward?app_key=28817749"
                  method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/recall/canReceiveReward</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                            1004未登录; <br/>9820 非召回用户<br/> 1005 已领取召回奖励 1000 可以领取<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.1">17.1 查询用户宝箱数</h3>
            <form action="<%=ctx%>/api/v1/box/user?app_key=28817749"
                  method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/box/user</th>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
data:
{
    leftBoxNum: 8 // 宝箱个数
}
status: 1000,
desc: "OK"
}
</pre>1004未登录;
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.2">17.2 开宝箱</h3>
            <form action="<%=ctx%>/api/v1/box/open?app_key=28817749"
                  method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/box/open<t/h>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
data:
{
    coin: 8 // 金币数
}
status: 1000,
desc: "OK"
}
</pre>
                            1004未登录;9940无可开宝箱;1013账号异常,请联系客服;1007开宝箱失败,请稍后重试
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="18.1">18.1 我的时光机数据</h3>
            <form action="<%=ctx%>/api/v1/sgj/data?app_key=28817749&uid=1"
                  method="get">
                
                <input style="width: 200px" name="uid" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/sgj/data<t/h>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
    <pre>
    {
    data: {
    uid: 100000236525,
    nick: "182****9431", // 昵称
    father_nick: "紫琼风", // 好友昵称
    register_time: 1513057523021, // 注册时间
    total_income: 0.98, // 总收益
    first_withdraw_time: 0, // 第一次提现时间
    first_withdraw_amount: 0, //第一次体现金额
    invite_coin: 0, // 邀请好友金币数
    share_task_coin: 0, // 分享任务金币
    search_task_coin: 0, // 搜索任务金币
    read_article_coin: 0, // 阅读文章金币
    checkin_coin: 700, // 签到金币
    server_time:1513057523021, // 服务器当前系统时间
    },
    desc: "",
    status: 1000,
    }
    </pre>
    2001 用户不存在; 1020 无数据,前端页面展示进度条,每隔2s查一次,知道查到数据;
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="18.2">18.2 分享时光机</h3>
            <form action="<%=ctx%>/api/v1/sgj/share?app_key=28817749"
                  method="get">
                
                
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/sgj/share<t/h>
                    </tr>
                    <tr>
                        <th>方法</th>
                        <th colspan="5">GET</th>
                    </tr>
                    <tr>
                        <th>必要性</th>
                        <th>参数名</th>
                        <th>类型</th>
                        <th>测试</th>
                        <th>说明</th>
                        <th>返回码</th>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
    <pre>
    {
    data:
    {
    is_obtain_box: true // 是否获得宝箱
    }
    status: 1000,
    desc: "OK"
    }
    </pre>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div id="gc-footer" dir="ltr">
            <div class="text">
                <div class="notice">
                    <div id="notice"
                         style="text-align: center; "></div>
                </div>
				<span style="text-align: center; ">kuaima
					Mobile Work </span><a href="http://www.kuaima.cn">kuaima</a><br/>
            </div>
        </div>
        <div style="width: 30px; height: 30px; position: fixed; bottom: 0px; right: 0px; background-color: #BBB; padding: 8px 8px 0px 8px;">
            <center>
                <a href="#" style="text-decoration: none; font-weight: bold;">TOP</a>
            </center>
        </div>
    </div>
</div>
</body>
</html>

