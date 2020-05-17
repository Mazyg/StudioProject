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
    <link rel="shortcut icon" href="img/title.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1 , shrink-to-fit=no">
    <link href="css/base_news.css" rel="stylesheet" type="text/css">
    <link href="font/font.css" rel="stylesheet" type="text/css">
    <link href="css/inner.css" rel="stylesheet" type="text/css">
     <link rel="stylesheet" href="css/style.css"/>
    <script src="js/jquery-1.8.3.js"></script>
    <link rel="stylesheet" href="css/slick.css">
    <script src="js/slick.min.js" type="text/javascript"></script>
    <script src="js/regexcut.js" type="text/javascript"></script>
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







</script>
<script type="text/javascript">
    function selectFile(){
        $("#photo").trigger("click");
    }

    function getImage() {
        /*var obj = new FormData();
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
                $("#src").attr("src",data)
            }
        })*/

        console.log("hello")
        var photo=document.querySelector("#photo");
        console.log(photo);
        var file=photo.files[0];
        var formData=new FormData();
        var type = $("#uname").val();
        formData.append("img",file);
        formData.append("type",type);
        var xhr=new XMLHttpRequest();
        xhr.open("post","http://111.229.25.156:7777/upload/img")
        xhr.onload=function (ev) {
            var json;
            if(xhr.status!==200){
                failFun('HTTP Error:'+xhr.status);
                return
            }
            json=JSON.parse(this.responseText);
            if(!json||typeof json.location !='string'){
                failFun('Invalid JSON:'+xhr.responseText);
                return;
            }else{
                console.log(json.location);
                $("#url").val(json.location) ;
                $("#src").attr("src",json.location);
            }


        };
        xhr.send(formData);




    }
</script>
<body onload="message()">
<header class="clearfix">
    <nav class="navwrap yahei">
        <section class="mainWrap">
            <ul id="nav">
                <li><a href="../info//epidemic.do?page=1&numberPerPage=3&start=0&length=3">全球战疫</a>
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
                <li><a class="">个人中心</a>
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
<br><br>
<div class="col-md-8 col-md-offset-2">
    <div class="col-md-12 back">
        <div>
            <br><br><br><br><br><br><br>
            <table>
                <tr><td>
                    &nbsp;&nbsp;<c:if test="${users.uid == null}">
                        <img class="imgs" src="img/png.png" alt="头像">
                    </c:if>
                    <c:if test="${users.uid != null}">
                    <img class="imgs" src="${users.photo}" alt="头像" data-toggle="modal" data-target="#myModal"/>
                    </c:if>
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="../user/personPhoto.do" method="post">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">更换头像</h4>
                            </div>
                            <div class="modal-body">

                                <div class="form-group">
                                  <%--  <input type="file" name="img[]" class="file-upload-default">--%>
                                    <div class="input-group col-xs-12" style="text-align:center">
                                        <img class="imgs  center-block" src="${users.photo} " id="src">
                                        <input type="text" class="form-control file-upload-info" style="display:none" readonly placeholder="上传封面" id="url" name="photo" >
                                        <span class="input-group-append">
                                            <br>
                                        <input type="file" id="photo" style="display:none" multiple="multiple" onchange="getImage()">
                                        <button class="file-upload-browse btn btn-primary" type="button" onclick="selectFile()">上传</button>
                                     </span>
                                    </div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="submit" class="btn btn-primary">提交更改</button>
                            </div>
                            </form>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
        </div>
                    </td>
                    <c:if test="${users.uname == null}">
                    <td><h4 style="color: white">&nbsp;&nbsp;&nbsp;xxxx<br><small><br>&nbsp;&nbsp;&nbsp;介绍自己</small></h4></td>
                    </c:if>
                    <c:if test="${users.uname != null}">
                        <td><h4 style="color: white">&nbsp;&nbsp;&nbsp;${users.uname}<br><small><br>&nbsp;&nbsp;&nbsp;介绍自己</small></h4></td>
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
            <li><a href="../dynamic/findAllCommentByName.do?uname=${users.uname}" >我的消息</a></li>
        </ul>
        <div id="mytab-content" class="tab-content">
            <div class="tab-pane fade in active" id="bulletin">
                <br>
                <c:if test="${users.uname == null}">
                    还未登录，<a href="../manage/pages/samples/login.jsp">登录</a>了解更多
                    <br>
                </c:if>
                <c:if test="${users.uname != null}">
                    <form class="form-horizontal" role="form" action="../user/personUpdate.do"  method="post" >
                        <div class="form-group">
                            <label for="disabledTextInput" class="col-sm-2 control-label">账号</label>
                            <div class="col-sm-8">
                                <span>
                                <input type="text" id="disabledTextInput" class="form-control" name="uid" value="${users.uid}"  readonly = "readonly">
                                </span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="disabledTextInput" class="col-sm-2 control-label">状态</label>
                            <div class="col-sm-8">
                                <input type="text"  class="form-control" name="u_status" value="${users.u_status}"  readonly = "readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">昵称</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="uname" name="uname" placeholder="请输入名字" value="${users.uname}">
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

