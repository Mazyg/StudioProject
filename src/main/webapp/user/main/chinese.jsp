<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"user/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    <base target="<%=basePath%>"/>
    <meta charset="utf-8">
    <title>爱我中华</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/chinese_base.css" rel="stylesheet" type="text/css">
    <link href="css/base_news.css" rel="stylesheet" type="text/css">
    <link href="font/font.css" rel="stylesheet" type="text/css">
    <link href="css/inner.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/slick.css">
    <script src="js/slick.min.js" type="text/javascript"></script>
    <script src="js/regexcut.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/owl.carousel.css">
    <script src="js/owl.carousel.min.js" type="text/javascript"></script>
    <script src="js/chinese.js" type="text/javascript"></script>
    <!--[if lt IE 9]-->
    <script src="js/html5.js" type="text/javascript"></script>
    <script src="js/json2.js" type="text/javascript"></script>
    <![endif]-->
    <script src="js/regex-cn.js" type="text/javascript"></script>
    <!--[if lt IE 8]-->
    <link rel="stylesheet" href="font/ie7/ie7.css">
    <script type="text/javascript" src="js/jump.js"></script>
</head>
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
<script type="text/javascript">
    jQuery(function(){
        jQuery('#nav li a [class^=item]').removeClass('current');
        jQuery('#nav li a.item9652').addClass('current');
    });
</script>
<div class="content yahei subchannel">
    <div class="mainWrap clearfix">
        <section class="colunm1">
            <h2 class="channeltitle noborder hideonpc">最美中国景</h2>
            <div class="biggallery">
                <div class="biggallerywraper">
                    <ul class="biggallerylist">
                    <c:forEach items="${chineseScenery}" var="chineseScenery">
                        <li>
                            <a href="#" target="_blank"><img src="${chineseScenery.photo}"></a>
                            <div class="imgintro">
                            <b></b>
                            <h3><a href="#" target="_blank" class="jiequ">【${chineseScenery.info_type}】${chineseScenery.title}</a></h3>
                            <p> ${chineseScenery.introduce}</p>
                            </div>
                        </li>
                    </c:forEach>
                    </ul>
                </div>
                <div class="imgthumb clearfix">
                    <ul>
                    <c:forEach items="${chineseScenery}" var="chineseScenery">
