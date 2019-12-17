<%--
  Created by IntelliJ IDEA.
  User: grandir
  Date: 2019/11/26
  Time: 9:10
  To change this template use File | Settings | File Templates.
--%>
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

<body onload="tset()">
<div class="header" id="header">
<%--    <div class="topline"></div>--%>
    <div class="masklayer"></div>
    <div class="smenu" id="smenu"><i class="icon-menu"></i></div>
    <div class="navwrapper">
        <div class="logowrapper">
            <a href="#" class="logo"><img src="" alt=""></a>
        </div>
        <div class="nav">
            <div class="mainnav clearfix">
                <ul id="nav">
                    <li><a href="../info/findEvent.do?page=1&numberPerPage=3&start=0&length=3">热点时事</a>
                    </li>
                    <li><a href="../info/findChinese.do?page=1&numberPerPage=3&start=0&length=3">爱我中华</a>
                    </li>
                    <li><a href="../info/findPersonInfo.do" class="">榜样力量</a>
                    </li>
                    <li><a href="../topic/showTopic.do?page=1&numberPerPage=3&start=0&length=3" class="">话题</a>
                    </li>

                    <li><a href="../info/findBooks.do?page=1&numberPerPage=3&start=0&length=3">书籍</a></li>
                    <li><a href="../info/findMovies.do?page=1&numberPerPage=3&start=0&length=3">电影</a></li>

                    <c:if test="${users.uname!=null}">
                    <li><a href="../info/findPersonalMainInfo.do" class="">个人中心</a>

                        <ul class="last">
                            <li><a href="main/personInfo.jsp">个人信息</a></li>
                            <li><a href="../topic/findByUid.do?uid="+${users.uid}">我的话题</a></li>
                            <c:if test="${users.u_type eq'admin'}">
                                <li><a href="../user/backAdmin.do">管理界面</a></li>
                            </c:if>
                            <li><a href="../user/exitLogin.do">退出登录</a></li>
                        </ul>
                    </li>
                    </c:if>
                </ul>
            </div>
            <div class="subnav clearfix">
                <ul>
                <c:if test="${users.uname==null}">
                    <li><a href="../manage/pages/samples/login.jsp">登录</a></li>
                    <li class="en"><a href="../manage/pages/samples/register.jsp">注册</a></li>
                </c:if>
                <c:if test="${users.uname!=null}">
                    <li><a href="../manage/pages/samples/login.jsp">${users.uname}</a></li>
                </c:if>
                </ul>
            </div>
        </div>
    </div>
    <div class="topimg">
        <ul>
            <c:forEach items="${event}" var="event">
            <li style="background-image: url('${event.photo}')">
                <a href="#">
                    <h3>${event.title}</h3>
                </a>
            </li>
            </c:forEach>

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
        prevArrow:"<div class='pre arrow'><i>&lt;</i></div>",
        nextArrow:"<div class='next arrow'><i>&gt;</i></div>",
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
    mr.text="更多热点时事>";
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
                <c:forEach items="${rolemodeltop}" var="rolemodeltop">
                    <li  class="fi" >
                        <a href="#" target="_blank">
                            <img src="${rolemodeltop.photo}" alt="">
                            <div class="txtwrapper">
                                <div class="time">
                                    <i class="icon-clock"></i> ${rolemodeltop.date}
                                </div>
                                <p><b>${rolemodeltop.title}</b><br/>
                                ${rolemodeltop.introduce}</p>
                            </div>
                        </a>
                    </li>
                </c:forEach>
                    <c:forEach items="${rolemodel}" var="rolemodel">
                    <li >
                        <a href="#" target="_blank">
                            <img src="${rolemodel.photo}" alt="">
                            <div class="txtwrapper">
                                <div class="time"><i class="icon-clock"></i>${rolemodel.date}
                                </div>
                                <p><b>${rolemodel.title}</b><br/>
                                ${rolemodel.introduce}</p>
                            </div>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="events">
                <h2><b></b>热门时事<b></b></h2>
                <ul class="clearfix">
                <c:forEach items="${event2}" var="event2">
                    <li>
                        <a href="#" target="_blank">
                            <div class="time">
                                <span></span>${event2.date}
                            </div>
                            <div class="txtwrapper">
                                <h3>${event2.title}</h3>
                                <p>${event2.introduce}</p>
                            </div>
                        </a>
                    </li>
                </c:forEach>
                </ul>
            </div>
            <a href="#" target="_blank" class="newsmore">更多热点时事</a>
        </div>
    </div>
    <div class="section_2">
        <div class="mainWrap relative">
            <h2><span>爱我中华</span><a href="#" class="more">更多 ></a></h2>
            <div class="focus">
                <div class="bigpic">
                    <ul>
                    <c:forEach items="${chinese}" var="chinese">
                        <li>
                            <a href="#" target="_blank">
                                <img src="${chinese.photo}"alt=""><div class="txtwrapper">
                                <div class="cata">${chinese.info_type}</div>
                                <h3> ${chinese.title}</h3>
                                <p> ${chinese.introduce}</p>
                            </div>
                            </a>
                        </li>
                    </c:forEach>
                    </ul>
                </div>
                <div class="smallpic">
                    <ul>
                    <c:forEach items="${chinese}" var="chinese">
                        <li>
                            <a href="#" target="_blank">
                                <img src="${chinese.photo}" alt=""><div class="txtwrapper">
                                <div class="cata">${chinese.info_type}</div>
                                <h3>${chinese.title}</h3>
                            </div>
                            </a>
                        </li>
                    </c:forEach>
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
                        <c:forEach items="${movies1}" var="movies1">
                        <li>
                            <div class="wrapper">
                                <img src="${movies1.photo}">
                                <div class="txtwrapper">
                                    <br/>
                                    <br/>
                                    <h4>${movies1.title}</h4>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                    </ul>
                </div>
                <div class="dataitem">
                    <ul>
                    <c:forEach items="${movies2}" var="movies2">
                        <li>
                            <div class="wrapper">
                                <img src="${movies2.photo}">
                                <div class="txtwrapper">
                                    <br/>
                                    <br/>
                                    <h4>${movies2.title}</h4>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                    </ul>
                </div>
                <div class="dataitem">
                    <ul>
                    <c:forEach items="${movies3}" var="movies3">
                        <li>
                            <div class="wrapper">
                                <img src="${movies3.photo}">
                                <div class="txtwrapper">
                                    <br/>
                                    <br/>
                                    <h4>${movies3.title}</h4>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                    </ul>
                </div>
                <div class="dataitem">
                    <ul>
                        <c:forEach items="${books1}" var="books1">
                            <li>
                                <div class="wrapper">
                                    <img src="${books1.photo}">
                                    <div class="txtwrapper">
                                        <br/>
                                        <br/>
                                        <h4>${books1.title}</h4>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="dataitem">
                    <ul>
                        <c:forEach items="${books2}" var="books2">
                            <li>
                                <div class="wrapper">
                                    <img src="${books2.photo}">
                                    <div class="txtwrapper">
                                        <br/>
                                        <br/>
                                        <h4>${books2.title}</h4>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="dataitem">
                    <ul>
                        <c:forEach items="${books3}" var="books3">
                            <li>
                                <div class="wrapper">
                                    <img src="${books3.photo}">
                                    <div class="txtwrapper">
                                        <br/>
                                        <br/>
                                        <h4>${books3.title}</h4>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
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
<div class="footer">
    <div class="mainWrap">
        <div class="ulink clearfix">
            <div class="plink">
                <h2>常用链接</h2>
                <ul class="plink_1 clearfix">
                    <li><a href="#" target="_blank">Campus Map</a></li>
                    <li><a href="#" target="_blank">Campus Tour</a></li>
                    <li><a href="#" target="_blank">Services</a></li>
                    <li><a href="#" target="_blank">Giving to Tsinghua</a></li>
                </ul>
                <ul class="plink_2 clearfix">
                    <li><a href="#" target="_blank">Academic Calendar</a></li>
                    <li><a href="#" target="_blank">Online Learning</a></li>
                    <li><a href="#" target="_blank">Contact</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="copy">
        <div class="mainWrap clearfix">
            <div class="contact">
                Tel:2-4-3-2002018　<br>Email:524864369@jxnu.edu.cn
            </div>
        </div>
    </div>
</div>
</body>
</html>

