<%--
  Created by IntelliJ IDEA.
  User: grandir
  Date: 2019/11/26
  Time: 9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0,viewport-fit=cover">
    <meta name="format-detection" content="telephone=no" />
    <title>首页</title>
    <link rel="stylesheet" href="css/slick.css">
    <link href="css/index.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/comm.js?v=1" type="text/javascript"></script>
</head>
<body>
<div class="header" id="header">
    <div class="topline"></div>
    <div class="masklayer"></div>
    <div class="smenu" id="smenu"><i class="icon-menu"></i></div>
    <div class="navwrapper">
        <div class="logowrapper">
            <a href="#" class="logo"><img src="" alt=""></a>
        </div>
        <div class="nav">
            <div class="mainnav clearfix">
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
                    <li><a href="#">电影</a></li>
                    <li><a href="#" class="">个人中心</a>
                        <ul class="last">
                            <li><a href="#">我的收藏</a></li>
                            <li><a href="#">话题管理</a></li>
                            <li><a href="#">个人信息</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="subnav clearfix">
                <ul>
                    <li>登录</li>
                    <li class="en">注册</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="topimg">
        <ul>
            <li style="background-image: url('img/tu1.jpg')">
                <a href="#">
                    <h3>我国再一次发射一箭双星</h3>
                </a>
            </li>
            <li style="background-image:url('img/tu2.jpg')" >
                <a href="#">
                    <h3>中国制度的最大优势</h3>
                </a>
            </li>
            <li style="background-image:url('img/tu3.jpg')">
                <a href="#">
                    <h3>中国国际进口博览会</h3>
                </a>
            </li>
            <li style="background-image:url('img/tu4.jpg')">
                <a href="#">
                    <h3>国产航母驶入台湾海峡</h3>
                </a>
            </li>
            <li style="background-image:url('img/tu5.jpg')">
                <a href="#">
                    <h3>学习马克思主义基本理论</h3>
                </a>
            </li>

        </ul>
    </div>
</div>
<script type="text/javascript">
    $('.topimg ul').slick({
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        centerMode: false,
        arrows:true,
        fade:true,
        dots:true,
        speed:1000,
        autoplaySpeed:6000,
        prevArrow:"<div class='pre arrow'><i class='icon-angle-left'></i></div>",
        nextArrow:"<div class='next arrow'><i class='icon-angle-right'></i></div>",
        customPaging:function(slider, i) {
            return '<button>0' + (i + 1) +"</button>";
        },
        responsive: [{
            breakpoint: 1000,
            settings: {
                fade:false,
                speed:300
            }
        }]
    });
    var mr=document.createElement("a");
    mr.text="更多最新话题 >";
    mr.href="#";
    mr.target="_blank";
    mr.className="moreimg";
    $(".topimg .slick-dots").append(mr);
