<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: grandir
  Date: 2019/11/26
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"user/";
%>
<!doctype html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>详情</title>
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
    <script src="js/video.min.js"></script>
    <link href="css/video-js.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <style type="text/css">
        .dh2{
            font-size: 25px;
            text-align: center;
        }
        .siz{
            font-size: 15px;
        }
        .m {
            width: 650px;
            height: 500px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 100px;
        }

        .imgs1{
            width: 100px;
            height: 80px;
        }

    </style>
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
                <li><a href="../info/findPersonalMainInfo.do" class="">个人中心</a>
                    <ul class="last">
                        <li><a href="main/personInfo.jsp">个人信息</a></li>
                        <li><a href="../topic/findByUid.do?uid="+${users.uid}">我的话题</a></li>
                        <li><a href="../user/exitLogin.do">退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </section>
    </nav>
</header>
<div class="content yahei subchannel">
    <div class="mainWrap clearfix">
        <section class="colunm1">
            <br>
            <h2 class="dh2">${infos.title}</h2>
            <br><br><br>
            <span class="siz">${infos.content}</span>
            <div class="m">
                <video id="my-video" class="video-js vjs-big-play-centered" controls preload="auto" width="640" height="270"
                       poster="m.jpg" data-setup="{}">
                    <source src="${infos.video}" type="video/mp4">
                    <source src=".webm" type="video/webm">
                    <source src=".ogv" type="video/ogg">
                    <p class="vjs-no-js"> To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a> </p>
                </video>
            </div>
        </section>



        <section class="colunm2">
            <section class="mod withborder">
                <h2>
                    <span class="iconwraper"><i class="thunews-play-circle"></i></span>
                    精彩视频
                    <a href="#" style="font-size:12px; color:#666; margin-left:30px">
                        <%--  更多 &#8250;--%>
                    </a>
                </h2>
                <%-- <ul class="promvideolist clearfix" id="thunews_jcsp">
                    <c:forEach items="${videoInfo}" var="videoList">
                        <li><a href="../info/findByIdInfo.do?infoId=${videoList.info_id}"><img src="${videoList.photo}">&nbsp;&nbsp;&nbsp;<br>${videoList.title}</a><br></li>
                    </c:forEach>
                 </ul>--%>

                <table class="table newslist clearfix">
                    <c:forEach items="${videoInfo}" var="videoList">
                        <tr>
                            <td><a href="../info/findByIdInfo.do?infoId=${videoList.info_id}"><img class="imgs1" src="${videoList.photo}"></a></td>
                            <td> <a href="../info/findByIdInfo.do?infoId=${videoList.info_id}"><p style="float: left">${videoList.title}</p></a>
                                <br><small style="float: right">${videoList.date}</small></td>
                        </tr>

                    </c:forEach>

                </table>

            </section>
            <section class="mod withborder">
                <h2 class="red"><span class="iconwraper">
            <i class="thunews-line-chart"></i>
            </span>
                    近期热点
                    <a href="#" style="font-size:12px; color:#666; margin-left:30px">
                        <%--更多 &#8250;--%>
                    </a>
                </h2>
                <ul class="newslist clearfix"  id="resText">
                    <c:forEach items="${hotInfo}" var="eventList">
                        <li><a href="../info/findByIdInfo.do?infoId=${eventList.info_id}">${eventList.title}<small style="float: right">${eventList.date}</small></li>
                    </c:forEach>
                </ul>
            </section>
        </section>
    </div>
</div>
</body>
<script type="text/javascript">
        //设置中文
        videojs.addLanguage('zh-CN', {
            "Play": "播放",
            "Pause": "暂停",
            "Current Time": "当前时间",
            "Duration": "时长",
            "Remaining Time": "剩余时间",
            "Stream Type": "媒体流类型",
            "LIVE": "直播",
            "Loaded": "加载完毕",
            "Progress": "进度",
            "Fullscreen": "全屏",
            "Non-Fullscreen": "退出全屏",
            "Mute": "静音",
            "Unmute": "取消静音",
            "Playback Rate": "播放速度",
            "Subtitles": "字幕",
            "subtitles off": "关闭字幕",
            "Captions": "内嵌字幕",
            "captions off": "关闭内嵌字幕",
            "Chapters": "节目段落",
            "Close Modal Dialog": "关闭弹窗",
            "Descriptions": "描述",
            "descriptions off": "关闭描述",
            "Audio Track": "音轨",
            "You aborted the media playback": "视频播放被终止",
            "A network error caused the media download to fail part-way.": "网络错误导致视频下载中途失败。",
            "The media could not be loaded, either because the server or network failed or because the format is not supported.": "视频因格式不支持或者服务器或网络的问题无法加载。",
            "The media playback was aborted due to a corruption problem or because the media used features your browser did not support.": "由于视频文件损坏或是该视频使用了你的浏览器不支持的功能，播放终止。",
            "No compatible source was found for this media.": "无法找到此视频兼容的源。",
            "The media is encrypted and we do not have the keys to decrypt it.": "视频已加密，无法解密。",
            "Play Video": "播放视频",
            "Close": "关闭",
            "Modal Window": "弹窗",
            "This is a modal window": "这是一个弹窗",
            "This modal can be closed by pressing the Escape key or activating the close button.": "可以按ESC按键或启用关闭按钮来关闭此弹窗。",
            ", opens captions settings dialog": ", 开启标题设置弹窗",
            ", opens subtitles settings dialog": ", 开启字幕设置弹窗",
            ", opens descriptions settings dialog": ", 开启描述设置弹窗",
            ", selected": ", 选择",
            "captions settings": "字幕设定",
            "Audio Player": "音频播放器",
            "Video Player": "视频播放器",
            "Replay": "重播",
            "Progress Bar": "进度小节",
            "Volume Level": "音量",
            "subtitles settings": "字幕设定",
            "descriptions settings": "描述设定",
            "Text": "文字",
            "White": "白",
            "Black": "黑",
            "Red": "红",
            "Green": "绿",
            "Blue": "蓝",
            "Yellow": "黄",
            "Magenta": "紫红",
            "Cyan": "青",
            "Background": "背景",
            "Window": "视窗",
            "Transparent": "透明",
            "Semi-Transparent": "半透明",
            "Opaque": "不透明",
            "Font Size": "字体尺寸",
            "Text Edge Style": "字体边缘样式",
            "None": "无",
            "Raised": "浮雕",
            "Depressed": "压低",
            "Uniform": "均匀",
            "Dropshadow": "下阴影",
            "Font Family": "字体库",
            "Proportional Sans-Serif": "比例无细体",
            "Monospace Sans-Serif": "单间隔无细体",
            "Proportional Serif": "比例细体",
            "Monospace Serif": "单间隔细体",
            "Casual": "舒适",
            "Script": "手写体",
            "Small Caps": "小型大写字体",
            "Reset": "重启",
            "restore all settings to the default values": "恢复全部设定至预设值",
            "Done": "完成",
            "Caption Settings Dialog": "字幕设定视窗",
            "Beginning of dialog window. Escape will cancel and close the window.": "开始对话视窗。离开会取消及关闭视窗",
            "End of dialog window.": "结束对话视窗"
        });
    var myPlayer = videojs('my-video');
    videojs("my-video").ready(function(){
        var myPlayer = this;
        myPlayer.play();
    });
</script>
</html>

