
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
                        <li><a href="#msg"><strong>15. 值得看相关接口</strong></a></li>
                        <li><a href="#15.1">15.1 校验采集地址</a></li>
                        <li><a href="#15.2">15.2 查询标签列表</a></li>
                        <li><a href="#15.3">15.3 添加采集内容</a></li>
                        <li><a href="#15.4">15.4 我的采集(H5使用)</a></li>
                        <li><a href="#15.5">15.5 校验发布白名单</a></li>
                        <li><a href="#15.6">15.6 采集详情</a></li>
                        <li><a href="#15.7">15.7 采集列表</a></li>
                        <li><a href="#15.8">15.8 采集收益</a></li>
                        <li><a href="#15.9">15.9 浏览采集获取金币</a></li>
                        <li><a href="#15.10">15.10 申请值得看采集权限</a></li>
                        <li><a href="#15.11">15.11 举报</a></li>
                        <li><a href="#15.12">15.12 采集用户介绍</a></li>
                        <li><a href="#15.13">15.13 资源搜索</a></li>
                        <li><a href="#15.14">15.14 兑换资源</a></li>
                        <li><a href="#15.15">15.15 我兑换的采集资源</a></li>
                        <li><a href="#15.16">15.16 昨日精选采集</a></li>
                        <li><a href="#msg"><strong>17. 团队相关接口</strong></a></li>
                        <li><a href="#17.1">17.1 创建团队</a></li>
                        <li><a href="#17.2">17.2 邀请码/快马扫一扫, 加入团队</a></li>
                        <li><a href="#17.3">17.3 邀请徒弟入团</a></li>
                        <li><a href="#17.4">17.4 收到的邀请</a></li>
                        <li><a href="#17.5">17.5 同意/拒绝入团邀请</a></li>
                        <li><a href="#17.6">17.6 团队信息(客户端/h5)</a></li>
                        <li><a href="#17.7">17.7 团队成员列表(客户端/h5)</a></li>
                        <li><a href="#17.8">17.8 自己退出团队</a></li>
                        <li><a href="#17.9">17.9 踢出队员</a></li>
                        <li><a href="#17.10">17.10 鞭策队友</a></li>
                        <li><a href="#17.11">17.11 修改团队名称</a></li>
                        <li><a href="#17.12">17.12 微信/分享 链接 加入团队(h5)</a></li>
                        <li><a href="#17.13">17.13 我的团队</a></li>
                        <li><a href="#17.14">17.14 我的团队邀请信息(h5专用)</a></li>
                        <li><a href="#17.15">17.15 我的组队状态</a></li>
                        <li><a href="#17.16">17.16 快速组队</a></li>
                        <li><a href="#17.17">17.17 团队招募状态</a></li>
                        <li><a href="#17.18">17.18 发布招募信息</a></li>
                        <li><a href="#17.19">17.19 取消招募信息</a></li>
                        <li><a href="#17.20">17.20 招募信息列表</a></li>
                        <li><a href="#17.21">17.21 申请加入</a></li>
                        <li><a href="#17.22">17.22 待处理申请列表</a></li>
                        <li><a href="#17.23">17.23 团长处理申请</a></li>
                        <li><a href="#17.24">17.24 我的团队(new)</a></li>
                        <li><a href="#msg"><strong>18. 右下角快马图标相关接口</strong></a></li>
                        <li><a href="#18.1">18.1 首页快马图标展示配置</a></li>
                        <li><a href="#msg"><strong>19. 微信服务号接口相关</strong></a></li>
                        <li><a href="#19.1">19.1 获取网页授权的地址</a></li>
                        <li><a href="#19.2">19.2 查看微信绑定领取状态</a></li>
                        <li><a href="#19.3">19.3 领取微信绑定奖励</a></li>
                        <li><a href="#19.4">19.4 微信签到状态</a></li>
                        <li><a href="#19.5">19.5 微信签到</a></li>
                        <li><a href="#msg"><strong>20. 深度任务</strong></a></li>
                        <li><a href="#20.1">20.1 深度任务列表</a></li>
                        <li><a href="#20.2">20.2 深度任务详情</a></li>
                        <li><a href="#20.3">20.3 领取深度任务</a></li>
                        <li><a href="#20.4">20.4 提交深度任务</a></li>
                        <li><a href="#20.5">20.5 我的深度任务列表</a></li>






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
            <h3 id="15.1">15.1 校验采集地址</h3>
            <form action="<%=ctx%>/api/v1/post/checkOriginUrl" method="post">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/post/checkOriginUrl</th>
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
                        <td><input style="width: 200px" name="" type="text"
                                   value=''/></td>
                        <td>
                            <pre>
                            {
                                "origin_url" : "http://wwww.baidu.com",
                                "content_type":"post"   // post 文章 , resource 资源
                            }
                            </pre>
                        </td>
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
                            1000 OK; </br>9700 输入的链接地址有误或快马暂不支持此网站文章; <br/>9701 已有用户转载过此篇文章;  <br/>9702 没有权限转载;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="15.2">15.2 查询标签列表</h3>
            <form action="<%=ctx%>/api/v1/tag/all" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/tag/all</th>
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
                        <td><input style="width: 200px" name="content_type" type="text" value='post'/></td>
                        <td>
                            值得看类目(post 文章,resource 资源)
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
data: [
{
id: 1,
name: "猎奇"
},
{
id: 2,
name: "娱乐"
}
],
status: 1000,
desc: "OK"
}
								</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1020 没有结果<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="15.3">15.3 添加采集内容</h3>
            <form action="<%=ctx%>/api/v1/post/add" method="post">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='eyJkZXZpY2UiOiIyMjYxOTRENi0xOERDLTQ3QUItOUI2QS03RUM3MDE5NTI4NUMiLCJ1aWQiOiIxMDAwMDAxOTI0OTkiLCJ1cCI6IklQSE9ORSIsImFjY3RrIjoiMC44MjkxMjc2NTUzMDM5OTI2OjlmMzUwMzg4LjE0OTY4ODk4Mjc2OTcifQ=='/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/post/add</th>
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
                        <td><input style="width: 200px" name="" type="text"
                                   value=''/></td>
                        <td>
                            <pre>
                            {
                                "tag_id" : 1,
                                "origin_url" : "http://wwww.baidu.com",
                                "content_type" : "post", //post 文章， photo 图片， resource 资源
                                "secret_key" : "post", //资源的密码
                                "title" : "这是图片或者资源", //
                                "images" : "[\"http://img1.jpg\" , \"http://img2.jpg\"]", // 上传到又拍云的图片
                                "cover_format" : "{\"width\": 121,\"height\": 444}", // 单张图片的尺寸

                            }
                            </pre>
                        </td>
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
                            1004未登录; <br/>1013 账号异常; <br/>9700 输入的链接地址有误或快马暂不支持此网站文章; <br/>9701 已有用户转载过此篇文章; <br/>9702
                            没有权限转载;<br/> 9703 文章不存在或已被删除<br/> 1007 服务器错误<br/>

                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="15.4">15.4 我的采集</h3>
            <form action="<%=ctx%>/api/v1/post/personally" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/post/personally</th>
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
                        <td><font color="red">status</font></td>
                        <td>int</td>
                        <td><input style="width: 200px" name="status" type="text" value='1'/></td>
                        <td>
                            发布状态 (1 发布中 2 已上线 2 已下线)
                        </td>
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
total_num: 1,
page: 1,
data: [
	{   //文章
		id: 6,
		uid: 378627,
		nick_name: "",
		avatar: "",
        content_type:"post",
		tag_id: 1, //标签id
		tag_name: "猎奇", //标签名字
		type: 2,    //1 图文 2 视频
		title: "叫MC啥……",
		status: 2,
		origin: 2,
		origin_url: "https://www.kuaishou.com/photo/20965523/2238332334",
		author_name: "爬宠馆大亮哥哥",  //源作者
		layout: 2,      //布局 1左右单图, 2上下单图, 3上下三图,4单个大图 ,5无图
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
        hot_value:2, // 热力值, 为0时展示暂无
		images: ["https://zkres.myzaker.com/201701/5874d195a07aec61500210b6_320.jpg"]},


      {  //图片
		id: 7,
		uid: 378627,
		nick_name: "",
		avatar: "",
        content_type:"photo",
		tag_id: 0, //标签id
		tag_name: "", //标签名字
		type: 1,    //1 图文 2 视频
		title: "叫MC啥……",
		status: 2,
		origin: 3,
		origin_url: "https://www.kuaishou.com/photo/20965523/2238332334",
		author_name: "爬宠馆大亮哥哥",  //源作者
		layout: 2,      //布局 1左右单图, 2上下单图, 3上下三图,4单个大图 ,5无图
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
        hot_value:2, // 热力值, 为0时展示暂无
		images: ["https://zkres.myzaker.com/201701/5874d195a07aec61500210b6_320.jpg"]},

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
		images: ["https://zkres.myzaker.com/201701/5874d195a07aec61500210b6_320.jpg"]}
],
status: 1000,
desc: "OK"
}
								</pre>
                        </td>
                        <td>
                            1004未登录; <br/>1013 账号异常; <br/>1020 没有结果<br/> 1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="15.5">15.5 校验发布白名单</h3>
            <form action="<%=ctx%>/api/v1/post/checkAuthority" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/post/checkAuthority</th>
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
                            1000 OK; </br>9702 没有权限转载<br/>9706 采集权限已经申请<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="15.6">15.6 采集详情</h3>
            <form action="<%=ctx%>/api/v1/post/detail" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/post/detail</th>
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
                        <td>long</td>
                        <td><input style="width: 200px" name="id" type="text" value='1'/></td>
                        <td>
                            采集的id
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
data: {
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
hasMoreComments: true,
post: {
        id: 6,
		uid: 378627,
		nick_name: "",
		avatar: "",
        content_type:"resource",//post 文章， photo 图片， resource 资源
        pay_amount:0.01 ,//资源定价
        has_exchanged:false //是否兑换过
        can_report:false //是否可以举报
        secret_key:"密码",
		tag_id: 1, //标签id
		tag_name: "猎奇", //标签名字
		type: 2,    //1 图文 2 视频
		title: "叫MC啥……",
		status: 2,
		origin: 2,
		origin_url: "https://www.kuaishou.com/photo/20965523/2238332334",
		author_name: "爬宠馆大亮哥哥",  //源作者
		layout: 2,      //布局 1左右单图, 2上下单图, 3上下三图,4单个大图 ,5无图
		view_num: 1,      //多少人看过
        comment_num: 15, //总评论数
        praise_num: 6,    //总点赞数
		message: "",  //下架原因
		pub_time: 1495850585002,  //上架/下架时间
		added_time: 1495695232463, //转载(申请)时间
		url: "",
		origin_icon: "",     //采集来源icon
		origin_name: "快手",  //采集来源
		has_viewed: false,
		images: ["https://zkres.myzaker.com/201701/5874d195a07aec61500210b6_320.jpg"]}
},
ads:{
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
}
isCollect: false,  //是否收藏
isPraise: false   //是否点赞
},
desc: "",
status: 1000
}
								</pre>
                        </td>
                        <td>
                            1000 OK; </br>9703 文章不存在或已被删除<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="15.7">15.7 采集列表</h3>
            <form action="<%=ctx%>/api/v1/post/recommend" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/post/recommend</th>
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
                        <td><input style="width: 200px" name="content_type" type="text" value='post'/></td>
                        <td>
                            值得看类目(post 文章,resource 资源)
                        </td>
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
                        <td><font color="red">tag_id</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="tag_id" type="text"
                                   value=''/></td>
                        <td>选择全部 标签,tag_id 不用传</td>
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
                        <td>opt</td>
                        <td><font color="red">offset</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="offset" type="text"
                                   value=''/></td>
                        <td>第一次获取可传0;此后传递服务器上次接口回传的参数offset的值</td>
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
offset: 1496650620011,
hasMore: true,
refreshNum: 3,
list: [
	{   //文章
		id: 6,
		uid: 378627,
		nick_name: "",
		avatar: "",
        content_type:"post",//post 文章， photo 图片， resource 资源
		tag_id: 1, //标签id
		tag_name: "猎奇", //标签名字
		type: 2,    //1 图文 2 视频
		title: "叫MC啥……",
		status: 2,
		origin: 2,
		origin_url: "https://www.kuaishou.com/photo/20965523/2238332334",
		author_name: "爬宠馆大亮哥哥",  //源作者
		layout: 2,      //布局 1左右单图, 2上下单图, 3上下三图,4单个大图 ,5无图
		view_num: 0,
		comment_num: 5,
		praise_num: 3,
		message: "",  //下架原因
		pub_time: 1495850585002,  //上架/下架时间
		added_time: 1495695232463, //转载(申请)时间
		url: "",
		origin_icon: "",     //采集来源icon
		origin_name: "快手",  //采集来源
		has_viewed: false,
        hot_value:2, // 热力值, 为0时展示暂无
		images: ["https://zkres.myzaker.com/201701/5874d195a07aec61500210b6_320.jpg"]},


      {  //图片
		id: 7,
		uid: 378627,
		nick_name: "",
		avatar: "",
        content_type:"photo",//post 文章， photo 图片， resource 资源
		tag_id: 0, //标签id
		tag_name: "", //标签名字
		type: 1,    //1 图文 2 视频
		title: "叫MC啥……",
		status: 2,
		origin: 3,
		origin_url: "https://www.kuaishou.com/photo/20965523/2238332334",
		author_name: "爬宠馆大亮哥哥",  //源作者
		layout: 2,      //布局 1左右单图, 2上下单图, 3上下三图,4单个大图 ,5无图
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
        has_praised:false,
        hot_value:2, // 热力值, 为0时展示暂无
		images: ["https://zkres.myzaker.com/201701/5874d195a07aec61500210b6_320.jpg"]},

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
		images: ["https://zkres.myzaker.com/201701/5874d195a07aec61500210b6_320.jpg"]}
]
},
desc: "",
status: 1000
}
								</pre>
                        </td>
                        <td>
                            1000 OK;
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="15.8">15.8 采集收益(昨日/今日)</h3>
            <form action="<%=ctx%>/api/v1/post/day_coin" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/post/day_coin</th>
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
todayCoin: 0,
yesterdayCoin: 0
},
desc: "",
status: 1000
}
								</pre>
                        </td>
                        <td>
                            1000 OK; </br>1004 尚未登录
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="15.9">15.9 浏览采集获取金币</h3>
            <form action="<%=ctx%>/api/v1/post/view" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/post/view</th>
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
                        <td>string</td>
                        <td><input style="width: 200px" name="uid" type="text" value=''/></td>
                        <td>uid<font color="red"></font></td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">id</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="id" type="text"
                                   value=''/></td>
                        <td>文章id</td>
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
    "is_obtain_box":true // 是否获得宝箱(注意接口返回的json中有可能没有这个字段)
},
status: 1000,
desc: "OK"
}
								</pre>
                        </td>
                        <td>
                            1004未登录; <br/> 1000 OK; </br>9703 文章不存在或已被删除<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="15.10">15.10 申请值得看采集权限</h3>
            <form action="<%=ctx%>/api/v1/zhdk/initialUsers?&app_key=28817749&auth_token=1" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="4"><%=ctx%>/api/v1/zhdk/initialUsers</th>
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
                        <td><font color="red">question</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="question" type="text" value=''/></td>
                        <td>
                            <pre>
     问题:答案;问题:答案;
                            </pre>
                        </td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
                            1004 尚未登录; 其他错误码: 请完成问卷后提交, 您已拥有采集权限,您已申请过，请耐心等待审核,申请用户不存在
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="15.11">15.11 举报</h3>
            <form action="<%=ctx%>/api/v1/report" method="post">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='eyJkZXZpY2UiOiIyMjYxOTRENi0xOERDLTQ3QUItOUI2QS03RUM3MDE5NTI4NUMiLCJ1aWQiOiIxMDAwMDAxOTI0OTkiLCJ1cCI6IklQSE9ORSIsImFjY3RrIjoiMC44MjkxMjc2NTUzMDM5OTI2OjlmMzUwMzg4LjE0OTY4ODk4Mjc2OTcifQ=='/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/report</th>
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
                        <td><input style="width: 200px" name="" type="text"
                                   value=''/></td>
                        <td>
                        <pre>
                        {
                            "obj_id" : 1, // 举报的采集id
                            "report_reason" : 1, 举报原因,1:标签错误;2:内容非法;3:内容不存在;4:资源已失效;5:资源含密码;
                            "tag_id":1, //正确的分类id, report_reason取1时需传;
                            "detail_reason":""// 内容违规的原因, report_reason取2时需传;
                        }
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
                            1004未登录; <br/>1002 参数错误; <br/> 9703 采集文章不存在或已被删除<br/> 9710已举报过此内容<br/>9711已达今日举报次数限制<br/> 1007 服务器错误
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="15.12">15.12 采集用户介绍</h3>
            <form action="<%=ctx%>/api/v1/post/user_info" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/post/user_info</th>
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
                        <td><font color="red">target_uid</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="target_uid" type="text" value='1'/></td>
                        <td>
                            被点击采集用户的uid
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
uid: 593699,
nick_name: "小辣椒",
avatar: "http://imgcom.kuaima.suishenyun.net/cfcd208495d565ef66e7dff9f98764da/d37cf7a41fa0ce30bba0a053a7607c51.jpg",
post_num: 206,
total_coin: 1571.97,
user_post_status_list: [
{
tag_id: 1,
tag_name: "搞笑",
count: 30
},
{
tag_id: 2,
tag_name: "社会",
count: 63
},
{
tag_id: 3,
tag_name: "八卦",
count: 27
},
{
tag_id: 4,
tag_name: "猎奇",
count: 84
},
{
tag_id: 5,
tag_name: "好物",
count: 2
}
]
},
desc: "",
status: 1000
}
								</pre>
                        </td>
                        <td>
                            1000 OK; </br>2002 用户不存在<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="15.13">15.13 资源搜索</h3>
            <form action="<%=ctx%>/api/v1/post/search" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/post/search</th>
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
                        <td><font color="red">page</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="page" type="text" value=''/></td>
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
data: {

result_type:"list"  // list:正常结果返回,分页获取字段 list 数组内容  , url:搜索引擎返回,取url字段的地址
url: "http://wap.sogou.com/web/sl?bid=sogou-mobb-607bc9ebe4abfcd6&keyword=ssss"
total: 1,
total_num: 1,
page: 1,
list: [
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
		images: ["https://zkres.myzaker.com/201701/5874d195a07aec61500210b6_320.jpg"]}
]
}
								</pre>
                        </td>
                        <td>
                            1000 OK; </br>2002 用户不存在<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="15.14">15.14 兑换采集资源</h3>
            <form action="<%=ctx%>/api/v1/post/exchange/1?app_key=28817749" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/post/exchange/{id}</th>
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
    "origin_url": "http://", // 资源原始地址
    "secret_key": "123" // 资源密码
},
status: 1000,
desc: "OK"
}
</pre>
                        </td>
                        <td>1000 OK; 1004未登录; 9703资源不存在或已被下架; 1010余额不足; 9801已兑换过资源; 9802 禁止兑换自己的资源; 1007兑换失败</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="15.15">15.15 我兑换的采集资源</h3>
            <form action="<%=ctx%>/api/v1/post/myExchange?app_key=28817749" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/post/myExchange</th>
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
    uid: 124976,
    post_id: 781, // 资源id
    post_author_nick: "我我全心全意", // 资源采集者昵称
    post_title: "特殊时期", // 资源标题
    post_images: [
        "http://"
    ], // 资源图片
    post_layout: 1, // 布局方式
    amount: 0.01, // 兑换金额
    can_report:true, // 是否可以举报
    added_time: 1501742419959 // 兑换时间
}
],
status: 1000,
desc: "OK"
}
</pre>
                        </td>
                        <td>1000 OK; 1004未登录; 1020没有数据; added_time超过24h不显示举报按钮;</td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="15.16">15.16 昨日精选采集(H5)</h3>
            <form action="<%=ctx%>/api/v1/post/topList" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/post/topList</th>
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
                        <td><font color="red">type</font></td>
                        <td>int</td>
                        <td><input style="width: 200px" name="type" type="text" value='1'/></td>
                        <td>
                            类别 (1 阅读精选 2 评论精选)
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
total: 1,
total_num: 1,
page: 1,
data: [
	{   //文章
		id: 6,
		uid: 378627,
		nick_name: "",
		avatar: "",
        content_type:"post",
		tag_id: 1, //标签id
		tag_name: "猎奇", //标签名字
		type: 2,    //1 图文 2 视频
		title: "叫MC啥……",
		status: 2,
		origin: 2,
		origin_url: "https://www.kuaishou.com/photo/20965523/2238332334",
		author_name: "爬宠馆大亮哥哥",  //源作者
		layout: 2,      //布局 1左右单图, 2上下单图, 3上下三图,4单个大图 ,5无图
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
        hot_value:2, // 热力值, 为0时展示暂无
		images: ["https://zkres.myzaker.com/201701/5874d195a07aec61500210b6_320.jpg"]},


      {  //图片
		id: 7,
		uid: 378627,
		nick_name: "",
		avatar: "",
        content_type:"photo",
		tag_id: 0, //标签id
		tag_name: "", //标签名字
		type: 1,    //1 图文 2 视频
		title: "叫MC啥……",
		status: 2,
		origin: 3,
		origin_url: "https://www.kuaishou.com/photo/20965523/2238332334",
		author_name: "爬宠馆大亮哥哥",  //源作者
		layout: 2,      //布局 1左右单图, 2上下单图, 3上下三图,4单个大图 ,5无图
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
        hot_value:2, // 热力值, 为0时展示暂无
		images: ["https://zkres.myzaker.com/201701/5874d195a07aec61500210b6_320.jpg"]}
],
status: 1000,
desc: "OK"
}
								</pre>
                        </td>
                        <td>
                            1004未登录; <br/>1013 账号异常; <br/>1020 没有结果<br/> 1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>

            <h3 id="17.1">17.1 创建团队</h3>
            <form action="<%=ctx%>/api/v1/teams/create" method="post">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/create</th>
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
                        <td><input style="width: 200px" name="" type="text"
                                   value=''/></td>
                        <td>
