<%--
  Created by IntelliJ IDEA.
  User: grandir
  Date: 2019/11/26
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"user/";
%>
<!doctype html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>新闻资讯</title>
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
    <script type="text/javascript" src="js/searchsub.js"></script>
</head>
<body>
<header class="clearfix">
    <section class="mainWrap">
        <div class="topwraper relative clearfix">
            <div class="search">
                <input name="query" type="text" id="search" >
                <a onclick="searchSub()"><i>搜索</i></a>
            </div>
        </div>
    </section>
    <nav class="navwrap yahei">
        <section class="mainWrap">
            <ul id="nav">
                <li><a href="../info/findEvent.do">热点时事</a>
                </li>
                <li><a href="../info/findChinese.do">爱我中华</a>
                    <ul>
                        <li><a href="#">最美中国景</a></li>
                        <li><a href="#">最美中国人</a></li>
                        <li><a href="#">最美中国事</a></li>
                    </ul>
                </li>
                <li><a href="../info/findPersonInfo.do" class="">榜样力量</a>
                    <ul>
                        <li><a href="#">新时代楷模</a></li>
                        <li><a href="#">改革先锋</a></li>
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
                <li><a href="../info/findMovies.do">电影</a></li>
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
            <ul class="picnewslist people">
                <c:forEach items="${infos}" var="infos">
                    <li class="clearfix">
                        <figure>
                            <a class="picwraper" href="#" target="_blank">
                                <img src="${infos.photo}">
                            </a>
                            <div class="contentwraper">
                                <figcaption>
                                    <span class="tips">${infos.info_type}</span>
                                    <a href="#" target="_blank"  class="jiequ">
                                        【${infos.info_type}】${infos.title}
                                    </a>
                                </figcaption>
                                <p>${infos.introduce}</p>
                                <div class="thumb">
                                    <i class="thunews-clock-o"></i>
                                        ${infos.date}
                                    <i class="thunews-eye"></i>
                                    <font  >
                                        <span  ></span>
                                    </font>
                                </div>
                            </div>
                        </figure>
                    </li>
                </c:forEach>
            </ul>
            <br>
            <div class="pager">
                <!-- 上一页 按钮 -->
                <c:choose>
                    <c:when test="${page>1}">
                        <a href="../info/findAll.do?start=${start-numberPerPage}&length=${numberPerPage}&page=${page-1}&numberPerPage=${numberPerPage}&search=${search}" rel="external nofollow" ><<</a>
                    </c:when>
                    <c:otherwise>
                        <a><<</a>
                    </c:otherwise>
                </c:choose>

                <!-- 页数列表 -->
                <c:forEach items="${pageList}" var="item">
                    <c:choose>
                        <c:when test="${(total-(item-1)*numberPerPage)>=numberPerPage}">
                            <a href="../info/findAll.do?start=${(item-1)*numberPerPage}&length=${numberPerPage}&page=${item}&numberPerPage=${numberPerPage}&search=${search}" rel="external nofollow" rel="external nofollow" rel="external nofollow" class="currentPage">${item}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="../info/findAll.do?start=${(item-1)*numberPerPage}&length=${total-(item-1)*numberPerPage}&page=${item}&numberPerPage=${numberPerPage}&search=${search}" rel="external nofollow" rel="external nofollow" rel="external nofollow" class="currentPage">${item}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <!-- 下一页 按钮 -->
                <c:choose>
                    <c:when test="${page<totalPage && rest>=numberPerPage}">
                        <a href="../info/findAll.do?start=${start+numberPerPage}&length=${numberPerPage}&page=${page+1}&numberPerPage=${numberPerPage}&search=${search}" rel="external nofollow">
                            >>
                        </a>
                    </c:when>
                    <c:when test="${page<totalPage && rest<numberPerPage && rest>0}">
                        <a href="../info/findAll.do?start=${start+numberPerPage}&length=${rest}&page=${page+1}&numberPerPage=${numberPerPage}&search=${search}" rel="external nofollow">
                            >>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a>>></a>
                    </c:otherwise>
                </c:choose>
                <!-- 直接跳转 -->
                共${totalPage}页&nbsp;&nbsp;向<input type="text" id="jumpTo" />页 <input type="button" style="color: #461B6E;line-height: 32px;width:50px;font-size:15px" value="跳转" onclick="jumpTo2(${totalPage},${numberPerPage},${total},${search})" />
                <!-- 设置每页显示条数 -->
                &nbsp;&nbsp;每页显示<input type="text" name="numberPerPage" id="numberPerPage" />条 <input style="color: #461B6E;line-height: 32px;width:50px;font-size:15px" type="button" value="设置" onclick="change2(${total},${search})" />
            </div>
        </section>
        <section class="colunm2">
            <section class="mod withborder">
                <h2>
                    <span class="iconwraper"><i class="thunews-play-circle"></i></span>
                    精彩视频
                    <a href="#" style="font-size:12px; color:#666; margin-left:30px">
                        更多 &#8250;
                    </a>
                </h2>
                <ul class="promvideolist clearfix" id="thunews_jcsp">
                    <li>视频1</li>
                    <li>视频2</li>
                    <li>视频3</li>
                    <li>视频4</li>
                </ul>
            </section>
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
                    <c:forEach items="${eventList}" var="eventList">
                        <li>${eventList.title}</li>
                    </c:forEach>
                </ul>
            </section>
        </section>
    </div>
</div>
</body>
</html>


