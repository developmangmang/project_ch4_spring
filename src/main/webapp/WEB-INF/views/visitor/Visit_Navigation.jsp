<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String com_name = (String)request.getAttribute("com_name");
  String com_addr = (String)request.getAttribute("com_addr");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<!-- Link Import --> 
<%@ include file="../../Style/common/HeadUI.jsp"%> 
<title>Insert title here</title>
<style>
   #div_title{
        border-bottom:1px solid #d8d8d8;
   }
   #title{
        font-size:30px;
        font-weight: bold;       
        padding-top:30px;
        padding-bottom:15px;
   }
   #description{
       padding-top:20px;
   }
</style>   
</head>
<body>
<%@ include file="../CommonForm/Top.jsp"%>
<div class="container" style="width:100%;height:80%">
   
    <div class="row" id="div_title">        
        <div class="col-sm-6 col-sm-offset-3" id="title">오시는길</div>
    </div>
    <div class="row">
        <div class="col-sm-6 col-sm-offset-3" id="map" style="width:1100px;height:500px;"></div>
    </div>  
    <div class="row" id="description">
        <div class="col-sm-3 col-sm-offset-3">여기다 설명할거</div>
        <div class="col-sm-3">
            <button class="btn btn-primary" style="width:120px;margin-right:20px;">길찾기</button>
        </div>
    </div>
</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e2e985efa1fac09e950547473e48705&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('<%=com_addr%>', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=com_name%></div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
</body>
</html>