<pre>
{
    team_name: "团队名称"
}
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
<pre>
{
data: {
    id: 1,
    team_name: "赚钱",
    invite_code: "12uhj238",
    member_num: 2,
    status: 0,
    added_time: 0,
    update_time: 0,
    total_coin: 0,
    yesterday_coin: 0
    },
status: 1000,
desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.2">17.2 邀请码/快马扫一扫 加入团队</h3>
            <form action="<%=ctx%>/api/v1/teams/join" method="post">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/join</th>
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
                        <td><input style="width: 200px" name="" type="text"
                                   value=''/></td>
                        <td>
<pre>
{
    "join_type": 1,    // 入团方式 : 2 邀请码,4  快马扫一扫
    "invite_code": "12uhj238",  //join_type 为2 时必填,默认为""
    "code": "fsdfsdfsf22"    join_type 为4 时必填,是二维码里的code参数,里面包含了一些团队信息
}
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
<pre>
{
    status: 1000,
    desc: "OK",
    "data": {
    "team_id":111// 团队id
    }
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.3">17.3 邀请徒弟入团</h3>
            <form action="<%=ctx%>/api/v1/teams/{teamId}/invite/{sonUid}" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/{teamId}/invite/{sonUid}</th>
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
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.4">17.4 收到的邀请</h3>
            <form action="<%=ctx%>/api/v1/teams/invite" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/invite</th>
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

    data:[
        {
            id: 1,
            team_id: 1,
            from_uid: 111,   //邀请者的uid
            from_nick: "小二",//邀请者的昵称
            from_avatar: "头像",//邀请者的头像
            to_uid: 100000192499,//被邀请的徒弟的uid
            team_name: "赚钱", //团队名字
            team_member_num: 0//团队人数
        }

    ],
    status: 1000,
    desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.5">17.5 同意/拒绝邀请</h3>
            <form action="<%=ctx%>/api/v1/teams/invite/{inviteId}" method="post">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/invite/{inviteId}</th>
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
                        <td><input style="width: 200px" name="" type="text"
                                   value=''/></td>
                        <td>
<pre>
{
    "status": 1,    // 是否同意邀请 : 1 同意,2  拒绝

}
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
<pre>
{
    status: 1000,
    desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.6">17.6 团队信息(客户端/h5)</h3>
            <form action="<%=ctx%>/api/v1/teams/{teamId}" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/{teamId}</th>
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
            id: 1,
            team_name: "赚钱",
            invite_code: "12uhj238", //邀请码
            member_num: 1,     //成员数目
            totalCoin: 100,  //累计分红
            yesterdayCoin: 20, //昨日分红
            status: 0,    //上线 ,下线(成员小于2)
            web_share_code:  "fdsfsd33ddsdf"  //加密后的参数 包括 uid 和team_id
            added_time: 0,
            update_time: 0
        },
        status: 1000,
        desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.7">17.7 团队成员列表(客户端/h5)</h3>
            <form action="<%=ctx%>/api/v1/teams/{teamId}/member" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/{teamId}/member</th>
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
    id: 1,
    team_id: 1,
    uid: 111,
    nick_name: "小二",
    avatar: "头像地址",
    role: 1,       //1 队长 2 队员
},
{
    id: 2,
    team_id: 1,
    uid: 222,
    nick_name: "小三",
    avatar: "头像地址",
    role: 2,
}
],
    status: 1000,
    desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.8">17.8 自己退出团队</h3>
            <form action="<%=ctx%>/api/v1/teams/{teamId}/quit" method="post">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/{teamId}/quit</th>
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
    status: 1000,
    desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.9">17.9 踢出队员</h3>
            <form action="<%=ctx%>/api/v1/teams/{teamId}/kick/{targetUid}" method="post">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/{teamId}/kick/{targetUid}</th>
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
    status: 1000,
    desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.10">17.10 鞭策队友</h3>
            <form action="<%=ctx%>/api/v1/teams/{teamId}/remind/{targetUid}" method="post">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/{teamId}/remind/{targetUid}</th>
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
    status: 1000,
    desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.11">17.11 修改团队名称</h3>
            <form action="<%=ctx%>/api/v1/teams/{teamId}/update" method="post">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/{teamId}/update</th>
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
                        <td><input style="width: 200px" name="" type="text"
                                   value=''/></td>
                        <td>
