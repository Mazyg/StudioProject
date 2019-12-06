<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"+"user/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="<%=basePath%>">
    <base target="<%=basePath%>"/>
    <meta charset="utf-8">
    <title>爱我中华</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/chinese_base.css" rel="stylesheet" type="text/css">
    <link href="css/base_news.css" rel="stylesheet" type="text/css">
    <link href="font/font.css" rel="stylesheet" type="text/css">
    <link href="css/inner.css" rel="stylesheet" type="text/css">
    <script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/slick.css">
    <script src="js/slick.min.js" type="text/javascript"></script>
    <script src="js/regexcut.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/owl.carousel.css">
    <script src="js/owl.carousel.min.js" type="text/javascript"></script>
    <script src="js/chinese.js" type="text/javascript"></script>
    <!--[if lt IE 9]-->
    <script src="js/html5.js" type="text/javascript"></script>
    <script src="js/json2.js" type="text/javascript"></script>
    <![endif]-->
    <script src="js/regex-cn.js" type="text/javascript"></script>
    <!--[if lt IE 8]-->
    <link rel="stylesheet" href="font/ie7/ie7.css">
    <!--<![endif]-->
    <script language="javascript" type="text/javascript">
        window.onerror = function(){return true;};
        function cutSummary(summaryStr,lengTh){
            if(summaryStr.length>lengTh){
                summaryStr=summaryStr.substring(0,lengTh)+"...";
            }
            document.write(summaryStr);
        }
        $(document).ready(function() {
            $("a.nivo-nextNav").click();
        });
    </script>
    <script type="text/javascript">
        // 对Date的扩展，将 Date 转化为指定格式的String
        // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
        // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
        // 例子：
        // (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
        // (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
        Date.prototype.Format = function(fmt)
        {
            //author: meizz
            var o = {
                "M+" : this.getMonth()+1,                 //月份
                "d+" : this.getDate(),                    //日
                "h+" : this.getHours(),                   //小时
                "m+" : this.getMinutes(),                 //分
                "s+" : this.getSeconds(),                 //秒
                "q+" : Math.floor((this.getMonth()+3)/3), //季度
                "S"  : this.getMilliseconds()             //毫秒
            };
            if(/(y+)/.test(fmt))
                fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
            for(var k in o)
                if(new RegExp("("+ k +")").test(fmt))
                    fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
            return fmt;
        }
        //2015.08 年.月
        function getYM(dtStr,id){
            var dtArr = dtStr.split("-");
            var dt = new Date(dtArr[0], dtArr[1]-1, dtArr[2]);
//var time1 = dt.Format("yyyy-MM-dd hh:mm:ss");
            var time2 = dt.Format("yyyy.MM.dd");
            var yyyy=time2.substr(0,7);
            $("#"+id).text(yyyy);
            return yyyy;
        }
        //10 日期
        function getDay(dtStr,id){
            var dtArr = dtStr.split("-");
            var dt = new Date(dtArr[0], dtArr[1]-1, dtArr[2]);
//var time1 = dt.Format("yyyy-MM-dd hh:mm:ss");
            var time2 = dt.Format("yyyy.MM.dd");
            var md=time2.substr(8);
            $("#"+id).text(md);
            return md;
        }
        //2015.08.10 年.月.日
        function getYMD(dtStr,id){
            var dtArr = dtStr.split("-");
            var dt = new Date(dtArr[0], dtArr[1]-1, dtArr[2]);
//var time1 = dt.Format("yyyy-MM-dd hh:mm:ss");
            var time2 = dt.Format("yyyy.MM.dd");
//var md=time2.substr(8);
            $("#"+id).text(time2);
            return time2;
        }
        function getMdd(dtStr){
            var dtArr = dtStr.split("-");
            var dt = new Date(dtArr[0], dtArr[1]-1, dtArr[2]);
//var time1 = dt.Format("yyyy-MM-dd hh:mm:ss");
            var time2 = dt.Format("MM.dd.yyyy");
            var mdd=time2.substr(0,5);
            $(".mdd").text(mdd);
            return mdd;
        }

    </script>
    <script type="text/javascript">
        function getResData(fwl){
            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID="+fwl+"&"+Math.random(), function(data){
                $(".itemlist_total_"+fwl).empty().text(data);
            });
        };
        getResData('20191115215226228316300');
        getResData('20191114104903637990661');
        getResData('20191114203150109885087');
        getResData('20191114143946213275944');
        getResData('20191113152253813214413');
        getResData('20191111125937323210834');
        getResData('20191107233056843273226');
        getResData('20191107183846159873936');
        getResData('20191104152016246665107');
        getResData('20191106103011951510366');
        getResData('20191104153940321801651');
        getResData('20191105183346446279780');
        getResData('20191104134331499696234');
        getResData('20191101223243367444385');
        getResData('20191101111643117378624');
        getResData('20191101085203346798565');
        getResData('20191029104154096369489');
        getResData('20191028110620976218917');
        getResData('20191028150523857986448');
        getResData('20191022155023394622916');
        getResData('20191022093411835887642');
        getResData('20191022092137552873282');
        getResData('20191022105107400296306');
        getResData('20191022091811133962779');
        getResData('20191021150536357487590');
        getResData('20191021212254800158780');
        getResData('20191017151051312549213');
        getResData('20191018100400959761970');
        getResData('20191017204712788788967');
        getResData('20191016095915802336830');
        getResData('20191012093251734457763');
        getResData('20191015144631478562739');
        getResData('20191011090943918490469');
        getResData('20191014093201031309912');
        getResData('20191013160634767850991');
        getResData('20191012181914192366147');
        getResData('20191012083624160251297');
        getResData('20191008092344328964486');
        getResData('20191008165728246550027');
        getResData('20191009153057525481097');
        getResData('20191008165347094538363');
        getResData('20191008144157969176601');
        getResData('20191008093802060669900');
        getResData('20191001191926205383860');
        getResData('20191001170159582662212');
        getResData('20190930154416085921100');
        getResData('20190930152719711560321');
        getResData('20190930092355258558191');
        getResData('20190929161853128794380');
        getResData('20190929154428459943810');
    </script></head>
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
<script type="text/javascript">
    jQuery(function(){
        jQuery('#nav li a [class^=item]').removeClass('current');
        jQuery('#nav li a.item9652').addClass('current');
    });
