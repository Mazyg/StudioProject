<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"+"manage/";
%>
<html>
<head>
    <meta charset="UTF-8">
    <base href="<%=basePath%>">
    <title>找回密码页面</title>
    <link href="css/img_smooth_check.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/img_smooth_check.js"></script>
    <link rel="shortcut icon" href="images/title.ico" />
    <style>

        * {
            margin: auto; /*块级标签(div)自动居中*/
            padding: 0px;
        }

        /* #代表ID选择器
        找到id为header的dom元素
        */
        #header {
            width: 1200px;
        }

        #header_bg {
            /*div属于块级标签,默认宽度不给的话为100%*/
            height: 100px;
            /*背景: 图片地址 平铺方式 x轴位置偏移量 y轴位置偏移量*/
            background: url("images/headbg.jpg") repeat-x 0 bottom;
        }

        #header_left {
            height: 100px;
            width: 270px;
            float: left;
        }

        #logo {
            /*行块: 可设置宽高也可共享一行*/
            display: inline-block;
            width: 147px;
            height: 50px;
            /*background: url("/image/icon.png");*/
            /*相对定位:根据原来的位置调整*/
            position: relative;
            /*距离上方20px*/
            top: 20px;
        }

        #hyzc {
            font-size: 24px;
            position: relative;
            top: 5px;
        }

        #content {
            width: 400px;
            height: 400px;
            margin-top: 120px;
            position: relative;
        }

        #tel_start { /*输入框的左边的"中国0086"的样式*/
            width: 106px;
            /*行高和高度一致可以垂直居中*/
            height: 48px;
            line-height: 48px;
            float: left;
            border: 1px solid #e6e6e6; /*边框:1像素 实线 16进制灰色*/
            border-right: none; /*去除右边框*/
            font-size: 13px; /*字体大小*/
            font-family: "Microsoft YaHei"; /*字体样式,美化字体*/
            text-align: center; /*文本水平居中*/
        }

        #tel_end { /*输入框的样式*/
            text-indent: 20px; /*文本缩进一点*/
            outline: none; /*去除默认的输入框的蓝色边框*/
            width: 290px;
            height: 48px;
            border: 1px solid #e6e6e6;
            float: left;
        }

        #tel_end:focus { /*获得焦点的时候,触发该样式,把边框颜色变为黑色*/
            border-color: black;
        }

        #verifyBtn {
            height: 52px;
            border: 1px solid #e6e6e6; /*内边框:1像素 实线 灰色*/
            width: 399px;
            background-color: white;
            outline: none; /*去除外边框*/
        }

        #phone {
            height: 80px;
        }
        #navigation {
            height: 80px;
        }
        #select {
            position: absolute;
            top:-120px;
            background-color: white;
        }
        .hide {
            visibility: hidden;
        }

        #code {
            margin-top:30px;
            position: relative;
            display:none;
        }
        #codeText {
            border:1px solid #e6e6e6;
            outline:none;
            width:287px;
            height: 48px;
            text-indent: 120px;
            float:left;
        }
        #codeTip {
            font-family: "Microsoft YaHei";
            font-size: 14px;
            color: gray;
            position: absolute;
            z-index: 10;
            left:26px;
            top:15px;
            text-space: 20px;
        }
        #codeBtn {
            outline: none;
            border:1px solid #e6e6e6;
            border-left: none;
            height: 50px;
            width:110px;
            float:left;
        }

        #nextBtn {
            margin-top:120px;  /*距离上面盒子的距离*/
            display:block;/*转换为块级标签,可设置宽高*/
            width:397px;
            line-height: 50px;/*垂直50高度居中*/
            background-color: #e2231a;/*背景色*/
            color: white;/*字体颜色*/
            text-align: center;/*水平居中*/
            text-decoration: none;/*去除下划线*/
        }
        #nextBtn:hover { /*:hover代表鼠标悬浮上去*/
            background-color:#c81623;
        }
        #password {
            height: 80px;
            position: relative;
            display:none;
        }
        #passwordTip {
            font-family: "Microsoft YaHei";
            font-size: 12px;
            color: gray;
            position: absolute;
            z-index: 10;
            left:30px;
            top:15px;
            letter-spacing: 10px;
        }
        input[name=password] {
            border:1px solid #e6e6e6;
            outline:none;
            width: 397px;
            height: 48px;
            text-indent: 120px;
        }
        #repassword {
            height: 80px;
            position: relative;
            display:none;
        }
        #repasswordTip {
            font-family: "Microsoft YaHei";
            font-size: 12px;
            color: gray;
            position: absolute;
            z-index: 10;
            left:30px;
            top:15px;
            letter-spacing: 10px;
        }
        input[name=repassword] {
            border:1px solid #e6e6e6;
            outline:none;
            width: 397px;
            height: 48px;
            text-indent: 120px;
        }

    </style>
</head>
<body>
<div id="header_bg">
    <div id="header">
        <div id="header_left">
            <a id="logo" href="#"></a>
            <span id="hyzc">找回密码</span>
        </div>
        <div id="header_right"></div>
    </div>
</div>