<pre>
{
    team_name: "团队名称"
}
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
<pre>
{
    status: 1000,
    desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.12">17.12 微信/分享 链接 加入团队(h5)</h3>
            <form action="<%=ctx%>/api/v1/teams/webJoin" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/webJoin</th>
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
                        <td><font color="red">join_type</font></td>
                        <td>int</td>
                        <td><input style="width: 200px" name="fu" type="text"
                                   value='1235'/></td>
                        <td>3 微信扫一扫  ,6 社交分享</td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">web_share_code</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="web_share_code" type="text"
                                   value='1234'/></td>
                        <td>DES 加密后的私有信息</td>
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
    desc: "OK",
    data:{
        isNewUser:1,     // 1 新用户 0 老用户
        isJoinTeam :1 // 1 入团成功 0 入团失败
        errorMsg:""    //入团失败原因

    }
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.13">17.13 我的团队</h3>
            <form action="<%=ctx%>/api/v1/teams/{teamId}/info" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/{teamId}/info</th>
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
    team: {
        id: 1,
        team_name: "赚钱",
        invite_code: "12uhj238",
        member_num: 2,
        status: 0,
        added_time: 0,
        update_time: 0,
        total_coin: 0,
        yesterday_coin: 0,   //昨日团队分红
        my_yesterday_coin: 0,  //昨日我的分红
        leader_uid: 124  //团长
        msg_num:9  //团队申请数目
    },
    team_members: [
        {
        id: 2,
        team_id: 1,
        uid: 222,
        nick_name: "小三",
        avatar: "头像地址",
        role: 2,  //1 队长 2 队员
    recent_active_time:0
        added_time: 0,
        update_time: 0
        },
        {
        id: 1,
        team_id: 1,
        uid: 111,
        nick_name: "小二",
        avatar: "头像地址",
        role: 1,    //1 队长 2 队员
        recent_active_time:0

        added_time: 0,
        update_time: 0
        }
    ],
    my_task_info:{  //我的任务情况
        search:  "1/10",
        check_in:"1/1",
        post_view:"10/10"   //前者实际次数 后者要求次数


    }
    team_task_info: {
        search: {
            task_code: "search",
            task_name: "搜索任务",
            task_desc: "",
            lock_flag:0    //1 锁定 0 解锁
            complete_flag: 0,
            task_coin: 0,
            complete_num: 0,
            complete_list: [ ],
            un_complete_list: [
                222,      //uid
                111       //uid
            ]
        },
        check_in: {
            task_code: "check_in",
            task_name: "签到任务",
            lock_flag:0    //1 锁定 0 解锁
            task_desc: "",
            complete_flag: 0,
            task_coin: 0,
            complete_num: 0,
            complete_list: [ ],
            un_complete_list: [
                222,
                111
            ]
        },
        post_view: {
            task_code: "post_view",
            task_name: "值得看任务",
            lock_flag:0    //1 锁定 0 解锁
            task_desc: "",
            complete_flag: 0,
            task_coin: 0,
            complete_num: 0,
            complete_list: [ ],
            un_complete_list: [
                222,
                111
            ]
        }
    }
},
status: 1000,
desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.14">17.14 我的团队邀请信息(h5专用)</h3>
            <form action="<%=ctx%>/api/v1/teams/myTeam" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/myTeam</th>
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
            id: 1,
            team_name: "赚钱",
            invite_code: "12uhj238", //邀请码
            member_num: 1,     //成员数目
            totalCoin: 100,  //累计分红
            yesterdayCoin: 20, //昨日分红
            status: 0,    //上线 ,下线(成员小于2)
            web_share_code:  "fdsfsd33ddsdf"  //加密后的参数 包括 uid 和team_id
            added_time: 0,
            update_time: 0
        },
        status: 1000,
        desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.15">17.15 我的组队状态</h3>
            <form action="<%=ctx%>/api/v1/teams/make/status" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/make/status</th>
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
             has_team: 1,    // 0 没有团队 1 有团队
            is_matching: 0,    //0 尚未开始匹配 1 匹配中 2 匹配失败
            team_id:0      //团队id
        },
        status: 1000,
        desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.16">17.16 快速组队</h3>
            <form action="<%=ctx%>/api/v1/teams/make" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/make</th>
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
                            1000 OK;<br/>1007 服务器错误 1004 尚未登录 9902 已经有一个团队 1013 黑名单用户<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.17">17.17 团队招募状态</h3>
            <form action="<%=ctx%>/api/v1/teams/{teamId}/recruit_status" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/{teamId}/recruit_status</th>
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

            status: 0,    //0 未发布且没有人满 1 发布中 2 未发布且人已经满了
            team_id:1      //团队id
        },
        status: 1000,
        desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.18">17.18 发布招募信息</h3>
            <form action="<%=ctx%>/api/v1/teams/{teamId}/recruit" method="post">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/{teamId}/recruit</th>
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
    status: 1000,
    desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
        <h3 id="17.19">17.19 取消招募信息</h3>
        <form action="<%=ctx%>/api/v1/teams/{teamId}/cancel_recruit" method="post">
            <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
            <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
            <table>
                <tr>
                    <th>地址</th>
                    <th colspan="5"><%=ctx%>/api/v1/teams/{teamId}/cancel_recruit</th>
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
    status: 1000,
    desc: "OK"
}
</pre>
                    </td>
                    <td>
                        1000 OK;<br/>1007 服务器错误<br/>
                    </td>
                </tr>
            </table>
        </form>
        <p>&nbsp;</p>
        <h3 id="17.20">17.20 招募信息列表</h3>
        <form action="<%=ctx%>/api/v1/teams/recruit" method="get">
            <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
            <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
            <table>
                <tr>
                    <th>地址</th>
                    <th colspan="5"><%=ctx%>/api/v1/teams/recruit</th>
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
                    <td><font color="red">offset</font></td>
                    <td>long</td>
                    <td><input style="width: 200px" name="offset" type="text"
                               value='1234'/></td>
                    <td>服务返回的offset值,初次请求设为0</td>
                </tr>
                <tr>
                    <td>must</td>
                    <td><font color="red">page</font></td>
                    <td>int</td>
                    <td><input style="width: 200px" name="page" type="text"
                               value='1'/></td>
                    <td>页数</td>
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
offset: 9223372036854776000,  //分页标记,下一页是作为参数
hasMore: false,  //是否还有下一页
list: [
    {
        id: 11,
        team_name: "2121212",
        invite_code: "XJ1C9N2O",
        member_num: 2,
        status: 1,
        added_time: 1505185463760,
        update_time: 1505196534841,
        total_coin: 0,
        yesterday_coin: 0,
        my_yesterday_coin: 0,
        web_share_code: "",
        leader_uid: 0,
        apply_status: 0   // 0 未申请 1 已经申请
    },
    {
        id: 3,
        team_name: "我的团长我的团",
        invite_code: "O5QYXBU6",
        member_num: 5,
        status: 1,
        added_time: 1505136880869,
        update_time: 1506506628456,
        total_coin: 3504,
        yesterday_coin: 0,
        my_yesterday_coin: 0,
        web_share_code: "",
        leader_uid: 0,
        apply_status: 0
    },
    {
        id: 37,
        team_name: "同岁估计",
        invite_code: "OGUFNKZ5",
        member_num: 4,
        status: 1,
        added_time: 1505355837318,
        update_time: 1506410580265,
        total_coin: 0,
        yesterday_coin: 0,
        my_yesterday_coin: 0,
        web_share_code: "",
        leader_uid: 0,
        apply_status: 0
    }
]
},
status: 1000,
desc: "OK"
}
</pre>
                    </td>
                    <td>
                        1000 OK;<br/>1007 服务器错误<br/>
                    </td>
                </tr>
            </table>
        </form>
        <p>&nbsp;</p>
            <h3 id="17.21">17.21 申请加入</h3>
            <form action="<%=ctx%>/api/v1/teams/{teamId}/apply" method="post">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/{teamId}/apply</th>
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
                        <td><input style="width: 200px" name="" type="text"
                                   value=''/></td>
                        <td>
