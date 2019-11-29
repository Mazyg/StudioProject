<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"+"manage/";
%>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>信息管理</title>
    <base href="<%=basePath%>">
    <!-- plugins:css -->
    <link rel="stylesheet" href="vendors/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="css/style.css"/> <!-- End layout styles -->
    <link rel="shortcut icon" href="images/favicon.png" />
    <script src="js/jquery-1.8.3.js"></script>
    <script src="../ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        window.onload = function() {
            CKEDITOR.replace('description');
            $("#title").val('${info.title}');
            $("#info").val('${info.info_type}');
            $("#photo").val('${info.photo}');
            $("#introduction").val('${info.introduce}');
        }
        function selectFile(){
            $("#photo").trigger("click");
        }
        function change(){
            $("#type").val($("#info").val()) ;
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
            <h5 class="mb-0 font-weight-medium d-none d-lg-flex">后台管理系统</h5>
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
                        <img class="img-xs rounded-circle ml-2" src="images/faces/face8.jpg" alt="Profile image"> <span class="font-weight-normal"> ${user.getname()} </span></a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                        <div class="dropdown-header text-center">
                            <img class="img-md rounded-circle" src="images/faces/face8.jpg" alt="Profile image">
                            <p class="mb-1 mt-3">${user.getname()}</p>
                            <p class="font-weight-light text-muted mb-0">${user.getEmail()}</p>
                        </div>
                        <a class="dropdown-item"><i class="dropdown-item-icon icon-user text-primary"></i> 个人信息</a>
                        <a class="dropdown-item" href="pages/samples/login.jsp"><i class="dropdown-item-icon icon-power text-primary"></i>退出登录</a>
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
                            <img class="img-xs rounded-circle" src="images/faces/face8.jpg" alt="profile image">
                            <div class="dot-indicator bg-success"></div>
                        </div>
                        <div class="text-wrapper">
                            <p class="profile-name">${user.getname()}</p>
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
                            <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.jsp">动态管理</a></li>
                            <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.jsp">动态推送</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="pages/icons/simple-line-icons.jsp">
                        <span class="menu-title">话题管理</span>
                        <i class="icon-globe menu-icon"></i>
                    </a>
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
                    <a class="nav-link" href="../user/findAllUser.do">
                        <span class="menu-title">用户管理</span>
                        <i class="icon-grid menu-icon"></i>
                    </a>
                </li>
                <li class="nav-item nav-category"><span class="nav-link">Sample Pages</span></li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                        <span class="menu-title">General Pages</span>
                        <i class="icon-doc menu-icon"></i>
                    </a>
                    <div class="collapse" id="auth">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"> <a class="nav-link" href="pages/samples/login.jsp"> Login </a></li>
                            <li class="nav-item"> <a class="nav-link" href="pages/samples/register.jsp"> Register </a></li>
                            <li class="nav-item"> <a class="nav-link" href="pages/samples/error-404.jsp"> 404 </a></li>
                            <li class="nav-item"> <a class="nav-link" href="pages/samples/error-500.jsp"> 500 </a></li>
                            <li class="nav-item"> <a class="nav-link" href="pages/samples/blank-page.jsp"> Blank Page </a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="page-header">
                    <h2 class="page-title"> 信息管理 </h2>
                </div>
                <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="card-body">
                                <form class="forms-sample" action="../info/updateInfo.do" method="post">
                                    <div class="form-group">
                                        <label for="title">标题</label>
                                        <input type="text" class="form-control" id="title" placeholder="标题" name="title">
                                    </div>
                                    <div class="form-group">
                                    <label for="introduction">简介</label>
                                    <div class="input-group col-xs-12">
                                        <textarea name="content" id="introduction" placeholder="简介" required="required" class="col-10 form-control"  style=" height:80px"></textarea>
                                    </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="info_category"> 信息类别</label>
                                        <div class="col-sm-6" id="info_category">
                                            <select class="form-control" id="info">
                                                <option value="榜样的力量">榜样的力量</option>
                                                <option value="热点时事">热点时事</option>
                                                <option></option>
                                                <option></option>
                                            </select>
                                            <input type="text"  style="display:none" id="type" name="info_type"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>上传封面</label>
                                        <input type="file" name="img[]" class="file-upload-default">
                                        <div class="input-group col-xs-12">
                                            <input type="text" class="form-control file-upload-info" readonly placeholder="上传封面" id="url" name="photo" >
                                            <span class="input-group-append">
                            <input type="file" id="photo" style="display:none" multiple="multiple" onchange="getImage()">
                            <button class="file-upload-browse btn btn-primary" type="button" onclick="selectFile()">上传</button>
                          </span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="description">内容</label>
                                        <textarea id="description"  name="content">${info.content}</textarea>
                                    </div>
                                    <input type="submit" class="btn btn-primary mr-2" value="确认修改" onclick="change()">
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->
            <!-- partial:../../partials/_footer.html -->
            <footer class="footer">
                <div class="d-sm-flex justify-content-center justify-content-sm-between">
                    <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2017  </span>
                </div>
            </footer>
            <!-- partial -->
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- plugins:js -->
<script src="vendors/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="js/off-canvas.js"></script>
<script src="js/misc.js"></script>
<!-- endinject -->
<!-- Custom js for this page -->
<!-- End custom js for this page -->
</body>
</html>