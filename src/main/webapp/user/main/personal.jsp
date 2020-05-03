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
    <script type="text/javascript" src="js/searchsub.js"></script>
    <link href="css/search-suggest.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="http://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/search-suggest.js"></script>
    <script type="text/javascript" src="js/demo.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-1.8.3.js" integrity="sha256-dW19+sSjW7V1Q/Z3KD1saC6NcE5TUIhLJzJbrdKzxKc=" crossorigin="anonymous"></script>
    <script src="js/jquery.lazyload.js"></script>

</head>
<style type="text/css">
    .imgs1{
        width: 100px;
        height: 80px;
    }
</style>

<script>
    function checkbrowse() {
        var ua = navigator.userAgent.toLowerCase();
        var is = (ua.match(/\b(chrome|opera|safari|msie|firefox)\b/) || ['', 'mozilla'])[1];
        var r = '(?:' + is + '|version)[\\/: ]([\\d.]+)';
        var v = (ua.match(new RegExp(r)) || [])[1];
        jQuery.browser.is = is;
        jQuery.browser.ver = v;
        return {
            'is': jQuery.browser.is,
            'ver': jQuery.browser.ver
        }
    }
    var public = checkbrowse();
    var showeffect = "";
    if ((public['is'] == 'msie' && public['ver'] < 8.0)) {
        showeffect = "show"
    } else {
        showeffect = "fadeIn"
    }

    $(function(){
        $("img").lazyload({
            threshold : 200,
            effect : showeffect
        });
    });
</script>

<body>
<header class="clearfix">
    <section class="mainWrap">
        <div class="topwraper relative clearfix">
            <div class="search">
                <input name="query" type="text" id="search" autocomplete="off" >
                <a onclick="searchSub(${numberPerPage})"><i>搜索</i></a>
            </div>
        </div>
    </section>
    <nav class="navwrap yahei">
        <section class="mainWrap">
            <ul id="nav">
                <li><a href="../info//epidemic.do?page=1&numberPerPage=3&start=0&length=3">全球战疫</a>
                </li>
                <li><a href="../info/findEvent.do?page=1&numberPerPage=3&start=0&length=3">热点资讯</a>
                </li>
                <li><a href="../info/findChinese.do?page=1&numberPerPage=3&start=0&length=3">爱我中华</a>
                </li>
                <li><a  class="">榜样力量</a>
                    <ul>
                        <li><a href="javascript:void(0)" onclick="window.location.hash='ab'">新时代楷模</a></li>
                        <li><a href="javascript:void(0)" onclick="window.location.hash = 'aa'">身边榜样</a></li>
                        <li><a href="javascript:void(0)" onclick="window.location.hash = 'ac'"> 榜样力量</a> </li>
                        <%--<li><a href="#">最美奋斗者</a></li>
                        <li><a href="#">道德模范</a></li>--%>
                    </ul>
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
<div class="content yahei subchannel">
    <div class="mainWrap clearfix">
        <section class="colunm1">
            <div class="biggallery">
                <div class="biggallerywraper">
                    <ul class="biggallerylist clearfix">
                        <li><a href="../info/findByIdInfo.do?infoId=${personone.get(0).info_id}&uid=${users.uid}" target="_blank"><img data-original="${personone.get(0).photo}" src="img/loading.gif"></a></li>
                    </ul>
                    <div class="imgintro1">
                        <b></b>
                        <h3>
                            <span class="tips" id="keyword1-1">人物</span>
                            <a href="../info/findByIdInfo.do?infoId=${personone.get(0).info_id}&uid=${users.uid}" target="_blank"  id="title1-1" class="jiequ">${personone.get(0).title}</a>
                        </h3>
                        <p> ${personone.get(0).introduce}
                        </p>
                    </div>
                </div>
            </div>
            <ul class="picnewslist people">
                <a name="ac"></a>
                <c:forEach items="${rolemodeltop}" var="role">
                <li class="clearfix">
                    <figure>
                        <a class="picwraper" href="../info/findByIdInfo.do?infoId=${role.info_id}&uid=${users.uid}" target="_blank">
                            <img data-original="${role.photo}" src="img/loading.gif">
                        </a>
                        <div class="contentwraper">
                            <figcaption>
                                <span class="tips">榜样力量</span>
                                <a href="../info/findByIdInfo.do?infoId=${role.info_id}&uid=${users.uid}" target="_blank"  class="jiequ">
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
                        <a class="picwraper" href="../info/findByIdInfo.do?infoId=${person.info_id}&uid=${users.uid}" target="_blank">
                            <img src="${person.photo}">
                        </a>
                        <div class="contentwraper">
                            <figcaption>
                                <span class="tips">身边榜样</span>
                                <a href="../info/findByIdInfo.do?infoId=${person.info_id}&uid=${users.uid}" target="_blank"  class="jiequ">
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
                <a name="ab"></a>
                <c:forEach items="${persontip}" var="persontip">
                <li class="clearfix">
                    <figure>
                        <a class="picwraper" href="../info/findByIdInfo.do?infoId=${persontip.info_id}&uid=${users.uid}" target="_blank">
                            <img data-original="${persontip.photo}" src="img/loading.gif">
                        </a>
                        <div class="contentwraper">
                            <figcaption>
                                <span class="tips">新时代楷模</span>
                                <a href="../info/findByIdInfo.do?infoId=${persontip.info_id}&uid=${users.uid}" target="_blank"  class="jiequ">
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
                            <td><a href="../info/findByIdInfo.do?infoId=${videoList.info_id}&uid=${users.uid}"><img class="imgs1" data-original="${videoList.photo}" src="img/loading.gif"></a></td>
                            <td> <a href="../info/findByIdInfo.do?infoId=${videoList.info_id}&uid=${users.uid}"><p style="float: left">${videoList.title}</p></a>
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
    </div>
</div>
</body>
</html>

