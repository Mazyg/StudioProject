<%--
  Created by IntelliJ IDEA.
  User: grandir
  Date: 2019/12/4
  Time: 10:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"user/";
%>
<!doctype html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
    <meta name="format-detection" content="telephone=no" />
    <link href="css/base_news.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <title>论坛</title>
</head>
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
        </div>
    </section>
    <nav class="navwrap yahei">
        <section class="mainWrap">
            <ul id="nav">
                <li><a href="../info/findEvent.do">热点时事</a>
                </li>
                <li><a href="../info/findChinese.do">爱我中华</a>
                    <ul>
                        <li><a href="#">最美中国景</a></li>
                        <li><a href="#">最美中国人</a></li>
                        <li><a href="#">最美中国事</a></li>
                    </ul>
                </li>
                <li><a href="../info/findPersonInfo.do" class="">榜样力量</a>
                    <ul>
                        <li><a href="#">新时代楷模</a></li>
                        <li><a href="#">改革先锋</a></li>
                        <li><a href="#">最美奋斗者</a></li>
                        <li><a href="#">道德模范</a></li>
                    </ul>
                </li>
                <li><a href="#" class="">话题</a>
                    <ul>
                        <li><a href="#">话题1</a></li>
                        <li><a href="#">话题2</a></li>
                        <li><a href="#">话题3</a></li>
                    </ul>
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
<div class="collapse navbar-collapse" id="my-navbar-collapse">

    <ul class="nav navbar-nav navbar-right" >
        <li ><a href="#"><i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;Jack.C</a></li>

        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                设置 <b class="caret"></b>
            </a>
            <ul class="dropdown-menu">
                <li><a href="#">登录</a></li>
                <li><a href="#">注册</a></li>

            </ul>
        </li>
    </ul>

</div>


</div>
<hr style="margin: 0;padding: 0;color:#222;width: 100%">
</nav>

<div class="container container_bg" >
    <div class="row">
        <div class="col-sm-2"></div>

        <div class="col-sm-6 col-xs-12 my_edit" >
            <div class="row" id="edit_form" >
                <span class="pull-left" style="margin:15px;">编写新鲜事</span>
                <span class="tips pull-right" style="margin:15px;"></span>
                <form role="form" style="margin-top: 50px;">
                    <div class="form-group">
                        <div class="col-sm-12">

                            <div contentEditable="true" id="content" class="form-control " ></div>
                        </div>
                        <div class="col-sm-12" style="margin-top: 12px;">
                            <span class="emoji" >表情</span>

                            <span class="pic" >图片	</span>
                            <span>
							    		<input type="file" name=""  class="select_Img" style="display: none" >
							    	    <img class="preview" src="">
							    	</span>


                            <div class="myEmoji" >
                                <ul id="myTab" class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#set" data-toggle="tab">
                                            预设
                                        </a>
                                    </li>
                                    <li><a href="#hot" data-toggle="tab">热门</a></li>

                                </ul>
                                <div id="myTabContent" class="tab-content">
                                    <div class="tab-pane fade in active" id="set">
                                        <div class="emoji_1"></div>
                                    </div>
                                    <div class="tab-pane fade" id="hot">
                                        <div class="emoji_2"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- <span> <input type="file" id="selectImg" value=""></input> </span> -->
                            <button type="button" id="send" class="btn btn-default pull-right disabled">发布</button>
                        </div>
                    </div>
                </form>
            </div>


            <div class="row item_msg" >
                <div class="col-sm-12 col-xs-12 message" >
                    <img src="img/icon.png" class="col-sm-2 col-xs-2" style="border-radius: 50%">
                    <div class="col-sm-10 col-xs-10">
                        <span style="font-weight: bold;">Jack.C</span>
                            <ul class="nav navbar-nav navbar-right" >
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                        <b class="caret"></b>
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">删除</a></li>
                                        <li><a href="#">编辑</a></li>
                                    </ul>
                                </li>
                            </ul>
                        <br>
                        <small class="date" style="color:#999">1分钟前</small>
                        <div class="msg_content">happy day!
                            <img class="mypic" src="img/bg_1.jpg" >
                        </div>

                    </div>

                </div>


            </div>


        </div>


        <div class="col-sm-3 col-xs-12 part_right" >
            <div class="row text-center inform">
                <img src="img/icon.png" >
                <h4 style="font-weight: bold;">Jack.C</h4>
                <div class="col-sm-12 my_inform" >
                    <div class="col-sm-4 col-xs-4">
                        <div>111</div>
                        <div class="sort">关注</div>

                    </div>
                    <div class="col-sm-4 col-xs-4">
                        <div>111</div>
                        <div class="sort">粉丝</div>
                    </div>
                    <div class="col-sm-4 col-xs-4">
                        <div>111</div>
                        <div class="sort">博客</div>
                    </div>
                </div>
            </div>
            <div class="row part_hot" >
                <div class="col-sm-12">
                    <span class="pull-left" style="padding: 10px;font-size:16px;font-weight: bold;">热门话题</span>
                    <span class="pull-right" style="padding: 10px;">换话题</span>
                </div>
                <hr style="margin: 0;padding: 0;width: 100%">
            <c:forEach items="${topic}" var="topic">
                <div class="col-sm-12 item_hot" >
                    <span class="pull-left">${topic.t_title}</span>
                    <span class="pull-right item_num">34.6亿</span>
                </div>
            </c:forEach>
                <hr style="margin: 0;padding: 0;width: 100%">

                <div class="col-sm-12 text-center" style="padding: 10px"><a href="#">查看更多</a></div>

            </div>

        </div>
    </div>