<pre>
{
    msg: "申请的留言内容"
}
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
<pre>
{
    status: 1000,
    desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.22">17.22 待处理申请列表</h3>
            <form action="<%=ctx%>/api/v1/teams/{teamId}/apply" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/{teamId}/apply</th>
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
                        <td><font color="red">offset</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="offset" type="text"
                                   value='1234'/></td>
                        <td>服务返回的offset值,初次请求设为0</td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">page</font></td>
                        <td>int</td>
                        <td><input style="width: 200px" name="page" type="text"
                                   value='1'/></td>
                        <td>页数</td>
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
    offset: 4,  //分页标记,下一页是作为参数
    hasMore: false,  //是否还有下一页
    list: [
            {
                id: 4,
                team_id: 3,
                from_uid: 333,
                from_nick: "小胡",
                from_avatar: "",
                msg: "工作"   //留言
            },
            {
                id: 3,
                team_id: 3,
                from_uid: 2222,
                from_nick: "小王",
                from_avatar: "",
                msg: "哈哈"
            },
            {
                id: 2,
                team_id: 3,
                from_uid: 1111,
                from_nick: "小张",
                from_avatar: "",
                msg: "崇拜"
            },
            {
                id: 1,
                team_id: 3,
                from_uid: 1111,
                from_nick: "小张",
                from_avatar: "",
                msg: "dfdf"
            }
    ]
},
status: 1000,
desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.23">17.23 团长处理申请</h3>
            <form action="<%=ctx%>/api/v1/teams/apply/{applyId}/verify" method="post">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/apply/{applyId}/verify</th>
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
                        <td><input style="width: 200px" name="" type="text"
                                   value=''/></td>
                        <td>
