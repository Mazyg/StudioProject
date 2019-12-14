<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"+"manage/";
%>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <base href="<%=basePath%>">
    <title>Stellar Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="vendors/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="vendors/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="vendors/chartist/chartist.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="css/style.css">
    <!-- End layout styles -->
    <link rel="shortcut icon" href="images/favicon.png" />
  </head>
<body>

    <div class="container-scroller">
      <!-- partial:partials/_navbar.html -->
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
              <input type="search" class="form-control" placeholder="查询" title="Search here">
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
                <img class="img-xs rounded-circle ml-2" src="<%--images/faces/face8.jpg--%> ${users.photo}" alt="Profile image"> <span class="font-weight-normal"> ${user.uname} </span></a>
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                <div class="dropdown-header text-center">
                  <img class="img-lg rounded-circle" src="${users.photo}" alt="Profile image">
                  <p class="mb-1 mt-3">${user.uname}</p>
                  <p class="font-weight-light text-muted mb-0">${users.email}</p>
                </div>
                <a class="dropdown-item" href="../user/personalInfo.do?${user.uid}"><i class="dropdown-item-icon icon-user text-primary"></i>个人信息</a>
                <a class="dropdown-item"><i class="dropdown-item-icon icon-power text-primary"></i>退出登录</a>
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
        <!-- partial:partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
          <ul class="nav">
            <li class="nav-item nav-profile">
              <a href="javascript:void(0);" class="nav-link">
                <div class="profile-image">
                  <img class="img-xs rounded-circle" src="<%--images/faces/face8.jpg--%>${users.photo}" alt="profile image">
                  <div class="dot-indicator bg-success"></div>
                </div>
                <div class="text-wrapper">
                  <p class="profile-name">${user.uname}</p>
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
              <a class="nav-link" data-toggle="collapse" href="#ui-topic" aria-expanded="false" aria-controls="ui-topic">
                <span class="menu-title">话题管理</span>
                <i class="icon-globe menu-icon"></i>
              </a>
                <div class="collapse" id="ui-topic">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"> <a class="nav-link" href="pages/ui-features/topicput.jsp">发布话题</a></li>
                        <li class="nav-item"> <a class="nav-link" href="../topic/findAllTopicByStatus.do">未审核话题</a></li>
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
            <!--<li class="nav-item pro-upgrade">
              <span class="nav-link">
                <a class="btn btn-block px-0 btn-rounded btn-upgrade" href="#" target="_blank"> <i class="icon-badge mx-2"></i> Upgrade to Pro</a>
              </span>
            </li>-->
          </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="row purchace-popup">
              <div class="col-12 stretch-card grid-margin">
                <div class="card card-secondary">
                  <span class="card-body d-lg-flex align-items-center">
                    <p class="mb-lg-0">Hi! ${users.uname},欢迎进入系统</p>
                    <a href="#" target="_blank" class="btn ml-lg-auto download-button btn-success btn-sm my-1 my-sm-0">开启美好的一天</a>
                    <button class="close popup-dismiss ml-2">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </span>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-md-12">
                        <div class="d-sm-flex align-items-baseline report-summary-header">
                          <h5 class="font-weight-semibold">用户</h5> <span class="ml-auto"></span> <button class="btn btn-icons border-0 p-2"><i class="icon-refresh"></i></button>
                        </div>
                      </div>
                    </div>
                    <div class="row report-inner-cards-wrapper">
                      <div class=" col-md -6 col-xl report-inner-card">
                        <div class="inner-card-text">
                          <span class="report-title">用户总数</span>
                          <h6 style="text-align: center">${userCount}</h6>
                          <br>
                          <span class="report-count"> <%--2 Reports--%>&nbsp;</span>
                        </div>
                        <div class="inner-card-icon bg-success">
                          <i class="icon-people"></i>
                        </div>
                      </div>
                      <div class="col-md-6 col-xl report-inner-card">
                        <div class="inner-card-text">
                          <span class="report-title">管理员</span>
                          <h6 style="text-align: center">${userAdm}</h6>
                          <span class="report-count"> &nbsp;</span>
                        </div>
                        <div class="inner-card-icon bg-primary">
                          <i class="icon-user"></i>
                        </div>
                      </div>
                      <div class="col-md-6 col-xl report-inner-card">
                        <div class="inner-card-text">
                          <span class="report-title">受限用户</span>
                          <h6 style="text-align: center">${userNo}</h6>
                          <span class="report-count"> &nbsp;</span>
                        </div>
                        <div class="inner-card-icon bg-danger">
                          <i class="icon-user-unfollow "></i>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="row">
              <div class="col-md-4 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">话题</h4>
                    <input type="text" class="col-10 form-control"   readonly="readonly" value="话题总数：${topicCount}">
                    <input type="text" class="col-10 form-control"  readonly="readonly" value="">
                    <input type="text" class="col-10 form-control"   readonly="readonly" value="待审核话题：${topicNo}">
                  </div>
                </div>
              </div>
              <div class="col-md-8 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body performane-indicator-card">
                    <div class="d-sm-flex">
                      <h4 class="card-title flex-shrink-1">信息</h4>
                    </div>
                    <div class="d-sm-flex flex-wrap">
                      <div class="d-flex align-items-center">
                        <span class="dot-indicator bg-primary ml-2"></span>
                        <p class="mb-0 ml-2 text-muted font-weight-semibold">信息总数：${infoCount}</p></div>

                      </div>
                    <br>
                    <p class="mb-0 ml-2 text-muted font-weight-semibold">视频信息总数：${infoV}</p>
                    <p class="mb-0 ml-2 text-muted font-weight-semibold">普通信息总数：${infoCount-infoV}</p>
                    </div>
                    <div id="performance-indicator-chart" class="ct-chart mt-4">

                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
          <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted text-center text-sm-left d-block d-sm-inline-block"></span>
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
    <script src="vendors/chart.js/Chart.min.js"></script>
    <script src="vendors/moment/moment.min.js"></script>
    <script src="vendors/daterangepicker/daterangepicker.js"></script>
    <script src="vendors/chartist/chartist.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="js/off-canvas.js"></script>
    <script src="js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="js/dashboard.js"></script>
    <!-- End custom js for this page -->
  </body>
</html>