<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 -->
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>출입 관리 메인 - CH4 방문/반입 자동화 시스템</title>
<!-- 공통코드 -->
<%@ include file="../../../Style/common/HeadUI.jsp"%>
</head>
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Raleway:400,500,800">
<style>
	html, body {
		margin: 0;
		width: 100%;
		height: 100%;
	}
	#main_container{
		background-color: #f6f3ee;
		height: 100%;
	}
	#logo_ch4 {
		margin-top : 100px;
		height: 120px;
	}
	#middleline {
		border-right-style: solid;
		border-color: #4a96ad;	
		height: 70px;	
		border-width: thin; 
	}
	#comname_area {
		border-style: solid hidden solid hidden;
		border-color: #4a96ad;
		border-width: thick;
	}
	#comname_area h1 {
		color: #274f5a;
		padding-block-start: 50px;
		padding-block-end: 50px;
		font-weight: 900;
		font-family: Georgia, "맑은 고딕", serif;
		font-size: 50px;
	}
	#movebox {
		border-style: solid hidden solid solid;
		border-color: #4a96ad;
		border-width: thin;
		
	}
	#movebox h3 {
		margin: 10px 10px 10px 10px;
	}
	#movebox h3 a {
		color: #274f5a;
		font-size: 20px;
		font-family: Georgia, "맑은 고딕", serif;
	}
</style>
<body>
<%@ include file="../../CommonForm/Top.jsp"%>
<%@ include file="../../CommonForm/InfoTop.jsp"%>
<div class="container-fluid" id="main_container">
	<div class="col-lg-offset-3 col-lg-6 col-lg-offset-3">
		<div class="row" align="center" id="logoarea" >
			<img src="${host}/resources/Style/images/logo/logo_cyan2.png" id="logo_ch4">
		</div>
		<div class="row" >
			<div class="col-lg-6 col-lg-offset" id="middleline"></div>
		</div>
		<div class="row" id="comname_area" align="center">
			<h1><%=com_name%></h1>
		</div>
		<div class="row">
			<div class="col-lg-6 col-lg-offset" id="middleline"></div>
		</div>
		<div class="row">
			<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
				<div class="col-lg-4" id="movebox" align="center">
					<h3>
						<a href="/info/logVisitor.ch4">방문자현황</a>
					</h3>
				</div>
				<div class="col-lg-4" id="movebox" align="center">
					<h3>
						<a href="/info/logGoods.ch4">반입현황</a>
					</h3>
				</div>
				<div class="col-lg-4" id="movebox" align="center"  style="border-right-style: solid;">
					<h3>
						<a href="/info/totalManage.ch4">종합관리</a>
					</h3>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>