</script>
<div class="content yahei subchannel">
    <div class="mainWrap clearfix">
        <section class="colunm1">
            <h2 class="channeltitle noborder hideonpc">最美中国景</h2>
            <div class="biggallery">
                <div class="biggallerywraper">
                    <ul class="biggallerylist">
                    <c:forEach items="${chineseScenery}" var="chineseScenery">
                        <li>
                            <a href="#" target="_blank"><img src="${chineseScenery.photo}"></a>
                            <div class="imgintro">
                            <b></b>
                            <h3><a href="#" target="_blank" class="jiequ">【${chineseScenery.info_type}】${chineseScenery.title}</a></h3>
                            <p> ${chineseScenery.introduce}</p>
                            </div>
                        </li>
                    </c:forEach>
                    </ul>
                </div>
                <div class="imgthumb clearfix">
                    <ul>
                    <c:forEach items="${chineseScenery}" var="chineseScenery">
<%--                        <li class="active"><a><img src=""></a></li>--%>
                        <li><a><img src="${chineseScenery.photo}"></a></li>
                    </c:forEach>
                    </ul>
                </div>
                <script type="text/javascript">
                    $(function(){

                        $('.biggallery .biggallerywraper .biggallerylist').slick({
                            infinite: true,
                            slidesToShow: 1,
                            slidesToScroll: 1,
                            autoplay: true,
                            centerMode: false,
                            prevArrow:"<div class=\"sliderbutton prev\"><i>&lt;</i></div>",
                            nextArrow:"<div class=\"sliderbutton next\"><i>&gt;</i></div>"
                        });
                        $('.biggallery .biggallerywraper .biggallerylist').on('beforeChange', function(event, slick, currentSlide,nextSlide){
                            $(".biggallery .imgthumb li").removeClass("active");
                            $(".biggallery .imgthumb li").eq(nextSlide).addClass("active");
                            $(".biggallery .biggallerywraper .imgintro li").removeClass("active");
                            $(".biggallery .biggallerywraper .imgintro li").eq(nextSlide).addClass("active");
                        });

                        $(".biggallery .imgthumb li").click(function(){
                            $('.biggallery .biggallerywraper .biggallerylist').slick("slickGoTo",$(this).index());
                        })
                    })
                </script>
            </div>
            <ul class="picwhitenewslist clearfix">
            <c:forEach items="${chineseAll}" var="chineseAll">
                <script language="javascript" type="text/javascript">
                    $(document).ready(function(){
                        getResData();
                        function getResData(){
                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20191115111315714796419&"+Math.random(), function(data){
                                $("#itemlist_total_20191115111315714796419").empty();
                                $("#itemlist_total_20191115111315714796419").append(data);
                            });
                        };
                    });
                </script>
                <li>
                    <figure>
                        <a href="#" target="_blank"><img src="${chineseAll.photo}"></a>
                        <figcaption><a target="_blank" href="#" class="jiequ">【${chineseAll.info_type}】${chineseAll.title}</a></figcaption>
                        <div class="thumb"><i class="thunews-clock-o"></i>${chineseAll.date}<i class="thunews-eye"></i> <font id="font_itemlist_total_20191115111315714796419"><span id="itemlist_total_20191115111315714796419"></span></font></div>
                    </figure>
                </li>
            </c:forEach>
