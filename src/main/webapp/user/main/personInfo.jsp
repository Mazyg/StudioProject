<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User:MN
  Date: 2019/11/26
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"user/";
%>
<!doctype html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>个人中心</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/base_news.css" rel="stylesheet" type="text/css">
    <link href="font/font.css" rel="stylesheet" type="text/css">
    <link href="css/inner.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/slick.css">
    <script src="js/slick.min.js" type="text/javascript"></script>
    <script src="js/regexcut.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/owl.carousel.css">
    <script src="js/owl.carousel.min.js" type="text/javascript"></script>
    <script src="js/comm.js" type="text/javascript"></script>
    <script src="publish/thunews/js/regex-cn.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
    body{
        background: url(img/bg_02.jpg);
    }
    .back{
        background: url(img/bg32.jpg);
        border-radius: 1%;
        height: 240px;
    }
    .imgs{
        border-radius: 50%;
        width: 70px;
        height: 70px;
    }
    /*.back1{
        background-color: white;
    }*/

    /*.back2{
        background-color: white;
        border-radius: 1%;
    }*/
    .img1{
        width: 20%;
        width: 200px;
    }
</style>
<script type="text/javascript">
    function message() {

        var mes = ${user3};
        alert(mes)
        if(mes == true){
            alert("修改成功！")
        }else
            if(mes == false){
                alert("出错了！")
            }
    }
window.onload = function () {
   $("#sex").val('${users.sex}')
}
    function getImage() {
        var obj = new FormData();
        var file = document.getElementById("photo").files[0];
        obj.append("file", file);
        $.ajax({
            url : '../load/getImageUrl.do',
            type : 'POST',
            data : obj,
            contentType : false,
            processData : false,
            mimeType : 'multipart/form-data',
            success : function(data) {
                $("#url").val(data) ;
            }
        })

    }
</script>
<body onload="message()">
<header class="clearfix">
    <%--<section class="mainWrap">
        <div class="topwraper relative clearfix">
            <div class="search">
                <form id="searchForm" target="_blank">
                    <input name="query" type="text" >
                    <input name="ie" type="hidden" value="utf8">
                    <input name="cid" type="hidden" value="3">
                    <a href="javascript:;" onclick="searchSub();"><i>搜索</i></a>
                </form>
            </div>
        </div>
    </section>--%>
    <nav class="navwrap yahei">
        <section class="mainWrap">
            <ul id="nav">
                <li><a href="main/news.jsp">热点资讯</a>
                </li>
                <li><a href="#">爱我中华</a>
                    <ul>
                        <li><a href="#">最美中国景</a></li>
                        <li><a href="#">最美中国人</a></li>
                        <li><a href="#">最美中国事</a></li>
                    </ul>
                </li>
                <li><a href="#" class="">榜样力量</a>
                    <ul>
                        <li><a href="javascript:void(0)" onclick="window.location.hash='ab'">新时代楷模</a></li>
                        <li><a href="javascript:void(0)" onclick="window.location.hash = 'aa'">身边榜样</a></li>
                        <li><a href="#">最美奋斗者</a></li>
                        <li><a href="#">道德模范</a></li>
                    </ul>
                </li>
                <li><a href="#" class="">话题</a>
                </li>
                <li><a href="#" class="">书籍</a></li>
                <li><a href="#">电影</a></li>
                <li><a href="#" class="">个人中心</a>
                    <ul class="last">
                        <li><a href="#">我的收藏</a></li>
                        <li><a href="#">话题管理</a></li>
                        <li><a href="#">个人信息</a></li>
                    </ul>
                </li>
            </ul>
        </section>
    </nav>
</header>
<br><br>
<div class="col-md-8 col-md-offset-2">
    <div class="col-md-12 back">
        <div>
            <br><br><br><br><br><br><br>
            <table>
                <tr><td>&nbsp;&nbsp;<img class="imgs" src="img/png.png" alt=""></td>
                    <c:if test="${users.uname == null}">
                    <td><h4>&nbsp;&nbsp;&nbsp;xxxx<br><small><br>&nbsp;&nbsp;&nbsp;介绍自己</small></h4></td>
                    </c:if>
                    <c:if test="${users.uname != null}">
                        <td><h4>&nbsp;&nbsp;&nbsp;${users.uname}<br><small><br>&nbsp;&nbsp;&nbsp;介绍自己</small></h4></td>
                    </c:if>
                </tr>
            </table>
        </div>
    </div>

    <div class="col-md-12 back2">
        <br>
        <h4>Hi! ${users.uname} 这里是你的主页，用来展示你的生活和发现，也是别人认识你的地方。<br><br>
            完善你的个人资料，开始全新的旅程吧</h4>
        <br>
        <ul class="nav nav-tabs">
            <li ><a href="../info/findPersonalMainInfo.do">主页</a></li>
            <li class="active"><a href="#bulletin" data-toggle="tab">个人信息</a></li>
            <li><a href="../topic/findByUid.do?uid="+${users.uid}>我的话题</a></li>
        </ul>
        <div id="mytab-content" class="tab-content">
            <div class="tab-pane fade in active" id="bulletin">
                <br>
                <c:if test="${users.uname == null}">
                    还未登录，<a href="../manage/pages/samples/login.jsp">登录</a>了解更多
                    <br>
                </c:if>
                <c:if test="${users.uname != null}">
                    <form class="form-horizontal" role="form" action="../user/personUpdate.do"  method="post">

                        <div class="form-group">
                            <label for="disabledTextInput" class="col-sm-2 control-label">头像</label>
                            <div class="col-sm-8">
                                <input type="file" class="form-control" id="photo" name="photo" value="${users.photo}" multiple="multiple" onchange="getImage()">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="disabledTextInput" class="col-sm-2 control-label">账号</label>
                            <div class="col-sm-8">
                                <span>
                                <input type="text" id="disabledTextInput" class="form-control" name="uid" value="${users.uid}"  readonly = "readonly">
                                <button class="file-upload-browse btn btn-primary" type="button" onclick="selectFile()">上传</button>
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="disabledTextInput" class="col-sm-2 control-label">账号</label>
                            <div class="col-sm-8">
                                <input type="text"  class="form-control" name="u_status" value="${users.u_status}"  readonly = "readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">昵称</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="uname" placeholder="请输入名字" value="${users.uname}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">密码</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="password" placeholder="请输入密码" value="${users.password}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">性别</label>
                            <input type="hidden" id ="selectRefundReason" value="{sex}"/>
                            <div class="col-sm-8">
                            <select class="form-control" name="sex" value="${users.sex}">
                                <option value="男" <c:if test="${'男'.equals(users.sex)}">selected</c:if>>男</option>
                                <option value="女" <c:if test="${'女'.equals(users.sex)}">selected</c:if>>女</option>
                            </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">email</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control"  name="email" placeholder="请输入email" value="${users.email}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-8">
                                <button type="submit" class="btn btn-primary btn-lg btn-block">修改</button>
                            </div>
                        </div>
                    </form></c:if>
            </div>
        </div>
    </div>

</div>
</body>
</html>
