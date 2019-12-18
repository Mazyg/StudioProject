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
    <title>发起话题</title>
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

    $(function () {
        $("#put").click(function () {
            var $t_title = $("#title").val();
            var $content = $("#content").val();
            var $type = $("#type").val();
            if(${users.uid == null}){
                alert("请登录后发布话题！");
                return;
            }
            if($t_title==""|| $t_title == null){
                alert("标题不能为空！");
                return;
            }
            $.ajax({
                type:'post',
                url:"../topic/saveTopicUser.do",
                data:"t_title="+$t_title+"&content="+$content+"&t_type="+$type,
                success:function (msg) {
                    if(msg === "success"){
                        alert("审核通过后，您的话题将会被发布！")
                    }else{
                        alert("发布失败！")
                    }
                    window.location.href="main/write.jsp";
                },
                error:function () {
                    alert("出错了！")
                }
            })
        })
    })
</script>
<body onload="msssage()">
<header class="ltHead">
    <div class="ltHead_cen">
        <a href=""><img src="img/logo.png" alt="" class="headPic1"/></a>
        <ul class="headNav">
            <li><a href="../info/findInfoBytype.do">首页</a></li>
            <li><a href="javascript:;" onClick="javascript:history.back(-1);">返回上一页</a></li>
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
        <li><a href="../user/exitLogin.do">退出</a></li>
        </ul>
        </div>
        </c:if>
        <!-- 登入结束-->
    </div>
</header>
<div class="writeCon">
    <div class="writeCon_head">
        <p>发新话题</p>
    </div>
    <div class="writeCon_cen">
        <br><br><br><br>
        <form class="form-horizontal" role="form" <%--action="../topic/saveTopicUser.do" --%> method="post" >
            <div class="form-group">
                <label  class="col-sm-2 control-label">话题标题</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="t_title" id="title" placeholder="请输入标题" required="required">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">概述</label>
                <div class="col-sm-8">
                    <textarea type="text" rows="10" name="content" placeholder="请描述话题" id="content" required="required" class="col-10 form-control" ></textarea>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">话题类别</label>
                <input type="hidden" id ="selectRefundReason" value="{t_type}"/>
                <div class="col-sm-8">
                    <select class="form-control" name="t_type" <%--value="${users.sex}"--%> id="type">
                        <option value="榜样的力量" <%--<c:if test="${'男'.equals(users.sex)}">selected</c:if>--%>>榜样的力量</option>
                        <option value="热点时事" <%--<c:if test="${'女'.equals(users.sex)}">selected</c:if>--%>>热点时事</option>
                        <option value="电影" <%--<c:if test="${'女'.equals(users.sex)}">selected</c:if>--%>>电影</option>
                        <option value="书籍" <%--<c:if test="${'女'.equals(users.sex)}">selected</c:if>--%>>书籍</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                    <button type="button" class="btn btn-primary col-md-4 " id="put">发表</button>
                    <button type="reset" class="btn btn-danger col-md-4 col-md-offset-1">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
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