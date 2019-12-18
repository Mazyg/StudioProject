<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/"+"manage/";
%>
<!DOCTYPE html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>首页信息管理</title>
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
    <link rel="shortcut icon" href="images/favicon.png" />
    <script src="js/jquery-1.8.3.js"></script>
    <script src="../tinymce/tinymce.min.js"></script>
    <script type="text/javascript">

      function selectFile(){
        $("#photo").trigger("click");
      }


      function selectFileV(){
        $("#video").trigger("click");
      }

    </script>
    <script type="text/javascript">
      function msssage () {
        var message = "${msg}";
        if( message != ""){
          alert(message);
        }
      }

      function change(){
        $("#type").val($("#info").val()) ;
      }

      function getImage() {

        var photo=document.querySelector("#photo");
        console.log(photo);
        var file=photo.files[0];
        var formData=new FormData();
        formData.append("img",file);
        var xhr=new XMLHttpRequest();
        xhr.open("post","http://111.229.25.156:7777/upload/img")
        xhr.onload=function (ev) {
          var json;
          if(xhr.status!==200){
            failFun('HTTP Error:'+xhr.status);
            return
          }
          json=JSON.parse(this.responseText);
          if(!json||typeof json.location !='string'){
            failFun('Invalid JSON:'+xhr.responseText);
            return;
          }else{
            console.log(json.location);
            $("#url").val(json.location) ;
            $("#src").attr("src",json.location);
          }


        };
        xhr.send(formData);



      }


      function getvideo() {
        var photo=document.querySelector("#video");
        console.log(photo);
        var file=photo.files[0];
        var formData=new FormData();
        formData.append("movie",file);
        var xhr=new XMLHttpRequest();
        xhr.open("post","http://111.229.25.156:7777/upload/movie")
        xhr.onload=function (ev) {
          var json;
          if(xhr.status!==200){
            failFun('HTTP Error:'+xhr.status);
            return
          }
          json=JSON.parse(this.responseText);
          if(!json||typeof json.location !='string'){
            failFun('Invalid JSON:'+xhr.responseText);
            return;
          }else{
            console.log(json.location);
            $("#urlv").val(json.location) ;
          /*  $("#src").attr("src",json.location);*/
          }

        };
        xhr.send(formData);
      }

    </script>
    <script>
      tinymce.init({
        selector: '#description',
        //skin:'oxide-dark',
        language:'zh_CN',
        plugins: 'print preview searchreplace autolink directionality visualblocks visualchars  image link media template code codesample table charmap hr pagebreak nonbreaking anchor insertdatetime advlist lists wordcount imagetools textpattern help emoticons autosave bdmap indent2em autoresize lineheight formatpainter axupimgs',
        toolbar: 'code undo redo restoredraft | cut copy paste pastetext | forecolor backcolor bold italic underline strikethrough link anchor | alignleft aligncenter alignright alignjustify outdent indent | blockquote subscript superscript removeformat | \
                     styleselect formatselect fontselect fontsizeselect | bullist numlist |  \
                     table image media charmap emoticons hr pagebreak insertdatetime print preview  | indent2em lineheight formatpainter axupimgs',
        height: 650, //编辑器高度
        min_height: 400,
        /*content_css: [ //可设置编辑区内容展示的css，谨慎使用
            '/static/reset.css',
            '/static/ax.css',
            '/static/css.css',
        ],*/
        fontsize_formats: '12px 14px 16px 18px 24px 36px 48px 56px 72px',
        font_formats: '微软雅黑=Microsoft YaHei,Helvetica Neue,PingFang SC,sans-serif;苹果苹方=PingFang SC,Microsoft YaHei,sans-serif;宋体=simsun,serif;仿宋体=FangSong,serif;黑体=SimHei,sans-serif;Arial=arial,helvetica,sans-serif;Arial Black=arial black,avant garde;Book Antiqua=book antiqua,palatino;Comic Sans MS=comic sans ms,sans-serif;Courier New=courier new,courier;Georgia=georgia,palatino;Helvetica=helvetica;Impact=impact,chicago;Symbol=symbol;Tahoma=tahoma,arial,helvetica,sans-serif;Terminal=terminal,monaco;Times New Roman=times new roman,times;Verdana=verdana,geneva;Webdings=webdings;Wingdings=wingdings,zapf dingbats;知乎配置=BlinkMacSystemFont, Helvetica Neue, PingFang SC, Microsoft YaHei, Source Han Sans SC, Noto Sans CJK SC, WenQuanYi Micro Hei, sans-serif;小米配置=Helvetica Neue,Helvetica,Arial,Microsoft Yahei,Hiragino Sans GB,Heiti SC,WenQuanYi Micro Hei,sans-serif',
        link_list: [
          { title: '预置链接1', value: 'http://www.tinymce.com' },
          { title: '预置链接2', value: 'http://tinymce.ax-z.cn' }
        ],
        image_list: [
          { title: '预置图片1', value: 'https://www.tiny.cloud/images/glyph-tinymce@2x.png' },
          { title: '预置图片2', value: 'https://www.baidu.com/img/bd_logo1.png' }
        ],
        image_class_list: [
          { title: 'None', value: '' },
          { title: 'Some class', value: 'class-name' }
        ],
        //importcss_append: true,
        //自定义文件选择器的回调内容
        file_picker_callback: function (callback, value, meta) {
          if (meta.filetype === 'file') {
            callback('https://www.baidu.com/img/bd_logo1.png', { text: 'My text' });
          }
          if (meta.filetype === 'image') {
            callback('https://www.baidu.com/img/bd_logo1.png', { alt: 'My alt text' });
          }
          if (meta.filetype === 'media') {
            callback('movie.mp4', { source2: 'alt.ogg', poster: 'https://www.baidu.com/img/bd_logo1.png' });
          }
        },
        //为内容模板插件提供预置模板
        templates: [
          { title: '模板1', description: '介绍文字1', content: '模板内容' },
          { title: '模板2', description: '介绍文字2', content: '<div class="mceTmpl"><span class="cdate">CDATE</span>，<span class="mdate">MDATE</span>，我的内容</div>' }
        ],
        //
        template_cdate_format: '[CDATE: %m/%d/%Y : %H:%M:%S]',
        template_mdate_format: '[MDATE: %m/%d/%Y : %H:%M:%S]',
        autosave_ask_before_unload: false,
        toolbar_drawer : false,
        // images_upload_base_path: '/demo',
        images_upload_handler: function (blobInfo, succFun, failFun) {
          var xhr,formData;
          var art_title=$("art_title").val();
          var art_author=$("art_author").val();
          xhr = new XMLHttpRequest();
          xhr.withCredentials= false;
          xhr.open("post","http://111.229.25.156:7777/upload/img");
          formData=new FormData();
          formData.append("img" , blobInfo.blob());
          xhr.onload = function (ev) {
            var json;
            if(xhr.status!==200){
              failFun('HTTP Error:'+xhr.status);
              return
            }
            json=JSON.parse(this.responseText);
            if(!json||typeof json.location !='string'){
              failFun('Invalid JSON:'+xhr.responseText);
              return;
            }
            // 成功回调
            succFun(json.location);
          };
          xhr.send(formData);
        }

      });

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
                  <img class="img-lg rounded-circle" src="${users.photo}" alt="Profile image">
                  <p class="mb-1 mt-3">${users.uname}</p>
                  <p class="font-weight-light text-muted mb-0">${users.email}</p>
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
              <h2 class="page-title"> 信息推送 </h2>
            </div>
            <div class="row">
              <div class="col-lg-12 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <form class="forms-sample" id="info_form">
                      <div class="form-group">
                        <label for="title">标题</label>
                        <input type="text" class="form-control" id="title" placeholder="标题" name="title">
                      </div>
                      <div class="form-group">
                        <label for="introduction">简介</label>
                        <div class="input-group col-xs-12">
                          <textarea name="introduce" id="introduction" placeholder="简介" required="required" class="col-10 form-control"  style=" height:80px"></textarea>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="info_category"> 信息类别</label>
                        <div class="col-sm-6" id="info_category">
                          <select class="form-control" id="info">
                            <option value="榜样力量">榜样力量</option>
                            <option value="身边榜样">身边榜样</option>
                            <option value="新时代楷模">新时代楷模</option>
                            <option value="热点时事">热点时事</option>
                            <option value="最美中国人">最美中国人</option>
                            <option value="最美中国景">最美中国景</option>
                            <option value="最美中国事">最美中国事</option>
                            <option value="电影">电影</option>
                            <option value="书籍">书籍</option>
                            <option value="近期政策">近期政策</option>
                            <option value="视频">视频</option>
                            <option value="人物">人物</option>
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
                        <label>上传视频</label>
                        <%-- <input type="file" name="img[]" class="file-upload-default">--%>
                        <div class="input-group col-xs-12">
                          <input type="text" class="form-control file-upload-info" readonly placeholder="视频地址" id="urlv" name="video" >
                          <span class="input-group-a ppend">
                            <input type="file" id="video" style="display:none" multiple="multiple" onchange="getvideo()">
                            <button class="file-upload-browse btn btn-primary" type="button" onclick="selectFileV()">上传</button>
                          </span>
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="description">内容</label>
                        <textarea id="description"  name="content"></textarea>
                      </div>
                      <input type="reset" class="btn btn-light" value="重置">
                      <input type="button" class="btn btn-primary mr-2" value="提交" id="subBtn">
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
    <script>
      $(function () {
        $("#subBtn").click(function () {
          var $type = $("#info").val();
          var $title = $("#title").val();
          var $introduce = $("#introduction").val();
          var $photo = $("#url").val();
          var $video = $("#urlv").val();
          var content = tinyMCE.activeEditor.getContent();
          alert(content);
          console.log(content);
          $.ajax({
            url:"../info/addInfo.do",
            contentType:"application/json;charset=UTF-8",
            data:JSON.stringify({"title":$title,"introduce":$introduce,"info_type":$type,"&photo":$photo,"video":$video,"content":content}),
            dataType:"text",
            //data:"title"+$title+"&introduce="+$introduce+"&info_type="+$type+"&photo="+$photo+"&video="+$video+"&content="+content,
            type:"post",
            success:function (result) {
              if (result == "success"){
                alert("发布成功");
                window.location.href = "pages/forms/basic_elements.jsp";
              }else {
                alert("发布失败");
              }
            },error:function (result) {
              alert("传参不成功");
            }
          })
        })
      })
    </script>
  </body>
</html>