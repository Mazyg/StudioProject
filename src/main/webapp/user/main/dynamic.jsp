<%--
  Created by IntelliJ IDEA.
  User: grandir
  Date: 2019/12/4
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"user/";
%>
<!doctype html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="format-detection" content="telephone=no" />
    <link href="css/base_news.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <title>论坛</title>
    <link rel="shortcut icon" href="img/title.ico" />
</head>
<body>
<header class="clearfix">
    <section class="mainWrap">
        <div class="topwraper relative clearfix">
            <nav class="navwrap yahei">
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
                            <li><a href="../user/exitLogin.do">退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </section>
</header>
<hr style="margin: 0;padding: 0;color:#222;width: 100%">
<div class="container container_bg" >
    <div class="row">
        <div class="col-sm-2"></div>
        <div class="col-sm-6 col-xs-12 my_edit" >
            <div class="row" id="edit_form" >
                <span class="pull-left" style="margin:15px;">编写新鲜事</span>
                <span class="tips pull-right" style="margin:15px;"></span>
                <form  action="../dynamic/saveDynamic.do" style="margin-top: 50px;" method="post">
                    <div class="form-group">
                        <div class="col-sm-12">
                                <textarea contentEditable="true" id="content" class="form-control " name="textarea"></textarea>
<%--                            <div contentEditable="true" id="content" class="form-control " ></div>--%>
                        </div>
                        <div class="col-sm-12" style="margin-top: 12px;">
                            <span class="emoji" >表情</span>
                            <span class="pic" >图片	</span>
                            <span>
<%--                                    <input type="file" name=""  class="select_Img" style="display: none" >--%>
<%--                                    <img class="preview" src="">--%>
                            </span>
                            <div class="myEmoji" >
                                <ul id="myTab" class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#set" data-toggle="tab">
                                            预设
                                        </a>
                                    </li>
                                    <li><a href="#hot" data-toggle="tab">热门</a></li>
                                </ul>
                                <div id="myTabContent" class="tab-content">
                                    <div class="tab-pane fade in active" id="set">
                                        <div class="emoji_1"></div>
                                    </div>
                                    <div class="tab-pane fade" id="hot">
                                        <div class="emoji_2"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- <span> <input type="file" id="selectImg" value=""></input> </span> -->
                            <button type="submit" id="send" class="btn btn-default pull-right disabled">发布</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="row item_msg" >
                <div class="col-sm-12 col-xs-12 message" >
                    <img src="img/icon.png" class="col-sm-2 col-xs-2" style="border-radius: 50%">
                    <div class="col-sm-10 col-xs-10">
                        <span style="font-weight: bold;">&nbsp;${users.uname}</span>
                            <ul class="nav navbar-nav navbar-right" >
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">删除</a></li>
                                        <li><a href="#">编辑</a></li>
                                    </ul>
                                </li>
                            </ul>
                        <br>
                        <small class="date" style="color:#999">1分钟前</small>
                        <div class="msg_content">happy day!
                            <img class="mypic" src="img/bg_1.jpg" >
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-3 col-xs-12 part_right" >
            <div class="row text-center inform">
                <img src="img/icon.png" >
                <h4 style="font-weight: bold;">Jack.C</h4>
                <div class="col-sm-12 my_inform" >
                    <div class="col-sm-4 col-xs-4">
                        <div>111</div>
                        <div class="sort">关注</div>
                    </div>
                    <div class="col-sm-4 col-xs-4">
                        <div>111</div>
                        <div class="sort">粉丝</div>
                    </div>
                    <div class="col-sm-4 col-xs-4">
                        <div>111</div>
                        <div class="sort">博客</div>
                    </div>
                </div>
            </div>
            <div class="row part_hot" >
                <div class="col-sm-12">
                    <span class="pull-left" style="padding: 10px;font-size:16px;font-weight: bold;">热门话题</span>
                    <span class="pull-right" style="padding: 10px;">换话题</span>
                </div>
                <hr style="margin: 0;padding: 0;width: 100%">
            <c:forEach items="${topic}" var="topic">
                <div class="col-sm-12 item_hot" >
                    <span class="pull-left">${topic.t_title}</span>
                    <span class="pull-right item_num">34.6亿</span>
                </div>
            </c:forEach>
                <hr style="margin: 0;padding: 0;width: 100%">
                <div class="col-sm-12 text-center" style="padding: 10px"><a href="#">查看更多</a></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
</body>
</html>