</div>
<script src="js/jquery-3.1.0.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(function(){

        $("#content").keyup(function(){

            //判断输入的字符串长度
            var content_len = $("#content").text().replace(/\s/g,"").length;

            $(".tips").text("已经输入"+content_len+"个字");


            if(content_len==0){
                // alert(content);
                $(".tips").text("");
                $("#send").addClass("disabled");
                return false;
            }else{
                $("#send").removeClass("disabled");
            }
        });


        $(".pic").click(function(){

            $(".select_Img").click();


        })

        // 	function confirm(){

        // 		var r= new FileReader();
        // f=$(".select_Img").files[0];
        // r.readAsDataURL(f);
        // r.onload=function(e) {
        // 	$(".preview").src=this.result;

        // };
        // 	}

        //点击按钮发送内容
        $("#send").click(function(){

            // var myDate = new Date();

            //   var min = myDate.getMinutes();

            //   var time = min-(min-1);

            //   //alert(time);

            var content=$("#content").html();

            //判断选择的是否是图片格式
            var imgPath = $(".imgPath").text();
            var start  = imgPath.lastIndexOf(".");
            var postfix = imgPath.substring(start,imgPath.length).toUpperCase();


            if(imgPath!=""){

                if(postfix!=".PNG"&&postfix!=".JPG"&&postfix!=".GIF"&&postfix!=".JPEG"){
                    alert("图片格式需为png,gif,jpeg,jpg格式");
                }else{
                    $(".item_msg").append("<div class='col-sm-12 col-xs-12 message' > <img src='img/icon.png' class='col-sm-2 col-xs-2' style='border-radius: 50%'><div class='col-sm-10 col-xs-10'><span style='font-weight: bold;''>Jack.C</span> <br><small class='date' style='color:#999'>刚刚</small><div class='msg_content'>"+content+"<img class='mypic' onerror='this.src='img/bg_1.jpg' src='file:///"+imgPath+"' ></div></div></div>");
                }
            }else{
                $(".item_msg").append("<div class='col-sm-12 col-xs-12 message' > <img src='img/icon.png' class='col-sm-2 col-xs-2' style='border-radius: 50%'><div class='col-sm-10 col-xs-10'><span style='font-weight: bold;''>Jack.C</span> <br><small class='date' style='color:#999'>刚刚</small><div class='msg_content'>"+content+"</div></div></div>");
            }

        });

        //添加表情包1
        for (var i = 1; i < 60; i++) {

            $(".emoji_1").append("<img src='img/f"+i+".png' style='width:35px;height:35px' >");
        }
        //添加表情包2
        for (var i = 1; i < 61; i++) {

            $(".emoji_2").append("<img src='img/h"+i+".png' style='width:35px;height:35px' >");
        }


        $(".emoji").click(function(){

            $(".myEmoji").show();

            //点击空白处隐藏弹出层
            $(document).click(function (e) {

                if (!$("#edit_form").is(e.target) && $("#edit_form").has(e.target).length === 0) {

                    $(".myEmoji").hide();
                }
            });


        });

        //将表情添加到输入框
        $(".myEmoji img").each(function(){
            $(this).click(function(){
                var url = $(this)[0].src;

                $('#content').append("<img src='"+url+"' style='width:25px;height:25px' >");

                $("#send").removeClass("disabled");
            })
        })

        //放大或缩小预览图片
        $(".mypic").click(function(){
            var oWidth=$(this).width(); //取得图片的实际宽度
            var oHeight=$(this).height(); //取得图片的实际高度

            if($(this).height()!=200){
                $(this).height(200);
            }else{
                $(this).height(oHeight + 200/oWidth*oHeight);

            }

        })

    })
</script>
</body>
</html>

</body>
</html>
