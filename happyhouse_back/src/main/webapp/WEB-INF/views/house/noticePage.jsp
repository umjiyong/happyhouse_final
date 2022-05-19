<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ssafy.happyhouse.model.dto.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Happy House</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/icon.png" />
    <!-- Bootstrap icons-->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
      rel="stylesheet"
      type="text/css"
    />
    <!-- Google fonts-->
    <!-- <link
      href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
      rel="stylesheet"
      type="text/css"
    /> -->
    <!-- Core theme CSS (includes Bootstrap)-->
    <!-- <link href="css/styles.css" rel="stylesheet" /> -->
    <!-- Custom fonts for this template-->
    <link
      href="vendor/fontawesome-free/css/all.min.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet"
    />

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet" />

  </head>
  <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

  <body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
      <!-- Sidebar -->
     
		<jsp:include page="../include/sidebar.jsp"/>
      <!-- End of Sidebar -->

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">
        <!-- Main Content -->
        <div id="content">
          <!-- Topbar -->
          <nav
            class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow"
          >
            <!-- Sidebar Toggle (Topbar) -->
            <button
              id="sidebarToggleTop"
              class="btn btn-link d-md-none rounded-circle mr-3"
            >
              <i class="fa fa-bars"></i>
            </button>

            <!-- Topbar Search -->

            <!-- Topbar Navbar -->
            <ul class="navbar-nav ml-auto">
              <!-- Nav Item - Search Dropdown (Visible Only XS) -->
              <li class="nav-item dropdown no-arrow d-sm-none">
                <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="searchDropdown"
                  role="button"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  <i class="fas fa-search fa-fw"></i>
                </a>
                <!-- Dropdown - Messages -->
                <div
                  class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                  aria-labelledby="searchDropdown"
                >
                  <form class="form-inline mr-auto w-100 navbar-search">
                    <div class="input-group">
                      <input
                        type="text"
                        class="form-control bg-light border-0 small"
                        placeholder="Search for..."
                        aria-label="Search"
                        aria-describedby="basic-addon2"
                      />
                      <div class="input-group-append">
                        <button class="btn btn-primary" type="button">
                          <i class="fas fa-search fa-sm"></i>
                        </button>
                      </div>
                    </div>
                  </form>
                </div>
              </li>

              <!-- Nav Item - Alerts -->

              <div class="topbar-divider d-none d-sm-block"></div>

              <li class="nav-item dropdown no-arrow mx-1"></li>

              <!-- Nav Item - User Information -->
              <li class="nav-item dropdown no-arrow">
                     <a class="btn btn-primary" href="../user/modify">마이페이지</a>
              </li>
            </ul>
          </nav>
          <!-- End of Topbar -->

          <!-- Begin Page Content -->
          <div class="container-fluid">
            <!-- Page Heading -->
            <div
              class="d-sm-flex align-items-center justify-content-between mb-4"
            >
              <h1 class="h3 mb-0 text-gray-800">공지사항</h1>
              <a
                href="./noticeNew.jsp"
                class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
                id="writeNotice"
                >글쓰기</a
              >
            </div>

            <div id="noticeListId">
            </div>
            <!-- Content Row -->
            <script>
              $(document).ready(function (){
                 const noticeNum = JSON.parse(localStorage.getItem("noticeNum"));
                 if(noticeNum==null){
                   console.log("noticeNum Null");
                   const noticeNum = {
                     num: 0
                   };
                   localStorage.setItem("noticeNum", JSON.stringify(noticeNum));
                 }
                 else if (noticeNum.num > 0){
                   var num = 1;
                   while(true){
                     if(noticeNum.num < num){
                       break;
                     }
                     const notice = JSON.parse(localStorage.getItem("notice" + num));
                     // 입력값 검증
                     if(notice==null){
                       break;
                     }
                     var nList = `<div class='col-xl-12 col-lg-12' id='notices${num}'>
                         <div class='card shadow mb-4'>
                           <div class='card-header py-3 d-flex flex-row align-items-center justify-content-between'>
                             <h6 class='m-0 font-weight-bold text-primary'>
                             ${notice.title}(작성자: ${notice.writer})
                             </h6>
                             <button class='d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm' onclick="removeNotice(${num})">삭제</button>
                           </div>
                           <div class='card-body'>
                             <p id = 'noticeList' class='lead mb-0'>
                             ${notice.content}
                             </p>
                           </div>
                         </div>
                       </div>`;
                     $('#noticeListId').append(nList);
                     console.log("num: " + num);
                     num++;
                   }
                 }
                 else{
                   console.log("num is zero");
                 }
               });
             </script>
        <!-- End of Main Content -->

        <!-- Footer -->
        <footer class="sticky-footer bg-white">
          <div class="container my-auto">
            <div class="copyright text-center my-auto">
              <span>Copyright &copy; Happy House (SSAFY7_SEOUL16_07)</span>
            </div>
          </div>
        </footer>
        <!-- End of Footer -->
      </div>
      <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div
      class="modal fade"
      id="logoutModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button
              class="close"
              type="button"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
            Select "Logout" below if you are ready to end your current session.
          </div>
          <div class="modal-footer">
            <button
              class="btn btn-secondary"
              type="button"
              data-dismiss="modal"
            >
              Cancel
            </button>
            <a class="btn btn-primary" href="login.jsp">Logout</a>
          </div>
        </div>
      </div>
    </div>

    
    <script type="text/javascript" src="js/notice.js"></script>
    
  </body>
</html>
