<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"+"manage/";
%>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>反馈回复</title>
    <base href="<%=basePath%>">
    <!-- plugins:css -->
    <link rel="stylesheet" href="vendors/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="vendors/select2/select2.min.css">
    <link rel="stylesheet" href="vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="css/style.css"/><!-- End layout styles -->
    <link rel="shortcut icon" href="images/title.ico" />
    <script src="js/jquery-1.8.3.js"></script>
    <script src="../ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        window.onload = function() {

            $("#userId").val('${param.uid}');
            $("#feedId").val('${param.fid}');

        }

    </script>

</head>
<body>
<div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
        <div class="navbar-brand-wrapper d-flex align-items-center">
            <a class="navbar-brand brand-logo" href="javascript:void(0);">
                <img src="images/logo.svg" alt="logo" class="logo-dark" />
            </a>
            <a class="navbar-brand brand-logo-mini" href="javascript:void(0);"><img src="images/logo-mini.svg" alt="logo" /></a>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-center flex-grow-1">
            <h5 class="mb-0 font-weight-medium d-none d-lg-flex">后台管理界面</h5>
            <ul class="navbar-nav navbar-nav-right ml-auto">
                <form class="search-form d-none d-md-block" action="#">
                    <i class="icon-magnifier"></i>
                    <input type="search" class="form-control" placeholder="查找" title="Search here">
                </form>
                <li class="nav-item dropdown language-dropdown d-none d-sm-flex align-items-center">
                    <a class="nav-link d-flex align-items-center dropdown-toggle" id="LanguageDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                        <div class="d-inline-flex mr-3">
                            <i class="flag-icon flag-icon-cn"></i>
                        </div>
                        <span class="profile-text font-weight-normal">中文</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-left navbar-dropdown py-2" aria-labelledby="LanguageDropdown">
                        <a class="dropdown-item">
                            <i class="flag-icon flag-icon-us"></i> English </a>
                    </div>
                </li>
                <li class="nav-item dropdown d-none d-xl-inline-flex user-dropdown">
                    <a class="nav-link dropdown-toggle" id="UserDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                        <img class="img-xs rounded-circle ml-2" src="<%--images/faces/face8.jpg--%>${users.photo}" alt="Profile image"> <span class="font-weight-normal"> ${users.uname} </span></a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                        <div class="dropdown-header text-center">
                            <img class="img-lg rounded-circle" src="<%--images/faces/face8.jpg--%>${users.photo}" alt="Profile image">
                            <p class="mb-1 mt-3">${users.uname}</p>
                            <p class="font-weight-light text-muted mb-0">${users.phone}</p>
                        </div>
                        <a class="dropdown-item" href="../user/personalInfo.do?uid=${users.uid}"><i class="dropdown-item-icon icon-user text-primary"></i> 个人信息</a>
                        <a href="../info/findInfoBytype.do" class="dropdown-item"><i class="dropdown-item-icon  icon-cursor text-primary"></i>用户界面</a>
                        <a class="dropdown-item" href="../user/exitLogin.do"><i class="dropdown-item-icon icon-power text-primary"></i>退出登录</a>
                    </div>
                </li>
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                <span class="icon-menu"></span>
            </button>
        </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
            <ul class="nav">
                <li class="nav-item nav-profile">
                    <a href="javascript:void(0);" class="nav-link">
                        <div class="profile-image">
                            <img class="img-xs rounded-circle" src="<%--images/faces/face8.jpg--%>${users.photo}" alt="profile image">
                            <div class="dot-indicator bg-success"></div>
                        </div>
                        <div class="text-wrapper">
                            <p class="profile-name">${users.uname}</p>
                            <p class="designation">管理员</p>
                        </div>
                    </a>
                </li>
                <li class="nav-item nav-category"><span class="nav-link">功能列表</span></li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
                        <span class="menu-title">动态管理</span>
                        <i class="icon-layers menu-icon"></i>
                    </a>
                    <div class="collapse" id="ui-basic">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="../dynamic/findAllTopic.do">动态管理</a></li>

                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#feedback" aria-expanded="false" aria-controls="ui-basic">
                        <span class="menu-title">用户反馈</span>
                        <i class="icon-layers menu-icon"></i>
                    </a>
                    <div class="collapse" id="feedback">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="../feedback/findAllFeedback.do">用户反馈</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#ui-topic" aria-expanded="false" aria-controls="ui-topic">
                        <span class="menu-title">话题管理</span>
                        <i class="icon-globe menu-icon"></i>
                    </a>
                    <div class="collapse" id="ui-topic">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="pages/ui-features/topicput.jsp">发布话题</a></li>
                            <li class="nav-item"> <a class="nav-link" href="../topic/findAllTopicByStatus.do ">未审核话题</a></li>
                            <li class="nav-item"> <a class="nav-link" href="../topic/findAll.do">全部话题</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#info_manage" aria-expanded="false" aria-controls="info_manage">
                        <span class="menu-title">首页信息管理</span>
                        <i class="icon-book-open menu-icon"></i>
                    </a>
                    <div class="collapse" id="info_manage">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="pages/forms/basic_elements.jsp">信息推送</a></li>
                            <li class="nav-item"> <a class="nav-link" href="../info/findAllInfo.do">信息管理</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#user_manage" aria-expanded="false" aria-controls="user_manage">
                        <span class="menu-title">用户管理</span>
                        <i class="icon-grid menu-icon"></i>
                    </a>
                    <div class="collapse" id="user_manage">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="../user/findAllUser.do">用户</a></li>
                            <li class="nav-item"> <a class="nav-link" href="../user/findAllAdmin.do">管理员</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="page-header">
                    <h3 class="page-title"> 反馈回复 </h3>
                </div>
                <div class="row">
                    <div class="col-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <form class="forms-sample" <%--action="../topic/saveTopic.do"--%> method="post">

                                    <form class="form-inline">
                                        <div class="form-group">
                                            <label for="feedId">反馈ID</label>
                                            <input type="text" class="form-control" id="feedId" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="userId">用户ID</label>
                                            <input type="text" class="form-control" id="userId" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="content"></label>
                                            <textarea class="form-control" rows="3" id="content" placeholder="请输入反馈给用户的内容"></textarea>
                                        </div>
                                    </form>

                                    <input type="button" class="btn btn-primary mr-2"   value="发送" id="sendMessage" >
                                    <input type="reset" class="btn btn-light" value="重置">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<script>
    $(function () {
        $("#sendMessage").click(function () {
            var $content = $('#content').val();
            var $uid = $('#userId').val();
            var $fid = $('#feedId').val();


            $.ajax({
                url:"../feedback/addNotify.do",
                data:"&content="+$content+"&receiver="+$uid+"&fid="+$fid,
                type:"post",
                success:function (result) {
                    if (result == "success"){
                        alert("发送成功");
                        window.location.href = "../feedback/findAllFeedback.do";
                    }else {
                        alert("发送失败");
                    }
                }
            });
        });
    })
</script>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="vendors/select2/select2.min.js"></script>
<script src="vendors/typeahead.js/typeahead.bundle.min.js"></script>
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="js/off-canvas.js"></script>
<script src="js/misc.js"></script>
<!-- endinject -->
<!-- Custom js for this page -->
<script src="js/typeahead.js"></script>
<script src="js/select2.js"></script>
<!-- End custom js for this page -->

</body>
</html>