<%--                <script language="javascript" type="text/javascript">--%>
<%--                    $(document).ready(function(){--%>
<%--                        getResData();--%>
<%--                        function getResData(){--%>
<%--                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20191106111628773279674&"+Math.random(), function(data){--%>
<%--                                $("#itemlist_total_20191106111628773279674").empty();--%>
<%--                                $("#itemlist_total_20191106111628773279674").append(data);--%>
<%--                            });--%>
<%--                        };--%>
<%--                    });--%>
<%--                </script>--%>
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <a href="publish/thunews/9652/2019/20191106111628773279674/20191106111628773279674_.html" target="_blank"><img src="publish/thunews/9652/20191106111628773279674/20191108103911942168184.jpg"></a>--%>
<%--                        <figcaption><a target="_blank" href="publish/thunews/9652/2019/20191106111628773279674/20191106111628773279674_.html" class="jiequ">【组图】漫步清华园 徒爱清华秋</a></figcaption>--%>
<%--                        <div class="thumb"><i class="thunews-clock-o"></i>2019.11.08 <i class="thunews-eye"></i> <font id="font_itemlist_total_20191106111628773279674"><span id="itemlist_total_20191106111628773279674"></span></font></div>--%>
<%--                    </figure>--%>
<%--                </li>--%>
<%--                <script language="javascript" type="text/javascript">--%>
<%--                    $(document).ready(function(){--%>
<%--                        getResData();--%>
<%--                        function getResData(){--%>
<%--                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20191029145736856666520&"+Math.random(), function(data){--%>
<%--                                $("#itemlist_total_20191029145736856666520").empty();--%>
<%--                                $("#itemlist_total_20191029145736856666520").append(data);--%>
<%--                            });--%>
<%--                        };--%>
<%--                    });--%>
<%--                </script>--%>
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <a href="publish/thunews/9652/2019/20191029145736856666520/20191029145736856666520_.html" target="_blank"><img src="publish/thunews/9652/20191029145736856666520/20191031095527869297113.jpg"></a>--%>
<%--                        <figcaption><a target="_blank" href="publish/thunews/9652/2019/20191029145736856666520/20191029145736856666520_.html" class="jiequ">【组图】欲说少年梦 何不趁秋光</a></figcaption>--%>
<%--                        <div class="thumb"><i class="thunews-clock-o"></i>2019.10.31 <i class="thunews-eye"></i> <font id="font_itemlist_total_20191029145736856666520"><span id="itemlist_total_20191029145736856666520"></span></font></div>--%>
<%--                    </figure>--%>
<%--                </li>--%>
<%--                <script language="javascript" type="text/javascript">--%>
<%--                    $(document).ready(function(){--%>
<%--                        getResData();--%>
<%--                        function getResData(){--%>
<%--                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20191023142354224842345&"+Math.random(), function(data){--%>
<%--                                $("#itemlist_total_20191023142354224842345").empty();--%>
<%--                                $("#itemlist_total_20191023142354224842345").append(data);--%>
<%--                            });--%>
<%--                        };--%>
<%--                    });--%>
<%--                </script>--%>
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <a href="publish/thunews/9652/2019/20191023142354224842345/20191023142354224842345_.html" target="_blank"><img src="publish/thunews/9666/20191023142354224842345/20191025154921254323705.jpg"></a>--%>
<%--                        <figcaption><a target="_blank" href="publish/thunews/9652/2019/20191023142354224842345/20191023142354224842345_.html" class="jiequ">【组图】北京市第二届大学生3D打印大赛在清华举行</a></figcaption>--%>
<%--                        <div class="thumb"><i class="thunews-clock-o"></i>2019.10.25 <i class="thunews-eye"></i> <font id="font_itemlist_total_20191023142354224842345"><span id="itemlist_total_20191023142354224842345"></span></font></div>--%>
<%--                    </figure>--%>
<%--                </li>--%>
<%--                <script language="javascript" type="text/javascript">--%>
<%--                    $(document).ready(function(){--%>
<%--                        getResData();--%>
<%--                        function getResData(){--%>
<%--                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20191015094104599265355&"+Math.random(), function(data){--%>
<%--                                $("#itemlist_total_20191015094104599265355").empty();--%>
<%--                                $("#itemlist_total_20191015094104599265355").append(data);--%>
<%--                            });--%>
<%--                        };--%>
<%--                    });--%>
<%--                </script>--%>
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <a href="publish/thunews/9652/2019/20191015094104599265355/20191015094104599265355_.html" target="_blank"><img src="publish/thunews/9666/20191015094104599265355/20191017140602798948173.jpg"></a>--%>
<%--                        <figcaption><a target="_blank" href="publish/thunews/9652/2019/20191015094104599265355/20191015094104599265355_.html" class="jiequ">【组图】健康始于足下——2019年新生赤足运动会举行</a></figcaption>--%>
<%--                        <div class="thumb"><i class="thunews-clock-o"></i>2019.10.17 <i class="thunews-eye"></i> <font id="font_itemlist_total_20191015094104599265355"><span id="itemlist_total_20191015094104599265355"></span></font></div>--%>
<%--                    </figure>--%>
<%--                </li>--%>
<%--                <script language="javascript" type="text/javascript">--%>
<%--                    $(document).ready(function(){--%>
<%--                        getResData();--%>
<%--                        function getResData(){--%>
<%--                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20191001132932513954927&"+Math.random(), function(data){--%>
<%--                                $("#itemlist_total_20191001132932513954927").empty();--%>
<%--                                $("#itemlist_total_20191001132932513954927").append(data);--%>
<%--                            });--%>
<%--                        };--%>
<%--                    });--%>
<%--                </script>--%>
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <a href="publish/thunews/9652/2019/20191001132932513954927/20191001132932513954927_.html" target="_blank"><img src="publish/thunews/9652/20191001132932513954927/20191001134359333702299.jpg"></a>--%>
<%--                        <figcaption><a target="_blank" href="publish/thunews/9652/2019/20191001132932513954927/20191001132932513954927_.html" class="jiequ">【组图】祖国，我为你自豪——参加国庆群众游行的同学回到清华园</a></figcaption>--%>
<%--                        <div class="thumb"><i class="thunews-clock-o"></i>2019.10.01 <i class="thunews-eye"></i> <font id="font_itemlist_total_20191001132932513954927"><span id="itemlist_total_20191001132932513954927"></span></font></div>--%>
<%--                    </figure>--%>
<%--                </li>--%>
<%--                <script language="javascript" type="text/javascript">--%>
<%--                    $(document).ready(function(){--%>
<%--                        getResData();--%>
<%--                        function getResData(){--%>
<%--                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20191001131540307242860&"+Math.random(), function(data){--%>
<%--                                $("#itemlist_total_20191001131540307242860").empty();--%>
<%--                                $("#itemlist_total_20191001131540307242860").append(data);--%>
<%--                            });--%>
<%--                        };--%>
<%--                    });--%>
<%--                </script>--%>
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <a href="publish/thunews/9652/2019/20191001131540307242860/20191001131540307242860_.html" target="_blank"><img src="publish/thunews/9652/20191001131540307242860/20191001141720383809862.jpg"></a>--%>
<%--                        <figcaption><a target="_blank" href="publish/thunews/9652/2019/20191001131540307242860/20191001131540307242860_.html" class="jiequ">【组图】共同祝福亲爱的祖国</a></figcaption>--%>
<%--                        <div class="thumb"><i class="thunews-clock-o"></i>2019.10.01 <i class="thunews-eye"></i> <font id="font_itemlist_total_20191001131540307242860"><span id="itemlist_total_20191001131540307242860"></span></font></div>--%>
<%--                    </figure>--%>
<%--                </li>--%>
<%--                <script language="javascript" type="text/javascript">--%>
<%--                    $(document).ready(function(){--%>
<%--                        getResData();--%>
<%--                        function getResData(){--%>
<%--                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20191001100319856587408&"+Math.random(), function(data){--%>
<%--                                $("#itemlist_total_20191001100319856587408").empty();--%>
<%--                                $("#itemlist_total_20191001100319856587408").append(data);--%>
<%--                            });--%>
<%--                        };--%>
<%--                    });--%>
<%--                </script>--%>
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <a href="publish/thunews/9652/2019/20191001100319856587408/20191001100319856587408_.html" target="_blank"><img src="publish/thunews/9652/20191001100319856587408/20191001102209559478563.jpg"></a>--%>
<%--                        <figcaption><a target="_blank" href="publish/thunews/9652/2019/20191001100319856587408/20191001100319856587408_.html" class="jiequ">【组图】今天是你的生日，我的中国</a></figcaption>--%>
<%--                        <div class="thumb"><i class="thunews-clock-o"></i>2019.10.01 <i class="thunews-eye"></i> <font id="font_itemlist_total_20191001100319856587408"><span id="itemlist_total_20191001100319856587408"></span></font></div>--%>
<%--                    </figure>--%>
<%--                </li>--%>
<%--                <script language="javascript" type="text/javascript">--%>
<%--                    $(document).ready(function(){--%>
<%--                        getResData();--%>
<%--                        function getResData(){--%>
<%--                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20190927103943554764584&"+Math.random(), function(data){--%>
<%--                                $("#itemlist_total_20190927103943554764584").empty();--%>
<%--                                $("#itemlist_total_20190927103943554764584").append(data);--%>
<%--                            });--%>
<%--                        };--%>
<%--                    });--%>
<%--                </script>--%>
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <a href="publish/thunews/9652/2019/20190927103943554764584/20190927103943554764584_.html" target="_blank"><img src="publish/thunews/9652/20190927103943554764584/20190927105016035300639.jpg"></a>--%>
<%--                        <figcaption><a target="_blank" href="publish/thunews/9652/2019/20190927103943554764584/20190927103943554764584_.html" class="jiequ">【组图】国旗，从清华园升起</a></figcaption>--%>
<%--                        <div class="thumb"><i class="thunews-clock-o"></i>2019.09.27 <i class="thunews-eye"></i> <font id="font_itemlist_total_20190927103943554764584"><span id="itemlist_total_20190927103943554764584"></span></font></div>--%>
<%--                    </figure>--%>
<%--                </li>--%>
<%--                <script language="javascript" type="text/javascript">--%>
<%--                    $(document).ready(function(){--%>
<%--                        getResData();--%>
<%--                        function getResData(){--%>
<%--                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20190911145158401852153&"+Math.random(), function(data){--%>
<%--                                $("#itemlist_total_20190911145158401852153").empty();--%>
<%--                                $("#itemlist_total_20190911145158401852153").append(data);--%>
<%--                            });--%>
<%--                        };--%>
<%--                    });--%>
<%--                </script>--%>
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <a href="publish/thunews/9652/2019/20190911145158401852153/20190911145158401852153_.html" target="_blank"><img src="publish/thunews/9666/20190911145158401852153/20190911145447003394855.jpg"></a>--%>
<%--                        <figcaption><a target="_blank" href="publish/thunews/9652/2019/20190911145158401852153/20190911145158401852153_.html" class="jiequ">【组图】2019年清华研究生运动会为祖国喝彩</a></figcaption>--%>
<%--                        <div class="thumb"><i class="thunews-clock-o"></i>2019.09.12 <i class="thunews-eye"></i> <font id="font_itemlist_total_20190911145158401852153"><span id="itemlist_total_20190911145158401852153"></span></font></div>--%>
<%--                    </figure>--%>
<%--                </li>--%>
<%--                <script language="javascript" type="text/javascript">--%>
<%--                    $(document).ready(function(){--%>
<%--                        getResData();--%>
<%--                        function getResData(){--%>
<%--                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20190909135048721703114&"+Math.random(), function(data){--%>
<%--                                $("#itemlist_total_20190909135048721703114").empty();--%>
<%--                                $("#itemlist_total_20190909135048721703114").append(data);--%>
<%--                            });--%>
<%--                        };--%>
<%--                    });--%>
<%--                </script>--%>
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <a href="publish/thunews/9652/2019/20190909135048721703114/20190909135048721703114_.html" target="_blank"><img src="publish/thunews/9652/20190825090818683511348/20190909145723327253897.jpg"></a>--%>
<%--                        <figcaption><a target="_blank" href="publish/thunews/9652/2019/20190909135048721703114/20190909135048721703114_.html" class="jiequ">【组图】九字班集结完毕，请检阅！</a></figcaption>--%>
<%--                        <div class="thumb"><i class="thunews-clock-o"></i>2019.09.10 <i class="thunews-eye"></i> <font id="font_itemlist_total_20190909135048721703114"><span id="itemlist_total_20190909135048721703114"></span></font></div>--%>
<%--                    </figure>--%>
<%--                </li>--%>
<%--                <script language="javascript" type="text/javascript">--%>
<%--                    $(document).ready(function(){--%>
<%--                        getResData();--%>
<%--                        function getResData(){--%>
<%--                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20190909084123389596286&"+Math.random(), function(data){--%>
<%--                                $("#itemlist_total_20190909084123389596286").empty();--%>
<%--                                $("#itemlist_total_20190909084123389596286").append(data);--%>
<%--                            });--%>
<%--                        };--%>
<%--                    });--%>
<%--                </script>--%>
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <a href="publish/thunews/9652/2019/20190909084123389596286/20190909084123389596286_.html" target="_blank"><img src="publish/thunews/9652/20190909084123389596286/20190909085129455693126.jpg"></a>--%>
<%--                        <figcaption><a target="_blank" href="publish/thunews/9652/2019/20190909084123389596286/20190909084123389596286_.html" class="jiequ">【组图】700余人参加2019-2020学年度清华大学升国旗仪式</a></figcaption>--%>
<%--                        <div class="thumb"><i class="thunews-clock-o"></i>2019.09.09 <i class="thunews-eye"></i> <font id="font_itemlist_total_20190909084123389596286"><span id="itemlist_total_20190909084123389596286"></span></font></div>--%>
<%--                    </figure>--%>
<%--                </li>--%>
<%--                <script language="javascript" type="text/javascript">--%>
<%--                    $(document).ready(function(){--%>
<%--                        getResData();--%>
<%--                        function getResData(){--%>
<%--                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20190906160403571257688&"+Math.random(), function(data){--%>
<%--                                $("#itemlist_total_20190906160403571257688").empty();--%>
<%--                                $("#itemlist_total_20190906160403571257688").append(data);--%>
<%--                            });--%>
<%--                        };--%>
<%--                    });--%>
<%--                </script>--%>
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <a href="publish/thunews/9652/2019/20190906160403571257688/20190906160403571257688_.html" target="_blank"><img src="publish/thunews/9652/20190906160403571257688/20190906161758519152924.jpg"></a>--%>
<%--                        <figcaption><a target="_blank" href="publish/thunews/9652/2019/20190906160403571257688/20190906160403571257688_.html" class="jiequ">【组图】清华大学2019年迎新晚会异彩纷呈</a></figcaption>--%>
<%--                        <div class="thumb"><i class="thunews-clock-o"></i>2019.09.06 <i class="thunews-eye"></i> <font id="font_itemlist_total_20190906160403571257688"><span id="itemlist_total_20190906160403571257688"></span></font></div>--%>
<%--                    </figure>--%>
<%--                </li>--%>
<%--                <script language="javascript" type="text/javascript">--%>
<%--                    $(document).ready(function(){--%>
<%--                        getResData();--%>
<%--                        function getResData(){--%>
<%--                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20190829114557108707418&"+Math.random(), function(data){--%>
<%--                                $("#itemlist_total_20190829114557108707418").empty();--%>
<%--                                $("#itemlist_total_20190829114557108707418").append(data);--%>
<%--                            });--%>
<%--                        };--%>
<%--                    });--%>
<%--                </script>--%>
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <a href="#" target="_blank"><img src=""></a>--%>
<%--                        <figcaption><a target="_blank" href="#" class="jiequ">【组图】书香润清华 开卷益青春——清华图书馆喜迎九字班新读者</a></figcaption>--%>
<%--                        <div class="thumb"><i class="thunews-clock-o"></i>2019.08.29 <i class="thunews-eye"></i> <font id="font_itemlist_total_20190829114557108707418"><span id="itemlist_total_20190829114557108707418"></span></font></div>--%>
<%--                    </figure>--%>
<%--                </li>--%>
<%--                <script language="javascript" type="text/javascript">--%>
<%--                    $(document).ready(function(){--%>
<%--                        getResData();--%>
<%--                        function getResData(){--%>
<%--                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20190828090937944801542&"+Math.random(), function(data){--%>
<%--                                $("#itemlist_total_20190828090937944801542").empty();--%>
<%--                                $("#itemlist_total_20190828090937944801542").append(data);--%>
<%--                            });--%>
<%--                        };--%>
<%--                    });--%>
<%--                </script>--%>
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <a href="publish/thunews/9652/2019/20190828090937944801542/20190828090937944801542_.html" target="_blank"><img src="publish/thunews/9666/20190828090937944801542/20190828112755416381061.jpg"></a>--%>
<%--                        <figcaption><a target="_blank" href="publish/thunews/9652/2019/20190828090937944801542/20190828090937944801542_.html" class="jiequ">【组图】2019年中外研究生新生欢迎会搭建沟通桥梁</a></figcaption>--%>
<%--                        <div class="thumb"><i class="thunews-clock-o"></i>2019.08.28 <i class="thunews-eye"></i> <font id="font_itemlist_total_20190828090937944801542"><span id="itemlist_total_20190828090937944801542"></span></font></div>--%>
<%--                    </figure>--%>
<%--                </li>--%>
<%--                <script language="javascript" type="text/javascript">--%>
<%--                    $(document).ready(function(){--%>
<%--                        getResData();--%>
<%--                        function getResData(){--%>
<%--                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20190825090818683511348&"+Math.random(), function(data){--%>
<%--                                $("#itemlist_total_20190825090818683511348").empty();--%>
<%--                                $("#itemlist_total_20190825090818683511348").append(data);--%>
<%--                            });--%>
<%--                        };--%>
<%--                    });--%>
<%--                </script>--%>
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <a href="publish/thunews/9652/2019/20190825090818683511348/20190825090818683511348_.html" target="_blank"><img src="publish/thunews/9652/20190825090818683511348/20190826084402850595596.jpg"></a>--%>
<%--                        <figcaption><a target="_blank" href="publish/thunews/9652/2019/20190825090818683511348/20190825090818683511348_.html" class="jiequ">【组图】勇往直前！清华大学本科生新生军训拉练现场直击</a></figcaption>--%>
<%--                        <div class="thumb"><i class="thunews-clock-o"></i>2019.08.25 <i class="thunews-eye"></i> <font id="font_itemlist_total_20190825090818683511348"><span id="itemlist_total_20190825090818683511348"></span></font></div>--%>
<%--                    </figure>--%>
<%--                </li>--%>
<%--                <script language="javascript" type="text/javascript">--%>
<%--                    $(document).ready(function(){--%>
<%--                        getResData();--%>
<%--                        function getResData(){--%>
<%--                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20190821111748778836918&"+Math.random(), function(data){--%>
<%--                                $("#itemlist_total_20190821111748778836918").empty();--%>
<%--                                $("#itemlist_total_20190821111748778836918").append(data);--%>
<%--                            });--%>
<%--                        };--%>
<%--                    });--%>
<%--                </script>--%>
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <a href="publish/thunews/9652/2019/20190821111748778836918/20190821111748778836918_.html" target="_blank"><img src="publish/thunews/9652/20190821111748778836918/20190821112039133387879.jpg"></a>--%>
<%--                        <figcaption><a target="_blank" href="publish/thunews/9652/2019/20190821111748778836918/20190821111748778836918_.html" class="jiequ">【迎新组图】2019级研究生新生开学典礼现场直击</a></figcaption>--%>
<%--                        <div class="thumb"><i class="thunews-clock-o"></i>2019.08.21 <i class="thunews-eye"></i> <font id="font_itemlist_total_20190821111748778836918"><span id="itemlist_total_20190821111748778836918"></span></font></div>--%>
<%--                    </figure>--%>
<%--                </li>--%>
<%--                <script language="javascript" type="text/javascript">--%>
<%--                    $(document).ready(function(){--%>
<%--                        getResData();--%>
<%--                        function getResData(){--%>
<%--                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20190821091029147265558&"+Math.random(), function(data){--%>
<%--                                $("#itemlist_total_20190821091029147265558").empty();--%>
<%--                                $("#itemlist_total_20190821091029147265558").append(data);--%>
<%--                            });--%>
<%--                        };--%>
<%--                    });--%>
<%--                </script>--%>
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <a href="publish/thunews/9652/2019/20190821091029147265558/20190821091029147265558_.html" target="_blank"><img src="publish/thunews/9652/20190821091029147265558/20190821095020794985667.jpg"></a>--%>
<%--                        <figcaption><a target="_blank" href="publish/thunews/9652/2019/20190821091029147265558/20190821091029147265558_.html" class="jiequ">【迎新组图】2019级研究生新生开学典礼精彩瞬间</a></figcaption>--%>
<%--                        <div class="thumb"><i class="thunews-clock-o"></i>2019.08.21 <i class="thunews-eye"></i> <font id="font_itemlist_total_20190821091029147265558"><span id="itemlist_total_20190821091029147265558"></span></font></div>--%>
<%--                    </figure>--%>
<%--                </li>--%>
<%--                <script language="javascript" type="text/javascript">--%>
<%--                    $(document).ready(function(){--%>
<%--                        getResData();--%>
<%--                        function getResData(){--%>
<%--                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20190820111002332930252&"+Math.random(), function(data){--%>
<%--                                $("#itemlist_total_20190820111002332930252").empty();--%>
<%--                                $("#itemlist_total_20190820111002332930252").append(data);--%>
<%--                            });--%>
<%--                        };--%>
<%--                    });--%>
<%--                </script>--%>
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <a href="publish/thunews/9652/2019/20190820111002332930252/20190820111002332930252_.html" target="_blank"><img src="publish/thunews/9652/20190820111002332930252/20190820124552620366450.jpg"></a>--%>
<%--                        <figcaption><a target="_blank" href="publish/thunews/9652/2019/20190820111002332930252/20190820111002332930252_.html" class="jiequ">【迎新组图】2019级研究生新生报到撷英</a></figcaption>--%>
<%--                        <div class="thumb"><i class="thunews-clock-o"></i>2019.08.20 <i class="thunews-eye"></i> <font id="font_itemlist_total_20190820111002332930252"><span id="itemlist_total_20190820111002332930252"></span></font></div>--%>
<%--                    </figure>--%>
<%--                </li>--%>
<%--                <script language="javascript" type="text/javascript">--%>
<%--                    $(document).ready(function(){--%>
<%--                        getResData();--%>
<%--                        function getResData(){--%>
<%--                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20190820090820598966703&"+Math.random(), function(data){--%>
<%--                                $("#itemlist_total_20190820090820598966703").empty();--%>
<%--                                $("#itemlist_total_20190820090820598966703").append(data);--%>
<%--                            });--%>
<%--                        };--%>
<%--                    });--%>
<%--                </script>--%>
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <a href="publish/thunews/9652/2019/20190820090820598966703/20190820090820598966703_.html" target="_blank"><img src="publish/thunews/9652/20190820090820598966703/20190820154620796276644.jpg"></a>--%>
<%--                        <figcaption><a target="_blank" href="publish/thunews/9652/2019/20190820090820598966703/20190820090820598966703_.html" class="jiequ">【迎新组图】2019级研究生新生雨中报到清华园</a></figcaption>--%>
<%--                        <div class="thumb"><i class="thunews-clock-o"></i>2019.08.20 <i class="thunews-eye"></i> <font id="font_itemlist_total_20190820090820598966703"><span id="itemlist_total_20190820090820598966703"></span></font></div>--%>
<%--                    </figure>--%>
<%--                </li>--%>
<%--                <script language="javascript" type="text/javascript">--%>
<%--                    $(document).ready(function(){--%>
<%--                        getResData();--%>
<%--                        function getResData(){--%>
<%--                            jQuery.get("application/visitor/article_list_visitors_2.jsp?articleID=20190815135033956435938&"+Math.random(), function(data){--%>
<%--                                $("#itemlist_total_20190815135033956435938").empty();--%>
<%--                                $("#itemlist_total_20190815135033956435938").append(data);--%>
<%--                            });--%>
<%--                        };--%>
<%--                    });--%>
<%--                </script>--%>
<%--                <li>--%>
<%--                    <figure>--%>
<%--                        <a href="publish/thunews/9652/2019/20190815135033956435938/20190815135033956435938_.html" target="_blank"><img src="publish/thunews/9652/20190815135033956435938/20190815143131592132274.jpg"></a>--%>
<%--                        <figcaption><a target="_blank" href="publish/thunews/9652/2019/20190815135033956435938/20190815135033956435938_.html" class="jiequ">【组图】展青春风采 谱人生华章</a></figcaption>--%>
<%--                        <div class="thumb"><i class="thunews-clock-o"></i>2019.08.15 <i class="thunews-eye"></i> <font id="font_itemlist_total_20190815135033956435938"><span id="itemlist_total_20190815135033956435938"></span></font></div>--%>
<%--                    </figure>--%>
<%--                </li>--%>
<%--            </ul>--%>
            <script type="text/javascript">
                var strUrl = window.location.href;
                var curPage=1;
                var pageCount = 21;//total pages count
                if(strUrl.lastIndexOf('index_')!=-1)
                    curPage=parseInt(strUrl.substring(strUrl.lastIndexOf('_')+1,strUrl.lastIndexOf('.')));//current page number
                var pageStr = "<div class=\"pager\">";
                if(pageCount>1){
                    pageStr += '<a href="javascript:;" class="p" title="前一页" onclick="doGo('+(curPage-1)+');">«</a>';
                }
                if(pageCount <= 9){
                    for(var i=0;i<pageCount;i++){
                        var currentClass = ((i+1)==curPage)?"current":"";
                        pageStr += '<a href="javascript:;" class="'+currentClass+'" onclick="doGo('+(i+1)+')">'+(i+1)+'</a>';
                    }
                }else if(pageCount > 9 && (curPage + 4) <= pageCount && (curPage - 4) <= 0){
                    for(var i=0;i<9;i++){
                        var currentClass = ((i+1)==curPage)?"current":"";
                        pageStr += '<a href="javascript:;" class="'+currentClass+'" onclick="doGo('+(i+1)+')">'+(i+1)+'</a>';
                    }
                }else if(pageCount > 9 && (curPage + 4) <= pageCount && (curPage - 4) > 0){
                    for(var i=(curPage - 3);i<(curPage + 4);i++){
                        var currentClass = ((i+1)==curPage)?"current":"";
                        pageStr += '<a href="javascript:;" class="'+currentClass+'" onclick="doGo('+(i+1)+')">'+(i+1)+'</a>';
                    }
                }else{
                    for(var i=(pageCount - 8);i<(pageCount);i++){
                        var currentClass = ((i+1)==curPage)?"current":"";
                        pageStr += '<a href="javascript:;" class="'+currentClass+'" onclick="doGo('+(i+1)+')">'+(i+1)+'</a>';
                    }
                }
                if(curPage < pageCount){
                    pageStr += '<a href="javascript:;" onclick="doGo('+(curPage+1)+')" class="p" title="后一页">»</a>';
                }
                pageStr += "<span>到第<input name=\"\" type=\"text\" id=\"ymz\">页 <a href=\"#\"  onclick=\"goto_ymz()\">确定</a></span>";
                pageStr += "</div>";
                var pageStr1 = "<div class=\"mobilemore clearfix\">";
                if(pageCount>1){
                    pageStr1 += '<a href="javascript:;" class="prev" title="上一页" onclick="doGo('+(curPage-1)+');">上一页</a>';
                }
                if(curPage < pageCount){
                    pageStr1 += '<a href="javascript:;" onclick="doGo('+(curPage+1)+')" class="next" title="下一页">下一页</a>';
                }
                pageStr1 += "</div>";
                document.write(pageStr);
                document.write(pageStr1);
            </script>
            <script type="text/javascript">
                function doGo(jumpvalue){
                    if(jumpvalue<1 || jumpvalue>21)
                        return;
                    var urlstr = window.location.href;
                    var urlColumnId = urlstr.substr(urlstr.indexOf('#')+1,8);
                    urlColumnId = urlColumnId.replace("","");
                    if(1==jumpvalue){
                        urlstr = urlstr.substr(0,urlstr.lastIndexOf('')+1)+'index.html';
                    }else{
                        urlstr = urlstr.substr(0,urlstr.lastIndexOf('')+1)+'index_'+jumpvalue+'.html';
                    }
                    window.location.href = urlstr;
                }
                function goto_ymz(){
                    jumpvalue0 = $('#ymz').val();
                    if(jumpvalue0<1 || jumpvalue0>21)
                        return;
                    var urlstr0 = window.location.href;
                    if(1==jumpvalue0){
                        urlstr0 = urlstr0.substr(0,urlstr0.lastIndexOf('')+1)+'index.html';
                    }else{
                        urlstr0 = urlstr0.substr(0,urlstr0.lastIndexOf('')+1)+'index_'+jumpvalue0+'.html';
                    }
                    window.location.href = urlstr0;
                }
            </script>
            <p style="display:none">
