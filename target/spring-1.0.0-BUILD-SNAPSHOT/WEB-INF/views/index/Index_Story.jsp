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
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<title>Insert title here</title>
<style type="text/css">
.banner_Main {
	margin-top: 0px;
	margin-bottom: 50px;
	padding-top: 0px;
	height: 200px;
	background-image: url('../../Style/images/banner/speedGate (1).jpg');
}

.step {
	-webkit-font-smoothing: antialiased;
	margin-left: 0px;
	text-align: left;
	padding-top: 10px;
	padding-left: 10px;
	border-width: 3px;
	border-color: #008329;
	padding-right: 10px;
	padding-bottom: 30px;
	background-size: 11px 2px;
	background-image:
		url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAGCAYAAADDl76dAAAAAXNSR0IArs4c6QAAABtJREFUGBljZGjW/M9ARcBERbPARo0aSHmIAgAynAG34TvqggAAAABJRU5ErkJggg==");
	border-left-style: solid;
	background-repeat: no-repeat;
	background-position: 0 0;
	align-items: center;
	align-content: center;
}

.histoy {
	margin-left: 20px;
}

.container {
	margin-left: 0px;
	margin-right: 0px;
	padding-left: 0px;
	padding-right: 0px;
}

.developdate {
	border-bottom-color: gray;
	border-bottom-style: solid;
	border-bottom-width: thin;
	padding-bottom: 10px;
	margin-bottom: 10;
	margin-bottom: 10px;
}

.about {
	color: #222;
	font-size: 45px;
	font-family: Spoqa Han Sans, Sans-serif;
	font-weight: 700;
	line-height: 1.2;
}

.title_p {
	font-size: 15px;
	margin-top: 20px;
	line-height: 2.6;
	text-align: center;
	font-family: Spoqa Han Sans, Sans-serif;
	font-weight: 500;
}

.phase {
	color: #222;
	font-size: 32px;
	font-family: Spoqa Han Sans, Sans-serif;
	font-weight: 400;
	line-height: 1.6;
}

.p_explain {
	margin-left: 10px;
	color: #707371;
	font-size: 18px;
	font-family: Spoqa Han Sans, Sans-serif;
	font-weight: 400;
	line-height: 1.5;
	color: #707371;
}

#content {
	font-family: Spoqa Han Sans, Sans-serif;
	font-weight: 500;
	line-height: 1.5;
	font-size: 22px;
	color: #008329;
	font-weight: 700;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-wrap: normal;

}

#del_date {
	padding-left:20px;
	font-size: 16px;
	color: #707371;
	font-family: Spoqa Han Sans, Sans-serif;
	font-weight: 400;
	line-height: 1.5;
	margin-bottom: 0px;
}
#im {
		width: 16px;
	height: 32px;
	display: inline-block;
	min-width: 16px;
	margin-right: -30px;
	background-size: 16px 32px;
	background-image:
		url("data:image/png;base64,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");
	background-repeat: no-repeat;
	background-position: center;
}
#headnav {
	margin-bottom: 0px;
	background-color:  #1db53a ;
}
.navbar-brand {
	padding-top: 2px;
}
.navbar-default .navbar-text {
	margin-bottom:0px;
	margin-top:0px;
    color: white;
    font-family: Spoqa Han Sans, Sans-serif;
    font-size: 24px;
    padding-top: 8px;
}
</style>
</head>
<body>
<script>
	AOS.init();
</script>
<%@ include file="../CommonForm/Top.jsp"%>
<nav class="navbar navbar-default" id="headnav">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#" >
        <img src="../../Style/images/logo/logo_navi5.png">
      </a>
       <p class="navbar-text">개발 스토리</p>
    </div>
  </div>
</nav>
<div class="container-fluid" align="center" >

	<div class="row"  style="background-color: #f9f9f9;">
		<div  class="aos-item aos-init aos-animate" data-aos="fade-up"
		 data-aos-id="about_title" data-aos-id-string="CH4">
			<h1 id="about_title" class="about" style="color: #008329">CH4</h1>
			<div class="col-lg-offset-3 col-lg-6 col-lg-offset-3">
				<p class="title_p">
					클라우드 웹서비스 기반
