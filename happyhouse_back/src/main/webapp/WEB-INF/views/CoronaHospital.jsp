<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#listBtn').click(function () {
                var ServiceKey = 'iT0EnygBr+qYTMqPt1bdwNuwGJeVyDAR6+cK/lxyT5QOGx/9CfSF/XIfOLbKwLXFVQduNGsNbZ6dfhnYQxLk6w==';
                var pageNo = '1';
                var numOfRows = '30';
                // server에서 넘어온 data
                $.ajax({
                    url: 'http://apis.data.go.kr/B551182/rprtHospService/getRprtHospService?serviceKey=인증키(URL Encode)&pageNo=1&numOfRows=10',
                    type: 'GET',
                    data: {
                        "ServiceKey": ServiceKey,
                        "pageNo": pageNo,
                        "numOfRows": numOfRows,
                    },
                    dataType: 'xml',
                    success: function (response) {
                        console.log(response);
                        makeList(response);
                    },
                    error: function (xhr, status, msg) {
                        console.log('상태값 : ' + status + ' Http에러메시지 : ' + msg);
                    },
                });
            });

            function makeList(data) {
                var hospitalList = ``;
                var items = $('item', data);
                $.each(items, function(index, item){
                	console.log(item);
                	hospitalList +=`
                		<tr>
                		<td>${$('yadmNm', item).text()}</td>
                		<td>${$('telno', item).text()}</td>
                		<td>${$('addr', item).text()}</td>
                		<td>${$('pcrPsblYn', item).text()}</td>
                		<td>${$('YPosWgs84', item).text()}</td>
                		<td>${$('XPosWgs84', item).text()}</td>
                		</tr>
                	`;
                        $('#hospitalInfo').empty().append(hospitalList);
                })

                $('tr:first').css('background', 'darkgray').css('color', 'white');
                $('tr:even').css('background', 'lightgray');
            }
        });
    </script>
</head>

<body>
    <h3>건강보험심사평가원_호흡기 진료 지정 의료기관 정보서비스</h3>
    <button id="listBtn">의료 기관 정보 얻기</button>
    <table>
        <tr>
            <th>요양 기관 이름</th>
            <th>전화번호</th>
            <th>주소</th>
            <th>PCR 가능 여부</th>
            <th>위도</th>
            <th>경도</th>
        </tr>
        <tbody id="hospitalInfo"></tbody>
    </table>
</body>

</html>