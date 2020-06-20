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
    <title>用户反馈</title>
    <link rel="shortcut icon" href="img/title.ico" />
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
            var $content = $("#content").val();
            var $address = $("#address").val();
            var check1 = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
            var check2 = /^[1][3,4,5,7,8][0-9]{9}$/;

            var patt1 = /^[\s]*$/;
            var patt2 = /^[0-9]+$/;
            var patt3 = /[@#\$%\^&\*]+$/;


            if (patt1.test($content) || patt2.test($content)  || patt3.test($content) ){
                alert("反馈内容格式不正确！");
                return;
            }
            if (check1.test($address) || check2.test($address)){
            }else {
                alert("联系方式格式不正确!");
                return;
            }
            if(${users.uid == null}){
                alert("请登录后进行反馈！");
                return;
            }
            if($content==""|| $content == null){
                alert("反馈内容不能为空！");
                return;
            }
            $.ajax({
                type:'post',
                url:"../feedback/addFeed.do",
                data:"&content="+$content+"&address="+$address,
                success:function (msg) {
                    if(msg == "success"){
                        alert("您的反馈已收到！")
                    }else if (msg == "already") {
                        alert("感谢您的支持！反馈每十二小时只能提交一次哦！")
                    }else {
                        alert("提交失败！");
                    }
                    window.location.href="main/feedback.jsp";
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
        <%--<a href=""><img src="img/logo.png" alt="" class="headPic1"/></a>--%>
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
    <div class="writeCon_cen">
        <br><br><br><br>
        <form class="form-horizontal" role="form" <%--action="../topic/saveTopicUser.do" --%> method="post" >
            <div class="form-group">
                <label  class="col-sm-2 control-label">用户反馈</label>
                <div class="col-sm-8">
                    <textarea type="text" rows="10" name="content" placeholder="请提出您对此网站宝贵的意见和建议" id="content" required="required" class="col-10 form-control" ></textarea>
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">联系方式</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" name="address" id="address" placeholder="可以留下您的联系方式" required="required">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                    <button type="button" class="btn btn-primary col-md-4 " id="put">提交</button>
                    <button type="reset" class="btn btn-danger col-md-4 col-md-offset-1">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
<script src="js/jquery-1.8.3.min.js"></script>