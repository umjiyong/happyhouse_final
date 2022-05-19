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
              <h1 class="h3 mb-0 text-gray-800">부동산 뉴스</h1>
              
            </div>

            <div id="newsList1">
                <div class='col-xl-12 col-lg-12' id='notices${num}'>
                    <div class='card shadow mb-4'>
                      <div class='card-header py-3 d-flex flex-row align-items-center justify-content-between'>
                        <h6 class='m-0 font-weight-bold text-primary'>
                            “부동산 약세 지속될 것” (금강일보, 2022-03-13)
                        </h6>
                      </div>
                      <div class='card-body'>
                        <img src="http://cdn.ggilbo.com/news/photo/202203/900649_731778_1314.jpg" width="30%"></img>
                        <p id = 'noticeList' class='lead mb-0'>
                            러시아의 우크라이나 침공 사태가 장기화할 경우 인플레이션 압박이 지속되면서 기준 금리 인상에 따른 부동산 가격 약세가 나타날 것이란 분석이 제기됐다.

12일 한국지방세연구원의 부동산 시장 동향 보고서에 담긴 '유가발(發) 인플레이션과 부동산'에 따르면 러시아 침공 사태에 따른 국제유가 급등은 국내 물가와 국내 기준금리에 상당한 영향을 줄 것으로 예상된다. 한국은 세계에서 세 번째로 원유 수입량이 많고, 에너지 수입 의존도가 높아 최근의 국제 유가 급등세는 한국 경제에 부담으로 작용한다. 1973년 1차 오일쇼크 때 국제유가는 282.4% 높아졌고, 물가상승률은 605.7% 상승했다. 1979년 2차 오일쇼크 때도 국제유가가 70.6% 높아졌고, 물가는 15.1% 올랐다. 2008년 유가급등 시기에도 물가상승률이 88%에 달했다. 최근 급등한 국제유가는 소비자물가 상승과 경제성장률 하방압력으로 작용할 것으로 보인다. 연평균 국제유가가 배럴당 100달러에 이르면 올해 경제성장률은 0.3%p, 120달러에 이르면 0.4%p 하락할 것으로 예상된다.
                        </p>
                        <p>
                            <a href="http://www.ggilbo.com/news/articleView.html?idxno=900649">[기사 원문 링크]</a>
                        </p>
                      </div>
                    </div>
                  </div>
            </div>
            <div id="newsList2">
                <div class='col-xl-12 col-lg-12' id='notices${num}'>
                    <div class='card shadow mb-4'>
                      <div class='card-header py-3 d-flex flex-row align-items-center justify-content-between'>
                        <h6 class='m-0 font-weight-bold text-primary'>
                            부동산 거래량 회복 신호탄···‘하루 새 문의도 방문도 급증’ (시사저널, 2022-03-14)
                        </h6>
                      </div>
                      <div class='card-body'>
                        <img src="http://www.sisajournal-e.com/news/photo/202203/258400_107595_4534.jpg" width="30%"></img>
                        <p id = 'noticeList' class='lead mb-0'>
                            20대 대통령 선거가 끝나면서 부동산 시장 분위기가 달라지고 있다. 윤석열 당선자가 대출·세제·정비사업 등 전방위 규제 완화를 공약으로 내걸면서 5년 간 눌려있던 매수욕구가 분출하며 시세가 상승할 것이라는 전망도 나온다. 업계에서는 그동안 토지, 오피스텔, 지식산업센터, 생활형 숙박시설 등의 대부분 부동산 상품에 대해서는 대출이 열려있었지만 이제 아파트가 대출 완화로 달라지는 만큼 시장을 이끄는 건 아파트가 될 것이라고 예상한다.

14일 빅데이터업체 아실에 따르면 전날 기준 서울 아파트 매물은 4만9441건으로 집계됐다. 이달 들어 매물이 줄곧 5만건 이상을 유지하다가 대통령 당선이 확정된 지난 10일 4만9539건으로 내려온 뒤 하향곡선을 이어오는 것이다. 그 폭이 크지는 않지만 업계에서는 추세가 바뀌었다는 것에 의의를 두고 있다. 매물이 감소한 것은 정권교체로 세 부담 완화가 기대되는 만큼 다주택자를 중심으로 매물 회수 움직임을 보이는 데 따른 것으로 풀이된다.
                        </p>
                        <p>
                            <a href="http://www.sisajournal-e.com/news/articleView.html?idxno=258400">[기사 원문 링크]</a>
                        </p>
                      </div>
                    </div>
                  </div>
            </div>
            <!-- Content Row -->
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
  </body>
</html>
