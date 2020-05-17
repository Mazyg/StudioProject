<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="css/style.css" /><!-- End layout styles -->
    <link rel="shortcut icon" href="images/title.ico" />
    <script type="text/javascript">
      function check() {
        if (form1.Password1.value!=form1.Password2.value){
          alert("两次密码输入不一致请重新输入");
          form1.Password1.value="";
          form1.Password2.value="";
          return false;
        }
        return true;
      }
    </script>
  </head>
  <body>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center auth">
          <div class="row flex-grow">
            <div class="col-lg-4 mx-auto">
              <div class="auth-form-light text-left p-5">
                <div class="brand-logo">
                  <img src="images/logo.svg">
                </div>
                <h4>注册账号</h4>
                <form class="pt-3" action="../user/register.do" onsubmit="return check();" method="post" id="form1">
                  <div class="form-group">
                    <input type="text" class="form-control form-control-lg" id="UserId" placeholder="账号" name="uid" required>
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control form-control-lg" id="Username" placeholder="昵称" name="uname" required>
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control form-control-lg" id="phone" placeholder="手机号" name="phone"
                           required>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group row">
                      <label class="col-sm-3 col-form-label">性别</label>
                      <div class="col-sm-4">
                        <div class="form-check">
                          <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="sex" id=sexRadios1" value="男" checked>男</label>
                        </div>
                      </div>
                      <div class="col-sm-5">
                        <div class="form-check">
                          <label class="form-check-label">
                            <input type="radio" class="form-check-input" name="sex" id="sexRadios2" value="女">女</label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control form-control-lg" id="Password1" placeholder="密码" name="password" required>
                  </div>
                  <div class="form-group">
                    <input type="password" class="form-control form-control-lg" id="Password2" placeholder="确认密码" name="repassword" required>
                  </div>
                  <div class="mt-3">
                    <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="注册" >
                  </div>
                  <div class="text-center mt-4 font-weight-light"> 已经注册了账号? <a href="login.jsp" class="text-primary">登录</a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
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