<%--                        <li class="active"><a><img src=""></a></li>--%>
                        <li><a><img src="${chineseScenery.photo}"></a></li>
                    </c:forEach>
                    </ul>
                </div>
                <script type="text/javascript">
                    $(function(){

                        $('.biggallery .biggallerywraper .biggallerylist').slick({
                            infinite: true,
                            slidesToShow: 1,
                            slidesToScroll: 1,
                            autoplay: true,
                            centerMode: false,
                            prevArrow:"<div class=\"sliderbutton prev\"><i>&lt;</i></div>",
                            nextArrow:"<div class=\"sliderbutton next\"><i>&gt;</i></div>"
                        });
                        $('.biggallery .biggallerywraper .biggallerylist').on('beforeChange', function(event, slick, currentSlide,nextSlide){
                            $(".biggallery .imgthumb li").removeClass("active");
                            $(".biggallery .imgthumb li").eq(nextSlide).addClass("active");
                            $(".biggallery .biggallerywraper .imgintro li").removeClass("active");
                            $(".biggallery .biggallerywraper .imgintro li").eq(nextSlide).addClass("active");
                        });

                        $(".biggallery .imgthumb li").click(function(){
                            $('.biggallery .biggallerywraper .biggallerylist').slick("slickGoTo",$(this).index());
                        })
                    })
                </script>
            </div>
            <ul class="picwhitenewslist clearfix">
            <c:forEach items="${chineseAll}" var="chineseAll">
                <li>
                    <figure>
                        <a href="#" target="_blank"><img src="${chineseAll.photo}"></a>
                        <figcaption><a target="_blank" href="#" class="jiequ">【${chineseAll.info_type}】${chineseAll.title}</a></figcaption>
                        <div class="thumb"><i class="thunews-clock-o"></i>${chineseAll.date}<i class="thunews-eye"></i> <font id="font_itemlist_total_20191115111315714796419"><span id="itemlist_total_20191115111315714796419"></span></font></div>
                    </figure>
                </li>
            </c:forEach>
            </ul>
            <br>
            <div class="pager">
                <!-- 上一页 按钮 -->
                <c:choose>
                    <c:when test="${page>1}">
                        <a href="../info/findChinese.do?start=${start-numberPerPage}&length=${numberPerPage}&page=${page-1}&numberPerPage=${numberPerPage}" rel="external nofollow" ><<</a>
                    </c:when>
                    <c:otherwise>
                        <a><<</a>
                    </c:otherwise>
                </c:choose>

                <!-- 页数列表 -->
                <c:forEach items="${pageList}" var="item">
                    <c:choose>
                        <c:when test="${(total-(item-1)*numberPerPage)>=numberPerPage}">
                            <a href="../info/findChinese.do?start=${(item-1)*numberPerPage}&length=${numberPerPage}&page=${item}&numberPerPage=${numberPerPage}" rel="external nofollow" rel="external nofollow" rel="external nofollow" class="currentPage">${item}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="../info/findChinese.do?start=${(item-1)*numberPerPage}&length=${total-(item-1)*numberPerPage}&page=${item}&numberPerPage=${numberPerPage}" rel="external nofollow" rel="external nofollow" rel="external nofollow" class="currentPage">${item}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <!-- 下一页 按钮 -->
                <c:choose>
                    <c:when test="${page<totalPage && rest>=numberPerPage}">
                        <a href="../info/findChinese.do?start=${start+numberPerPage}&length=${numberPerPage}&page=${page+1}&numberPerPage=${numberPerPage}" rel="external nofollow">
                            >>
                        </a>
                    </c:when>
                    <c:when test="${page<totalPage && rest<numberPerPage && rest>0}">
                        <a href="../info/findChinese.do?start=${start+numberPerPage}&length=${rest}&page=${page+1}&numberPerPage=${numberPerPage}" rel="external nofollow">
                            >>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a>>></a>
                    </c:otherwise>
                </c:choose>

                <!-- 直接跳转 -->
                共${totalPage}页&nbsp;&nbsp;向<input type="text" id="jumpTo" />页 <input type="button" style="color: #461B6E;line-height: 32px;width:50px;font-size:15px" value="跳转" onclick="jumpTo(${totalPage},${numberPerPage},${total},'findChinese')" />
                <!-- 设置每页显示条数 -->
                &nbsp;&nbsp;每页显示<input type="text" name="numberPerPage" id="numberPerPage" />条 <input style="color: #461B6E;line-height: 32px;width:50px;font-size:15px" type="button" value="设置" onclick="change(${total},'findChinese')" />
            </div>
</section>
        <section class="colunm2">
            <section class="mod withborder">
                <h2><a href="http://tv.tsinghua.edu.cn/" class="more" target="_blank">更多 &#8250;</a><span class="iconwraper"><i class="thunews-play-circle"></i></span>精彩视频</h2>
                <ul class="promvideolist clearfix" id="thunews_jcsp">
                </ul>
            </section>
            <section class="mod withborder">
                <h2 class="red"><span class="iconwraper"><i class="thunews-line-chart"></i></span>近期热点</h2>
                <ul class="newslist clearfix"  id="resText">

                </ul>
            </section>
        </section>
    </div>
</div>
<footer>
    <div class="mainWrap clearfix">
        <section>
            <div class="thulogo"><img src="publish/thunews/images/thulogo.png"></div>
            <div class="copyright"><span><a href="publish/thunews/10274/index.html">网站地图</a>　│　<a href="publish/thunews/10225/index.html">关于我们</a>　│　<a href="publish/thunews/10217/index.html">友情链接</a>　│　<a href="http://www.tsinghua.edu.cn/publish/newthu/newthu_cnt/intothu/picture/map.png" target="_blank">清华地图</a></span>
                清华大学新闻中心版权所有，清华大学新闻网编辑部维护，电子信箱:news@tsinghua.edu.cn<br>
                Copyright 2001-2020 news.tsinghua.edu.cn. All rights reserved.
            </div>
        </section>
    </div></footer>
</body>
</html>

