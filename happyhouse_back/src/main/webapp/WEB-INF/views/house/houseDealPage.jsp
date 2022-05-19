<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="com.ssafy.happyhouse.model.dto.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Happy House</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/icon.png" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" type="text/css" />
<!-- Google fonts-->
<!-- <link
      href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic"
      rel="stylesheet"
      type="text/css"
    /> -->
<!-- Core theme CSS (includes Bootstrap)-->
<!-- <link href="css/styles.css" rel="stylesheet" /> -->
<!-- Custom fonts for this template-->
<!-- <link
      href="vendor/fontawesome-free/css/all.min.css"
      rel="stylesheet"
      type="text/css"
    /> -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />

<link href="../css/apt.css" rel="stylesheet" />


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Custom styles for this template-->

<script type="text/javascript">
  var url =
  "http://openapi.molit.go.kr/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTradeDev";
var ServiceKey =
  "yQJmbxPKHfbveoouxPQICmXLoAexdytRO17wxg/wLWpCObZ80VVS/7bBYGPtH+K0tLxa5/23tWERGQOow9IV1Q=="; // 교수님 key
//"nWA+w5Vi/PjsTBDk/b8niapwQraa5lraTYL62LwQrILP74Z7IBpCGFERLLTdK7vDxqpEQZDQnOcAgX0e/H+ezw==";

var map = null;
var geocoder = null;

