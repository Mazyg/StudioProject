<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"+"manage/";
%>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>动态推送</title>
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
    <link rel="stylesheet" href="css/style.css" /><!-- End layout styles -->
    <link rel="shortcut icon" href="images/title.ico" />
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
                  <p class="font-weight-light text-muted mb-0">${users.phone}</p>
                </div>
                <a class="dropdown-item" href="../user/personalInfo.do?uid=${users.uid}"><i class="dropdown-item-icon icon-user text-primary"></i> 个人信息 </a>
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
          </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel">
          <div class="content-wrapper">
            <div class="page-header">
              <h3 class="page-title"> Typography </h3>
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">UI Elements</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Typography</li>
                </ol>
              </nav>
            </div>
            <div class="row">
              <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Headings</h4>
                    <p class="card-description"> Add tags <code>&lt;h1&gt;</code> to <code>&lt;h6&gt;</code> or class <code>.h1</code> to <code>.h6</code>
                    </p>
                    <div class="template-demo">
                      <h1>h1. Heading</h1>
                      <h2>h2. Heading</h2>
                      <h3>h3. Heading</h3>
                      <h4>h4. Heading</h4>
                      <h5>h5. Heading</h5>
                      <h6>h6. Heading</h6>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Headings with secondary text</h4>
                    <p class="card-description"> Add faded secondary text to headings </p>
                    <div class="template-demo">
                      <h1> h1. Heading <small class="text-muted"> Secondary text </small>
                      </h1>
                      <h2> h2. Heading <small class="text-muted"> Secondary text </small>
                      </h2>
                      <h3> h3. Heading <small class="text-muted"> Secondary text </small>
                      </h3>
                      <h4> h4. Heading <small class="text-muted"> Secondary text </small>
                      </h4>
                      <h5> h5. Heading <small class="text-muted"> Secondary text </small>
                      </h5>
                      <h6> h6. Heading <small class="text-muted"> Secondary text </small>
                      </h6>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Display headings</h4>
                    <p class="card-description"> Add class <code>.display1</code> to <code>.display-4</code>
                    </p>
                    <div class="template-demo">
                      <h1 class="display-1">Display 1</h1>
                      <h1 class="display-2">Display 2</h1>
                      <h1 class="display-3">Display 3</h1>
                      <h1 class="display-4">Display 4</h1>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6 d-flex align-items-stretch">
                <div class="row">
                  <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                      <div class="card-body">
                        <h4 class="card-title">Paragraph</h4>
                        <p class="card-description"> Write text in <code>&lt;p&gt;</code> tag </p>
                        <p> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley not only five centuries, </p>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                      <div class="card-body">
                        <h4 class="card-title">Icon size</h4>
                        <p class="card-description"> Add class <code>.icon-lg</code>, <code>.icon-md</code>, <code>.icon-sm</code>
                        </p>
                        <div class="row">
                          <div class="col-md-4 d-flex align-items-center">
                            <div class="d-flex flex-row align-items-center">
                              <i class="icon-compass icon-lg text-warning"></i>
                              <p class="mb-0 ml-1"> Icon-lg </p>
                            </div>
                          </div>
                          <div class="col-md-4 d-flex align-items-center">
                            <div class="d-flex flex-row align-items-center">
                              <i class="icon-compass icon-md text-success"></i>
                              <p class="mb-0 ml-1"> Icon-md </p>
                            </div>
                          </div>
                          <div class="col-md-4 d-flex align-items-center">
                            <div class="d-flex flex-row align-items-center">
                              <i class="icon-compass icon-sm text-danger"></i>
                              <p class="mb-0 ml-1"> Icon-sm </p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Blockquotes</h4>
                    <p class="card-description"> Wrap content inside<code>&lt;blockquote class="blockquote"&gt;</code>
                    </p>
                    <blockquote class="blockquote">
                      <p class="mb-0">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                    </blockquote>
                  </div>
                  <div class="card-body">
                    <blockquote class="blockquote blockquote-primary">
                      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
                      <footer class="blockquote-footer">Someone famous in <cite title="Source Title">Source Title</cite></footer>
                    </blockquote>
                  </div>
                </div>
              </div>
              <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Address</h4>
                    <p class="card-description"> Use <code>&lt;address&gt;</code> tag </p>
                    <div class="row">
                      <div class="col-md-6">
                        <address>
                          <p class="font-weight-bold">Purple imc</p>
                          <p> 695 lsom Ave, </p>
                          <p> Suite 00 </p>
                          <p> San Francisco, CA 94107 </p>
                        </address>
                      </div>
                      <div class="col-md-6">
                        <address class="text-primary">
                          <p class="font-weight-bold"> E-mail </p>
                          <p class="mb-2"> johndoe@examplemeail.com </p>
                          <p class="font-weight-bold"> Web Address </p>
                          <p> www.Purple.com </p>
                        </address>
                      </div>
                    </div>
                  </div>
                  <div class="card-body">
                    <h4 class="card-title">Lead</h4>
                    <p class="card-description"> Use class <code>.lead</code>
                    </p>
                    <p class="lead"> Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. </p>
                  </div>
                </div>
              </div>
              <div class="col-md-12 grid-margin">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Text colors</h4>
                    <p class="card-description"> Use class <code>.text-primary</code>, <code>.text-secondary</code> etc. for text in theme colors </p>
                    <div class="row">
                      <div class="col-md-6">
                        <p class="text-primary">.text-primary</p>
                        <p class="text-success">.text-success</p>
                        <p class="text-danger">.text-danger</p>
                        <p class="text-warning">.text-warning</p>
                        <p class="text-info">.text-info</p>
                      </div>
                      <div class="col-md-6">
                        <p class="text-light bg-dark pl-1">.text-light</p>
                        <p class="text-secondary">.text-secondary</p>
                        <p class="text-dark">.text-dark</p>
                        <p class="text-muted">.text-muted</p>
                        <p class="text-white bg-dark pl-1">.text-white</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Top aligned media</h4>
                    <div class="media">
                      <i class="icon-globe icon-md text-info d-flex align-self-start mr-3"></i>
                      <div class="media-body">
                        <p class="card-text">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque.</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Center aligned media</h4>
                    <div class="media">
                      <i class="icon-globe icon-md text-info d-flex align-self-center mr-3"></i>
                      <div class="media-body">
                        <p class="card-text">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque.</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-4 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Bottom aligned media</h4>
                    <div class="media">
                      <i class="icon-globe icon-md text-info d-flex align-self-end mr-3"></i>
                      <div class="media-body">
                        <p class="card-text">Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque.</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Highlighted Text</h4>
                    <p class="card-description"> Wrap the text in <code>&lt;mark&gt;</code> to highlight text </p>
                    <p> It is a long <mark class="bg-warning text-white">established</mark> fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution </p>
                  </div>
                </div>
              </div>
              <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">List Unordered</h4>
                    <ul>
                      <li>Lorem ipsum dolor sit amet</li>
                      <li>Consectetur adipiscing elit</li>
                      <li>Integer molestie lorem at massa</li>
                      <li>Facilisis in pretium nisl aliquet</li>
                      <li>Nulla volutpat aliquam velit</li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Bold text</h4>
                    <p class="card-description"> Use class<code>.font-weight-bold</code>
                    </p>
                    <p> It is a long <span class="font-weight-bold">established fact</span> that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution </p>
                  </div>
                </div>
              </div>
              <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">List Ordered</h4>
                    <ol>
                      <li>Lorem ipsum dolor sit amet</li>
                      <li>Consectetur adipiscing elit</li>
                      <li>Integer molestie lorem at massa</li>
                      <li>Facilisis in pretium nisl aliquet</li>
                      <li>Nulla volutpat aliquam velit></li>
                    </ol>
                  </div>
                </div>
              </div>
              <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title text-primary">Underline</h4>
                    <p class="card-description"> Wrap in <code>&lt;u&gt;</code> tag for underline </p>
                    <p>
                      <u>lorem ipsum dolor sit amet, consectetur mod tempor incididunt ut labore et dolore magna aliqua.</u>
                    </p>
                  </div>
                  <div class="card-body">
                    <h4 class="card-title text-danger">Lowercase</h4>
                    <p class="card-description"> Use class <code>.text-lowercase</code>
                    </p>
                    <p class="text-lowercase"> lorem ipsum dolor sit amet, consectetur mod tempor incididunt ut labore et dolore magna aliqua. </p>
                  </div>
                  <div class="card-body">
                    <h4 class="card-title text-warning">Uppercase</h4>
                    <p class="card-description"> Use class <code>.text-uppercase</code>
                    </p>
                    <p class="text-uppercase"> lorem ipsum dolor sit amet, consectetur mod tempor incididunt ut labore et dolore magna aliqua. </p>
                  </div>
                </div>
              </div>
              <div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">Mute</h4>
                    <p class="card-description"> Use class <code>.text-muted</code>
                    </p>
                    <p class="text-muted"> lorem ipsum dolor sit amet, consectetur mod tempor incididunt ut labore et dolore magna aliqua. </p>
                  </div>
                  <div class="card-body">
                    <h4 class="card-title text-success">Strike</h4>
                    <p class="card-description"> Wrap content in <code>&lt;del&gt;</code> tag </p>
                    <p>
                      <del> lorem ipsum dolor sit amet, consectetur mod tempor incididunt ut labore et dolore magna aliqua. </del>
                    </p>
                  </div>
                  <div class="card-body">
                    <h4 class="card-title text-info">Capitalized</h4>
                    <p class="card-description"> Use class <code>.text-capitalize</code>
                    </p>
                    <p class="text-capitalize"> lorem ipsum dolor sit amet, consectetur mod tempor incididunt ut labore et dolore magna aliqua. </p>
                  </div>
                </div>
              </div>
              <div class="col-md-4 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">List with icon</h4>
                    <p class="card-description">Add class <code>.list-ticked</code> to <code>&lt;ul&gt;</code></p>
                    <ul class="list-ticked">
                      <li>Lorem ipsum dolor sit amet</li>
                      <li>Consectetur adipiscing elit</li>
                      <li>Integer molestie lorem at massa</li>
                      <li>Facilisis in pretium nisl aliquet</li>
                      <li>Nulla volutpat aliquam velit></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="col-md-4 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">List with icon</h4>
                    <p class="card-description">Add class <code>.list-arrow</code> to <code>&lt;ul&gt;</code></p>
                    <ul class="list-arrow">
                      <li>Lorem ipsum dolor sit amet</li>
                      <li>Consectetur adipiscing elit</li>
                      <li>Integer molestie lorem at massa</li>
                      <li>Facilisis in pretium nisl aliquet</li>
                      <li>Nulla volutpat aliquam velit></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="col-md-4 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">List with icon</h4>
                    <p class="card-description">Add class <code>.list-star</code> to <code>&lt;ul&gt;</code></p>
                    <ul class="list-star">
                      <li>Lorem ipsum dolor sit amet</li>
                      <li>Consectetur adipiscing elit</li>
                      <li>Integer molestie lorem at massa</li>
                      <li>Facilisis in pretium nisl aliquet</li>
                      <li>Nulla volutpat aliquam velit></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:../../partials/_footer.html -->
          <footer class="footer">
            <div class="d-sm-flex justify-content-center justify-content-sm-between">
              <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2017  All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></span>
              <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="icon-heart text-danger"></i></span>
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