<pre>
{
    "status": 1,    // 是否同意邀请 : 1 同意,2  拒绝

}
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
<pre>
{
    status: 1000,
    desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="18.1">18.1 首页快马图标展示配置</h3>
            <form action="<%=ctx%>/api/v1/assistant/first_screen/config" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/assistant/first_screen/config</th>
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
            code: "check_in"
        },
        {
            code: "red_packet"
        },
        {
            code: "junior"
        },
        {
            code: "ad",
            data: [
                {
                    id: 117,
                    title: "大转盘",
                    source: "推啊",
                    layout: 4,
                    view_num: 0,
                    show_num:4,  //客户端每日展示次数
                    origin_url: "http://browser.kuaima.cn/tongji/7taskTopRight1_3_0.html?url=https://engine.tuia.cn/index/activity?appKey=2cMgpedEXq4tgEy5Y6f4g963ZTkr&adslotId=1137",
                    content_type: "ads",
                    tips: "广告",
                    ads_type: "km_zt",
                    ads_location: "first_screen_assistant",
                    need_login: false,
                    added_time: 1498206278087,
                    content_model: "",
                    third_location_id: "",
                    ad_app_id: "",
                    images: [
                        "http://img1000.static.suishenyun.net/2e52e1dc5ac9d868e9983bd3fd8ced1c/9f6dc94e327c12e2ae979faf5419cdee.png"
                    ]
                }
            ]
        },
        {
            code: "bind_wx"
        },
        {
            code: "search"
        },
        {
            code: "invite"
        },
        {
            code: "team"
        }
    ],
    status: 1000,
    desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="17.24">17.24 我的团队(new)</h3>
            <form action="<%=ctx%>/api/v1/teams/{teamId}/info_new" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/teams/{teamId}/info_new</th>
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
		team: {
			id: 111,
			team_name: "傻老",
			invite_code: "R76JNH7E",
			member_num: 7,
			status: 1,
			added_time: 1512720297024,
			update_time: 1515050337926,
			total_coin: 0,
			yesterday_coin: 0,
			my_yesterday_coin: 0,
			web_share_code: "",
			leader_uid: 906152,
			msg_num: 0,
			apply_status: 0
		},
		team_members: [{
				id: 349,
				team_id: 111,
				uid: 906152,
				nick_name: "LOMO",
				avatar: "http://imgcom.kuaima.suishenyun.net/cfcd208495d565ef66e7dff9f98764da/53cc78afa15acffe82fb5de7eaaec132.jpg",
				role: 1,
				recent_active_time: 1514874077227,
				added_time: 1512720297048,
				update_time: 1514874080011,
				total_coin: 0
			},
			{
				id: 353,
				team_id: 111,
				uid: 703515,
				nick_name: "ring11入土bb",
				avatar: "http://imgcom.kuaima.suishenyun.net/cfcd208495d565ef66e7dff9f98764da/97013a04d5b7fbcf96e6cb22589ff5d2.jpg",
				role: 2,
				recent_active_time: 1514165703089,
				added_time: 1512720349859,
				update_time: 1514165703119,
				total_coin: 0
			},
			{
				id: 355,
				team_id: 111,
				uid: 593699,
				nick_name: "晓明",
				avatar: "http://imgcom.kuaima.suishenyun.net/cfcd208495d565ef66e7dff9f98764da/a761bff8e374ec7570293f7bb992aaba.jpg",
				role: 2,
				recent_active_time: 1514874752747,
				added_time: 1512723330817,
				update_time: 1514874760006,
				total_coin: 0
			},
			{
				id: 357,
				team_id: 111,
				uid: 100000659109,
				nick_name: "171****8942",
				avatar: "",
				role: 2,
				recent_active_time: 1512723334158,
				added_time: 1512723334158,
				update_time: 1512723334158,
				total_coin: 0
			},
			{
				id: 359,
				team_id: 111,
				uid: 304155,
				nick_name: "井九",
				avatar: "http://imgcom.kuaima.suishenyun.net/cfcd208495d565ef66e7dff9f98764da/928e8c83ef7935e1d5fe65fe2487ec92.jpg",
				role: 2,
				recent_active_time: 1515466188110,
				added_time: 1512723748297,
				update_time: 1515466190019,
				total_coin: 0
			},
			{
				id: 361,
				team_id: 111,
				uid: 179097,
				nick_name: "我我全心全意",
				avatar: "http://imgcom.kuaima.suishenyun.net/cfcd208495d565ef66e7dff9f98764da/f89c207e2b9e238e90b8b521bff3fb24.jpg",
				role: 2,
				recent_active_time: 1514270431162,
				added_time: 1512725692812,
				update_time: 1514270431163,
				total_coin: 0
			},
			{
				id: 371,
				team_id: 111,
				uid: 100000192499,
				nick_name: "紫琼风",
				avatar: "http://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKVgreGdl62cuXjCXM8XTyCOQkVCdpzicouCULSMiaLk9mwy5nErlnj07LUnCmhMtp16anfCHXR9F1g/0",
				role: 2,
				recent_active_time: 1515050337899,
				added_time: 1515050337899,
				update_time: 1515657200153,
				total_coin: 0
			}
		],
		team_task_info: [{
				team_id: 111,
				task_code: "search",
				task_name: "完成10次有效搜索",
				task_desc: "4人完成即可计分红400金币, 最多完成10人可分红3000金币",
				lock_flag: 0,
				complete_flag: 0,
				task_coin: 0,
				complete_num: 0,
				complete_list: [],
				un_complete_list: [
					906152,
					703515,
					593699,
					100000659109,
					304155,
					179097,
					100000192499
				],
				my_progress: "0/10",      //进度
				client_scheme: "kmb://hotsearch", //客户端的scheme
                toast: "去完成搜索任务吧~" //客户端的toast

			},
			{
				team_id: 111,
				task_code: "check_in",
				task_name: "参与签到",
				task_desc: "4人完成即可计分红40金币, 最多完成10人可分红400金币",
				lock_flag: 0,
				complete_flag: 0,
				task_coin: 0,
				complete_num: 0,
				complete_list: [],
				un_complete_list: [
					906152,
					703515,
					593699,
					100000659109,
					304155,
					179097,
					100000192499
				],
				my_progress: "0/1",
				client_scheme: "kmb://taskcenter",
                toast: "去完成签到任务吧~" //客户端的toast

			},
			{
				team_id: 111,
				task_code: "post_view",
				task_name: "阅读10篇值得看",
				task_desc: "4人完成即可计分红280金币, 最多完成10人可分红2500金币",
				lock_flag: 0,
				complete_flag: 0,
				task_coin: 0,
				complete_num: 0,
				complete_list: [],
				un_complete_list: [
					906152,
					703515,
					593699,
					100000659109,
					304155,
					179097,
					100000192499
				],
				my_progress: "0/10",
				client_scheme: "kmb://worthreadingtab",
                toast: "去完成值得看任务吧~" //客户端的toast
			}
		]
	},
	status: 1000,
	desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>


            <h3 id="19.1">19.1 获取网页授权的地址</h3>
            <form action="<%=ctx%>/api/v1/wx/mp/oauth2/build_authorize_url" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/wx/mp/oauth2/build_authorize_url</th>
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
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">state</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="state" type="text"
                                   value='1234'/></td>
                        <td>重定向后会带上state参数，开发者可以填写a-zA-Z0-9的参数值，最多128字节</td>
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
        url: "https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxe90442d714d3c319&redirect_uri=http%3A%2F%2F16b00e1a.ngrok.io%2Fkm_task%2Fapi%2Fv1%2Fwx%2Fmp%2Foauth2%2Ftoken&response_type=code&scope=snsapi_userinfo&state=#wechat_redirect"
    },
    status: 1000,
    desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>

            <h3 id="19.2">19.2 查看微信绑定领取状态 </h3>
            <form action="<%=ctx%>/api/v1/business/wx_mp/bind_reward/status" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>api/v1/business/wx_mp/bind_reward/status</th>
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
                        <td><font color="red">auth_token</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="auth_token" type="text"
                                   value='1234'/></td>
                        <td> 微信服务号的登录令牌</td>
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
        phone: phone    //手机号
        received: true    //是否领取了奖励
         coin: 200    //奖励金币数

    },
    status: 1000,
    desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误 <br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>


            <h3 id="19.3">19.3 领取微信绑定奖励 </h3>
            <form action="<%=ctx%>/api/v1/business/wx_mp/bind_reward/receive" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>api/v1/business/wx_mp/bind_reward/receive</th>
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
                        <td><font color="red">auth_token</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="auth_token" type="text"
                                   value='1234'/></td>
                        <td> 微信服务号的登录令牌</td>
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
                            1000 OK;<br/>非1000 服务器错误/绑定微信任务奖励已领取/请先绑定微信才能领取奖励哦/..... <br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>

            <h3 id="19.4">19.4 微信签到状态 </h3>
            <form action="<%=ctx%>/api/v1/business/wx_mp/daily_sign/status" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>api/v1/business/wx_mp/daily_sign/status</th>
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
                        <td><font color="red">auth_token</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="auth_token" type="text"
                                   value='1234'/></td>
                        <td> 微信服务号的登录令牌</td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
    data:{
        sign_num : 3,  //连续签到次数
        today : true   //今日是否签到
            rules : [1,1,1,2,2,2,3] //依次是每一天的宝箱数目

    }
    status: 1000,
    desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误 <br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>

            <h3 id="19.5">19.5 微信签到 </h3>
            <form action="<%=ctx%>/api/v1/business/wx_mp/daily_sign/sign" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>api/v1/business/wx_mp/daily_sign/sign</th>
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
                        <td><font color="red">auth_token</font></td>
                        <td>string</td>
                        <td><input style="width: 200px" name="auth_token" type="text"
                                   value='1234'/></td>
                        <td> 微信服务号的登录令牌</td>
                    </tr>
                    <tr>
                        <td>--------</td>
                        <td>--------</td>
                        <td>--------</td>
                        <td><input name="" type="submit" value="提交"/></td>
                        <td>