let httpRequest,httpRequest2;
window.onload = function () {
	console.log("onload action");
     //httpRequest = sendRequest("http://localhost/house/deal/list", null, getHouseDealDatas, "GET"); 
        httpRequest = $.ajax({
        	type:"GET",
        	url:"http://localhost:8080/happyhouse/house/deal/list",
        	success: getHouseDealDatas,
        	error: function(XMLHttpRequest,textStatus,errorThrown){
        		console.log("통신 실패 : "+errorThrown);
        	}
        	
        });
	console.log("did action "+httpRequest);
	httpRequest2 = $.ajax({
    	type:"GET",
    	url:"http://localhost:8080/happyhouse/house/deal/view",
    	success: getHouseView,
    	error: function(XMLHttpRequest,textStatus,errorThrown){
    		console.log("통신 view 실패 : "+errorThrown);
    	}
    	
    });

  };
  
  function place(lat,lng){
	  this.lat = lat;
	  this.lng = lng;
  }
  
   // houseDeal list 응답을 처리
  function getHouseDealDatas() {
	  console.log("Get HouseDeal Data!")
      if (httpRequest.readyState == 4) {
        if (httpRequest.status == 200) {
          let houseDealList = [];
          let txt = httpRequest.responseText;
          console.log(txt);
          let datas = JSON.parse(txt);
          let places = [];
          datas.forEach((data) => {
            let houseDeal = new Object();
            houseDeal.no = data.no;
            houseDeal.aptName = data.aptName;
            houseDeal.dealAmount = data.dealAmount;
            houseDeal.dealYear = data.dealYear;
            houseDeal.dealMonth = data.dealMonth;
            houseDeal.dealDay = data.dealDay;
            houseDeal.area = data.area;
            houseDeal.floor = data.floor;
            houseDeal.type = data.type;
            houseDeal.rentMoney = data.rentMoney;
            
            houseDeal.aptName = data.aptName;
            houseDeal.buildYear = data.buildYear;
            houseDeal.address = data.address;
            houseDeal.lat = data.lat;
            houseDeal.lng = data.lng;
            //wc.link = "javascript:updateCount('" + data.text + "');";
            houseDealList.push(houseDeal);
            if(houseDeal.lat!=null || houseDeal.lng!=null){
            	// 전체 조회는 마커 표시하지 않기 위해
				const p = new place();
				p.lat = houseDeal.lat;
				p.lng = houseDeal.lng;
				p.buildYear = houseDeal.buildYear;
				p.address = houseDeal.address;
				p.dealAmount = houseDeal.dealAmount;
				p.aptName = houseDeal.aptName;
				
				
            	places.push(p);
            }
            console.log(houseDeal);
          });
          //$("#housedeal-list").empty();
       	  console.log("places:"+places);
       	  //hellohello();
          if(places.length>0){
        	  console.log("BEFORE DISPLAY MARKERS");
        	  displayMarkers(places);
        	  console.log("AFTER DISPLAY MARKERS");
          }
          makeHouseDealList(houseDealList);
        }
      }
    } 
    
	// houseDeal list 응답을 처리
	function getHouseDealDatasForSearched() {
		console.log("Get HouseDeal Data!-------TEST KNAPSACK")
		if (httpRequest.readyState == 4) {
			if (httpRequest.status == 200) {
				let houseDealList = [];
				let txt = httpRequest.responseText;
				//console.log(txt);
				let datas = JSON.parse(txt);
				console.log("TEST DATAS : " + datas);
				const searched = datas["searched"];
				const bestcomb = datas["bestcomb"];
				console.log(searched);
				console.log(typeof searched);
				let places = [];
				searched.forEach((data) => {
				 let houseDeal = new Object();
				 houseDeal.no = data.no;
				 houseDeal.aptName = data.aptName;
				 houseDeal.dealAmount = data.dealAmount;
				 houseDeal.dealYear = data.dealYear;
				 houseDeal.dealMonth = data.dealMonth;
				 houseDeal.dealDay = data.dealDay;
				 houseDeal.area = data.area;
				 houseDeal.floor = data.floor;
				 houseDeal.type = data.type;
				 houseDeal.rentMoney = data.rentMoney;
				
				 houseDeal.aptName = data.aptName;
				 houseDeal.buildYear = data.buildYear;
				 houseDeal.address = data.address;
				 houseDeal.lat = data.lat;
				 houseDeal.lng = data.lng;
				 //wc.link = "javascript:updateCount('" + data.text + "');";
				 houseDealList.push(houseDeal);
				 if(houseDeal.lat!=null || houseDeal.lng!=null){
				 // 전체 조회는 마커 표시하지 않기 위해
				 const p = new place();
				 p.lat = houseDeal.lat;
				 p.lng = houseDeal.lng;
				 p.buildYear = houseDeal.buildYear;
				 p.address = houseDeal.address;
				 p.dealAmount = houseDeal.dealAmount;
				 p.aptName = houseDeal.aptName;
				
				
				 places.push(p);
				 }
				 console.log(houseDeal);
				 });
				 //$("#housedeal-list").empty();
				 console.log("places:"+places);
				 //hellohello();
				 if(places.length>0){
				 console.log("BEFORE DISPLAY MARKERS");
				 displayMarkers(places);
				 console.log("AFTER DISPLAY MARKERS");
				 }
				 makeHouseDealList(houseDealList); 
				 
				 let bestCombList = []
				 // best comb 
				 bestcomb.forEach((data) => {
					 let houseDeal = new Object();
					 //houseDeal.no = data.no;
					 houseDeal.aptName = data.aptName;
					 houseDeal.dealAmount = data.dealAmount;
					 //houseDeal.dealYear = data.dealYear;
					 //houseDeal.dealMonth = data.dealMonth;
					 //houseDeal.dealDay = data.dealDay;
					 houseDeal.area = data.area;
					 //houseDeal.floor = data.floor;
					 //houseDeal.type = data.type;
					 //houseDeal.rentMoney = data.rentMoney;
					
					 houseDeal.buildYear = data.buildYear;
					 houseDeal.address = data.address;
					 houseDeal.lat = data.lat;
					 houseDeal.lng = data.lng;
					 //wc.link = "javascript:updateCount('" + data.text + "');";
					 bestCombList.push(houseDeal);
					
				});
				makeBestCombList(bestCombList); 
			}
		}
	}
  
  function makeHouseDealList(houseDealList) {
	  
	  var houseDealListItems = "";
	  console.log("searchall" + houseDealList);
	  houseDealList.forEach((houseDeal) => {
		 console.log("housedeal info : "+houseDeal.aptName);
		  houseDealListItems += `										
		  <li class="housedeal-list-item">
		  <div class="housedeal-card shadow hover-pointer" >
				<div class="apt-name">
					${'${houseDeal.aptName}'}
				</div>
				<div>
					${'${houseDeal.address}'}
				</div>
				<br/>
				<div>
					거래금액 :
					${'${houseDeal.dealAmount}'}
					만원
				</div>
				<div>
				거래일 :
				${'${houseDeal.dealYear}'}년 
				${'${houseDeal.dealMonth}'}월 
				${'${houseDeal.dealDay}'}일 
				</div>
				<div>
					전용면적 :
					${'${houseDeal.area}'}
					m<sup>2</sup>
				</div>
				<div class="apt-year">
					건축년도 :
					${'${houseDeal.buildYear}'}
				</div>
			</div>
			</li>`
	  });
	  $("#housedeal-list").empty().append(houseDealListItems);
  }
  
