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
        .imgs1{
             width: 100px;
             height: 80px;
         }
        #tip{
            position: relative;
            top:20px;
            left:450px;
        }
        #tip a{
            color:white;
            font-size: 14px;
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
<c:choose>
    <c:when test="${users == null}">
            <div id="tip">
                <a href="../manage/pages/samples/login.jsp">登录</a>&nbsp;<a>|</a>&nbsp;
                 <a href="../manage/pages/samples/register.jsp">注册</a>
            </div>
    </c:when>
    <c:otherwise></c:otherwise>
</c:choose>
        </div>
    </section>
    <nav class="navwrap yahei">
        <section class="mainWrap">
            <ul id="nav">
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
                            window.location.href="../info/findByIdInfo.do?infoId="+info_id+"&uid="+uid+"&content="+content;
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
                                        <p style="margin-top: -10px;"><small>${discuss.date}</small></p>
                                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${discuss.content}</p>
                                    </div>
                                </div>
                                <br>
                            </li>
                        </c:forEach>
                    </ul>

                </div>
            </div>
        </section>
        <section class="colunm2">
            <section class="mod withborder">
                <h2>
                    <span class="iconwraper"><i class="thunews-play-circle"></i></span>
                    精彩视频
                    <a href="#" style="font-size:12px; color:#666; margin-left:30px">
                        <%--  更多 &#8250;--%>
                    </a>
                </h2>
                <%-- <ul class="promvideolist clearfix" id="thunews_jcsp">
                    <c:forEach items="${videoInfo}" var="videoList">
                        <li><a href="../info/findByIdInfo.do?infoId=${videoList.info_id}"><img src="${videoList.photo}">&nbsp;&nbsp;&nbsp;<br>${videoList.title}</a><br></li>
                    </c:forEach>
                 </ul>--%>

                <table class="table newslist clearfix">
                    <c:forEach items="${videoInfo}" var="videoList">
                        <tr>
                            <td><a href="../info/findByIdInfo.do?infoId=${videoList.info_id}"><img class="imgs1" src="${videoList.photo}"></a></td>
                            <td> <a href="../info/findByIdInfo.do?infoId=${videoList.info_id}"><p style="float: left">${videoList.title}</p></a>
                                <br><small style="float: right">${videoList.date}</small></td>
                        </tr>

                    </c:forEach>

                </table>

            </section>
            <section class="mod withborder">
                <h2 class="red"><span class="iconwraper">
            <i class="thunews-line-chart"></i>
            </span>
                    近期热点
                    <a href="#" style="font-size:12px; color:#666; margin-left:30px">
                        <%--更多 &#8250;--%>
                    </a>
                </h2>
                <ul class="newslist clearfix"  id="resText">
                    <c:forEach items="${hotInfo}" var="eventList">
                        <li><a href="../info/findByIdInfo.do?infoId=${eventList.info_id}">${eventList.title}<small style="float: right">${eventList.date}</small></li>
                    </c:forEach>
                </ul>
            </section>
        </section>
        </section>
    </div>
</div>
</body>
</html>

