<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 -->
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>승인자 메인 - CH4 방문자 관리 시스템</title>
<!-- 공통코드 -->
<%@ include file="../../../Style/common/HeadUI.jsp"%>
</head>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway:400,500,800">
<style>
/* 소개 메뉴 스타일 설정 */
figure.snip1200 {
	font-family: 'Raleway', Arial, sans-serif;
	position: relative;
	overflow: hidden;
	margin: 10px;
	min-width: 220px;
	max-width: 310px;
	max-height: 310px;
	width: 100%;
	background: #000000;
	color: white;
	text-align: center;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
	font-size: 16px;
}

figure.snip1200 * {
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-transition: all 0.45s ease-in-out;
	transition: all 0.45s ease-in-out;
}

figure.snip1200 img {
	max-width: 100%;
	position: relative;
	opacity: 0.9;
}

figure.snip1200 figcaption {
	position: absolute;
	top: 45%;
	left: 7%;
	right: 7%;
	bottom: 45%;
	border: 1px solid white;
	border-width: 1px 1px 0;
}

figure.snip1200 .heading {
	overflow: hidden;
	-webkit-transform: translateY(50%);
	transform: translateY(50%);
	position: absolute;
	bottom: 0;
	width: 100%;
}

figure.snip1200 h2 {
	display: table;
	margin: 0 auto;
	padding: 0 10px;
	position: relative;
	text-align: center;
	width: auto;
	text-transform: uppercase;
	font-weight: 400;
}

figure.snip1200 h2 span {
	font-weight: 800;
}

figure.snip1200 h2:before, figure.snip1200 h2:after {
	position: absolute;
	display: block;
	width: 1000%;
	height: 1px;
	content: '';
	background: white;
	top: 50%;
}

figure.snip1200 h2:before {
	left: -1000%;
}

figure.snip1200 h2:after {
	right: -1000%;
}

figure.snip1200 p {
	top: 50%;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%);
	position: absolute;
	width: 100%;
	padding: 0 20px;
	margin: 0;
	opacity: 0;
	line-height: 1.6em;
	font-size: 0.9em;
}

figure.snip1200 a {
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	position: absolute;
	z-index: 1;
}

figure.snip1200:hover img, figure.snip1200.hover img {
	opacity: 0.25;
	-webkit-transform: scale(1.1);
	transform: scale(1.1);
}

figure.snip1200:hover figcaption, figure.snip1200.hover figcaption {
	top: 7%;
	bottom: 7%;
}

figure.snip1200:hover p, figure.snip1200.hover p {
	opacity: 1;
	-webkit-transition-delay: 0.35s;
	transition-delay: 0.35s;
}
</style>
<body>
	<%@ include file="../../CommonForm/Top.jsp"%>

	<!-- Content -->
	<div class="mainContent">
		<%@ include file="../../CommonForm/ManagerSideBar.jsp"%>
		<div style="padding-left: 200px">
			<div class="col-lg-12">
				<div class="col-lg-offset-1 col-lg-10"
					style="margin-top: 20px; margin-bottom: 20px;">
					<div style="font-size: 35px; width: 78%; float: left;">
						<h1><%=com_name%></h1>
					</div>
				</div>
				<div class="col-lg-offset-1 col-lg-10">
					<div class="col-md-6 col-lg-3">
						<figure class="snip1200">
							<img src="http://localhost:8000/resources/Style/images/postIt/yellow.png" alt="sq-sample27" />
							<figcaption>
								<p>귀사에 방문 신청한 자료들을 조회합니다.이 페이지에서 신청에 대한 승인/반려를 처리합니다.</p>
								<div class="heading">
									<h2>
										방문<span> 신청 조회</span>
									</h2>
								</div>
							</figcaption>
							<a href="/company/searchVisitor.ch4"></a>
						</figure>
					</div>

					<!-- Portfolio Item 2 -->
					<div class="col-md-6 col-lg-3">
						<figure class="snip1200">
							<img src="http://localhost:8000/resources/Style/images/postIt/red.png" alt="sq-sample27" />
							<figcaption>
								<p>귀사에 대한 방문 신청을 처리한 건들을 조회합니다. 승인된 신청에 대해서 방문자들의 위치를 파악 할 수
									있습니다.</p>
								<div class="heading">
									<h2>
										방문<span> 현황 조회</span>
									</h2>
								</div>
							</figcaption>
							<a href="/company/logVisitor.ch4"></a>
						</figure>
					</div>

					<!-- Portfolio Item 3 -->
					<div class="col-md-6 col-lg-3">
						<figure class="snip1200">
							<img src="http://localhost:8000/resources/Style/images/postIt/greenblue.png" alt="sq-sample27" />
							<figcaption>
								<p>귀사에 반입할 물품에 대해서 반입 신청한 자료를 조회합니다. 이 페이지에서 신청에 대하 승인/반려를
									처리합니다.</p>
								<div class="heading">
									<h2>
										반입<span> 신청 조회</span>
									</h2>
								</div>
							</figcaption>
							<a href="/company/searchGoods.ch4"></a>
						</figure>
					</div>

					<!-- Portfolio Item 4 -->
					<div class="col-md-6 col-lg-3">
						<figure class="snip1200">
							<img src="http://localhost:8000/resources/Style/images/postIt/blue.png" alt="sq-sample27" />
							<figcaption>
								<p>귀사에 대한 반입 신청을 처리한 건들을 조회합니다. 승인된 신청에 대해서 반입 물품들의 처리상태를 파악
									할 수 있습니다.</p>
								<div class="heading">
									<h2>
										반입<span> 현황 조회</span>
									</h2>
								</div>
							</figcaption>
							<a href="/company/logGoods.ch4"></a>
						</figure>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>