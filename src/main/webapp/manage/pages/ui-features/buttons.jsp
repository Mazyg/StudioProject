<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"+"manage/";
%>
<html >
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>动态管理</title>
    <base href="<%=basePath%>">
    <!-- plugins:css -->
    <link rel="stylesheet" href="vendors/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End Plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="css/style.css"/> <!-- End layout styles -->
    <link rel="shortcut icon" href="images/favicon.png" />
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
                <img class="img-xs rounded-circle ml-2" src="images/faces/face8.jpg" alt="Profile image"> <span class="font-weight-normal"> ${users.uname} </span></a>
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                <div class="dropdown-header text-center">
                  <img class="img-md rounded-circle" src="images/faces/face8.jpg" alt="Profile image">
                  <p class="mb-1 mt-3">${users.uname}</p>
                  <p class="font-weight-light text-muted mb-0">${users.email}</p>
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
                  <li class="nav-item"> <a class="nav-link" href="pages/ui-features/buttons.jsp">动态管理</a></li>
                  <li class="nav-item"> <a class="nav-link" href="pages/ui-features/typography.jsp">动态推送</a></li>
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
              <h3 class="page-title"> Buttons </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">UI Elements</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Buttons</li>
                </ol>
              </nav>
            </div>
            <div class="row">
              <div class="col-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Single color buttons</h4>
                    <p class="card-description">Add class <code>.btn-{color}</code> for buttons in theme colors</p>
                    <div class="template-demo">
                      <button type="button" class="btn btn-primary btn-fw">Primary</button>
                      <button type="button" class="btn btn-secondary btn-fw">Secondary</button>
                      <button type="button" class="btn btn-success btn-fw">Success</button>
                      <button type="button" class="btn btn-danger btn-fw">Danger</button>
                      <button type="button" class="btn btn-warning btn-fw">Warning</button>
                      <button type="button" class="btn btn-info btn-fw">Info</button>
                      <button type="button" class="btn btn-light btn-fw">Light</button>
                      <button type="button" class="btn btn-dark btn-fw">Dark</button>
                      <button type="button" class="btn btn-link btn-fw">Link</button>
                    </div>
                  </div>
                  <div class="card-body">
                    <h4 class="card-title">Inverse buttons</h4>
                    <p class="card-description">Add class <code>.btn-inverse-{color} for inverse buttons</code></p>
                    <div class="template-demo">
                      <button type="button" class="btn btn-inverse-primary btn-fw">Primary</button>
                      <button type="button" class="btn btn-inverse-secondary btn-fw">Secondary</button>
                      <button type="button" class="btn btn-inverse-success btn-fw">Success</button>
                      <button type="button" class="btn btn-inverse-danger btn-fw">Danger</button>
                      <button type="button" class="btn btn-inverse-warning btn-fw">Warning</button>
                      <button type="button" class="btn btn-inverse-info btn-fw">Info</button>
                      <button type="button" class="btn btn-inverse-light btn-fw">Light</button>
                      <button type="button" class="btn btn-inverse-dark btn-fw">Dark</button>
                      <button type="button" class="btn btn-link btn-fw">Link</button>
                    </div>
                  </div>
                  <div class="card-body">
                    <h4 class="card-title">Rounded buttons</h4>
                    <p class="card-description">Add class <code>.btn-rounded</code></p>
                    <div class="template-demo">
                      <button type="button" class="btn btn-primary btn-rounded btn-fw">Primary</button>
                      <button type="button" class="btn btn-secondary btn-rounded btn-fw">Secondary</button>
                      <button type="button" class="btn btn-success btn-rounded btn-fw">Success</button>
                      <button type="button" class="btn btn-danger btn-rounded btn-fw">Danger</button>
                      <button type="button" class="btn btn-warning btn-rounded btn-fw">Warning</button>
                      <button type="button" class="btn btn-info btn-rounded btn-fw">Info</button>
                      <button type="button" class="btn btn-light btn-rounded btn-fw">Light</button>
                      <button type="button" class="btn btn-dark btn-rounded btn-fw">Dark</button>
                      <button type="button" class="btn btn-link btn-rounded btn-fw">Link</button>
                    </div>
                  </div>
                  <div class="card-body">
                    <h4 class="card-title">Outlined buttons</h4>
                    <p class="card-description">Add class <code>.btn-outline-{color}</code> for outline buttons</p>
                    <div class="template-demo">
                      <button type="button" class="btn btn-outline-primary btn-fw">Primary</button>
                      <button type="button" class="btn btn-outline-secondary btn-fw">Secondary</button>
                      <button type="button" class="btn btn-outline-success btn-fw">Success</button>
                      <button type="button" class="btn btn-outline-danger btn-fw">Danger</button>
                      <button type="button" class="btn btn-outline-warning btn-fw">Warning</button>
                      <button type="button" class="btn btn-outline-info btn-fw">Info</button>
                      <button type="button" class="btn btn-outline-light btn-fw">Light</button>
                      <button type="button" class="btn btn-outline-dark btn-fw">Dark</button>
                      <button type="button" class="btn btn-link btn-fw">Link</button>
                    </div>
                  </div>
                  <div class="card-body">
                    <h4 class="card-title">Normal buttons</h4>
                    <p class="card-description">Use any of the available button classes to quickly create a styled button.</p>
                    <div class="template-demo">
                      <button type="button" class="btn btn-primary">Primary</button>
                      <button type="button" class="btn btn-secondary">Secondary</button>
                      <button type="button" class="btn btn-success">Success</button>
                      <button type="button" class="btn btn-danger">Danger</button>
                      <button type="button" class="btn btn-warning">Warning</button>
                      <button type="button" class="btn btn-info">Info</button>
                      <button type="button" class="btn btn-light">Light</button>
                      <button type="button" class="btn btn-dark">Dark</button>
                      <button type="button" class="btn btn-link">Link</button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-8 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-md-7">
                        <h4 class="card-title">Icon Buttons</h4>
                        <p class="card-description">Add class <code>.btn-icon</code> for buttons with only icons</p>
                        <div class="template-demo d-flex justify-content-between flex-nowrap">
                          <button type="button" class="btn btn-primary btn-rounded btn-icon">
                            <i class="icon-home"></i>
                          </button>
                          <button type="button" class="btn btn-dark btn-rounded btn-icon">
                            <i class="icon-globe"></i>
                          </button>
                          <button type="button" class="btn btn-danger btn-rounded btn-icon">
                            <i class="icon-envelope-open"></i>
                          </button>
                          <button type="button" class="btn btn-info btn-rounded btn-icon">
                            <i class="icon-star"></i>
                          </button>
                          <button type="button" class="btn btn-success btn-rounded btn-icon">
                            <i class="icon-location-pin"></i>
                          </button>
                        </div>
                        <div class="template-demo d-flex justify-content-between flex-nowrap">
                          <button type="button" class="btn btn-inverse-primary btn-rounded btn-icon">
                            <i class="icon-home"></i>
                          </button>
                          <button type="button" class="btn btn-inverse-dark btn-icon">
                            <i class="icon-globe"></i>
                          </button>
                          <button type="button" class="btn btn-inverse-danger btn-icon">
                            <i class="icon-envelope-open"></i>
                          </button>
                          <button type="button" class="btn btn-inverse-info btn-icon">
                            <i class="icon-star"></i>
                          </button>
                          <button type="button" class="btn btn-inverse-success btn-icon">
                            <i class="icon-location-pin"></i>
                          </button>
                        </div>
                        <div class="template-demo d-flex justify-content-between flex-nowrap mt-4">
                          <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                            <i class="icon-heart text-danger"></i>
                          </button>
                          <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                            <i class="icon-music-tone-alt text-dark"></i>
                          </button>
                          <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                            <i class="icon-star text-primary"></i>
                          </button>
                          <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                            <i class="icon-speedometer text-info"></i>
                          </button>
                          <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                            <i class="icon-graph text-success"></i>
                          </button>
                        </div>
                        <div class="template-demo d-flex justify-content-between flex-nowrap">
                          <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                            <i class="icon-heart"></i>
                          </button>
                          <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                            <i class="icon-music-tone-alt"></i>
                          </button>
                          <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                            <i class="icon-star"></i>
                          </button>
                          <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                            <i class="icon-speedometer"></i>
                          </button>
                          <button type="button" class="btn btn-outline-secondary btn-rounded btn-icon">
                            <i class="icon-graph"></i>
                          </button>
                        </div>
                      </div>
                      <div class="col-md-5">
                        <h4 class="card-title">Button Size</h4>
                        <p class="card-description">Use class <code>.btn-{size}</code></p>
                        <div class="template-demo">
                          <button type="button" class="btn btn-outline-secondary btn-lg">btn-lg</button>
                          <button type="button" class="btn btn-outline-secondary btn-md">btn-md</button>
                          <button type="button" class="btn btn-outline-secondary btn-sm">btn-sm</button>
                        </div>
                        <div class="template-demo mt-4">
                          <button type="button" class="btn btn-danger btn-lg">btn-lg</button>
                          <button type="button" class="btn btn-success btn-md">btn-md</button>
                          <button type="button" class="btn btn-primary btn-sm">btn-sm</button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Block buttons</h4>
                    <p class="card-description">Add class <code>.btn-block</code></p>
                    <div class="template-demo">
                      <button type="button" class="btn btn-info btn-lg btn-block">Block buttons <i class="icon-menu float-right"></i>
                      </button>
                      <button type="button" class="btn btn-dark btn-lg btn-block">Block buttons</button>
                      <button type="button" class="btn btn-primary btn-lg btn-block">
                        <i class="icon-user"></i> Block buttons </button>
                      <button type="button" class="btn btn-outline-secondary btn-lg btn-block">Block buttons</button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <div class="row">
                      <div class="col-md-6">
                        <h4 class="card-title">Button groups</h4>
                        <p class="card-description">Wrap a series of buttons with <code>.btn</code> in <code>.btn-group</code></p>
                        <div class="template-demo">
                          <div class="btn-group" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">1</button>
                            <button type="button" class="btn btn-outline-secondary">2</button>
                            <button type="button" class="btn btn-outline-secondary">3</button>
                          </div>
                          <div class="btn-group" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">
                              <i class="icon-heart"></i>
                            </button>
                            <button type="button" class="btn btn-outline-secondary">
                              <i class="icon-calendar"></i>
                            </button>
                            <button type="button" class="btn btn-outline-secondary">
                              <i class="icon-clock"></i>
                            </button>
                          </div>
                        </div>
                        <div class="template-demo">
                          <div class="btn-group" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-primary">1</button>
                            <button type="button" class="btn btn-primary">2</button>
                            <button type="button" class="btn btn-primary">3</button>
                          </div>
                          <div class="btn-group" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-primary">
                              <i class="icon-heart"></i>
                            </button>
                            <button type="button" class="btn btn-primary">
                              <i class="icon-calendar"></i>
                            </button>
                            <button type="button" class="btn btn-primary">
                              <i class="icon-clock"></i>
                            </button>
                          </div>
                        </div>
                        <div class="template-demo mt-4">
                          <div class="btn-group-vertical" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">
                              <i class="icon-arrow-up"></i>
                            </button>
                            <button type="button" class="btn btn-outline-secondary">
                              <i class="icon-menu"></i>
                            </button>
                            <button type="button" class="btn btn-outline-secondary">
                              <i class="icon-arrow-down"></i>
                            </button>
                          </div>
                          <div class="btn-group-vertical" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">Default</button>
                            <div class="btn-group">
                              <button type="button" class="btn btn-outline-secondary dropdown-toggle" data-toggle="dropdown">Dropdown</button>
                              <div class="dropdown-menu">
                                <a class="dropdown-item">Go back</a>
                                <a class="dropdown-item">Delete</a>
                                <a class="dropdown-item">Swap</a>
                              </div>
                            </div>
                            <button type="button" class="btn btn-outline-secondary">Default</button>
                          </div>
                          <div class="btn-group-vertical" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">Top</button>
                            <button type="button" class="btn btn-outline-secondary">Middle</button>
                            <button type="button" class="btn btn-outline-secondary">Bottom</button>
                          </div>
                        </div>
                        <div class="template-demo mt-4">
                          <div class="btn-group" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-outline-secondary">
                              <i class="icon-star d-block mb-1"></i> Favourites </button>
                            <button type="button" class="btn btn-outline-secondary">
                              <i class="icon-reload d-block mb-1"></i> Reload </button>
                            <button type="button" class="btn btn-outline-secondary">
                              <i class="icon-user d-block mb-1"></i> Users </button>
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <h4 class="card-title">Button with text and icon</h4>
                        <p class="card-description">Wrap icon and text inside <code>.btn-icon-text</code> and use <code>.btn-icon-prepend</code> or <code>.btn-icon-append</code> for icon tags</p>
                        <div class="template-demo">
                          <button type="button" class="btn btn-primary btn-icon-text">
                            <i class="icon-doc btn-icon-prepend"></i> Submit </button>
                          <button type="button" class="btn btn-dark btn-icon-text"> Edit <i class="icon-doc btn-icon-append"></i>
                          </button>
                          <button type="button" class="btn btn-success btn-icon-text">
                            <i class="icon-info btn-icon-prepend"></i> Warning </button>
                        </div>
                        <div class="template-demo">
                          <button type="button" class="btn btn-danger btn-icon-text">
                            <i class="icon-cloud-upload btn-icon-prepend"></i> Upload </button>
                          <button type="button" class="btn btn-info btn-icon-text"> Print <i class="icon-printer btn-icon-append"></i>
                          </button>
                          <button type="button" class="btn btn-warning btn-icon-text">
                            <i class="icon-reload btn-icon-prepend"></i> Reset </button>
                        </div>
                        <div class="template-demo mt-2">
                          <button type="button" class="btn btn-outline-primary btn-icon-text">
                            <i class="icon-doc btn-icon-prepend"></i> Submit </button>
                          <button type="button" class="btn btn-outline-secondary btn-icon-text"> Edit <i class="icon-doc btn-icon-append"></i>
                          </button>
                          <button type="button" class="btn btn-outline-success btn-icon-text">
                            <i class="icon-info btn-icon-prepend"></i> Warning </button>
                        </div>
                        <div class="template-demo">
                          <button type="button" class="btn btn-outline-danger btn-icon-text">
                            <i class="icon-cloud-upload btn-icon-prepend"></i> Upload </button>
                          <button type="button" class="btn btn-outline-info btn-icon-text"> Print <i class="icon-printer btn-icon-append"></i>
                          </button>
                          <button type="button" class="btn btn-outline-warning btn-icon-text">
                            <i class="icon-reload btn-icon-prepend"></i> Reset </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Social Icon Buttons</h4>
                    <p class="card-description">Add class <code>.btn-social-icon</code></p>
                    <div class="template-demo">
                      <button type="button" class="btn btn-social-icon btn-outline-facebook"><i class="icon-social-facebook"></i></button>
                      <button type="button" class="btn btn-social-icon btn-outline-youtube"><i class="icon-social-youtube"></i></button>
                      <button type="button" class="btn btn-social-icon btn-outline-twitter"><i class="icon-social-twitter"></i></button>
                      <button type="button" class="btn btn-social-icon btn-outline-dribbble"><i class="icon-social-dribbble"></i></button>
                      <button type="button" class="btn btn-social-icon btn-outline-linkedin"><i class="icon-social-linkedin"></i></button>
                      <button type="button" class="btn btn-social-icon btn-outline-google"><i class="icon-social-google"></i></button>
                    </div>
                    <div class="template-demo">
                      <button type="button" class="btn btn-social-icon btn-facebook"><i class="icon-social-facebook"></i></button>
                      <button type="button" class="btn btn-social-icon btn-youtube"><i class="icon-social-youtube"></i></button>
                      <button type="button" class="btn btn-social-icon btn-twitter"><i class="icon-social-twitter"></i></button>
                      <button type="button" class="btn btn-social-icon btn-dribbble"><i class="icon-social-dribbble"></i></button>
                      <button type="button" class="btn btn-social-icon btn-linkedin"><i class="icon-social-linkedin"></i></button>
                      <button type="button" class="btn btn-social-icon btn-google"><i class="icon-social-google"></i></button>
                    </div>
                    <div class="template-demo">
                      <button type="button" class="btn btn-social-icon btn-facebook btn-rounded"><i class="icon-social-facebook"></i></button>
                      <button type="button" class="btn btn-social-icon btn-youtube btn-rounded"><i class="icon-social-youtube"></i></button>
                      <button type="button" class="btn btn-social-icon btn-twitter btn-rounded"><i class="icon-social-twitter"></i></button>
                      <button type="button" class="btn btn-social-icon btn-dribbble btn-rounded"><i class="icon-social-dribbble"></i></button>
                      <button type="button" class="btn btn-social-icon btn-linkedin btn-rounded"><i class="icon-social-linkedin"></i></button>
                      <button type="button" class="btn btn-social-icon btn-google btn-rounded"><i class="icon-social-google"></i></button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Social button with text</h4>
                    <p class="card-description">Add class <code>.btn-social-icon-text</code></p>
                    <div class="template-demo">
                      <button type="button" class="btn btn-social-icon-text btn-facebook"><i class="icon-social-facebook"></i>Facebook</button>
                      <button type="button" class="btn btn-social-icon-text btn-youtube"><i class="icon-social-youtube"></i>Youtube</button>
                      <button type="button" class="btn btn-social-icon-text btn-twitter"><i class="icon-social-twitter"></i>Twitter</button>
                      <button type="button" class="btn btn-social-icon-text btn-dribbble"><i class="icon-social-dribbble"></i>Dribbble</button>
                      <button type="button" class="btn btn-social-icon-text btn-linkedin"><i class="icon-social-linkedin"></i>Linkedin</button>
                      <button type="button" class="btn btn-social-icon-text btn-google"><i class="icon-social-google"></i>Google</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:../../partials/_footer.html -->
          <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2017  All rights reserved.</span>
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
  </body>
</html>