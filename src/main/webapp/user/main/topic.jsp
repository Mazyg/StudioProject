<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"user/";
%>
<html>
<head lang="en">
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>论坛首页</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/topic.css"/>
    <style type="text/css">
        body{
            background: url("img/bg_02.jpg");
        }
    </style>
</head>
<body>
<header class="ltHead">
    <div class="ltHead_cen">
        <a href=""><img src="img/logo.png" alt="" class="headPic1"/></a>
        <ul class="headNav">
            <li><a href="../info/findInfoBytype.do">首页</a></li>
        </ul>
        <!--未登入开始-->
        <div class="ltForm appear">
            <a href=""><img src="img/indexForm_bg.png" alt="" class="headPic2"/></a>
            <ul>
                <c:choose>
                    <c:when test="${users == null}">
                        <li><a href="../manage/pages/samples/login.jsp">登录</a></li>
                        <li><a href="../manage/pages/samples/register.jsp">注册</a></li>
                    </c:when>
                    <c:otherwise></c:otherwise>
                </c:choose>
            </ul>
        </div>
        <!-- 未登入结束-->
        <!-- 登入开始，未登入时以下隐藏-->
        <!--<div class="lt_login appear">-->
        <!--<ul>-->
        <!--<li><a href="">花开花落</a></li>-->
        <!--<li><a href="">退出</a></li>-->
        <!--</ul>-->
        <!--</div>-->
        <!-- 登入结束-->
        <div class="navFix">
            <!--登入开始-->
            <a class="navMe">${users.uname}</a>
            <!--登入结束-->
            <!--未登入开始-->
            <!--<a href="" class="navLogin">登录</a>-->
            <!--未登入结束-->
            <a href="main/write.jsp" class="navWrite">发新帖</a>
        </div>
    </div>
</header>
<div class="indexMain">
    <div class="indexMain_left">
        <div class="indexMain_left_btn">
            <ul>
                <li><a href="javascript:" class="on">最新</a></li>
            </ul>
        </div>
        <div class="indexMain_left_con">
            <!--有主题图循环开始-->
            <c:forEach items="${topics}" var="topic">
            <div class="indexCon_msg">
                <div class="indexCon_msg_pic"><img src="${topic.user.photo}"></div>
                <div class="indexCon_msg_detail">
                    <a href="../topic/findTopicById.do?tid=${topic.tid}&type=${topic.t_type}">
                        <div class="indexCon_msg_detail_tittle">
                            <span>${topic.t_type}</span>
                            <p>${topic.content}</p>
                        </div>
                    </a>
                    <div class="indexCon_msg_detail_other">
                        <ul>
                            <li>${topic.uname}</li>
                            <li>${topic.date}</li>
                            <li>21</li>
                            <li>28</li>
                        </ul>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            </c:forEach>
        </div>
        <div class="indexFooter">
            <div class="indexFooter_con">
                <a href="javascript:"><</a>
                <a href="" class="on">1</a>
                <a href="">2</a>
                <a href="">3</a>
                <a href="javascript:">></a>
            </div>
        </div>
    </div>
    <div class="indexMain_right">
        <div class="indexMain_rightCon">
            <a href="main/write.jsp " class="newMsg">发新帖</a>
            <div class="indexMain_right">
                <div class="myMsg">
                    <div class="myMsg_con">
                        <c:choose>
                            <c:when test="${users.uname==null}">
                                <div class="myMsg_conPic"></div>
                                <p>未登录</p>
                            </c:when>
                            <c:otherwise>
                                <div class="myMsg_conPic"><img src="${users.photo}"></div>
                                <p id="user">${users.uname}</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <c:choose>
                        <c:when test="${users == null}"></c:when>
                        <c:otherwise>
                            <div  class="myMsg_footer">
                                <ul>
                                    <li><a href="">
                                        <p>主题数</p>
                                        <p>23</p>
                                    </a></li>
                                    <li><a href="">
                                        <p>精华数</p>
                                        <p>23</p>
                                    </a></li>
                                    <li><a href="">
                                        <p>注册排名</p>
                                        <p>23</p>
                                    </a></li>
                                </ul>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            <div class="indexSearch">
                <input type="text" placeholder="请输入关键词"/>
                <input type="submit" value="搜索"/>
            </div>
            <div class="indexPublic">
                <div class="indexPublic_head">
                    本周热议
                </div>
                <div class="indexPublic_con">
                    <ul class="weekHot">
                        <li><a href="">本周热议</a><span>29</span></li>

                    </ul>
                </div>
            </div>
            <div class="indexPublic">
                <div class="indexPublic_head">
                    友情链接
                </div>
                <div class="indexPublic_con">
                    <ul class="indexLink">
                        <li><a href=""></a></li>
                        <li><a href=""></a></li>
                        <li><a href=""></a></li>
                        <li><a href=""></a></li>
                        <li><a href=""></a></li>
                        <li><a href=""></a></li>
                        <li><a href=""></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<footer class="publicFooter">
    <p></p>
</footer>
</body>
</html>
<script src="js/jquery-1.8.3.min.js"></script>
<script>
    $(".indexMain_left_btn li a").click(function(){
        $(".indexMain_left_btn li a").removeClass("on");
        $(this).addClass("on");
    });
    window.onscroll=function(){
        var scrolls=document.body.scrollTop||document.documentElement.scrollTop;
        var slided=60;
        if(scrolls>=slided){
            $(".appear").hide();
            $(".navFix").show();
            $(".ltHead").addClass("navTop");
        }else{
            $(".appear").show();
            $(".navFix").hide();
            $(".ltHead").removeClass("navTop");
        }
    };
</script>