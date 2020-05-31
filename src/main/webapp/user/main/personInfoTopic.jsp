<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style type="text/css">
    body{
        /*background-color: aliceblue;*/
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

    $(function () {
        $(".del").click(function () {
            var $tid = $(this).parent().parent().children('td').eq(0).text();
            $.ajax({
                type:'post',
                url:"../topic/deleTopic2.do",
                data:"tid="+$tid,
                success:function (msg) {
                    if(msg === "success"){
                        alert("删除成功！")
                    }else{
                        alert("删除失败！")
                    }
                    window.location.href="../topic/findByUid.do?uid="+${users.uid};
                },
                error:function () {
                    alert("出错了！")
                }
            });
        });



    })

    function query(tid) {
        $.ajax({
            url : "../topic/showResult.do",
            async : true,
            type : "POST",
            data : {
                "tid" : tid
            },
            // 成功后开启模态框
            success : showQuery,
            error : function() {
                alert("请求失败");
            },
            dataType : "json"
        });
    }

    // 查询成功后向模态框插入数据并开启模态框。data是返回的JSON对象
    function showQuery(data) {
        $("#content").val(data.content);
        $("#type").val(data.t_type);
        $("#result").val(data.t_result);
        $("#reason").val(data.t_reason);
        $("#title").val(data.t_title);
        // 显示模态框
        $('#myModal').modal('show');
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
                <tr><td>&nbsp;&nbsp;
                   <c:if test="${users.uname == null}">
                    <img class="imgs" src="img/png.png" alt=""></td>
                    <td><h4 style="color: white">&nbsp;&nbsp;&nbsp;xxxx<br><small><br>&nbsp;&nbsp;&nbsp;介绍自己</small></h4></td>
                    </c:if>
                    <c:if test="${users.uname != null}">
                        <img class="imgs" src="${users.photo}" alt="头像" />
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
            <li ><a href="main/personInfo.jsp" >个人信息</a></li>
            <li class="active"><a href="#rule" data-toggle="tab">我的话题</a></li>
            <li><a href="../dynamic/findAllCommentByName.do?uname=${users.uname}" >我的消息</a></li>
        </ul>
        <div id="mytab-content" class="tab-content">
            <div class="tab-pane fade in active" id="rule">
                <br>
                <c:if test="${users.uname == null}">
                    还未登录，<a href="../manage/pages/samples/login.jsp">登录</a>了解更多
                    <br>
                </c:if>
                <c:if test="${users.uname != null}">
                    <c:if test="${topicInfo.size()== 0}">
                        还没有发布话题，去<a href="main/write.jsp">发布话题</a>
                        <br>
                    </c:if>
                    <c:if test="${topicInfo.size()!= 0}">

                            <table class="table  table-hover">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>话题</th>
                                    <th>发布时间</th>
                                    <th>状态</th>
                                    <th>内容</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                        <c:forEach items="${topicInfo}" var="topicInfo">
                            <tr>
                                <td>${topicInfo.tid}</td>
                                <td>${topicInfo.t_title}</td>
                                <td>${topicInfo.date}</td>
                                <td>${topicInfo.t_tatus}/${topicInfo.t_result}</td>
                                <c:if test="${topicInfo.t_result.equals('已通过')}">
                                    <td><a style="color: #1b8dbf"  href="../topic/findTopicById.do?tid=${topicInfo.tid}">详情</a></td>
                                </c:if>
                                <c:if test="${topicInfo.t_result.equals('未通过')}">
                                <td><a style="color: #1b8dbf" href="javascript:void(0)" onclick="query(${topicInfo.tid})" >详情</a>
                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="myModalLabel">详情</h4>
                                            </div>
                                            <div class="modal-body">
                                                    话题标题：<input  id="title" readonly style="border:0;background:transparent;"><br><br>
                                                    话题简介：<input id="content" readonly style="border:0;background:transparent;"><br><br>
                                                    话题类型：<input id="type" readonly style="border:0;background:transparent;"><br><br>
                                                    话题状态：<input id="result" readonly style="border:0;background:transparent;color: #bf3322"><br><br>
                                                    状态原因：<input id="reason" readonly style="border:0;background:transparent;color: #bf3322"> <br><br>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                            </div>
                                        </div>
                                    </div>
                                </div></td></c:if>
                                <td><a style="color: #c21d17" href="javascript:void(0)" class="del">删除</a></td>
                            </tr>
                        </c:forEach>
                                </tbody>
                            </table>
                          <br>
                    </c:if>
                </c:if>
            </div>
        </div>
    </div>

</div>
</body>
</html>

