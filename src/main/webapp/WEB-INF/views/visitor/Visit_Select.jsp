<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<!-- Link Import --> 
<%@ include file="../../Style/common/HeadUI.jsp"%> 
<title>방문/반입 - CH4 방문자 관리 시스템</title>
</head>
<body>
<%@ include file="../CommonForm/Top.jsp"%>
<script type="text/javascript">
	function applyVisitor(){
		location.href = "/visitor/visitPurpose.ch4?pp=visitor";
	}
	function applyGoods(){
		location.href = "/visitor/visitPurpose.ch4?pp=goods";
	}
</script>
<div class="container-fluid">
	<div class="col-lg-offset-2 col-lg-8 col-lg-offset-2" style="text-align:center;">
		<h1><b>방문/반입 선택</b></h1>
		<div class="row" style="padding-top:40px;">
			<div class="col-lg-offset-1 col-lg-5">
				<button onClick="applyVisitor()">
					<img src="http://localhost:8080/resources/Style/images/crud/visitor_logo.png" class="img-thumbnail" style="background-color:#E8E8E8;">
				</button>
			</div>
			<div class="col-lg-5">
				<button onClick="applyGoods()">
					<img src="http://localhost:8080/resources/Style/images/crud/transport_logo.png" class="img-thumbnail" style="background-color:#E8E8E8;">
				</button>		
			</div>
		</div>
	</div>
</div>
</body>
</html>