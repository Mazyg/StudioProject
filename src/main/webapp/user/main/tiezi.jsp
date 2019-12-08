<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"user/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>帖子</title>
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
        <div class="ltForm">
            <a href=""><img src="img/indexForm_bg.png" alt="" class="headPic2"/></a>
            <ul>
                <li><a href="">登入</a></li>
                <li><a href="">注册</a></li>
            </ul>
        </div>
        <!-- 未登入结束-->
        <!-- 登入开始，未登入时以下隐藏-->
        <!--<div class="lt_login">-->
        <!--<ul>-->
        <!--<li><a href="">花开花落</a></li>-->
        <!--<li><a href="">退出</a></li>-->
        <!--</ul>-->
        <!--</div>-->
        <!-- 登入结束-->
    </div>
</header>
<div class="indexMain">
    <div class="indexMain_left">
        <div class="tzCon">
            <div class="tzCon_head">
                <div class="tzCon_head_left"></div>
                <div class="tzCon_head_right">
                    <h1>${topic.t_title}</h1>
                    <ul>
                        <li>${topic.uname}</li>
                        <li>${topic.date}</li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
            <div class="tzCon_con">
                ${topic.content}
            </div>
            <div class="tzCon_foot">
                <div class="tzCollect">
                    <div class="tzCollect_left">收藏</div>
                    <div class="tzCollect_right">131</div>
                </div>
            </div>
        </div>
        <div class="newPending">
            <div class="newPending_head">
                <div class="tzHeng"></div>
                <div class="newPending_head_tittle">最新回复(52)</div>
            </div>
            <!--楼主可以删除评论、自己可以删除自己的评论删除按钮酌情出现-->
            <!--回复后的情况-->
            <c:forEach items="${dynamics}" var="dynamic">
            <div class="newPending_son">
                <div class="pendPic"></div>
                <div class="pendDetail">
                    <div class="pendDetail_head">
                        <p>${dynamic.uname} <span>${dynamic.date}</span></p>
                        <input type="text" style="display: none" id="wid" value="${dynamic.wid}">
                    </div>
                    <div class="pendDetail_con">
                        <p>${dynamic.content}</p>
                    </div>
                    <c:choose>
                        <c:when test="${dynamic.comments == null}"></c:when>
                        <c:otherwise>
                            <div class="pendDetail_replayCon">
                                <c:forEach items="${dynamic.comments}" var="comment">
                                    <p><span>${comment.uname} 回复 ${comment.rname}：${comment.content}
                                        <button class="replayBtn" id="comment">回复</button></span></p>
                                    <div class="pendDetail_action">
                                        <input type="text" placeholder="回复${comment.uname}:"/>
                                        <button onclick="postMessage()">回复</button>
                                        <button>取消</button>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <div class="pendDetail_btn">
                        <ul>
                            <li>361</li>
                            <li class="replayBtn">278</li>
                            <li class="delateBtn">删除</li>
                        </ul >
                    </div>
                    <div class="pendDetail_action">
                        <input type="text" placeholder=" 回复 ${dynamic.uname} :" id="content"/>
                        <input type="text" style="display: none" id="postPeople" value="${dynamic.uname}">
                        <button id="replyTopic">回复</button>
                        <button>取消</button>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            </c:forEach>
            <!--测试内容结束、十条内容分页-->
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
        <div class="writePending">
            <div class="newPending_head">
                <div class="tzHeng"></div>
                <div class="newPending_head_tittle">评论</div>
            </div>
            <div class="writePending_con">
                <input type="text" placeholder="写下你的评论..." class="commentText"/>
                <input type="submit" value="评论" id="postMsg"/>
            </div>
        </div>
    </div>
    <div class="indexMain_right">
        <div class="myMsg">
            <div class="myMsg_con">
                <div class="myMsg_conPic"></div>
                <p id="user">${users.uname}</p>
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
        <div class="indexPublic">
            <div class="indexPublic_head">
                本周热议
            </div>
            <div class="indexPublic_con">
                <ul class="weekHot">
                    <li><a href="">${topic.t_title}</a><span>29</span></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="clear"><input type="text" style="display: none" id="topicId" value="${topic.tid}"></div>
</div>
<footer class="publicFooter">
    <p></p>
</footer>
</body>
</html>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/tiezi.js"></script>
<script>
        $(function () {
            $("#replyTopic").click(function () {
                var $uname = $("#user").text();
                var $rname = $("#postPeople").val();
                var $content = $("#content").val();
                var $wid = $("#wid").val();
                var $tid = $("#topicId").val();
                $.ajax({
                    url:"../comment/saveComment.do",
                    contentType:"application/json;charset=UTF-8",
                    data:JSON.stringify({"content":$content,"uname":$uname,"rname":$rname,"wid":$wid}),
                    dataType:"json",
                    type:"post",
                    success:function (data) {
                        if (data == null){
                            alert("回复失败")
                        }else {
                            window.location.href = "../topic/findTopicById.do?tid="+$tid;
                        }
                    }
                });
            });
            $("#postMsg").click(function () {
                var $content = $(".commentText").val();
                var $user = $("#user").text();
                var $tid = $("#topicId").val();
                $.ajax({
                    url:"../dynamic/saveDynamic.do",
                    contentType:"application/json;charset=UTF-8",
                    data:JSON.stringify({"content":$content,"uname":$user,"tid":$tid}),
                    dataType:"json",
                    type:"post",
                    success:function (data) {
                        if (data == null){
                            alert("评论失败")
                        }else {
                            window.location.href = "../topic/findTopicById.do?tid="+$tid;
                        }
                    }
                });
            });
        });
</script>