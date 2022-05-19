<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
function registerUser() {
	 if (document.getElementById("id").value == "") {
			alert("아이디를 입력해주세요");
			return;
		}else if (document.getElementById("password").value == "") {
			alert("비밀번호를 입력해주세요");
			return;
		} else if (document.getElementById("email").value == "") {
			alert("이메일을 입력해주세요");
			return;
		} else if (document.getElementById("name").value == "") {
			alert("이름을 입력해주세요");
			return;
		} else if(document.getElementById("age").value == ""){
			alert("나이를 입력해주세요");
			return;
		} else {
		document.getElementById("registerForm").action = "${root}/happyhouse/user/register";
		document.getElementById("registerForm").submit();
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
        <h1>회원가입</h1>
        <div class="form">
          <form id="registerForm" method="post" action="">
			<input type="hidden" name="act" value="register">
			
            <input id="id" name="id" type="text" placeholder="id" />
            <input id="password" name="password" type="password" placeholder="password"/>
            <input id="email" name="email" type="email" placeholder="email address"/>
            <input id="name" name="name" type="text" placeholder="name" />
            <input id="age" name="age" type="number" placeholder="age" />
           <button type="button" class="btn btn-primary" onclick="javascript:registerUser();">회원 등록</button>
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
