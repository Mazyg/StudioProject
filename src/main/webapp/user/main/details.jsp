<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: grandir
  Date: 2019/11/26
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"user/";
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    Date date = new Date();
    String nowDate = sdf.format(date);
%>
<!doctype html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>详情</title>
    <link rel="shortcut icon" href="img/title.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/base_news.css" rel="stylesheet" type="text/css">
    <link href="font/font.css" rel="stylesheet" type="text/css">
    <link href="css/inner.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/slick.css">
    <script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="js/slick.min.js" type="text/javascript"></script>
    <script src="js/regexcut.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/owl.carousel.css">
    <script src="js/owl.carousel.min.js" type="text/javascript"></script>
    <script src="js/comm.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/layui.css">
    <link rel="stylesheet" href="css/editormd.min.css"/>

    <style type="text/css">
        .imgs1{
             width: 100px;
             height: 80px;
         }
        #tip{
            position: relative;
            top:20px;
            left:450px;
        }
        #tip a{
            color:white;
            font-size: 14px;
        }
        .heart {
            background: url(img/web_heart_animation.png);
            background-position: left;
            background-repeat: no-repeat;
            height: 100px;
            width: 100px;
            cursor: pointer;
            position: absolute;
            left:700px;
            background-size:2900%;
        }
        .heart:hover, .heart:focus{
            background-position: right;
        }
        @-webkit-keyframes heartBlast {
            0% {
                background-position: left;
            }
            100% {
                background-position: right;
            }
        }

        @keyframes heartBlast {
            0% {
                background-position: left;
            }
            100% {
                background-position: right;
            }
        }

        .heartAnimation {
            display: inline-block;
            -webkit-animation-name: heartBlast;
            animation-name: heartBlast;
            -webkit-animation-duration: .8s;
            animation-duration: .8s;
            -webkit-animation-iteration-count: 1;
            animation-iteration-count: 1;
            -webkit-animation-timing-function: steps(28);
            animation-timing-function: steps(28);
            background-position: right;
        }
        .likeCount{font-family: 'Georgia', Times, Times New Roman, serif; margin-top:30px;margin-left: 600px;font-size: 25px;color: #999999}
    </style>
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
<c:choose>
    <c:when test="${users == null}">
            <div id="tip">
                <a href="../manage/pages/samples/login.jsp">登录</a>&nbsp;<a>|</a>&nbsp;
                 <a href="../manage/pages/samples/register.jsp">注册</a>
            </div>
    </c:when>
    <c:otherwise></c:otherwise>
</c:choose>
        </div>
    </section>
    <nav class="navwrap yahei">
        <section class="mainWrap">
            <ul id="nav">
                <li><a href="../info/epidemic.do?page=1&numberPerPage=3&start=0&length=3">全球战疫</a>
                </li>
                <li><a href="../info/findEvent.do?page=1&numberPerPage=3&start=0&length=3">热点资讯</a>
                </li>
                <li><a href="../info/findChinese.do?page=1&numberPerPage=3&start=0&length=3">爱我中华</a>
                    <%--<ul>
                        <li><a href="#">最美中国景</a></li>
                        <li><a href="#">最美中国人</a></li>
                        <li><a href="#">最美中国事</a></li>
                    </ul>--%>
                </li>
                <li><a href="../info/findPersonInfo.do" class="">榜样力量</a>
                </li>
                <li><a href="../topic/showTopic.do" class="">话题</a>
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
            <br>
            <h2 class="dh2">${infos.title}</h2>
            <br><br><br>
            <span class="siz">${infos.content}</span>
<%--            点赞--%>
            <div class="heart " id="like1" rel="like"></div> <div class="likeCount" id="likeCount1">${result}</div>
            <br/>
            <div style="margin:0 4% 0 4%;">
                <br/>
                <!-- 留言的表单 -->
                <form class="layui-form" action="../info/saveWords.do" method="post">
                    <input name="lw_name" value="${users.uname}" hidden="hidden"/>
                    <input name="lw_date" value="<%=nowDate%>" hidden="hidden"/>
                    <input name="lw_for_article_id" value="${article.info_id}" hidden="hidden"/>
                    <div class="layui-input-block" style="margin-left: 0;">
                        <textarea id="lw_content" name="lw_content" placeholder="请输入你的留言" class="layui-textarea" style="height: 150px;"></textarea>
                    </div>
                    <br/>
                    <div class="layui-input-block" style="text-align: left;margin-left: 0;">
                        <input type="submit" class="layui-btn" value="留言">
                    </div>
                </form>
                <br/>
                <!-- 留言信息列表展示 -->
                <div>
                    <ul>
                        <!-- 先遍历留言信息（一条留言信息，下面的全是回复信息） -->
                        <c:forEach items="${requestScope.lw_list}" var="words">
                            <!-- 如果留言信息是在本文章下的才显示 -->
                            <c:if test="${words.lw_for_article_id eq article.info_id}">
                                <li style="border-top: 1px dotted #01AAED">
                                    <br/>
                                    <div style="text-align: left;color:#444">
                                        <div>
                                            <span style="color:#01AAED">${words.lw_name}</span>
                                        </div>
                                        <div>${words.lw_content}</div>
                                    </div>
                                    <div>
                                        <div class="comment-parent" style="text-align:left;margin-top:7px;color:#444">
                                            <span>${words.lw_date}</span>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <p>
                                                <a href="javascript:;" style="text-decoration: none;" onclick="btnReplyClick(this)">回复</a>
                                            </p>
                                            <hr style="margin-top: 7px;"/>
                                        </div>
                                        <!-- 回复表单默认隐藏 -->
                                        <div class="replycontainer layui-hide" style="margin-left: 61px;">
                                            <form action="../info/saveReply.do" method="post" class="layui-form">
                                                <input name="lr_for_article_id" id="lr_for_article_id" value="${article.info_id}" hidden="hidden"/>
                                                <input name="lr_name" id="lr_name" value="${users.uname}" hidden="hidden"/>
                                                <input name="lr_date" id="lr_date" value="<%=nowDate%>" hidden="hidden"/>
                                                <input name="lr_for_name" id="lr_for_name" value="${words.lw_name}" hidden="hidden"/>
                                                <input name="lr_for_words" id="lr_for_words" value="${words.lw_id}" hidden="hidden"/>
                                                <input name="lr_for_reply" id="lr_for_reply" value="${reply.lr_id}" hidden="hidden"/>
                                                <div class="layui-form-item">
                                                    <textarea name="lr_content" id="lr_content" lay-verify="replyContent" placeholder="请输入回复内容" class="layui-textarea" style="min-height:80px;"></textarea>
                                                </div>
                                                <div class="layui-form-item">
                                                    <button id="replyBtn" class="layui-btn layui-btn-mini" lay-submit="formReply" lay-filter="formReply">提交</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                    <!-- 以下是回复信息 -->
                                    <c:forEach items="${requestScope.lr_list}" var="reply">
                                        <!-- 每次遍历出来的留言下存在回复信息才展示（本条回复信息是本条留言下的就显示在当前留言下） -->
                                        <c:if test="${reply.lr_for_article_id eq article.info_id && reply.lr_for_words eq words.lw_id}">
                                            <div style="text-align: left;margin-left:61px;color: #444">
                                                <div>
                                                    <span style="color:#5FB878">${reply.lr_name}&nbsp;&nbsp;</span>
                                                </div>
                                                <div>@${reply.lr_for_name}:&nbsp;&nbsp; ${reply.lr_content}</div>
                                            </div>
                                            <div>
                                                <div class="comment-parent" style="text-align:left;margin-top:7px;margin-left:61px;color:#444">
                                                    <span>${reply.lr_date}</span>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <p>
                                                        <a href="javascript:;" style="text-decoration: none;" onclick="btnReplyClick(this)">回复</a>
                                                    </p>
                                                    <hr style="margin-top: 7px;"/>
                                                </div>
                                                <!-- 回复表单默认隐藏 -->
                                                <div class="replycontainer layui-hide" style="margin-left: 61px;">
                                                    <form action="../info/saveReply.do" method="post" class="layui-form">
                                                        <input name="lr_for_article_id" id="lr_for_article_id" value="${article.info_id}" hidden="hidden"/>
                                                        <input name="lr_name" id="lr_name" value="${users.uname}" hidden="hidden"/>
                                                        <input name="lr_date" id="lr_date" value="<%=nowDate%>" hidden="hidden"/>
                                                        <input name="lr_for_name" id="lr_for_name" value="${words.lw_name}" hidden="hidden"/>
                                                        <input name="lr_for_words" id="lr_for_words" value="${words.lw_id}" hidden="hidden"/>
                                                        <input name="lr_for_reply" id="lr_for_reply" value="${reply.lr_id}" hidden="hidden"/>
                                                        <div class="layui-form-item">
                                                    <textarea name="lr_content" id="lr_content" lay-verify="replyContent" placeholder="请输入回复内容" class="layui-textarea" style="min-height:80px;">
                                                      @${words.lw_name}:&nbsp;&nbsp;
                                                  </textarea>
                                                        </div>
                                                        <div class="layui-form-item">
                                                            <button id="replyBtn" class="layui-btn layui-btn-mini" lay-submit="formReply" lay-filter="formReply">提交</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
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
                            <td><a href="../info/findByIdInfo.do?infoId=${videoList.info_id}&uid=${users.uid}"><img class="imgs1" src="${videoList.photo}"></a></td>
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
        </section>
    </div>
</div>
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/layui.js"></script>
<!-- Markdwon富文本 -->
<script src="js/marked.min.js"></script>
<script src="js/prettify.min.js"></script>
<script src="js/raphael.min.js"></script>
<script src="js/underscore.min.js"></script>
<script src="js/sequence-diagram.min.js"></script>
<script src="js/flowchart.min.js"></script>
<script src="js/jquery.flowchart.min.js"></script>
<script src="js/editormd.min.js"></script>
<%--<script src="js/jquery-1.11.0.min.js"></script>--%>
<script>
    $(document).ready(function()
    {

        var color='<%=request.getSession().getAttribute("color")%>';
        if(color=="like"){
            $(".heart").addClass("heartAnimation");
        }
        else {
            $(".heart").removeClass("heartAnimation");
        }
        $('body').on("click",'.heart',function()
        {
            var uid='<%=request.getSession().getAttribute("uid")%>';
            // alert(uid);
            if(uid=="null"){
               alert("请先去登录！");
            }
            else{
                var A=$(this).attr("id");
                var B=A.split("like");
                var messageID=B[1];
                $(this).css("background-position","")
                var D=$(this).attr("rel");
                if(D=== 'like')
                {
                    $(this).addClass("heartAnimation").attr("rel","unlike");

                }
                else
                {
                    $(this).removeClass("heartAnimation").attr("rel","like");
                    $(this).css("background-position","left");
                }

                window.location.href="../info/niceDetail.do"
             }
        });


    });
</script>
<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
<!-- Markdown富文本 -->
<script type="text/javascript">
    var markdown;
    $(function(){
        markdown = editormd.markdownToHTML('content',{
            htmlDecode: "style,script,iframe",
            syncScrolling: 'single',
            emoji: true,
            taskList: true,
            tex: true,
            flowChart: true,
            sequenceDiagram: true,
            codeFold: true
        });
    });
</script>
<script type="text/javascript">
    function btnReplyClick(elem) {
        var $ = layui.jquery;
        if($(this)){
        }else if(!$(this)){
            $(elem).parent('p').parent('.comment-parent').siblings('.replycontainer').toggleClass('layui-show');
        }
        $(elem).parent('p').parent('.comment-parent').siblings('.replycontainer').toggleClass('layui-hide');
        if ($(elem).text() == '回复') {
            $(elem).text('收起')
        } else {
            $(elem).text('回复')
        }
    }
    $("#replyBtn").click(function(){
        var lr_for_article_id = $("#lr_for_article_id").val();
        var lr_name = $("#lr_name").val();
        var lr_date = $("#lr_date").val();
        var lr_for_name = $("#lr_for_name").val();
        var lr_content = $("#lr_content").val();
        var lr_for_words = $("#lr_for_words").val();
        $.ajax({
            url: '../info/saveWords.do',
            type: 'POST',
            data: [{
                lr_for_article_id: lr_for_article_id,
                lr_name: lr_name,
                lr_date: lr_date,
                lr_for_name: lr_for_name,
                lr_content: lr_content,
                lr_for_words: lr_for_words
            }],
            success: function(data){
                layer.open({
                    title: '提示信息',
                    content: '留言成功',
                    btn: ['确定'],
                    btn1: function(index){
                        $("body").html(data);
                    }
                });
            },
            error: function(){
                layer.open({
                    title: '提示信息',
                    content: '出现未知错误'
                });
            }
        });
    });
</script>
</html>

