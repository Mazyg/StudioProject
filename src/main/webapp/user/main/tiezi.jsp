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
    <link rel="shortcut icon" href="img/title.ico" />
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
       <%-- <a href=""><img src="img/logo.png" alt="" class="headPic1"/></a>--%>
        <ul class="headNav">
            <li><a href="../info/findInfoBytype.do">首页</a></li>
            <li><a href="javascript:;" onClick="javascript:history.back(-1);">返回上一页</a></li>
        </ul>
        <!--未登入开始-->
        <div class="ltForm">
            <a href="../info/findPersonalMainInfo.do"><img src="img/indexForm_bg.png" alt="" class="headPic2"/></a>
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
    </div>
</header>
<div class="indexMain">
    <div class="indexMain_left">
        <div class="tzCon">
            <div class="tzCon_head">
                <div class="tzCon_head_left"><img src="${topic.user.photo}"></div>
                <div class="tzCon_head_right">
                    <h1>${topic.t_title}</h1>
                    <ul>
                        <li>发布人：${topic.uname}</li>
                        <li>发布时间：${topic.date}</li>
                        <li>浏览数：${topic.view_count}</li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
            <div class="tzCon_con">
                ${topic.content}
            </div>
            <div class="tzCon_foot">
            </div>
        </div>

        <div class="writePending">
            <div class="newPending_head">
                <div class="tzHeng"></div>
                <div class="newPending_head_tittle">评论</div>
            </div>
            <div class="writePending_con">
                <input type="text" placeholder="写下你的评论...(请不要超过50个字)"class="commentText" maxlength="50"/>
                <input type="submit" value="评论" id="postMsg"/>
            </div>
        </div>
        <div class="newPending">
            <div class="newPending_head">
                <div class="tzHeng"></div>
                <div class="newPending_head_tittle">相关回复</div>
            </div>
            <!--楼主可以删除评论、自己可以删除自己的评论删除按钮酌情出现-->
            <!--回复后的情况-->
            <c:forEach items="${dynamics}" var="dynamic">
            <div class="newPending_son">
                <div class="pendPic"><img src="${dynamic.user.photo}"></div>
                <div class="pendDetail">
                    <div class="pendDetail_head">
                        <p>${dynamic.uname} <span>${dynamic.date}</span></p>
                        <input type="text" style="display: none" id="wid" value="${dynamic.wid}">
                    </div>
                    <div class="pendDetail_con">
                        <p>${dynamic.content}</p>
                    </div>
                    <c:choose>
                        <c:when test="${empty dynamic.comments}"></c:when>
                        <c:otherwise>
                            <div class="pendDetail_replayCon">
                                <c:forEach items="${dynamic.comments}" var="comment">
                                    <p><span>${comment.uname} 回复 ${comment.rname}：${comment.content}
                                        <button class="replayBtn" id="comment">回复</button></span></p>
                                    <div class="pendDetail_action">
                                        <input type="text"  placeholder="回复${comment.uname}:(请不要超过40个字)" maxlength="40"/>
                                        <input type="text" style="display: none" value="${comment.uname}" >
                                        <input type="text" style="display: none" value="${dynamic.wid}" >
                                        <button class="replyTopic">回复</button>
                                        <button>取消</button>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <div class="pendDetail_btn">
                        <ul>
                            <li></li>
                            <li class="replayBtn">+</li>
                            <c:choose>
                                <c:when test="${dynamic.uname == users.uname}">
                                    <input type="text" style="display: none" value="${dynamic.wid}" >
                                    <li class="delateBtn">删除</li>
                                </c:when>
                                <c:otherwise></c:otherwise>
                            </c:choose>
                        </ul >
                    </div>
                    <div class="pendDetail_action">
                        <input type="text" placeholder=" 回复 ${dynamic.uname} :(请不要超过40个字)" maxlength="40" />
                        <input type="text" style="display: none" value="${dynamic.uname}" >
                        <input type="text" style="display: none" value="${dynamic.wid}" >
                        <button class="replyTopic">回复</button>
                        <button>取消</button>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            </c:forEach>
            <!--测试内容结束、十条内容分页-->
        </div>

    </div>
    <div class="indexMain_right">
        <div class="myMsg">
            <c:choose>
                <c:when test="${users == null}">
                    <div class="myMsg_con">
                        <div class="myMsg_conPic"></div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="myMsg_con">
                        <div class="myMsg_conPic"><img src="${users.photo}"></div>
                        <p id="user">${users.uname}</p>
                    </div>
                </c:otherwise>
            </c:choose>
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
        <div class="indexPublic">
            <div class="indexPublic_head">
                相关热点
            </div>
            <div class="indexPublic_con">
                <ul class="weekHot">
                    <c:forEach var="info" items="${infos}" >
                        <li><a href="../info/findInfoByTitle.do?title=${info.title}">${info.title}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
    <div class="clear">
        <input type="text" style="display: none" id="topicId" value="${topic.tid}">
        <input type="text" style="display: none" id="t_type" value="${topic.t_type}">
    </div>
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

            //评论
            $(".replyTopic").click(function () {
                var $uname = $("#user").text();
                var $tid = $("#topicId").val();
                //var $rname = $(this).prev().val();
                var $content = $(this).parent().children('input').eq(0).val();
                var $rname = $(this).parent().children('input').eq(1).val();
                var $wid = $(this).parent().children('input').eq(2).val();
                var $t_type = $("#t_type").val();

                var patt1 = /^[\s]*$/;
                var patt2 = /^[0-9]+$/;
                var patt3 = /[@#\$%\^&\*]+$/;

                var pvalue1 = patt1.test($content);
                var pvalue2 = patt2.test($content);
                var pvalue3 = patt3.test($content);


                if ($uname == "") {
                    alert("请先登录!");
                    return ;
                }
                if($content == ""){
                    alert("请输入内容!");
                    return;
                }
                if(pvalue1){
                    alert("请输入有效内容!1");
                    return;
                }
                if(pvalue2){
                    alert("请输入有效内容!2");
                    return;
                }
                if(pvalue3){
                    alert("请输入有效内容!3");
                    return;
                }
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
                            window.location.href = "../topic/findTopicById.do?tid="+$tid+"&type="+$t_type;
                        }
                    }
                });
            });

            //回复话题
            $("#postMsg").click(function () {
                var $content = $(".commentText").val();
                var $user = $("#user").text();
                var $tid = $("#topicId").val();
                var $t_type = $("#t_type").val();
                var username = "<%=session.getAttribute("users")%>"

                var patt1 = /^[\s]*$/;
                var patt2 = /^[0-9]+$/;
                var patt3 = /[@#\$%\^&\*]+$/;

                var pvalue1 = patt1.test($content);
                var pvalue2 = patt2.test($content);
                var pvalue3 = patt3.test($content);

                if ($user == "") {
                    alert("请先登录!");
                    return ;
                }
                if($content == ""){
                    alert("请输入内容!");
                    return;
                }
                if(pvalue1){
                    alert("请输入有效内容!1");
                    return;
                }
                if(pvalue2){
                    alert("请输入有效内容!2");
                    return;
                }
                if(pvalue3){
                    alert("请输入有效内容!3");
                    return;
                }

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
                            window.location.href = "../topic/findTopicById.do?tid="+$tid+"&type="+$t_type;
                        }
                    }
                });
            });

            //删除回复
            $(".delateBtn").click(function () {
                var $wid = $(this).prev().val();
                var $tid = $("#topicId").val();
                var $t_type = $("#t_type").val();
                $.ajax({
                    url:"../dynamic/deleteDynamic.do",
                    data:"wid="+$wid,
                    type:"post",
                    success:function (result) {
                        if (result == "false"){
                            alert("删除回复失败");
                        }else {
                            window.location.href = "../topic/findTopicById.do?tid="+$tid+"&type="+$t_type;
                        }
                    }
                });
            });


        });
</script>