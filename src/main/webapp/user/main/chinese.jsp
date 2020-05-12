<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"user/";
%>
<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <base href="<%=basePath%>">
    <base target="<%=basePath%>"/>
    <meta charset="utf-8">
    <title>爱我中华</title>
    <link rel="shortcut icon" href="img/title.ico" />
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
    <script type="text/javascript" src="js/searchsub.js"></script>
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
    if ((public['is'] == 'msie' == public['ver'] < 8.0)) {
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
                <input type="text" id="search"/>
                <a onclick="searchSub(${numberPerPage})"><i>搜索</i></a>
            </div>
        </div>
    </section>
    <nav class="navwrap yahei">
        <section class="mainWrap">
            <ul id="nav">
                <li><a href="../info/findEvent.do?page=1&numberPerPage=3&start=0&length=3">全球战役</a>
                </li>
                <li><a href="../info/findEvent.do?page=1&numberPerPage=3&start=0&length=3">热点资讯</a>
                </li>
                <li><a href="../info/findChinese.do?page=1&numberPerPage=3&start=0&length=3">爱我中华</a>
                    <%-- <ul>
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
                            <a href="../info/findByIdInfo.do?infoId=${chineseScenery.info_id}&uid=${users.uid}" target="_blank"><img data-original="${chineseScenery.photo}" src="img/loading.gif"></a>
                            <div class="imgintro">
                            <b></b>
                            <h3><a href="../info/findByIdInfo.do?infoId=${chineseScenery.info_id}&uid=${users.uid}" target="_blank" class="jiequ">【${chineseScenery.info_type}】${chineseScenery.title}</a></h3>
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
                        <li><a><img data-original="${chineseScenery.photo}" src="img/loading.gif"></a></li>
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
                        <a href="../info/findByIdInfo.do?infoId=${chineseAll.info_id}&uid=${users.uid}" target="_blank"><img data-original="${chineseAll.photo}" src="img/loading.gif"></a>
                        <figcaption><a target="_blank" href="../info/findByIdInfo.do?infoId=${chineseAll.info_id}&uid=${users.uid}" class="jiequ">【${chineseAll.info_type}】${chineseAll.title}</a></figcaption>
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
                共${totalPage}页&nbsp;&nbsp;向<input type="text" id="jumpTo" />页 <input type="button" style="color: #461B6E;line-height: 32px;width:50px;font-size:15px" value="跳转" onclick="jumpTo(${totalPage},${numberPerPage},${total},'../info/findChinese')" />
                <!-- 设置每页显示条数 -->
                &nbsp;&nbsp;每页显示<input type="text" name="numberPerPage" id="numberPerPage" />条 <input style="color: #461B6E;line-height: 32px;width:50px;font-size:15px" type="button" value="设置" onclick="change(${total},'../info/findChinese')" />
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

