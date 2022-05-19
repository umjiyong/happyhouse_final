<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ssafy.happyhouse.model.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
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
    <link
      href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
      rel="stylesheet"
      type="text/css"
    />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function () {
        // $("#search_apt_btn").on("click", function () {
        //   console.log("hello");
        //   location.replace("./search_apt.html");
        // });
      });
    </script>
  </head>
  <body>
    <!-- Navigation-->
    <nav class="navbar navbar-light bg-light static-top">
      <div class="container">
        <a href="/happyhouse">
          <img
            class="logo"
            src="assets/icon.png"
            alt="My Image"
            style="max-width: 10%; height: auto"
          />
        </a>
        	<c:if test="${empty userinfo}">
			<a class="btn btn-primary" id = "login-button" onclick="location.href='user/login'">로그인</a>
      	    </c:if>
        	
        	<c:if test="${!empty userinfo}">
        	<div align = "right">
        	<strong>${userinfo.name}</strong> (${userinfo.id})님 안녕하세요.
        	<div>
       		 <a class="btn btn-primary"  onclick="location.href='user/modify'">마이페이지</a>
       		 <a class="btn btn-primary"  onclick="location.href='user/logout'">로그아웃</a>
       		</div>
       		 </div>
       		</c:if>
       		 
      </div>
    </nav>
    <!-- Masthead-->
    <header class="masthead">
      <div class="container position-relative">
        <div class="row justify-content-center">
          <div class="col-xl-6">
            <div class="text-center text-white">
              <!-- Page heading-->
              <h1 class="mb-5">해피하우스에서 행복의 보금자리를 찾아보세요!</h1>
              <!-- Signup form-->
              <!-- * * * * * * * * * * * * * * *-->
              <!-- * * SB Forms Contact Form * *-->
              <!-- * * * * * * * * * * * * * * *-->
              <!-- This form is pre-integrated with SB Forms.-->
              <!-- To make this form functional, sign up at-->
              <!-- https://startbootstrap.com/solution/contact-forms-->
              <!-- to get an API token!-->
              <form
                class="form-subscribe"
                id="contactForm"
                data-sb-form-api-token="API_TOKEN"
              >
                <!-- Email address input-->
                <div class="row">
                  <div class="col">
                    <input
                      class="form-control form-control-lg"
                      id="emailAddress"
                      type="email"
                      placeholder="주소 입력"
                      data-sb-validations="required,email"
                    />
                    <div
                      class="invalid-feedback text-white"
                      data-sb-feedback="emailAddress:required"
                    >
                      주소를 입력해주세요.
                    </div>
                    <div
                      class="invalid-feedback text-white"
                      data-sb-feedback="emailAddress:email"
                    >
                      올바르지 않은 주소입니다.
                    </div>
                  </div>
                  <div class="col-auto">
                    <button
                      class="btn btn-primary btn-lg disabled hover_pointer"
                      id="submitButton"
                      type="submit"
                    >
                      검색
                    </button>
                  </div>
                </div>
                <!-- Submit success message-->
                <!---->
                <!-- This is what your users will see when the form-->
                <!-- has successfully submitted-->
                <div class="d-none" id="submitSuccessMessage">
                  <div class="text-center mb-3">
                    <div class="fw-bolder">Form submission successful!</div>
                    <p>To activate this form, sign up at</p>
                    <a
                      class="text-white"
                      href="https://startbootstrap.com/solution/contact-forms"
                      >https://startbootstrap.com/solution/contact-forms</a
                    >
                  </div>
                </div>
                <!-- Submit error message-->
                <!---->
                <!-- This is what your users will see when there is-->
                <!-- an error submitting the form-->
                <div class="d-none" id="submitErrorMessage">
                  <div class="text-center text-danger mb-3">
                    Error sending message!
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </header>
    <!-- Icons Grid-->
    <section class="features-icons bg-light text-center">
      <div class="container">
        <div class="row">
          <div
            class="col-lg-4 hover_pointer hover_dark"
            onclick="location.href='house/deal'"
          >
            <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <i class="bi-file-earmark-ruled m-auto text-primary"></i>
              </div>
              <h3>거래내역 조회</h3>
              <p class="lead mb-0">부동산 거래내역을 조회해드립니다</p>
            </div>
          </div>
          <div class="col-lg-4 hover_pointer hover_dark"
          onclick="location.href='house/news'">
            <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <i class="bi-newspaper m-auto text-primary"></i>
              </div>
              <h3>부동산 뉴스</h3>
              <p class="lead mb-0">부동산과 관련된 최신 소식을 전해드립니다</p>
            </div>
          </div>
          <div class="col-lg-4 hover_pointer hover_dark"
          onclick="location.href='house/notice'">
            <div class="features-icons-item mx-auto mb-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <i class="bi-clipboard m-auto text-primary"></i>
              </div>
              <h3>공지사항</h3>
              <p class="lead mb-0">
                사이트와 관련된 중요한 내용을 안내해드립니다
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Image Showcases-->
    <section class="showcase">
      <div class="container-fluid p-0">
        <div class="row g-0 hover_dark">
          <div
            class="col-lg-6 order-lg-2 text-white showcase-img"
            style="background-image: url('assets/img/bg-showcase-1.jpg')"
          ></div>
          <div class="col-lg-6 order-lg-1 my-auto showcase-text">
            <h2>간편한 위치 검색</h2>
            <p class="lead mb-0">
              서울의 면적은 605.2 km2로, 이 넓은 지역을 스스로 탐방하는 것은
              결코 쉬운 일이 아닐 것입니다. 그러나 걱정하지 마세요! 상세 주소를
              선택해주시면, Happy House가 해당 지역의 위치를 자동으로 검색해
              드립니다.
            </p>
          </div>
        </div>
        <div class="row g-0 hover_dark">
          <div
            class="col-lg-6 text-white showcase-img"
            style="background-image: url('assets/img/bg-showcase-2.jpg')"
          ></div>
          <div class="col-lg-6 my-auto showcase-text">
            <h2>최근 거래금액을 한눈에 파악</h2>
            <p class="lead mb-0">
              Happy House는 사용자가 선택한 아파트의 최근 거래 내역들을
              제공합니다. 최근 거래금액이 어떻게 형성되어 있는지 직접
              확인하세요!
            </p>
          </div>
        </div>
        <div class="row g-0 hover_dark">
          <div
            class="col-lg-6 order-lg-2 text-white showcase-img"
            style="background-image: url('assets/img/bg-showcase-3.jpg')"
          ></div>
          <div class="col-lg-6 order-lg-1 my-auto showcase-text">
            <h2>부동산 정보까지 빠르게</h2>
            <p class="lead mb-0">
              최근의 부동산 트렌드는 매우 빠르게 변화하고 있으며, 이를 따라가는
              것은 매우 힘든 일입니다. Happy House는 현재 일어나는 부동산에
              관련된 뉴스들을 제공하여, 고객 여러분들께 지식 제공에 힘쓰고
              있습니다.
            </p>
          </div>
        </div>
        <div class="row g-0 hover_dark">
          <div
            class="col-lg-6 text-white showcase-img"
            style="background-image: url('assets/img/bg-showcase-4.jpg')"
          ></div>
          <div class="col-lg-6 my-auto showcase-text">
            <h2>우리 가족의 건강은 소중하니까</h2>
            <p class="lead mb-0">
              질병은 언제나 예상하지 못하는 순간에 찾아오기 마련입니다. 그
              순간에 당황하지 않도록, Happy House에서는 주변 코로나19 전담 병원을
              안내해드립니다.
            </p>
          </div>
        </div>
      </div>
    </section>
    <!-- Testimonials-->
    <section class="testimonials text-center bg-light">
      <div class="container">
        <h2 class="mb-5">사용자 후기</h2>
        <div class="row">
          <div class="col-lg-4">
            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <img
                class="img-fluid rounded-circle mb-3"
                src="assets/img/testimonials-1.jpg"
                alt="..."
              />
              <h5>Margaret E.</h5>
              <p class="font-weight-light mb-0">
                "해피하우스 덕에 싸고 좋은 집으로 이사왔어요!"
              </p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <img
                class="img-fluid rounded-circle mb-3"
                src="assets/img/testimonials-2.jpg"
                alt="..."
              />
              <h5>Fred S.</h5>
              <p class="font-weight-light mb-0">"해피하우스 최고"</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <img
                class="img-fluid rounded-circle mb-3"
                src="assets/img/testimonials-3.jpg"
                alt="..."
              />
              <h5>Sarah W.</h5>
              <p class="font-weight-light mb-0">"한번 써보세요!"</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Footer-->
    <footer class="footer bg-light">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 h-100 text-center text-lg-start my-auto">
            <ul class="list-inline mb-2">
              <li class="list-inline-item"><a href="#!">About</a></li>
              <li class="list-inline-item">⋅</li>
              <li class="list-inline-item"><a href="#!">Contact</a></li>
              <li class="list-inline-item">⋅</li>
              <li class="list-inline-item"><a href="#!">Terms of Use</a></li>
              <li class="list-inline-item">⋅</li>
              <li class="list-inline-item"><a href="#!">Privacy Policy</a></li>
            </ul>
            <p class="text-muted small mb-4 mb-lg-0">
              &copy; Happy House (SSAFY7_SEOUL16_07). All Rights Reserved.
            </p>
          </div>
          <div class="col-lg-6 h-100 text-center text-lg-end my-auto">
            <ul class="list-inline mb-0">
              <li class="list-inline-item me-4">
                <a href="#!"><i class="bi-facebook fs-3"></i></a>
              </li>
              <li class="list-inline-item me-4">
                <a href="#!"><i class="bi-twitter fs-3"></i></a>
              </li>
              <li class="list-inline-item">
                <a href="#!"><i class="bi-instagram fs-3"></i></a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
  </body>
</html>
