<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<link href="../css/sb-admin-2.min.css" rel="stylesheet" />
</head>
<body>
<script>
	let selectedPage = window.location.href.split("/")[5];
	console.log("current page! : "+selectedPage);
	console.log(`test  : ${'${selectedPage==="deal"}'}`);
</script>
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">
			<!-- Sidebar - Brand -->

			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="${root }/happyhouse/" > <img src="../assets/icon.png"
				alt="logo" style="max-width: 10%; height: auto" />
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">Happy House</div>
			</a>
			<!-- Divider -->
			<hr class="sidebar-divider my-0" />

			<!-- Nav Item - Dashboard --><!-- 
			<li class="nav-item active"> -->
			<li class="nav-item"><a class="nav-link" href="${root}/happyhouse/house/deal"> <i
					class="bi-file-earmark-ruled m-auto text-white"></i> <span>&nbsp;거래내역
						조회</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider" />

			<!-- Heading -->
			<div class="sidebar-heading">Information</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link" href="${root}/happyhouse/house/news"> <i
					class="bi-newspaper m-auto text-white"></i> <span>&nbsp;부동산
						뉴스</span>
			</a></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link" href="${root}/happyhouse/house/notice"> <i
					class="bi-clipboard m-auto text-white"></i> <span>&nbsp;공지사항</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block" />

			<!-- Sidebar Toggler (Sidebar) -->
			<!-- <div class="text-center d-none d-md-inline">
          <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div> -->

			<!-- Sidebar Message -->

		</ul>
</body>
</html>