<span style='font-size:12px'>
		共<b>436</b>条&nbsp;&nbsp;
		分<b>21</b>页&nbsp;&nbsp;
		当前&nbsp;第<b>1</b>页&nbsp;&nbsp;
		 <font color='#C0C0C0'>首页</font>
		 <font color='#C0C0C0'>上一页</font>
		 <a href='publish/thunews/9652/index_2.html'><font color='#000000'>下一页</font></a>
		 <a href='publish/thunews/9652/index_21.html'><font color='#000000'>末页</font></a>
</span></p>
            <!--<a id="mobilemore" class="mobilemore" href="javascript:;">... 加载更多 ...</a>-->    </section>
        <section class="colunm2">
            <section class="mod withborder">
                <h2><a href="http://tv.tsinghua.edu.cn/" class="more" target="_blank">更多 &#8250;</a><span class="iconwraper"><i class="thunews-play-circle"></i></span>精彩视频</h2>
                <ul class="promvideolist clearfix" id="thunews_jcsp">

                </ul>
            </section>
            <section class="mod withborder">
                <h2 class="red"><span class="iconwraper"><i class="thunews-line-chart"></i></span>近期热点</h2>
                <ul class="newslist clearfix"  id="resText">

                </ul>
            </section>
        </section>

        <script>
            jQuery.ajaxSettings.async = false;
            getResData1();
            function getResData1(){
                jQuery.getJSON("publish/thunews/thunews_tsqh.json?r="+Math.random(), function(data){
                    //$("#thunews_tsqh").empty();
                    jQuery.each(data,function(index){

                        var html = "<li>";
                        html += "<a href=\""+data[index]["href"]+"\" title=\"" +data[index]["span"]+ "\" target=\"_blank\">";
                        html += "<img src=\""+data[index]["src"]+"\">";
                        html += "<div><b></b>";
                        html += "<span>"+data[index]["span"]+"</span>"
                        html += "</div></a></li>";
                        $("#thunews_tsqh").append(html);
                    });
                });
                getResData3();
            };
            function getResData3(){
                jQuery.getJSON("publish/thunews/thunews_jcsp.json?r="+Math.random(), function(data){
                    //$("#thunews_jcsp").empty();
                    jQuery.each(data,function(index){

                        var html = "<li><figure>";
                        html += "<a class=\"promvideo\" href=\""+data[index]["href"]+"\" target=\"_blank\">";
                        html += "<b></b><img src=\""+data[index]["src"]+"\"></a>";
                        html += "<figcaption><a href=\""+data[index]["href"]+"\"  target=\"_blank\">"+data[index]["span"]+"</a></figcaption>";
                        html += " </figure></li>";
                        $("#thunews_jcsp").append(html);
                    });
                });
                getResData4();
            };

            function getResData4(){
                jQuery.getJSON("publish/thunews/thunews_jqrd.json?r="+Math.random(), function(data){
                    //$("#resText").empty();
                    jQuery.each(data,function(entryIndex,entry){
                        var datet = entry["datetime"];
                        datet = datet.replace(/-/g,'.');
                        var html = "<li>";
                        html +="<div class='thumb'><i class='thunews-clock-o'></i>" + datet;
                        html +="<i class='thunews-eye'></i>" + entry["dotnum"];
                        html += "</div>";
                        html += "<a href=\""+entry["href"]+"\" title=\"" +entry["title"]+ "\" target=\"_blank\">" + entry["title"] + "</a>"
                        html += "</li>";
                        $("#resText").append(html);
                    });
                });
                test();
            };

            function test(){
                $('.slidegallery ul').slick({
                    infinite: true,
                    slidesToShow: 1,
                    slidesToScroll: 1,
                    autoplay: true,
                    centerMode: false,
                    dots:true,
                    prevArrow:"<div class=\"sliderbutton prev\"><i class=\"thunews-angle-left\"></i></div>",
                    nextArrow:"<div class=\"sliderbutton next\"><i class=\"thunews-angle-right\"></i></div>"
                });
                $('.slidegallery .sliderbutton.prev,.slidegallery .sliderbutton.next').hide();
            }
        </script>
    </div>
</div>
<footer>
    <div class="mainWrap clearfix">
        <section>
            <div class="thulogo"><img src="publish/thunews/images/thulogo.png"></div>
            <div class="copyright"><span><a href="publish/thunews/10274/index.html">网站地图</a>　│　<a href="publish/thunews/10225/index.html">关于我们</a>　│　<a href="publish/thunews/10217/index.html">友情链接</a>　│　<a href="http://www.tsinghua.edu.cn/publish/newthu/newthu_cnt/intothu/picture/map.png" target="_blank">清华地图</a></span>
                清华大学新闻中心版权所有，清华大学新闻网编辑部维护，电子信箱:news@tsinghua.edu.cn<br>
                Copyright 2001-2020 news.tsinghua.edu.cn. All rights reserved.
            </div>
        </section>
    </div></footer>
</body>
</html>

