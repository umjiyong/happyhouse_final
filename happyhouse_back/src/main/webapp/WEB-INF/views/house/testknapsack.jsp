<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<script>
		console.log("hello");
		
		// houseDeal list ������ ó��
		function getHouseDealDatas() {
			console.log("Get HouseDeal Data!-------TEST KNAPSACK")
			if (httpRequest.readyState == 4) {
				if (httpRequest.status == 200) {
					let houseDealList = [];
					let txt = httpRequest.responseText;
					//console.log(txt);
					let datas = JSON.parse(txt);
					console.log("TEST DATAS : " + datas);
					const searched = datas["searched"];
					const bestcomb =  datas["bestcomb"];
					let place = [];
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
					 // ��ü ��ȸ�� ��Ŀ ǥ������ �ʱ� ����
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
		
		function makeBestCombList(bestComb) {
			let list = ``;
			bestComb.forEach((housedeal)=>{
				list += `
					<div>
						${'${housedeal.aptName}'}
					</div>
				`
			});
			$("#bestcomblist").append(list);
		}
		
		function searchHousedeals() {
			console.log("search_btn clicked");
 			httpRequest = $.ajax({
				type : "POST",
				url : "http://localhost:8080/happyhouse/house/deal/list",
				data : {
					key : $("#key").val(),
					word : $("#word").val(),
					dong : $("#dong").val(),
					gugun : $("#gugun").val(),
					sido : $("#sido").val(),
					k: $("#k").val()
				},
				success : getHouseDealDatas,
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("��� ���� : " + errorThrown);
				}
			});
 
		};


	</script>
	<div id="bestcomblist">
	
	</div>
	<button onclick="searchHousedeals()" value="hello">hello</button>
	<form onsubmit="searchHousedeals()">
	<button>����</button>
	</form>
	<form id="searchForm" class="navbar-search" method="POST"
		action="deal/list" onsubmit="searchHousedeals()">
		<!-- <input type="hidden" name="action" value="searchdeal" /> -->
		<div class="input-group">
			<div>
				<select name="key" id="key">
					<option value="searchbyarea">����</option>
					<option value="searchbyname">����Ʈ</option>
				</select>
			</div>
			<div>
				<select name="sido" id="sido"></select> <select name="gugun"
					id="gugun">
					<option value="">��������</option>
				</select> <select name="dong" id="dong">
					<option value="all">all</option>
				</select>
			</div>
			<div>
				<input type="text" id="word" name="word" placeholder="����Ʈ�� �Է�" />
			</div>
			<div>
				<input type="number" id="k" name="k" placeholder="���� ���� �ݾ��Է�"/>����
			</div>
			<div class="input-group-append">
				<!-- <input type="submit"> -->
				<button class="btn btn-primary" id="search_btn" type="button" onclick="searchHousedeals()">
					�˻�! <i class="bi-search"></i>
				</button>
			</div>
		</div>
	</form>

</body>
</html>