업무프로세스
1.방문자는 언제 어디서든 WEB으로 방문신청을 한다.
2.담당자는 언제 어디서든 WEB으로 방문승인을 한다.
3.경비실에서는 방문 승인정보에 의해 출입증을 발급한다.
4.출문 시 출입증을 회수한다.
구현 내용
*웹,앱으로 출입증 발급 : QR코드 or 바코드*예약 후, 네비게이션 연결 기능
*정기방문, 기간방문, 1회성 방문
*신원확인 방법 > 무인시스템 : 블록 체인 *안내데스크 기능(무인 안내) + 사무실 안내기능


*물류/화물차량 입고 , 일반 방문  - *주차증 기능 → 정산:핀테크  - *전시회/박물관 입장 > 자동결제
*병원 입/퇴원, 방문객  - *물품 보관 시스템  - *비회원/회원 기능  - *지문인식 기능 : 정기방문자
					
				</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="aos-item aos-init aos-animate" data-aos="fade-in"
			 data-aos-id="about_date" data-aos-id-string="개발 일정표">
			<div class="row title">
				<h2 class="about" id="about_date">개발 일정표</h2>
			</div>
			<div class="col-lg-offset-3 col-lg-6 col-lg-offset-3 Schedule">
				<img src="../../Style/images/banner/developdate.png" style="margin-top: 20px;">
			</div>
		</div>
	</div>
	<div class="row" align="center">
		<div class="aos-item aos-init aos-animate" data-aos="fade-in"
			 data-aos-id="about_stage" data-aos-id-string="개발 단계">
			 <div style="background-color: #f9f9f9;">
			 	<div class="row title">
					<h2 class="about" id="about_stage">개발 단계</h2>
				</div>
				<div class="row">
					<div class="histoy">
						<div class="col-lg-offset-4 col-lg-4 col-lg-offset-4">
							<div class="step">
								<div>
									<h3 class="phase">1단계</h3>
									<p class="p_explain">
									방문신청
회원관리/가입 : 관리자(기업)
자동화 인증 시스템 : 보안 인식(방문자 인증) : 블록 체인
</p>
								</div>
							</div>
							<div class="step">
								<div>
									<h3 class="phase">2단계</h3>
									<p class="p_explain">
									Q&A페이지 / 챗봇
네비게이션 API
물류 반출입 관리 시스템
입출고 기록 추적 → 바코드/QR 자동화 시스템
									
									</p>
								</div>
							</div>
							<div class="step">
								<div>
									<h3 class="phase">3단계</h3>
									<p class="p_explain">
									지문인식관리
관제시스템(실시간/녹화)
									
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<div class="aos-item aos-init aos-animate" data-aos="fade-in"
			 data-aos-id="about_diary" data-aos-id-string="개발 일지">
		<div class="row">
			<div class="row title">
					<h2 id="about_diary" class="about">개발 일지</h2>
			</div>
			<div>
				<div class="date">
					<div class="col-lg-offset-3 col-lg-6 col-lg-offset-3">
						<div class="develop" align="left">
							<div class="row developdate">
								<div class="row">
									<p id="del_date">2019-10-04</p>
								</div>
								<div class="row">
									<div class="col-lg-11">
										<a id="content">Manager_화면 연결  </a>
									</div>
									<div class="col-lg-1">
										<a id="im"></a>
									</div>
								</div>
							</div>
							<div class="row developdate">
								<div class="row">
									<p id="del_date">2019-09-27</p>
								</div>
								<div class="row">
									<div class="col-lg-11">
										<a id="content">visitor Controller 구성</a>
									</div>
									<div class="col-lg-1">
										<a id="im"></a>
									</div>
								</div>
							</div>
							<div class="row developdate">
								<div class="row">
									<p id="del_date">2019-09-14</p>
								</div>
								<div class="row">
									<div class="col-lg-11">
										<a id="content">index_notice페이지 화면 구성</a>
									</div>
									<div class="col-lg-1">
										<a id="im" role="botton"></a>
									</div>
								</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>	 
		</div>
	</div>
</div>
<%@ include file="../CommonForm/Footer.jsp"%>
</body>
</html>