<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8"> 
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<title>고객지원 - CH4 방문/반입 자동화 시스템</title>
<!-- Link Import --> 
<%@ include file="../../Style/common/HeadUI.jsp"%>
<style type="text/css">
.banner_Content {
	margin-top: 0px;
	padding-top: 10px;
	height: 300px;
	background-image: url('${host}/resources/Style/images/banner/banner_top.jpg');
}
.jumbotron_Content a {
	font-size: 25px;
}
.Content_title h1 {
	padding-top: 12px;
	padding-bottom: 12px;
	border-width: thick;
	margin-bottom: -10px;
}
#main1 {
	border-bottom: ridge;
	border-top: ridge;
}
	#fontB{
		color: #0b4f96;
		font-weight:bold;
		font-size: 16px;
	
	}
	#fontG{
		 color: #5a5a5a;
		 font-weight:bold;
	}
	h3 {
		padding-left: 3%;
		border-left: solid 7px;
		color: black;
	}
	.panel.panel-default{
		margin-bottom: 0px;
	}
</style> 
</head>
<body>

<!-- 고객지원 내용 -->
<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
	<div class="row" align="center">
		<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
			<div id="main1">
				<div class="row">
					<h1 style="font-weight:bold;">고객센터</h1>
				</div>
				<div class="row">
					<h5 style="color: gray;">CH4 서비스를 이용하시면서 궁금한 점이 있으신가요? 원하시는 상담방법을 이용해 문의해주세요.</h5>
				</div>
				<div class="row">
					<img alt="" src="${host}/resources/Style/images/logo/line.png">
				</div>
				<div class="row">
					<div class="col-lg-4" style="padding-bottom: 10px; margin-bottom: 30px;">
						<div class="col-lg-7">
							<p align="center" style="margin-top: 10px;">
								<font id="fontB">자주하는 질문</font>
								<font id="fontG">에서 먼저 확인해주세요.<font>
							</p>
						</div>
						<div class="col-lg-5">
							<img alt="" src="${host}/resources/Style/images/logo/question.png">
						</div>
					</div>
					<div class="col-lg-4" style="padding-bottom: 10px; margin-bottom: 30px;">
						<div class="col-lg-7">
							<p align="center" style="margin-top: 10px;">
								<font id="fontB">서비스 문의하기</font>
								<font id="fontG">를 이용해주세요.<font>
							</p>
						</div>
						<div class="col-lg-5">
							<img alt="" src="${host}/resources/Style/images/logo/Inquiry.png">
						</div>
					</div>
					<div class="col-lg-4" style="padding-bottom: 10px; margin-bottom: 30px;">
						<div class="col-lg-7">
							<p align="center" style="margin-top: 10px;">
								<font id="fontB">고객센터 상담원</font>
								<font id="fontG">에게 전화문의를 해주세요.<font>
							</p>
						</div>
						<div class="col-lg-5">
							<img alt="" src="${host}/resources/Style/images/logo/call.png">
						</div>
					</div>
				</div>
			</div>
			<div class="row" align="left" id="main2">
				<h3>자주하는 질문 TOP5</h3>
			</div>
			<div class="row" id="top5"  style=" border-top: ridge; border-top-color: #0054a6;">
			<!-- top1 -->
			<div class="panel panel-default">
				<div class="panel-heading" role="tab" id="topOne">
					<h4 class="panel-title">
						<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
							href="#collapseOne" aria-expanded="false" aria-controls="#collapseOne">
							동행자는 몇명까지 입력 가능한가요?
						</a>
					</h4>
				</div>
    			<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      				<div class="panel-body">
						<p>	
							그룹 방문예약시스템에서는 방문자의 편의성 제공을 위하여
							동행자를 관리하고 있습니다.
							동행자는 10명까지 입력 가능합니다.
							방문신청자의 책임하에 방문신청 할 수 있습니다.
							※방문자 및 동행자의 방문사고 책임은 방문신청자에게 있습니다.
							감사합니다.
						</p>
					</div>
				</div>
 				</div>
				<!-- top2 -->
				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="topTwo">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
								href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
								방문신청 정보를 재사용하여 신청할 수 있나요?
							</a>
						</h4>
					</div>
	    			<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
	      				<div class="panel-body">
							<p>	
								그룹 방문예약시스템에서는 이전 방문신청이력을 사용하여
								방문신청할 수 있도록 편의성을 제공하고 있습니다.
								
								1.최근 방문이력(방문종료) Top 5 제공
								2.방문이력 팝업 화면을 이용한 전체 방문신청이력 조회
								
								단, 방문종료된 방문신청건에 대해서만 재사용 할 수 있습니다.
								
								감사합니다.
							</p>
						</div>
					</div>
  				</div>
  				<!-- top3 -->
  				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="top3">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
								href="#collapse3" aria-expanded="false" aria-controls="collapse3">
								실명인증을 할 수 없는 방문객은 어떻게 신청하나요?
							</a>
						</h4>
					</div>
	    			<div id="collapse3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading3">
	      				<div class="panel-body">
							<p>	
								'신청자(실명인증 방문객)' 또는 '찾아갈 분(방문승인자)'이
								실명인증을 할 수 없는 방문객을 대신하여 방문신청할 수 있습니다.
								(방문자변경 기능 사용)
								
								[실명인증을 할 수 없는 방문객]
								1. 휴대폰이 없는 내국인 또는 외국인
								2. 휴대폰 인증이 불가한 내국인 또는 외국인
								ex)법인 명의의 휴대폰 사용 방문객 본인 명의의 휴대폰이 아닌 방문객
								
								감사합니다.
							</p>
						</div>
					</div>
  				</div>
  				<!-- top4 -->
  				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="top4">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
								href="#collapse4" aria-expanded="false" aria-controls="collapse4">
								다른 직원으로 승인권자 변경은 어떻게 하나요?
							</a>
						</h4>
					</div>
	    			<div id="collapse4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading4">
	      				<div class="panel-body">
							<p>	
								승인권자가 휴가중인 경우 승인권자를 변경할 수 있습니다.

								☞ 변경방법은
								방문이력 화면에서 방문신청내용을 확인후 신청취소 하시고
								변경된 승인권자에게 다시 방문신청하시면 됩니다.
								
								※ 방문신청이 완료된 상태에서 승인권자 변경은 불가합니다.
								※ 동일지역 동일기간의 방문신청건이 있으면 방문신청이 안됩니다.
								
								감사합니다.
							</p>
						</div>
					</div>
  				</div>
  				<!-- top5 -->
  				<div class="panel panel-default">
					<div class="panel-heading" role="tab" id="top5">
						<h4 class="panel-title">
							<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
								href="#collapse5" aria-expanded="false" aria-controls="collapse5">
								본인의 인증수단이 실패하는 이유입니다.
							</a>
						</h4>
					</div>
	    			<div id="collapse5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading5">
	      				<div class="panel-body">
							<p>	
								*인증실패 안내사항 입니다.

								[본인의 인증수단이 실패하는 이유]
								1. 본인의 명의로 개통한 휴대전화가 아닌 경우(타인의 명의로 개통)
								2. 휴대전화 요금이 미납(연체)증인 경우
								3. 선불요금카드(예스카드, 앵콜카드 등)를 사용중인 경우
								4. 특수요금제(패밀리요금제, 커플요금제)를 사용중인 경우
								
								[고객센터 문의]
								☎ 인증실패관련 문의 : NICE평가정보(1600-1522)
								
								감사합니다.
							</p>
						</div>
					</div>
  				</div>
  				<!-- 자주묻는 질문 끝 -->
			</div>
			<!-- 문의 전화 -->
			<div class="row" style="margin-top: 10px;">
				<div class="col-lg-6" style=" border:1px;border-color:white; background-color:#fafafa;">
					<div class="col-lg-7" align="left" 
						style="height: 160px; padding-top: 10px; border-right-color: white-space: ;">
						<h4><font style="font-weight: bold;">서비스 문의하기</font></h4>
						<p><font id="fontG">서비스 이용과 관련한 문의사항을 등록해주세요. 최대한 빨리 답변해드릴 수 있도록 노력하겠습니다.</font></p>
					</div>
					<div class="col-lg-5" style="height: 150px; padding-top: 10px;">
						<img alt="" src="${host}/resources/Style/images/logo/sendMail.png">
					</div>
				</div>
				<div class="col-lg-6" style=" border:1px;border-color:white; background-color:#fafafa;">
					<div class="col-lg-7" align="left" 
						style="height: 160px; padding-top: 10px;">
						<h4><font style="font-weight: bold;">고객센터 상담 안내</font></h4>
						<h2 style="margin-top: 0px; margin-bottom: 3px;"><font style="font-weight: bold;">1588-1688</font></h2>
						<p><font id="fontG">평일 > 09:00~12:00,13:00~18:00</font></p>
						<p><font id="fontG">업무외 시간에는 서비스 문의하기를 이용해주세요.</font></p>
					</div>
					<div class="col-lg-5" style="height: 150px; padding-top: 10px;">
						<img alt="" src="${host}/resources/Style/images/logo/calling.png">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>