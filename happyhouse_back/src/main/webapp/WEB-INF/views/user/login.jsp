<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Happy House</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/icon.png" />
    <link rel="stylesheet" href="../css/main.css" />
    <script type="text/javascript">
     function login() {
	 if (document.getElementById("id").value == "") {
			alert("아이디를 입력해주세요");
			return;
		}else if (document.getElementById("password").value == "") {
			alert("비밀번호를 입력해주세요");
			return;
		} else {
		document.getElementById("loginForm").action = "${root}/happyhouse/user/login";
		document.getElementById("loginForm").submit();
	}
}
</script>
  </head>
  <body>
    <header>
      <nav class="header-nav">
        <div>
          <a href="${root}/happyhouse"><h1>Happy House</h1></a>
        </div>
      </nav>
    </header>
    <main class="container">
      <div class="login-page">
        <h1>로그인</h1>
        <div class="form" >
         <form id="loginForm" method="post" action="">
        	<input type="hidden" name="act" value="loginCheck"/>
        	
            <input id="id" name="id" type="text" placeholder="ID" />
            <input id="password" name="password" type="password" placeholder="password"/>
            <button type="button" class="btn btn-primary" onclick="javascript:login();">
                         로그인
            </button>
            <button onclick="location.href='register'" type="button">
                         회원가입
            </button>
          </form>
        </div>
      </div>
    </main>
    <footer>
      <ul class="footer-list">
        <li>&copy; Happy House (SSAFY7_SEOUL16_07)</li>
      </ul>
    </footer>
    <script type="text/javascript" src="js/main.js"></script>
  </body>
</html>
