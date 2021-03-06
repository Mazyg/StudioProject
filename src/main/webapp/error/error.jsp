<%--
  Created by IntelliJ IDEA.
  User: 江西师范大学
  Date: 2019/12/16
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"+"error/";
%>
<html>
<head>
    <title>500</title>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
    <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>
<body>

<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <header id="header">
        <div class="logo">
            <span class="icon fa-diamond"></span>
        </div>
        <div class="content">
            <div class="inner">
                <h1>500</h1>
                <p><!--[-->对不起，页面出现了错误。联系管理员进行处理吧！<!--]--></p>
            </div>
        </div>
        <nav>
            <ul>
                <li><a href="../info/findInfoBytype.do">首页</a></li>
                <!--<li><a href="#elements">Elements</a></li>-->
            </ul>
        </nav>
    </header>

    <!-- Main -->


    <!-- Footer -->
    <footer id="footer">
        <p class="copyright">&copy; Untitled. Design: <a href="https://500.life">500.LIFE</a>.</p>
    </footer>

</div>

<!-- BG -->
<div id="bg"></div>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/skel.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>

</body>
</html>
