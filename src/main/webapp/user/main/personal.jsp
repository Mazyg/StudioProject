<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: grandir
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
    <title>榜样力量</title>
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
                    <ul>
                        <li><a href="#">话题1</a></li>
                        <li><a href="#">话题2</a></li>
                        <li><a href="#">话题3</a></li>
                    </ul>
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
            <div class="biggallery">
                <div class="biggallerywraper">
                    <ul class="biggallerylist clearfix">
                        <li><a href="#" target="_blank"><img src="${personone.get(0).photo}"></a></li>
                    </ul>
                    <div class="imgintro1">
                        <b></b>
                        <h3>
                            <span class="tips" id="keyword1-1">人物</span>
                            <a href="#" target="_blank"  id="title1-1" class="jiequ">${personone.get(0).title}</a>
                        </h3>
                        <p> ${personone.get(0).introduce}
                        </p>
                    </div>
                </div>
            </div>
            <ul class="picnewslist people">

                <c:forEach items="${rolemodeltop}" var="role">
                <li class="clearfix">
                    <figure>
                        <a class="picwraper" href="#" target="_blank">
                            <img src="${role.photo}">
                        </a>
                        <div class="contentwraper">
                            <figcaption>
                                <span class="tips">榜样力量</span>
                                <a href="#" target="_blank"  class="jiequ">
                                   ${role.title}
                                </a>
                            </figcaption>
                            <p>${role.introduce}</p>
                            <div class="thumb">
                                <i class="thunews-clock-o"></i>
                                ${role.date}
                                <i class="thunews-eye"></i>
                                <font>
                                    <span  ></span>
                                </font>
                            </div>
                        </div>
                    </figure>
                </li>
                </figure>
                </li>
                </c:forEach>
                <a name="aa"></a>
                <c:forEach items="${person}" var="person">
                <li class="clearfix">
                    <figure>
                        <a class="picwraper" href="#" target="_blank">
                            <img src="${person.photo}">
                        </a>
                        <div class="contentwraper">
                            <figcaption>
                                <span class="tips">身边榜样</span>
                                <a href="#" target="_blank"  class="jiequ">
                                   ${person.title}
                                </a>
                            </figcaption>
                            <p>${person.introduce}</p>
                            <div class="thumb">
                                <i class="thunews-clock-o"></i>
                                ${person.date}
                                <i class="thunews-eye"></i>
                                <font>
                                    <span  ></span>
                                </font>
                            </div>
                        </div>
                    </figure>
                </li>
                </figure>
                </li>
                </c:forEach>
                <a name="ab">新时代楷模</a>
                <c:forEach items="${persontip}" var="persontip">
                <li class="clearfix">
                    <figure>
                        <a class="picwraper" href="#" target="_blank">
                            <img src="${persontip.photo}">
                        </a>
                        <div class="contentwraper">
                            <figcaption>
                                <span class="tips">新时代楷模</span>
                                <a href="#" target="_blank"  class="jiequ">
                                    ${persontip.title}
                                </a>
                            </figcaption>
                            <p>${persontip.introduce}</p>
                            <div class="thumb">
                                <i class="thunews-clock-o"></i>
                                ${persontip.date}
                                <i class="thunews-eye"></i>
                                <font>
                                    <span  ></span>
                                </font>
                            </div>
                        </div>
                    </figure>
                </li>
                </figure>
                </li>
                </c:forEach>
            </ul>
            <p style="display:none">
        <span style='font-size:12px'>
                共<b>10</b>条&nbsp;&nbsp;
                分<b>2</b>页&nbsp;&nbsp;
                当前&nbsp;第<b>1</b>页&nbsp;&nbsp;
                 <font color='#C0C0C0'>首页</font>
                 <font color='#C0C0C0'>上一页</font>
                 <a href='#'><font color='#000000'>下一页</font></a>
                 <a href='#'><font color='#000000'>末页</font></a>
        </span>
            </p>
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

