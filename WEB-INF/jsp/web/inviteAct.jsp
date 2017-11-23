<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
    <title><%=request.getAttribute("title")%></title>
    <meta name="description" content='<%=request.getAttribute("desc")%>'/>
    <script src="http://browser.kuaima.cn/lib/c.js"></script>
    <script src="http://browser.kuaima.cn/lib/f.js"></script>
    <script src="http://browser.kuaima.cn/lib/z.js"></script>
    <script src="http://browser.kuaima.cn/lib/i.js"></script>
    <script>
        inviteAct({
            path: '<%=request.getAttribute("path")%>',
            code: '<%=(String)request.getAttribute("code")%>',
            target: '<%=(String)request.getAttribute("target")%>'
        });
    </script>
    </head>
    <body>
    </body>
</html>