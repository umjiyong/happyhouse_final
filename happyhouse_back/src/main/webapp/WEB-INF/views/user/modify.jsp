<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ssafy.happyhouse.model.dto.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
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
function modifyUser() {
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
		document.getElementById("modifyForm").action = "${root}/user/modify";
		document.getElementById("modifyForm").submit();
		alert ("수정 완료!");
	}
}
</script>

<script type="text/javascript"> 
function byebye() {
	var input = confirm('진짜 진짜 탈퇴하시겠습니까?');  
	if (input) {
		location.href='delete';
	} 
	else return;	
}
</script>
    
  </head>
  <body>
    <header>
      <nav class="header-nav">
        <div>
          <a href="${root}"><h1>Happy House</h1></a>
        </div>
      </nav>
    </header>
    <c:if test="${!empty userinfo}">
    
    <main class="container">
      <div class="login-page">
        <h1>회원 정보 수정</h1>
        <div class="form">
          <form id="modifyForm" method="post" action="">
			<input type="hidden" name="act" value="modifyCheck">
			<label for="id">아이디 :</label>
            <input id="id" name="id" type="text" placeholder="id" 
              value="${userinfo.id}"
              readonly
              />
              
            <label for="password">비밀번호 :</label>  
            <input
              id="password"
              name="password"
              type="password"
              placeholder="password"
              value="${userinfo.password}"
            />
            
            <label for="email">이메일 :</label>
            <input
              id="email"
              name="email"
              type="email"
              placeholder="email address"
              value="${userinfo.email}"
            />
            
            <label for="name">이름 :</label>
            <input id="name" name="name" type="text" placeholder="name"
                value="${userinfo.name}" />
                
            <label for="age">나이 :</label>    
            <input id="age" name="age" type="number" placeholder="age"
                value="${userinfo.age}" />
            
           
            <button class="btn btn-primary" onclick="javascript:modifyUser();">회원 정보 수정</button>
            <button onclick="javascript:byebye();" type="button">
                           회원 탈퇴
            </button>
          </form>
        </div>
      </div>
    </main>
    </c:if>
    <footer>
      <ul class="footer-list">
        <li>&copy; Happy House (SSAFY7_SEOUL16_07)</li>
      </ul>
    </footer>
    <script type="text/javascript" src="js/main.js"></script>
  </body>
</html>
