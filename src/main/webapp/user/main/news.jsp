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
            <div class="biggallery">
                <div class="biggallerywraper">
                    <ul class="biggallerylist clearfix">
                        <li><a href="#" target="_blank"><img src="img/tu1.jpg"></a></li>
                    </ul>
                    <div class="imgintro">
                        <b></b>
                        <h3>
                            <span class="tips" id="keyword1-1">资讯</span>
                            <a href="#" target="_blank"  id="title1-1" class="jiequ">【资讯】对话未来实验室首席研究员郑址洪：让未来更好，就是让一...</a>
                        </h3>
                        <p> "2019年初，郑址洪全职加入清华大学未来实验室，担任Aging+eXperience实验室主任，致力于开发及优化适老设备以提升老人的生活质量。“每个人都值得拥有更好的生活，残疾人如是，老年人如是。用余生去帮助更多需要帮助的人，这是我的最大心愿
                        </p>
                    </div>
                </div>
            </div>
            <ul class="picnewslist people">
                <li class="clearfix">
                    <figure>
                        <a class="picwraper" href="#" target="_blank">
                            <img src="img/tu5.jpg">
                        </a>
                        <div class="contentwraper">
                            <figcaption>
                                <span class="tips"  >资讯</span>
                                <a href="#" target="_blank"  class="jiequ">
                                    【资讯】新闻标题
                                </a>
                            </figcaption>
                            <p>新闻内容</p>
                            <div class="thumb">
                                <i ></i>
                                2019.10.31 （新闻时间）
                                <i ></i>

                                <span ></span>

                            </div>
                        </div>
                    </figure>
                </li>
                <li class="clearfix">
                    <figure>
                        <a class="picwraper" href="#" target="_blank">
                            <img src="img/tu5.jpg">
                        </a>
                        <div class="contentwraper">
                            <figcaption>
                                <span class="tips"  >资讯</span>
                                <a href="#" target="_blank"  class="jiequ">
                                    【资讯】新闻标题
                                </a>
                            </figcaption>
                            <p>新闻内容</p>
                            <div class="thumb">
                                <i class=""></i>
                                2019.10.31 （新闻时间）
                                <i class=""></i>
                                <font  >
                                    <span  ></span>
                                </font>
                            </div>
                        </div>
                    </figure>
                </li>
                <li class="clearfix">
                    <figure>
                        <a class="picwraper" href="#" target="_blank">
                            <img src="img/tu5.jpg">
                        </a>
                        <div class="contentwraper">
                            <figcaption>
                                <span class="tips" id="keyword-1">资讯</span>
                                <a href="#" target="_blank" id="title-1" class="jiequ">
                                    【资讯】新闻标题
                                </a>
                            </figcaption>
                            <p>新闻内容</p>
                            <div class="thumb">
                                <i class="thunews-clock-o"></i>
                                2019.10.31 （新闻时间）
                                <i class="thunews-eye"></i>
                                <font id="font_itemlist_total_20191029161652878588253">
                                    <span id="itemlist_total_20191029161652878588253"></span>
                                </font>
                            </div>
                        </div>
                    </figure>
                </li>
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


