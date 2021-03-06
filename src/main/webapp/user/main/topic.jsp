<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"user/";
%>
<html>
<head lang="en">
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>论坛首页</title>
    <link rel="shortcut icon" href="img/title.ico" />
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/topic.css"/>
    <link href="css/base_news.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/jump.js"></script>
    <style type="text/css">
        body{
            background: url("img/bg_02.jpg");
        }
    </style>
</head>
<body>
<header class="ltHead">
    <div class="ltHead_cen">
        <nav class="navwrap yahei">
            <section class="mainWrap">
                <ul id="nav">
                    <li><a href="../info/epidemic.do">全球战疫</a>
                    </li>
                    <li><a href="../info/findEvent.do">热点时事</a>
                    </li>
                    <li><a href="../info/findChinese.do">爱我中华</a>
                    </li>
                    <li><a href="../info/findPersonInfo.do" >榜样力量</a>
                    </li>
                    <li><a href="../topic/showTopic.do" >话题</a>
                    </li>

                    <li><a href="../info/findBooks.do">书籍</a></li>
                    <li><a href="../info/findMovies.do">电影</a></li>

                    <c:if test="${users.uname!=null}">
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
                    </c:if>
                </ul>
            </section>
        </nav>
        <!--未登入开始-->
        <div class="ltForm appear">
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
        <div class="navFix">
            <a class="navMe">${users.uname}</a>
            <a href="main/write.jsp" class="navWrite">发起话题</a>
        </div>
    </div>
</header>
<div class="indexMain">
    <div class="indexMain_left">
        <div class="indexMain_left_btn">
            <ul>
                <li><a href="../topic/showTopic.do?viewType=new "  class="on">最新</a></li>
                <li><a href="../topic/showTopic.do?viewType=hot "  class="on">最热</a></li>
            </ul>
        </div>
        <div class="indexMain_left_con">
            <!--有主题图循环开始-->
            <c:forEach items="${pageInfo.list}" var="topic">
            <div class="indexCon_msg">
                <div class="indexCon_msg_pic"><img src="${topic.user.photo}"></div>
                <div class="indexCon_msg_detail">
                    <a href="../topic/findTopicById.do?tid=${topic.tid}&type=${topic.t_type}">
                        <div class="indexCon_msg_detail_tittle">
                            <span>${topic.t_type}</span>
                            <p>${topic.t_title}</p>
                        </div>
                    </a>
                    <div class="indexCon_msg_detail_other">
                        <ul>
                            <li>作者：${topic.uname}</li>
                            <li>发布时间：${topic.date}</li>
                            <li>浏览数：${topic.view_count}</li>
                        </ul>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            </c:forEach>
        </div>

        <div class="indexFooter">
            <div class="pager">
                <!-- 上一页 按钮 -->
                <c:choose>
                    <c:when test="${pageInfo.pageNum>1}">
                        <a href="../topic/showTopic.do?pageNum=${pageInfo.prePage}" rel="external nofollow" ><<</a>
                    </c:when>
                    <c:otherwise>
                        <a><<</a>
                    </c:otherwise>
                </c:choose>

                <!-- 页数列表 -->
                <c:forEach items="${pageInfo.navigatepageNums}" var="page">

                    <a href="../topic/showTopic.do?pageNum=${page}" rel="external nofollow" rel="external nofollow" rel="external nofollow" class="currentPage">${page}</a>

                </c:forEach>

                <!-- 下一页 按钮 -->
                <c:choose>
                    <c:when test="${pageInfo.hasNextPage}">
                        <a href="../topic/showTopic.do?pageNum=${pageInfo.nextPage}" rel="external nofollow">
                            >>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a>>></a>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </div>



    <div class="indexMain_right">
        <div class="indexMain_rightCon">
            <a href="main/write.jsp " class="newMsg" style="color: white">发起话题</a>
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
                                <ul class="nav nav-pills" role="tablist">
                                    <li role="presentation"><a href="../topic/findByUid.do?uid="+${users.uid}">话题数<span class="badge"><h4>${topicCount}</h4></span></a></li>
                                    <li role="presentation"><a href="../dynamic/findAllCommentByName.do?uname=${users.uname}">消息数<span class="badge"><h4>${commentCount}</h4></span></a></li>
                                </ul>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
               <%-- <div class="indexSearch">
                    <input type="text" placeholder="请输入关键词"/>
                    <input type="submit" value="搜索"/>
                </div>--%>
                <div class="indexPublic">
                    <div class="indexPublic_head">
                        本周热议
                    </div>
                    <div class="indexPublic_con">
                        <ul class="weekHot">
                            <c:forEach items="${topTopics}" var="topTopic">
                                <li><a href="../topic/findTopicById.do?tid=${topTopic.tid}&type=${topTopic.t_type}">${topTopic.t_title}</a></li>
                            </c:forEach>
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
</div>
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