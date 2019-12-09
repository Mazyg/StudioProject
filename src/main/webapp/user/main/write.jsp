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
    <title>发表帖子</title>
    <link rel="stylesheet" href="css/reset.css"/>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/write.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
    body{
        background: url(img/bg_02.jpg);
    }
</style>
<script type="text/javascript">
    function msssage () {
        var top = "${top}";
        if( top == "true"){
            alert("审核通过后，您的话题将会被发布！");
        }else
        if( top == "false"){
            alert("请登录后发布话题！");
        }
    }
</script>
<body onload="msssage()">
<header class="ltHead">
    <div class="ltHead_cen">
        <a href=""><img src="img/logo.png" alt="" class="headPic1"/></a>
        <ul class="headNav">
            <li><a href="">首页</a></li>
            <li><a href="">沪牌竞拍</a></li>
            <li><a href="">拍王助手</a></li>
            <li><a href="">深圳竞价摇号</a></li>
            <li><a href="">广州竞价摇号</a></li>
            <li><a href="">杭州竞价摇号</a></li>
            <li><a href="">天津竞价摇号</a></li>
            <li><a href="">增值服务</a></li>
        </ul>
        <!--未登入开始-->
        <!--<div class="ltForm">-->
            <!--<a href=""><img src="img/indexForm_bg.png" alt="" class="headPic2"/></a>-->
            <!--<ul>-->
                <!--<li><a href="">登入</a></li>-->
                <!--<li><a href="">注册</a></li>-->
            <!--</ul>-->
        <!--</div>-->
        <!-- 未登入结束-->
        <!-- 登入开始，未登入时以下隐藏-->
        <c:if test="${users.uid == null}">
            <div class="ltForm">
                <ul>
                    <li><a href="../manage/pages/samples/login.jsp">登录</a></li>
                    <li><a href="../manage/pages/samples/register.jsp">注册</a></li>
                </ul>
            </div>
        </c:if>
        <c:if test="${users.uid != null}">
        <div class="lt_login">
        <ul>
        <li><a href="">${users.uname}</a></li>
        <li><a href="">退出</a></li>
        </ul>
        </div>
        </c:if>
        <!-- 登入结束-->
    </div>
</header>
<div class="writeCon">
    <div class="writeCon_head">
        <p>发新帖</p>
    </div>
    <div class="writeCon_cen">
        <br><br><br><br>
        <form class="form-horizontal" role="form" action="../topic/saveTopicUser.do"  method="post" >
            <div class="form-group">
                <label  class="col-sm-2 control-label">话题标题</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="t_title" placeholder="请输入标题" required="required">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">概述</label>
                <div class="col-sm-8">
                    <textarea type="text" rows="10" name="content" placeholder="请描述话题"  required="required" class="col-10 form-control" ></textarea>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">话题类别</label>
                <input type="hidden" id ="selectRefundReason" value="{t_type}"/>
                <div class="col-sm-8">
                    <select class="form-control" name="t_type" <%--value="${users.sex}"--%>>
                        <option value="榜样的力量" <%--<c:if test="${'男'.equals(users.sex)}">selected</c:if>--%>>榜样的力量</option>
                        <option value="热点时事" <%--<c:if test="${'女'.equals(users.sex)}">selected</c:if>--%>>热点时事</option>
                        <option value="电影" <%--<c:if test="${'女'.equals(users.sex)}">selected</c:if>--%>>电影</option>
                        <option value="书籍" <%--<c:if test="${'女'.equals(users.sex)}">selected</c:if>--%>>书籍</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                    <button type="submit" class="btn btn-primary col-md-4 ">发表</button>
                    <button type="reset" class="btn btn-danger col-md-4 col-md-offset-1">重置</button>
                </div>
            </div>
        </form>
        <%--div class="writeMsg">
            <input type="text" placeholder="请输入标题"/>
        </div>--%>
        <%--<div class="chooseDevide">
            <div class="chooseDevide_left">
                所在分类
            </div>
            &lt;%&ndash;<div class="chooseDevide_right">
                <div class="nice-select" name="nice-select">
                    <input type="text" value="请选择">
                    <ul>
                        <li class="click" data-val="">沪牌竞拍</li>
                        <li class="click" data-val="">拍王助手</li>
                        <li class="click" data-val="">深圳竞价摇号</li>
                        <li class="click" data-val="">广州竞价摇号</li>
                        <li class="click" data-val="">杭州竞价摇号</li>
                        <li class="click" data-val="">天津竞价摇号</li>
                        <li class="click" data-val="">增值服务</li>
                    </ul>
                </div>
            </div>&ndash;%&gt;
        </div>--%>
    <%--    <div class="writeDown"></div>--%>
       <%-- <input type="submit" class="reform" value="发布"/>--%>

<%--</div>--%>
</body>
</html>
<script src="js/jquery-1.8.3.min.js"></script>
<%--script>
    $('[name="nice-select"]').click(function(e){
        $('[name="nice-select"]').find('ul').hide();
        $(this).find('ul').show();
        e.stopPropagation();
    });
    $('[name="nice-select"] li').hover(function(e){
        $(this).toggleClass('on');
        e.stopPropagation();
    });
    $('[name="nice-select"] li').click(function(e){
        var val = $(this).text();
        var dataVal = $(this).attr("data-value");
        $(this).parents('[name="nice-select"]').find('input').val(val);
        $('[name="nice-select"] ul').hide();
        e.stopPropagation();
    });
    $(document).click(function(){
        $('[name="nice-select"] ul').hide();
    });
</script>--%>