function makeBestCombList(bestCombList) {
	  
	  var bestCombListItems = "";
	  let totalArea = 0;
	  let totalDealAmount = 0;
	  let totalBuildYear = 0;
	  bestCombList.forEach((houseDeal) => {
		  totalArea += parseFloat(houseDeal.area);
		  totalDealAmount += parseInt((houseDeal.dealAmount).split(",").join(""));
		  totalBuildYear += parseInt(houseDeal.buildYear);
		  
		  bestCombListItems += `										
		  <li class="housedeal-list-item">
		  <div class="housedeal-card shadow hover-pointer" >
				<div class="apt-name">
					${'${houseDeal.aptName}'} 
				</div>
				<div>
					${'${houseDeal.address}'}
				</div>
				<br/>
				<div>
					<span class="font-weight-bold">거래금액 :</span>
					${'${houseDeal.dealAmount}'}
					만원 &nbsp; 
					<span class="font-weight-bold">전용면적 :</span>
						${'${houseDeal.area}'}
						m<sup>2</sup> &nbsp; 
					<span class="font-weight-bold"> 건축년도 :</span>
					${'${houseDeal.buildYear}'}
				</div>
	
			</div>
			</li>`
	  });
	  const avgBuildYear = parseInt(totalBuildYear/bestCombList.length);
	  if(bestCombList.length>0) {
	  bestCombListItems += `
	  	<br/>
	  		<div  class="housedeal-card shadow">
	  			<table class="apt-name">
	  				<tr><td class="text-black-75">총 면적</td> <td class="text-primary offset-1 ">${'${totalArea}'} m<sup>2</sup></td></tr>
	  				<tr><td class="text-black-75">총 금액</td> <td class="text-primary offset-1 ">${'${totalDealAmount}'} 만원</td></tr>
	  				<tr><td class="text-black-75">평균 건축년도&nbsp;&nbsp;</td> <td class="text-primary offset-1 ">${'${avgBuildYear}'} 년</td></tr>
	  			</table>
	  		</div>
	  	</div>
	  	<br/>
	  `;
	  }
	  $("#bestcomb-list").empty().append(bestCombListItems);
	  
  }
  
  function getHouseView() {
	  console.log("Get HouseDeal Data!")
      if (httpRequest2.readyState == 4) {
        if (httpRequest2.status == 200) {
          let houseDealList = [];
          let txt = httpRequest2.responseText;
          //console.log(txt);
          let datas = JSON.parse(txt);
          let places = [];
          datas.forEach((data) => {
            let houseDeal = new Object();
            houseDeal.no = data.no;
            houseDeal.aptName = data.aptName;
            houseDeal.dealAmount = data.dealAmount;
            houseDeal.dealYear = data.dealYear;
            houseDeal.dealMonth = data.dealMonth;
            houseDeal.dealDay = data.dealDay;
            houseDeal.area = data.area;
            houseDeal.floor = data.floor;
            houseDeal.type = data.type;
            houseDeal.rentMoney = data.rentMoney;
            
            houseDeal.aptName = data.aptName;
            houseDeal.buildYear = data.buildYear;
            houseDeal.address = data.address;
            houseDeal.lat = data.lat;
            houseDeal.lng = data.lng;
            houseDealList.push(houseDeal);
          });
          makeHouseViewList(houseDealList);
        }
      }
    }
  
  function makeHouseViewList(houseDealList) {
	  
	  var houseDealListItems = "";
	  console.log("viewcheck" + houseDealList);
	  houseDealList.forEach((houseDeal) => {
		 console.log("housedeal info : "+houseDeal.aptName);
		  houseDealListItems += `	
		  <span class="viewc" style="width : 30%" >
					&nbsp;☆${'${houseDeal.address}'}☆
			</span>
			`
	  });
	  $("#viewList").empty().append(houseDealListItems);
  }

