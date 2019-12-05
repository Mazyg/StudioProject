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
                <c:forEach items="${eventTop}" var="eventTop">
                <div class="biggallerywraper">
                    <ul class="biggallerylist clearfix">
                        <li><a href="#" target="_blank"><img src="${eventTop.photo}"></a></li>
                    </ul>
                    <div class="imgintro1">
                        <b></b>
                        <h3>
                            <span class="tips" id="keyword1-1">${eventTop.info_type}</span>
                            <a href="#" target="_blank"  id="title1-1" class="jiequ">【${eventTop.info_type}】${eventTop.title}</a>
                        </h3>
                        <p>${eventTop.introduce}</p>
                    </div>
                </div>
                </c:forEach>
            </div>
            <ul class="picnewslist people">
            <c:forEach items="${eventList}" var="eventList">
                <li class="clearfix">
                    <figure>
                        <a class="picwraper" href="#" target="_blank">
                            <img src="${eventList.photo}">
                        </a>
                        <div class="contentwraper">
                            <figcaption>
                                <span class="tips">${eventList.info_type}</span>
                                <a href="#" target="_blank"  class="jiequ">
                                    【${eventList.info_type}】${eventList.title}
                                </a>
                            </figcaption>
                            <p>${eventList.introduce}</p>
                            <div class="thumb">
                                <i class="thunews-clock-o"></i>
                                ${eventList.date}
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
            <script type="text/javascript">
                var strUrl = window.location.href;
                var curPage=1;
                var pageCount = 21;//total pages count
                if(strUrl.lastIndexOf('index_')!=-1)
                    curPage=parseInt(strUrl.substring(strUrl.lastIndexOf('_')+1,strUrl.lastIndexOf('.')));//current page number
                var pageStr = "<div class=\"pager\">";
                if(pageCount>1){
                    pageStr += '<a href="javascript:;" class="p" title="前一页" onclick="doGo('+(curPage-1)+');">«</a>';
                }
                if(pageCount <= 9){
                    for(var i=0;i<pageCount;i++){
                        var currentClass = ((i+1)==curPage)?"current":"";
                        pageStr += '<a href="javascript:;" class="'+currentClass+'" onclick="doGo('+(i+1)+')">'+(i+1)+'</a>';
                    }
                }else if(pageCount > 9 && (curPage + 4) <= pageCount && (curPage - 4) <= 0){
                    for(var i=0;i<9;i++){
                        var currentClass = ((i+1)==curPage)?"current":"";
                        pageStr += '<a href="javascript:;" class="'+currentClass+'" onclick="doGo('+(i+1)+')">'+(i+1)+'</a>';
                    }
                }else if(pageCount > 9 && (curPage + 4) <= pageCount && (curPage - 4) > 0){
                    for(var i=(curPage - 3);i<(curPage + 4);i++){
                        var currentClass = ((i+1)==curPage)?"current":"";
                        pageStr += '<a href="javascript:;" class="'+currentClass+'" onclick="doGo('+(i+1)+')">'+(i+1)+'</a>';
                    }
                }else{
                    for(var i=(pageCount - 8);i<(pageCount);i++){
                        var currentClass = ((i+1)==curPage)?"current":"";
                        pageStr += '<a href="javascript:;" class="'+currentClass+'" onclick="doGo('+(i+1)+')">'+(i+1)+'</a>';
                    }
                }
                if(curPage < pageCount){
                    pageStr += '<a href="javascript:;" onclick="doGo('+(curPage+1)+')" class="p" title="后一页">»</a>';
                }
                pageStr += "<span>到第<input name=\"\" type=\"text\" id=\"ymz\">页 <a href=\"#\"  onclick=\"goto_ymz()\">确定</a></span>";
                pageStr += "</div>";
                var pageStr1 = "<div class=\"mobilemore clearfix\">";
                if(pageCount>1){
                    pageStr1 += '<a href="javascript:;" class="prev" title="上一页" onclick="doGo('+(curPage-1)+');">上一页</a>';
                }
                if(curPage < pageCount){
                    pageStr1 += '<a href="javascript:;" onclick="doGo('+(curPage+1)+')" class="next" title="下一页">下一页</a>';
                }
                pageStr1 += "</div>";
                document.write(pageStr);
                document.write(pageStr1);
            </script>
            <script type="text/javascript">
                function doGo(jumpvalue){
                    if(jumpvalue<1 || jumpvalue>21)
                        return;
                    var urlstr = window.location.href;
                    var urlColumnId = urlstr.substr(urlstr.indexOf('#')+1,8);
                    urlColumnId = urlColumnId.replace("","");
                    if(1==jumpvalue){
                        urlstr = urlstr.substr(0,urlstr.lastIndexOf('')+1)+'index.html';
                    }else{
                        urlstr = urlstr.substr(0,urlstr.lastIndexOf('')+1)+'index_'+jumpvalue+'.html';
                    }
                    window.location.href = urlstr;
                }
                function goto_ymz(){
                    jumpvalue0 = $('#ymz').val();
                    if(jumpvalue0<1 || jumpvalue0>21)
                        return;
                    var urlstr0 = window.location.href;
                    if(1==jumpvalue0){
                        urlstr0 = urlstr0.substr(0,urlstr0.lastIndexOf('')+1)+'index.html';
                    }else{
                        urlstr0 = urlstr0.substr(0,urlstr0.lastIndexOf('')+1)+'index_'+jumpvalue0+'.html';
                    }
                    window.location.href = urlstr0;
                }
            </script>
            <p style="display:none">
<span style='font-size:12px'>
		共<b>436</b>条&nbsp;&nbsp;
		分<b>21</b>页&nbsp;&nbsp;
		当前&nbsp;第<b>1</b>页&nbsp;&nbsp;
		 <font color='#C0C0C0'>首页</font>
		 <font color='#C0C0C0'>上一页</font>
		 <a href='#'><font color='#000000'>下一页</font></a>
		 <a href='#'><font color='#000000'>末页</font></a>
</span></p>
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