<pre>
{
    data:{
        sign_num : 3,  //连续签到次数
        box_num : 2   //得到的宝箱数
        next_box_num : 3//明天可获得的宝箱数
    }
    status: 1000,
    desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误 <br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>

            <h3 id="20.1">20.1 深度任务列表</h3>
            <form action="<%=ctx%>/api/v1/deepTask/list" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/deepTask/list</th>
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
                        <td><font color="red">offset</font></td>
                        <td>long</td>
                        <td><input style="width: 200px" name="offset" type="text"
                                   value='1234'/></td>
                        <td>服务返回的offset值,初次请求设为0</td>
                    </tr>
                    <tr>
                        <td>must</td>
                        <td><font color="red">page</font></td>
                        <td>int</td>
                        <td><input style="width: 200px" name="page" type="text"
                                   value='1'/></td>
                        <td>页数</td>
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
		offset: 1521079200000,  //分页标识
		hasMore: false,
		list: [{
			id: 1,
			name: "关注公众号，轻松赚收益",
			reward_coin: 800,    //奖励金币
			cat_name: "关注任务",  //任务类型
			publisher_uid: 0,
			publisher_nick: "快小马",
			publisher_avatar: "http://www.kuaima.cn/image/logo_txt.png",
			platform: "DEFAULT",
			source: "KM",         //发布来源
			rank: 0,
			status: 1,
			msg: "",
			total_num: 99,
			left_num: 99,
			my_status: 1,   // -1 未领取 0 已领取未提交 1 已提交待审核 2 审核通过已完成 3 审核未通过(需重新提交)
			start_time: 1515981600000,    //任务开始时间
			end_time: 1521079200000,      //任务截止时间
			publish_time: 1521072000000,  //发布时间
			added_time: 1520985600000,
			update_time: 1520985600000
		}]
	},
	status: 1000,
	desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="20.2">20.2 深度任务详情</h3>
            <form action="<%=ctx%>/api/v1/deepTask/{taskId}/detail" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/deepTask/{taskId}/detail</th>
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
		id: 1,
        name: "关注公众号，轻松赚收益",
        reward_coin: 800,    //奖励金币
        cat_name: "关注任务",  //任务类型
        publisher_uid: 0,
        publisher_nick: "快小马",
        publisher_avatar: "http://www.kuaima.cn/image/logo_txt.png",
        platform: "DEFAULT",
        source: "KM",         //发布来源
        rank: 0,
        status: 1,
        msg: "",
        total_num: 99,
        left_num: 99,
        my_status: 1,   // -1 未领取 0 已领取未提交 1 已提交待审核 2 审核通过已完成 3 审核未通过(需重新提交)
        start_time: 1515981600000,    //任务开始时间
        end_time: 1521079200000,      //任务截止时间
        publish_time: 1521072000000,  //发布时间
        added_time: 1520985600000,
        update_time: 1520985600000,
		deep_task_details: {
			deep_task_id: 1,
			description: "叨叨叨......",   //任务说明
			finish_steps: [{
					imgs: [
						"http://www.kuaima.cn/image/logo_txt.png ",
						"http: //www.kuaima.cn/image/logo_txt.png"
					],
					urls: [                   //链接地址
						"https://www.baidu.com",
						"https://www.sougou.com"
					],
					desc: "第一步"           //步骤说明
				},
				{
					imgs: [
						"http://www.kuaima.cn/image/logo_txt.png"
					],
					urls: [],
					desc: "第二步"
				},
				{
					imgs: [
						"http://www.kuaima.cn/image/logo_txt.png",
						"http://www.kuaima.cn/image/logo_txt.png",
						"http://www.kuaima.cn/image/logo_txt.png"
					],
					urls: [
						"https://www.baidu.com"
					],
					desc: "第三步"
				}
			],
			commit_info: [{
					rule: "phone",
					desc: "手机号"
				},
				{
					rule: "",
					desc: "支付宝账号"
				},
				{
					rule: "",
					desc: "微信昵称"
				},
				{
					rule: "id_number",
					desc: "身份证号"
				}
			],
			example_photo: [
				"http://www.kuaima.cn/image/logo_txt.png",
				"http://www.kuaima.cn/image/logo_txt.png",
				"http://www.kuaima.cn/image/logo_txt.png"
			]
		}
	},
	status: 1000,
	desc: "OK"
}
								</pre>
                        </td>
                        <td>
                            1000 OK; </br>9703 文章不存在或已被删除<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>


            <h3 id="20.3">20.3. 领取深度任务</h3>
            <form action="<%=ctx%>/api/v1/deepTask/{taskId}/receive" method="post">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/deepTask/{taskId}/receive</th>
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
    status: 1000,
    desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>

            <h3 id="20.4">20.4 提交任务</h3>
            <form action="<%=ctx%>/api/v1/deepTask/{orderId}/commit" method="post">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/deepTask/{taskId}/commit</th>
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
                        <td><input style="width: 200px" name="" type="text"
                                   value=''/></td>
                        <td>