</script>
<div class="content">
    <div class="section_1">
        <div class="cbg"></div>
        <div class="mainWrap">
            <div class="news clearfix">
                <ul>
                    <li  class="fi" >
                        <a href="#" target="_blank">
                            <img src="img/1.png" alt="">
                            <div class="txtwrapper">
                                <div class="time">
                                    <i class="icon-clock"></i> 2019.11.19
                                </div>
                                <p>2017年感动中国人物廖俊波：”牢记党的话，温暖群众的心“</p>
                            </div>
                        </a>
                    </li>
                    <li >
                        <a href="#" target="_blank">
                            <img src="img/2.png" alt="">
                            <div class="txtwrapper">
                                <div class="time"><i class="icon-clock"></i> 2019.11.19
                                </div>
                                <p>刘练：青春在大漠沙海中闪光</p>
                            </div>
                        </a>
                    </li>
                    <li >
                        <a href="#" target="_blank">
                            <img src="img/3.png" alt="">
                            <div class="txtwrapper"><div class="time">
                                <i class="icon-clock"></i> 2019.11.19
                            </div>
                                <p>”抠门“的老兵走了，留下”丰厚“的遗产！</p>
                            </div>
                        </a>
                    </li>

                </ul>
            </div>
            <div class="events">
                <h2><b></b>新闻资讯<b></b></h2>
                <ul class="clearfix">
                    <li>
                        <a href="#" target="_blank">
                            <div class="time">
                                <span>15</span>2019.11
                            </div>
                            <div class="txtwrapper">
                                <h3>新闻资讯标题</h3>
                                <p>新闻资讯内容</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <div class="time">
                                <span>15</span>2019.11
                            </div>
                            <div class="txtwrapper">
                                <h3>新闻资讯标题</h3>
                                <p>新闻资讯内容</p>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" target="_blank">
                            <div class="time">
                                <span>15</span>2019.11
                            </div>
                            <div class="txtwrapper">
                                <h3>新闻资讯标题</h3>
                                <p>新闻资讯内容... </p>
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
            <a href="#" target="_blank" class="newsmore">更多新闻资讯</a>
        </div>
    </div>
    <div class="section_2">
        <div class="mainWrap relative">
            <h2><span>爱我中华</span><a href="#" class="more">更多 ></a></h2>
            <div class="focus">
                <div class="bigpic">
                    <ul>
                        <li>
                            <a href="#" target="_blank">
                                <img src="img/art.jpg "alt=""><div class="txtwrapper">
                                <div class="cata">最美中国事</div>
                                <h3>近200项非遗项目在黄山市展出</h3>
                                <p> 2019年11月，第4届中国非遗传统技艺大展在安徽省黄山市举办。
                                    本届大展共有全国30个省区市近200项传统美术、传统技艺、传统医药等非遗项目参展...</p>
                            </div>
                            </a>
                        </li>
                        <li>
                            <a href="#" target="_blank">
                                <img src="img/scenery.png" alt="">
                                <div class="txtwrapper">
                                    <div class="cata">最美中国景</div>
                                    <h3>辽宁葫芦岛：三礁揽胜 梦幻海湾</h3>
                                    <p>  三礁揽胜位于辽宁兴城市兴海湾浴场，是一-座由三块巨大礁石连接而成的观景石桥。三礁揽胜蜿蜒曲折探入大海，是兴城市的地标性建筑。不论春夏秋冬... </p>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#" target="_blank"><img src="img/people.jpg" alt="">
                                <div class="txtwrapper">
                                    <div class="cata">最美中国人</div>
                                    <h3>中国艺术体操队在京进行体能检验</h3>
                                    <p>11月22日，为进一步做好备战东京奥运会强化体能工作，中国艺术体操队在北京体育大学进行了体能测验，检测运动员水平... </p>
                                </div>
                            </a>
                        </li>

                    </ul>
                </div>
                <div class="smallpic">
                    <ul>
                        <li>
                            <a href="#" target="_blank">
                                <img src="img/people.jpg" alt=""><div class="txtwrapper">
                                <div class="cata">最美中国人</div>
                                <h3>中国艺术体操队在京进行体能检验</h3>
                            </div>
                            </a>
                        </li>
                        <li>
                            <a href="#" target="_blank"><img src="img/art.jpg" alt="">
                                <div class="txtwrapper"><div class="cata">最美中国事</div>
                                    <h3>近200项非遗项目在黄山市展出</h3>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="#" target="_blank"><img src="img/scenery.png" alt="">
                                <div class="txtwrapper"><div class="cata">最美中国景</div>
                                    <h3>辽宁葫芦岛：三礁揽胜 梦幻海湾</h3>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('.smallpic ul').slick({
            infinite: true,
            slidesToShow: 1,
            slidesToScroll: 1,
            autoplay: true,
            centerMode: false,
            arrows:false,
            dots:false,
            asNavFor:$('.bigpic ul')
        });
        $('.bigpic ul').slick({
            infinite: true,
            slidesToShow: 1,
            slidesToScroll: 1,
            autoplay: true,
            centerMode: false,
            arrows:false,
            dots:true,
            autoplaySpeed:4000,
            // prevArrow:"&lt;div class='pre arrow'>&lt;i class='icon-angle-left'>&lt;/i>&lt;/div>",
            // nextArrow:"&lt;div class='next arrow'>&lt;i class='icon-angle-right'>&lt;/i>&lt;/div>",
            asNavFor:$('.smallpic ul')
        });

    </script>

    <div class="section_3">
        <div class="tbg"><div><img src="img/btbg.png" alt=""></div></div>
        <div class="tcbg"></div>
        <div class="mainWrap relative">
            <h2><b></b>图书电影<b></b></h2>
            <div class="datawrapper">
                <div class="dataitem">
                    <ul>
                        <li>
                            <div class="wrapper">
                                <img src="img/movie9.jpg" alt="">
                                <div class="txtwrapper">
                                    <h4>名称</h4>
                                    <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                                </div>
                            </div>
                        </li>
                        <li><div class="wrapper"><img src="img/movie10.jpg" alt="">
                            <div class="txtwrapper">
                                <h4>名称</h4>
                                <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                            </div>
                        </div>
                        </li>

                    </ul>
                </div>
                <div class="dataitem">
                    <ul>
                        <li>
                            <div class="wrapper">
                                <img src="img/movie11.jpg" alt="">
                                <div class="txtwrapper">
                                    <h4>名称</h4>
                                    <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                                </div>
                            </div>
                        </li>
                        <li><div class="wrapper"><img src="img/movie12.jpg" alt="">
                            <div class="txtwrapper">
                                <h4>名称</h4>
                                <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                            </div>
                        </div>
                        </li>

                    </ul>
                </div>
                <div class="dataitem">
                    <ul>
                        <li>
                            <div class="wrapper">
                                <img src="img/movie13.jpg" alt="">
                                <div class="txtwrapper">
                                    <h4>名称</h4>
                                    <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                                </div>
                            </div>
                        </li>

                        <li><div class="wrapper"><img src="img/movie14.jpg" alt="">
                            <div class="txtwrapper">
                                <h4>名称</h4>
                                <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                            </div>
                        </div>
                        </li>

                    </ul>
                </div>
                <div class="dataitem">
                    <ul>
                        <li>
                            <div class="wrapper">
                                <img src="" alt="">
                                <div class="txtwrapper">
                                    <h4>名称</h4>
                                    <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                                </div>
                            </div>
                        </li>
                        <li><div class="wrapper"><img src="" alt="">
                            <div class="txtwrapper">
                                <h4>名称</h4>
                                <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                            </div>
                        </div>
                        </li>

                    </ul>
                </div>
                <div class="dataitem">
                    <ul>
                        <li>
                            <div class="wrapper">
                                <img src="" alt="">
                                <div class="txtwrapper">
                                    <h4>名称</h4>
                                    <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                                </div>
                            </div>
                        </li>
                        <li><div class="wrapper"><img src="" alt="">
                            <div class="txtwrapper">
                                <h4>名称</h4>
                                <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                            </div>
                        </div>
                        </li>

                    </ul>
                </div>
                <div class="dataitem">
                    <ul>
                        <li>
                            <div class="wrapper">
                                <img src="" alt="">
                                <div class="txtwrapper">
                                    <h4>名称</h4>
                                    <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="wrapper">
                                <img src="" alt="">
                                <div class="txtwrapper">
                                    <h4>名称</h4>
                                    <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                                </div>
                            </div>
                        </li>

                    </ul>
                </div>
                <div class="dataitem">
                    <ul>
                        <li><div class="wrapper"><img src="" alt="">
                            <div class="txtwrapper">
                                <h4>名称</h4>
                                <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                            </div>
                        </div>
                        </li>
                        <li>
                            <div class="wrapper">
                                <img src="" alt="">
                                <div class="txtwrapper">
                                    <h4>名称</h4>
                                    <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="dataitem">
                    <ul>

                        <li><div class="wrapper"><img src="" alt="">
                            <div class="txtwrapper">
                                <h4>名称</h4>
                                <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                            </div>
                        </div>
                        </li>
                        <li>
                            <div class="wrapper">
                                <img src="" alt="">
                                <div class="txtwrapper">
                                    <h4>名称</h4>
                                    <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="dataitem">
                    <ul>

                        <li><div class="wrapper"><img src="" alt="">
                            <div class="txtwrapper">
                                <h4>名称</h4>
                                <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                            </div>
                        </div>
                        </li>
                        <li>
                            <div class="wrapper">
                                <img src="" alt="">
                                <div class="txtwrapper">
                                    <h4>名称</h4>
                                    <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="dataitem">
                    <ul>

                        <li><div class="wrapper"><img src="" alt="">
                            <div class="txtwrapper">
                                <h4>名称</h4>
                                <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                            </div>
                        </div>
                        </li>
                        <li>
                            <div class="wrapper">
                                <img src="" alt="">
                                <div class="txtwrapper">
                                    <h4>名称</h4>
                                    <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="dataitem">
                    <ul>
                        <li>
                            <div class="wrapper">
                                <img src="" alt="">
                                <div class="txtwrapper">
                                    <h4>名称</h4>
                                    <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                                </div>
                            </div>
                        </li>
                        <li><div class="wrapper"><img src="" alt="">
                            <div class="txtwrapper">
                                <h4>名称</h4>
                                <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                            </div>
                        </div>
                        </li>

                    </ul>
                </div>
                <div class="dataitem">
                    <ul>
                        <li>
                            <div class="wrapper">
                                <img src="" alt="">
                                <div class="txtwrapper">
                                    <h4>名称</h4>
                                    <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                                </div>
                            </div>
                        </li>

                        <li><div class="wrapper"><img src="" alt="">
                            <div class="txtwrapper">
                                <h4>名称</h4>
                                <p>介绍介绍介绍介绍介绍介绍介绍介绍</p>
                            </div>
                        </div>
                        </li>

                    </ul>
                </div>

            </div>
        </div>
    </div>
    <script type="text/javascript">
        $('.datawrapper').slick({
            infinite: true,
            slidesToShow: 4,
            slidesToScroll: 4,
            autoplay: true,
            centerMode: false,
            arrows:false,
            dots:true,
            autoplaySpeed:8000,
            responsive: [{
                breakpoint: 1400,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 3
                }
            },
                {
                    breakpoint: 1000,
                    settings: {
                        slidesToShow: 2,
                        slidesToScroll: 2
                    }
                } ,
                {
                    breakpoint: 600,
                    settings: {
                        slidesToShow: 1,
                        slidesToScroll: 1
                    }
                }
            ]
        })
    </script>
</div>

</body>
</html>