$(document).ready(function () {

  sendRequest("sido", "*00000000");

  $(document).on("change", "#sido", function () {
    regcode = $(this).val().substr(0, 2) + "*00000";
    console.log("sido select regcode : " + regcode);
    $("#gugun").empty();
    $("#dong").empty().append("<option>all</option>");
    sendRequest("gugun", regcode);
  });

  $(document).on("change", "#gugun", function () {
    regcode = $(this).val().substr(0, 5) + "*";
    console.log("gugun select regcode : " + regcode);
    sendRequest("dong", regcode);
  });
  
/*   $(document).on("click","#search_btn", function(){
	  const sidoName = $("#sido").val();
	  const gugunName = $("#gugun").val();
	  const dongName = $("#dong").val();
	  console.log("test ::: "+ sidoName+" "+gugunName+" "+dongName);
  }) */

});

$(document).on("click", "#search_btn", searchHousedeals); 
$(document).on("keydown","#searchForm", function(e) {console.log("check!");if(e.keyCode==13)e.preventDefault();})
function searchHousedeals(){
	  console.log("search_btn clicked");
    httpRequest = $.ajax({
    	type:"POST",
    	url:"http://localhost:8080/happyhouse/house/deal/list",
		data: {
			key:$("#key").val(),
			word:$("#word").val(),
			dong:$("#dong").val(),
			gugun:$("#gugun").val(),
			sido:$("#sido").val(),
			k:$("#k").val(),
		},
	    success: getHouseDealDatasForSearched,
    	error: function(XMLHttpRequest,textStatus,errorThrown){
    		alert("통신 실패 : "+errorThrown);
    	}
    });
    	
 };

// $(document).on("click", "#search_btn", function () {
//   console.log("search start");
//   var pageNo = "1";
//   var numOfRows = "10";

//   let gugun = $("#gugun").val().substr(0, 5);
//   let ym = "" + $("#year").val() + $("#month").val();
//   console.log(gugun + " " + ym);
//   let requestData = {
//     serviceKey: ServiceKey,
//     pageNo: "1",
//     numOfRows: "30",
//     LAWD_CD: gugun,
//     DEAL_YMD: ym,
//   };
//   $.ajax({
//     url: url,
//     type: "GET",
//     data: requestData,
//     dataType: "xml",
//     success: function (response) {
//       console.log(response);
//     },
//     error: function (xhr, status, msg) {
//       console.log("상태값 : " + status + " Http에러메시지 : " + msg);
//     },
//   });
// });

function AptInfo(aptName, pay, dong, area, year) {
    this.aptName = aptName;
    this.pay = pay;
    this.dong = dong;
    this.area = area;
    this.year = year;
};
var aptInfos  = [];

function showByApt(index) {
  console.log("function --> "+index)
  aptInfos = aptInfos.filter((apt)=>apt.aptName === aptInfos[index].aptName);
  
  var houseDealList = ``;
  aptInfos.forEach((apt,idx)=>{
    for(var s in apt) console.log(apt[s]);
    houseDealList += `
                		<li class="housedeal-list-item"><div class="housedeal-card shadow hover-pointer" onclick="showByApt(${idx})">
                      <h5 class="apt-name">${apt.aptName}</h5>
                		<div>거래금액 : ${apt.pay} 만원</div>
                		<div>법정동 : ${apt.dong}</div>
                		<div>전용면적 : ${apt.area} m<sup>2</sup></div>
                		<div class="apt-year">건축년도 : ${apt.year}</div>
                		</div></li>
                	`;
  });
  
  $("#housedeal-list").empty().append(houseDealList);
}


