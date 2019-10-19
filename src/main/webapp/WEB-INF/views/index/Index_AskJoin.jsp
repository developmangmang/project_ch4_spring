<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--meta charset tags --> 
<meta charset="utf-8"> 
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<!-- Link Import --> 
<%@ include file="../../Style/common/HeadUI.jsp"%> 
<title>Index_AskJoin</title>
<style type="text/css">
	div .textbox {
		margin-top:7px;
	}
	label {
		margin-top: 14px;
	}
	.banner_Main {
		margin-top: 0px;
		padding-top: 10px;
		height: 300px;
		background-image: url('../../Style/images/banner/speedGate (3).jpg');
	}
	.jumbotron_Main a{
		font-size: 25px;
	}
	.jumbotron_Main a{
		font-size: 25px;
	}
	.Content_title h1{
		padding-top: 12px;
		padding-bottom: 12px;
	    border-width: thick;
	    margin-bottom: -10px;
	}
	#qa_title{
		background-color: #5c5c5c;
	}
</style>
</head>

<body>
<!-- Top -->	<!-- 선택된 페이지 class : nav-item active // 나머지 페이지: nav-item -->
<%@ include file="../CommonForm/Top.jsp"%>
<!-- Banner -->
<section class="banner_Main">
	<div class="jumbotron_Main">
		<div class="container_Banner_Content col-lg-offset-2 col-lg-2 col-lg-8" style="color: white">
			<div class="row Content_title">
				<h1 style="font-size:50px; margin-top: 70px; text-shadow: 4px 2px 2px gray;">Ask_Join</h1>
			</div>
			<div class="row page_link"  style="padding-left: 5px;">
					<a href="Index_Main.jsp">Home</a> → <a href="Index_AskJoin.jsp"> Ask_Join</a>
			</div>
		</div>
	</div>
</section>
<div class="well col-lg-offset-2 col-lg-8 col-lg-offset-2" id="qa_title" >
	<h2><font color="tomato" style="font-family: fantasy;" >회원가입 문의</font><font color="white">게시판</font></h2>
	<p><font color="white">서비스를 이용하시는 중 궁금한 사항 및 불편한 사항을 문의해주세요.<br>
	      문의하신 내용의 처리 및 답변은 평일기준 24시간 이내 처리됩니다.</font></p>
</div>
<!--안의 내용 들어갈 부분이에욤. -->
<!-- 공통 Footer -->
<%@ include file="../CommonForm/Footer.jsp"%>
</body>
</html>