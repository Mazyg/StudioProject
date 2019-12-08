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
</head>
<body>
<header class="ltHead">
    <div class="ltHead_cen">
        <a href=""><img src="img/logo.png" alt="" class="headPic1"/></a>
        <ul class="headNav">
            <li><a href="">首页</a></li>
        </ul>
        <!--未登入开始-->
        <div class="ltForm appear">
            <a href=""><img src="img/indexForm_bg.png" alt="" class="headPic2"/></a>
            <ul>
                <li><a href="">登入</a></li>
                <li><a href="">注册</a></li>
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
            <a href="" class="navMe">花花</a>
            <!--登入结束-->
            <!--未登入开始-->
            <!--<a href="" class="navLogin">登录</a>-->
            <!--未登入结束-->
            <a href="" class="navWrite">发新帖</a>
        </div>
    </div>
</header>
<div class="indexMain">
    <div class="indexMain_left">
        <div class="indexMain_left_btn">
            <ul>
                <li><a href="javascript:">置顶</a></li>
                <li><a href="javascript:" class="on">最新</a></li>
            </ul>
        </div>
        <div class="indexMain_left_con">
            <!--有主题图循环开始-->
            <c:forEach items="${topics}" var="topic">
            <div class="indexCon_msg">
                <div class="indexCon_msg_pic"></div>
                <div class="indexCon_msg_detail">
                    <a href="../topic/findTopicById.do?tid=${topic.tid}">
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
            <a href="" class="newMsg">发新帖</a>
            <div class="pwfb">
                <div class="pwfbHead">
                    拍王发布
                </div>
                <div class="pwfbCon"></div>
                <div class="pwfbFooter"></div>
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