function sendRequest(selid, regcode) {
  console.log("regcode : " + regcode);
  $.ajax({
    url: "https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes",
    type: "GET",
    data: {
      regcode_pattern: regcode,
      is_ignore_zero: true,
    },
    dataType: "json",
    success: function (response) {
      console.log(response);
      addOption(selid, response);
    },
    error: function (xhr, status, msg) {
      console.log("상태값 : " + status + " Http에러메시지 : " + msg);
    },
  });
}

function addOption(selid, data) {
  let code = ``;
  let initOption = ``;
  switch (selid) {
  case "sido":
      initOption = `<option>시도선택</option>`;
      $("#sido").empty().append(initOption);
      $.each(data.regcodes, function (i, regcode) {
        console.log(regcode);
        code += "<option value='"
        		+ regcode.code
        		+ "'>"
        		+regcode.name.split(" ")[0]
        		+"</option>";
      });
      break;
    case "gugun":
      initOption = `<option>구군선택</option>`;
      $("#gugun").empty().append(initOption);
      console.log(data.regcodes);
      for (let i = 0; i < data.regcodes.length; i++) {
        if (i != data.regcodes.length - 1) {
          if (
            data.regcodes[i].name.split(" ")[1] ==
              data.regcodes[i + 1].name.split(" ")[1] &&
            data.regcodes[i].name.split(" ").length !=
              data.regcodes[i + 1].name.split(" ").length
          ) {
            data.regcodes.splice(i, 1);
            i--;
          }
        }
      }
      console.log(data.regcodes);
      let name = "";
      $.each(data.regcodes, function (i, regcode) {
        if (regcode.name.split(" ").length == 2)
          name = regcode.name.split(" ")[1];
        else
          name = regcode.name.split(" ")[1] + " " + regcode.name.split(" ")[2];
        code += "<option value='" + regcode.code + "'>" + name + "</option>";
      });
      break;
    case "dong":
      initOption = `<option>all</option>`;
      $("#dong").empty().append(initOption);
      let idx = 2;
      $.each(data.regcodes, function (i, regcode) {
        if (data.regcodes[i].name.split(" ").length != 3) idx = 3;
        code += "<option value='"+regcode.code+"'>"+regcode.name.split(" ")[idx]+"</option>";
      });
      break;
  }
  $("#" + selid).append(code);
}

  </script>






