<%--
  Created by IntelliJ IDEA.
  User: 江西师范大学
  Date: 2019/11/25
  Time: 8:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <title>Title</title>
    <script src="tinymce/tinymce.min.js"></script>
</head>
<body>
<a href="info/findInfoBytype.do">进入网站</a>
<textarea id="edit"></textarea>
<script>
    tinymce.init({
        selector: '#edit',
        language:'zh_CN'
    })
</script>
</body>
</html>