<div id="content">
    <div class="widgets__img_check_box hide" id="select">
        <div class="widgets__img_display">
            <div class="widgets__img_cnt">
                <img src1="a.jpg" class="widgets__img_src"/>
                <canvas class="widgets__img_fragment_hollow"></canvas>
                <div class="widgets__img_fragment_cnt">
                    <canvas class="widgets__img_fragment widgets__img_fragment_shadow"></canvas>
                    <canvas class="widgets__img_fragment widgets__img_fragment_content"></canvas>
                </div>
                <div class="widgets__icon_refresh"></div>
            </div>
        </div>
        <div class="widgets__smooth_cnt">
            <div class="widgets__smooth_bar"></div>
            <div class="widgets__smooth_circle"></div>
        </div>
    </div>
    <form action="../rep/rePassword.do" method="post">
    <div id="navigation"><span id="tip">111111111111</span></div>
    <div id="phone">
        <div id="tel_start">中国 0086</div>
        <input id="tel_end" type="text" placeholder="建议使用常用手机号" name="telephone" >
    </div>
    <div id="verify">
        <input onclick="checkphone();" id="verifyBtn" type="button" value="点击按钮进行验证">
    </div>
    <div id="code">
        <label id="codeTip">手机验证码</label>
        <input id="codeText"><input onclick="sendMessage()" disabled id="codeBtn" type="button" value="60s后重新获取">
    </div>
    <div id="password">
        <label id="passwordTip">新密码</label>
        <input class="password" name="password" type="password">
    </div>
    <div id="repassword">
        <label id="repasswordTip">确认密码</label>
        <input class="repassword" name="repassword" type="password">
    </div>
    <div  id="res" style="display: none"></div>
    <div id="next" class="hide"> <a onclick="nextStep();" id="nextBtn" href="javascript:;">下一步</a></div>
    <div id="register"></div>
    </form>
</div>

<script type="text/javascript">
    function checkphone(){
        var number = $("#tel_end").val();
        if(number==''){
            alert("手机号不能为空！");
            return false;
        }else{
            var $reg=/^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/;
            if(!$reg.test(number)){
                alert("手机号格式错误！");
                return false;
            }
            // $.get(URL,data,function(data,status,xhr),dataType)
            //URL规定您需要请求的 URL。Data规定连同请求发送到服务器的数据。function(data,status,xhr)规定当请求成功时运行的函数(data - 包含来自请求的结果数据status - 包含请求的状态（"success"、"notmodified"、"error"、"timeout"、"parsererror"）xhr - 包含 XMLHttpRequest 对象)。datatype规定预期的服务器响应的数据类型。
            $.get("../rep/checkPhone.do?telephone="+number,null,function(res){
                if(res=="no"){
                    alert("该手机号还未注册，请先去注册用户！");
                }
                else{
                    $('#select').removeClass('hide');
                }
            },"text");
        }
    }
    var s = WIDGETS.imgSmoothCheck({
        selector: "#select",
        data: ["images/t1.png", "images/t2.png", "images/t3.png"],
        imgHeight: 150,
        imgWidth: 360,
        allowableErrorValue: 3,
        success: function () {
            // alert("成功！");
            sendMessage();
        },
        error: function (res) {

        }
    });
    var code;
    function sendMessage() {
        // 取到要发送的手机号码
        var number = $("#tel_end").val();
        //验证手机号
        // alert(number);
        // 请求后台控制器服务
        var s = 59;
        $.get("../rep/sendCode.do?telephone="+number,null,function(res){
            code = res;
            alert(code);
            $("#res").text(code);
            $("#select").addClass("hide");
            $('#next').removeClass('hide');
            $("#verify").hide();
            $("#code").show();
            // 倒计时
            setTimeout(function second() {
                var text = s + "秒后重新获取";
                $("#codeBtn").val(text);
                $("#codeBtn").text(text);

                if(s == 0) {
                    $("#codeBtn").removeAttr("disabled");
                    $("#codeBtn").val("重新获取");
                } else {
                    setTimeout(second, 1000);
                }
                s--;
            }, 1000);
        },"text");
    }
    // var s = 59;
    // function second() {
    //     var text = s + "秒后重新获取";
    //     $("#codeBtn").val(text);
    //     $("#codeBtn").text(text);
    //
    //     if(s == 0) {
    //         $("#codeBtn").removeAttr("disabled");
    //         $("#codeBtn").val("重新获取");
    //     } else {
    //         setTimeout(second, 100);
    //     }
    //     s--;
    // }
    function nextStep() {
        // 获取到用户输入的验证码
        var userCode = document.
        querySelector("#codeText").value;
        // 和系统发送短信的验证码匹配
        var code=$("#res").text();
        if(userCode == code) {
            $("#phone,#code").hide();
            $("#password").show();
            $("#repassword").show();
            $("#nextBtn").html("提交");
            // 删除原来的点击事件
            $("#nextBtn").removeAttr("onclick");
            // 添加新的点击事件
            $("#nextBtn").click(function(){
                //验证密码
                if($(".password").val()==""){
                    $("#tip").show().text("密码不能为空");
                    return false;
                }else{
                    var $reg=/^\w{6,}$/;
                    if(!$reg.test($(".password").val())){
                        $("#tip").show().text("密码至少6位");
                        return false;
                    }
                }
                //确认密码是否为空
                if($(".repassword").val()==""){
                    $("#tip").show().text("请确认密码");
                    return false;
                }
                //验证两次密码是否一致
                if($(".password").val()!=$(".repassword").val()){
                    $("#tip").show().text("两次密码不一致");
                    return false;
                }
                // 提交表单,把数据提交给后台
                $("form").submit();
                // window.location.href="../rep/rePassword.do?telephone="+number+"&";
            });
        } else {
            alert("验证码错误,请重试...");
        }
    }



</script>

</body>
</html>