</head>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<%-- 		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">
			<!-- Sidebar - Brand -->

			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="${root}/happyhouse/"> <img src="../assets/icon.png"
				alt="logo" style="max-width: 10%; height: auto" />
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">Happy House</div>
			</a>
			<!-- Divider -->
			<hr class="sidebar-divider my-0" />

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link" href="#"> <i
					class="bi-file-earmark-ruled m-auto text-white"></i> <span>&nbsp;거래내역
						조회</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider" />

			<!-- Heading -->
			<div class="sidebar-heading">Information</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link" href="news.jsp"> <i
					class="bi-newspaper m-auto text-white"></i> <span>&nbsp;부동산
						뉴스</span>
			</a></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link"
				href="notice.jsp"> <i
					class="bi-clipboard m-auto text-white"></i> <span>&nbsp;공지사항</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block" />

			<!-- Sidebar Toggler (Sidebar) -->
			<!-- <div class="text-center d-none d-md-inline">
          <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div> -->

			<!-- Sidebar Message -->

		</ul> --%>
		<jsp:include page="../include/sidebar.jsp" />
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Search -->


					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">
						<!-- Nav Item - Search Dropdown (Visible Only XS) -->

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
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">거래내역 조회</h1>

					</div>

					<!-- Content Row -->
					<div class="row " >
						<form
							id="searchForm"
							class ="navbar-search"
							method="POST" action="deal/list" onsubmit="searchHousedeals()">
							<!-- <input type="hidden" name="action" value="searchdeal" /> -->
							<div class="input-group">
								<div>
									<select name="key" id="key">
										<option value="searchbyarea">지역</option>
										<option value="searchbyname">아파트</option>
									</select>
								</div>
								<div>
									<select name="sido" id="sido"></select> <select name="gugun"
										id="gugun">
										<option value="">구군선택</option>
									</select> <select name="dong" id="dong">
										<option value="all">all</option>
									</select>
								</div>
								<div>
									<input type="text" id="word" name="word" placeholder="아파트명 입력" />
								</div>

								<div class="input-group-append">
									<!-- <input type="submit"> -->
									<button class="btn btn-primary" id="search_btn" type="button">
										<i class="bi-search"></i>
									</button>
								</div>
							</div>
						</form>
						<div class="col-lg-6" align="left" >
						     <div class="card shadow " style="height : 86px" style="width :100%">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header d-flex flex-row align-items-center justify-content-between"
								>
									<h6 class="m-0 font-weight-bold text-primary">현재 뜨거운 동네</h6>

								</div>
								<!-- Card Body -->
								<div id="viewList">
								</div>
							</div>
						      
						</div>
						
					</div>
					<!-- Content Row -->
					<br />
					
					<!-- Best Comb -->
					
					<div class="row">
					<div class="col-xl-4 col-lg-7" align="left" >
							<div>
								총 투자금 &nbsp;<input type="number" id="k" name="k" placeholder="투자 가능 금액 "/>만원
							</div>						
							<br/>
						     <div class="card shadow " >
								<!-- Card Header - Dropdown -->
								<div
									class="card-header d-flex flex-row align-items-center justify-content-between"
								>
									<h6 class="m-0 font-weight-bold text-primary">추천 최고 아파트 조합</h6>

								</div>
								<!-- Card Body -->
									<div id="bestcomb-list">
									</div>
					
							</div>
					</div>
					</div>
					<br/>

					<div class="row">
						<!-- Area Chart -->
						<div class="col-xl-4 col-lg-7">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between" >
									<h6 class="m-0 font-weight-bold text-primary">거래 정보</h6>

								</div>
								<!-- Card Body -->
								<div>
									<ul id="housedeal-list">
										<%-- 										<%
											ArrayList<HouseDeal> housedealList = (ArrayList<HouseDeal>) request.getAttribute("housedealList");
																			if (housedealList != null) {

																				for (HouseDeal housedeal : housedealList) {
										%>
										<li class="housedeal-list-item"><div
												class="housedeal-card shadow hover-pointer"
												>
												<h5 class="apt-name">
													아파트 이름:
													<%=housedeal.getAptName()%></h5>
												<div>
													거래금액 :
													<%=housedeal.getDealAmount()%>
													만원
												</div>
												<div>
													법정동 :
													<%=housedeal.getDongName()%></div>
												<div>
													전용면적 :
													<%=housedeal.getArea()%>
													m<sup>2</sup>
												</div>
												<div class="apt-year">
													건축년도 :
													<%=housedeal.getBuildYear()%></div>
											</div></li>

										<%
											}
											}
										%> --%>
									</ul>
								</div>
							</div>
						</div>

						<!-- Pie Chart -->
						<div class="col-xl-8 col-lg-5">
							<div class="card shadow mb-4">
								<!-- Card Header - Dropdown -->
								<div
									class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
									<h6 class="m-0 font-weight-bold text-primary">지도</h6>

								</div>
								<!-- Card Body -->
								<div class="card-body">
									<div id="map" style="width: 100%; height: 70vh;"></div>
									<!--카카오 맵 API-->
									<script type="text/javascript"
										src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c55152ebe143d53da08dae86d55b65f5&libraries=services"></script>
									<script type="text/javascript" src="../js/map.js"></script>
								</div>
							</div>
						</div>
					</div>

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
			<a class="scroll-to-top rounded" href="#page-top"> <i
				class="fas fa-angle-up"></i>
			</a>
</body>
</html>
