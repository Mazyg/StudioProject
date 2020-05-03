<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User:MN
  Date: 2019/11/26
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"user/";
%>
<!doctype html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>个人中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/base_news.css" rel="stylesheet" type="text/css">
    <link href="font/font.css" rel="stylesheet" type="text/css">
    <link href="css/inner.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/slick.css">
    <script src="js/slick.min.js" type="text/javascript"></script>
    <script src="js/regexcut.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/owl.carousel.css">
    <script src="js/owl.carousel.min.js" type="text/javascript"></script>
    <script src="js/comm.js" type="text/javascript"></script>
    <script src="publish/thunews/js/regex-cn.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
    body{
        /*background-color: aliceblue;*/
        background: url(img/bg_02.jpg);
    }
    .back{
        background: url(img/bg32.jpg);
        border-radius: 1%;
        height: 240px;
    }
    .imgs{
        border-radius: 50%;
        width: 70px;
        height: 70px;
    }
    .back1{
        background-color: white;
    }

    /*.back2{
        background-color: white;
        border-radius: 1%;
    }*/
    .img1{
        width: 20%;
        width: 200px;
    }
</style>
<body>
<%--<ul class="breadcrumb back1">
    <li><a href="../info/findInfoBytype.do">首页</a></li>
    <li><a href="../info/findEvent.do">热点资讯</a></li>
    <li><a href="../info/findChinese.do" class="styles">爱我中华</a></li>
    <li><a href="../info/findPersonInfo.do" class="">榜样力量</a></li>
    <li><a href="#" class="">话题</a></li>
    <li><a href="#" class="">书籍</a></li>
    <li><a href="#">电影</a></li>
    <li><a href="../info/findPersonalMainInfo.do" class="">个人中心</a></li>
</ul>--%>

<header class="clearfix">
    <%--<section class="mainWrap">
        <div class="topwraper relative clearfix">
            <div class="search">
                <form id="searchForm" target="_blank">
                    <input name="query" type="text" >
                    <input name="ie" type="hidden" value="utf8">
                    <input name="cid" type="hidden" value="3">
                    <a href="javascript:;" onclick="searchSub();"><i>搜索</i></a>
                </form>
            </div>
        </div>
    </section>--%>
    <nav class="navwrap yahei">
        <section class="mainWrap">
            <ul id="nav">
                <li><a href="../info//epidemic.do?page=1&numberPerPage=3&start=0&length=3">全球战疫</a>
                </li>
                <li><a href="../info/findEvent.do?page=1&numberPerPage=3&start=0&length=3">热点资讯</a>
                </li>
                <li><a href="../info/findChinese.do?page=1&numberPerPage=3&start=0&length=3">爱我中华</a>
                    <%--<ul>
                        <li><a href="#">最美中国景</a></li>
                        <li><a href="#">最美中国人</a></li>
                        <li><a href="#">最美中国事</a></li>
                    </ul>--%>
                </li>
                <li><a href="../info/findPersonInfo.do" class="">榜样力量</a>
                </li>
                <li><a href="../topic/showTopic.do?page=1&numberPerPage=3&start=0&length=3" class="">话题</a>
                </li>
                <li><a href="../info/findBooks.do?page=1&numberPerPage=3&start=0&length=3" class="">书籍</a></li>
                <li><a href="../info/findMovies.do?page=1&numberPerPage=3&start=0&length=3">电影</a></li>
                <li><a href="../info/findPersonalMainInfo.do" class="">个人中心</a>
                    <ul class="last">
                        <li><a href="main/personInfo.jsp">个人信息</a></li>
                        <li><a href="../topic/findByUid.do?uid="+${users.uid}">我的话题</a></li>
                        <li><a href="main/feedback.jsp">反馈</a></li>
                        <c:if test="${users.u_type eq'admin'}">
                            <li><a href="../user/backAdmin.do">管理界面</a></li>
                        </c:if>
                        <c:if test="${users.uid !=null}">
                            <li><a href="../user/exitLogin.do">退出登录</a></li>
                        </c:if>
                    </ul>
                </li>
            </ul>
        </section>
    </nav>
</header>
<br><br>
<div class="col-md-8 col-md-offset-2">
    <div class="col-md-12 back">
        <div>
            <br><br><br><br><br><br><br>
            <table>
                <tr><td>&nbsp;&nbsp; <c:if test="${users.uname == null}">
                    <img class="imgs" src="img/png.png" alt=""></td>
                    <td><h4 style="color: white">&nbsp;&nbsp;&nbsp;xxxx<br><small><br>&nbsp;&nbsp;&nbsp;介绍自己</small></h4></td>
                    </c:if>
                    <c:if test="${users.uname != null}">
                        <img class="imgs" src="${users.photo}" alt="头像" />
                        <td><h4 style="color: white">&nbsp;&nbsp;&nbsp;${users.uname}<br><small><br>&nbsp;&nbsp;&nbsp;介绍自己</small></h4></td>
                    </c:if>
                </tr>
            </table>
        </div>
    </div>
    <div class="col-md-12 back2">
        <br>
        <h4>Hi! ${users.uname} 这里是你的主页，用来展示你的生活和发现，也是别人认识你的地方。<br><br>
            完善你的个人资料，开始全新的旅程吧</h4>
        <br>
        <c:if test="${users.uname == null}">
            还未登录，<a href="../manage/pages/samples/login.jsp">登录</a>了解更多
        </c:if>

        <ul class="nav nav-tabs">
            <li class="active"><a href="#main" data-toggle="tab">主页</a></li>
            <li><a href="main/personInfo.jsp" >个人信息</a></li>
            <li><a href="../topic/findByUid.do?uid="+${users.uid} >我的话题</a></li>
        </ul>
        <div id="mytab-content" class="tab-content">
            <div class="tab-pane fade in active" id="main">
                <br>
                <h4>近期政策</h4>
                   <br>
                <ul>
                    <c:forEach items="${personalMainInfo}" var="personalMainInfo">
                        <li><h4>&nbsp;&nbsp;&nbsp;<a href="../info/findByIdInfo.do?infoId=${personalMainInfo.info_id}&uid=${users.uid}">${personalMainInfo.title}</a><small>&nbsp;&nbsp;&nbsp;&nbsp;${personalMainInfo.date}
                        <br>&nbsp;&nbsp;&nbsp;&nbsp;${personalMainInfo.introduce}</small></h4></li>
                        <br>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>

</div>
</body>
</html>