<pre>
{
    commit_info: "[{"content":"18888888888","desc":"手机号"},{"content":"sfdsdfsdfsdfsdf","desc":"支付宝账号"},{"content":"小白","desc":"微信昵称"},{"content":"320xxxxxxx","desc":"身份证号"}]",
    example_photo :"["http://www.kuaima.cn/image/logo_txt.png","http://www.kuaima.cn/image/logo_txt.png","http://www.kuaima.cn/image/logo_txt.png"]"
}
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
<pre>
{
    status: 1000,
    desc: "OK"
}
</pre>
                        </td>
                        <td>
                            1000 OK;<br/>1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>
            <h3 id="20.5">20.5 我的深度任务列表</h3>
            <form action="<%=ctx%>/api/v1/deepTask/myTask" method="get">
                <input style="width: 200px" name="app_key" type="hidden" value='28817749'/>
                <input style="width: 200px" name="auth_token" type="hidden" value='1'/>
                <table>
                    <tr>
                        <th>地址</th>
                        <th colspan="5"><%=ctx%>/api/v1/deepTask/myTask</th>
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
                        <td><font color="red">type</font></td>
                        <td>int</td>
                        <td><input style="width: 200px" name="type" type="text" value='1'/></td>
                        <td>
                            发布状态 (1 进行中 2 已完成 3 已过期)
                        </td>
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
	page: 1,
	data: [{
		id: 1,          //订单id
		deep_task_id: 1,     //任务id
		name: "下载得金币",   //任务名称
		reward_coin: 800,    //奖励金币
		cat_name: "注册任务",  //任务类型
		uid: 494943,
		commit_info: [{           //提交条件
				content: "18888888888",
				desc: "手机号"
			},
			{
				content: "sfdsdfsdfsdfsdf",
				desc: "支付宝账号"
			},
			{
				content: "小白",
				desc: "微信昵称"
			},
			{
				content: "320xxxxxxx",
				desc: "身份证号"
			}
		],
		example_photo: [          //示例图片
			"http://www.kuaima.cn/image/logo_txt.png",
			"http://www.kuaima.cn/image/logo_txt.png",
			"http://www.kuaima.cn/image/logo_txt.png"
		],
		status: 1, //0 已领取未提交 1 已提交待审核 2 审核通过已完成 3 审核未通过(需重新提交)
		msg: "",
		expire_time: 1521079200000,  //截止时间
        left_seconds: 0  //距离截止时间的秒数
		added_time: 100,
		commit_time: 0,     //提交时间
		update_time: 0
	}],
	total_num: 1,
	status: 1000,
	desc: "OK"
}
								</pre>
                        </td>
                        <td>
                            1004未登录; <br/>1013 账号异常; <br/>1020 没有结果<br/> 1007 服务器错误<br/>
                        </td>
                    </tr>
                </table>
            </form>
            <p>&nbsp;</p>

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

