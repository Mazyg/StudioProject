<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: grandir
  Date: 2019/11/26
  Time: 9:50
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
    <meta charset="utf-8">
    <title>详情</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/base_news.css" rel="stylesheet" type="text/css">
    <link href="font/font.css" rel="stylesheet" type="text/css">
    <link href="css/inner.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/slick.css">
    <script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="js/slick.min.js" type="text/javascript"></script>
    <script src="js/regexcut.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/owl.carousel.css">
    <script src="js/owl.carousel.min.js" type="text/javascript"></script>
    <script src="js/comm.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <style type="text/css">
        .dh2{
            font-size: 25px;
           text-align: center;
        }
        .siz{
            font-size: 15px;
        }
        .comment .commentbox .textarea{
            width: 630px;
            height: 100px;
            border: #e6e6e6 2px;
        }
        .comment .commentbox .submit{
            margin-left:580px;
            margin-top:15px;
            width: 50px;
            height: 30px;
            line-height: 16px;
            font-size: 16px;
            border: #e6e6e6 2px;
            background:#A7def6;
        }
        .comment-list{
            width: 600px;
            margin: 20px auto;
            clear: both;
            padding-top: 20px;
        }
        .comment-list .comment-left{
               float: left;
               position: relative;
               left:-18px;
           }
        .comment-list .comment-left img{
            width: 40px;
            height: 40px;
        }
        .comment-list .comment-right{
            position: relative;
            left:0px;
            top: -5px;
        }
    </style>
<body>
<header class="clearfix">
    <section class="mainWrap">
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
    </section>
    <nav class="navwrap yahei">
        <section class="mainWrap">
            <ul id="nav">
                <li><a href="main/news.jsp">热点资讯</a>
                </li>
                <li><a href="#">爱我中华</a>
                    <ul>
                        <li><a href="#">最美中国景</a></li>
                        <li><a href="#">最美中国人</a></li>
                        <li><a href="#">最美中国事</a></li>
                    </ul>
                </li>
                <li><a href="#" class="">榜样力量</a>
                    <ul>
                        <li><a href="javascript:void(0)" onclick="window.location.hash='ab'">新时代楷模</a></li>
                        <li><a href="javascript:void(0)" onclick="window.location.hash = 'aa'">身边榜样</a></li>
                        <li><a href="#">最美奋斗者</a></li>
                        <li><a href="#">道德模范</a></li>
                    </ul>
                </li>
                <li><a href="#" class="">话题</a>
                </li>
                <li><a href="#" class="">书籍</a></li>
                <li><a href="#">电影</a></li>
                <li><a href="#" class="">个人中心</a>
                    <ul class="last">
                        <li><a href="#">我的收藏</a></li>
                        <li><a href="#">话题管理</a></li>
                        <li><a href="#">个人信息</a></li>
                    </ul>
                </li>
            </ul>
        </section>
    </nav>
</header>
<div class="content yahei subchannel">
    <div class="mainWrap clearfix">
        <section class="colunm1">
            <br>
            <h2 class="dh2">${infos.title}</h2>
            <br><br><br>
            <span class="siz">${infos.content}</span>
            <div class="comment">
                <div class="commentbox">
                        <textarea class="textarea" placeholder="来说几句吧......" id="content" ></textarea>
                        <input class="submit" type="button" value="评论" onclick="check('${uid}','${info_id}')">
                </div>
                <script type="text/javascript">
                    function check(uid,info_id){
                        var content=$("#content").val();
                        if(uid==''){
                            alert("请先登录！");
                        }
                        else if(content==''){
                            alert("评论不能为空！");
                        }
                        else{
                            alert("评论成功！")
                            window.location.href="../info/findByIdInfo.do?info_id="+info_id+"&uid="+uid+"&content="+content;
                        }
                    }
                </script>
                <div class="comment-list">
                    <ul>
                        <c:forEach items="${discuss}" var="discuss">
                            <li>
                                <div>
                                    <div class="comment-left">
                                        <img src="${discuss.photo}">
                                    </div>
                                    <div class="comment-right">
                                        <p>${discuss.uname}</p>
                                        <p style="margin-top: -10px;">${discuss.date}</p>
                                        <p>${discuss.content}</p>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>

                </div>
            </div>
        </section>
        <section class="colunm2">
            <section class="mod withborder">
                <h2 class="red"><span class="iconwraper">
            <i class="thunews-line-chart"></i>
            </span>
                    近期热点
                    <a href="#" style="font-size:12px; color:#666; margin-left:30px">
                        更多 &#8250;
                    </a>
                </h2>
                <ul class="newslist clearfix"  id="resText">
                    <li>热点一</li>
                    <li>热点二</li>
                    <li>热点三</li>
                    <li>热点四</li>
                </ul>
            </section>
        </section>
    </div>
</div>
</body>
</html>

