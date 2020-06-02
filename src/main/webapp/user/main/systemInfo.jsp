<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="shortcut icon" href="img/title.ico" />
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


</style>
<body>
<header class="clearfix">
    <nav class="navwrap yahei">
        <section class="mainWrap">
            <ul id="nav">
                <li><a href="../info/epidemic.do">全球战疫</a>
                </li>
                <li><a href="../info/findEvent.do">热点资讯</a>
                </li>
                <li><a href="../info/findChinese.do">爱我中华</a>
                </li>
                <li><a href="../info/findPersonInfo.do" >榜样力量</a>
                </li>
                <li><a href="../topic/showTopic.do" >话题</a>
                </li>
                <li><a href="../info/findBooks.do" >书籍</a></li>
                <li><a href="../info/findMovies.do">电影</a></li>
                <li><a class="">个人中心</a>
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
                <tr><td>&nbsp;&nbsp;
                    <c:if test="${users.uname == null}">
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
        <ul class="nav nav-tabs">
            <li ><a href="../info/findPersonalMainInfo.do">主页</a></li>
            <li ><a href="main/personInfo.jsp" >个人信息</a></li>
            <li ><a href="../topic/findByUid.do?uid="+${users.uid}>我的话题</a></li>
            <li ><a href="findCollect.do?uid="+${users.uid}>我的收藏</a></li>
            <li ><a href="../dynamic/findAllCommentByName.do?uname=${users.uname}" >我的消息</a></li>
            <li class="active"><a href="#rule" data-toggle="tab">系统消息</a></li>
        </ul>
        <div id="mytab-content" class="tab-content">
            <div class="tab-pane fade in active" id="rule">
                <br>
                <c:if test="${users.uname == null}">
                    还未登录，<a href="../manage/pages/samples/login.jsp">登录</a>了解更多
                    <br>
                </c:if>
                <c:if test="${users.uname != null}">
                    <c:if test="${notifies.size()== 0}">
                        无系统消息
                        <br>
                    </c:if>
                    <c:if test="${notifies.size()!= 0}">

                        <table class="table  table-hover">
                            <thead>
                            <tr>
                                <th>内容</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${notifies}" var="notify">
                                <tr>
                                    <td>对于您 <span style="color: blue; display: inline">"${notify.feedback.content}"</span> 的反馈，${notify.content}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <br>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>

</div>
</body>
</html>

