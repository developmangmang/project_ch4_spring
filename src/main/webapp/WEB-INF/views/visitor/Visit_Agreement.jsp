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
<title>약관동의 - CH4 방문/반입 자동화 시스템</title>
<style type="text/css">
	#agree_area {
		padding:5px;
		padding-left:15px;
		overflow:scroll;
		height:120px;
		border:1px solid #ACACAC;
	}

</style>
</head>
<body>
<%@ include file="../CommonForm/Top.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		//약관동의 전체체크
		$("#agreeAll").on('click',function(){
			var chkAll = $(this).is(":checked");
			if(chkAll){
				$("#agree1").prop("checked", true);
				$("#agree2").prop("checked", true);
				$("#agree3").prop("checked", true);
				$("#agree4").prop("checked", true);
			}
			else{
				$("#agree1").prop("checked", false);
				$("#agree2").prop("checked", false);
				$("#agree3").prop("checked", false);
				$("#agree4").prop("checked", false);
			}
		});
		//체크박스 4개와 전체동의체크박스 동기화
		$("#content input:checkbox").on('click',function(){
			var chk1 = $("#agree1").is(":checked");
			var chk2 = $("#agree2").is(":checked");
			var chk3 = $("#agree3").is(":checked");
			var chk4 = $("#agree4").is(":checked");
			if(chk1&&chk2&&chk3&&chk4){
				$("#agreeAll").prop("checked", true);
			}
			else{
				$("#agreeAll").prop("checked", false);
			}
		});
	});
	function agree(){
		var chkAll = $("#agreeAll").is(":checked");
		//전부 체크했니?
		if(chkAll){
			location.href= "/visitor/applyAgreement.ch4";
		}
		else{
			alert("약관을 전부 동의해 주세요.");
		}
	}
	function disagree(){
		location.href = "Visit_Main.jsp";
	}
</script>
<div class="container-fluid">
	<div id="content" class="col-lg-offset-2 col-lg-8 col-lg-offset-2">
		<h3><b>방문/반입 약관</b></h3><br>
		<div class="checkbox" style="border:0px; margin-bottom:10px;">
			<label>
				<input id="agree1" type="checkbox" value="agree"><b style="font-size:16px;">방문/반입 약관 동의</b>
			</label>
		</div>
		<div id="agree_area" >
				0.방문지의 내사 규칙을 준수하고, 검문 검색 및 신분확인에 협조해 주십시오<br>
			1.방문 승인된 장소 외 출입은 관련 부서의 동의를 받으셔야합니다<br>
			2.회사 내에 물품 절취 시 당사자는 형사처벌 및 출입금지, 형사처벌 개약상 불이익을 받습니다<br>
			3.이동형 컴퓨팅 기기(노트북, 카메라, 카메라폰, USB메모리, 외장하드 등 출입시 승인 받아야 합니다.<br>
			- 반입 전 바이러스 백신 업데이트와 HDD 전체 검사를 시행해 주십시오<br>
			-회사내 사진촬영은 금지합니다<br>
			-인가되지 않은 기기 및 무선네트워크 장치는 반입을 금지합니다.<br>
			-방문지 내부에서 통신이 제한 될 수 있습니다.<br>
			4.당사 내 제반 규정을 위반하면 출입 정지 등 불이익을 받습니다.<br>
			5.방문지 출입 시, QR코드를 반드시 이용하여 정확한 인증을 받아야합니다."
		</div><br>
		<div class="checkbox" style="border:0px; margin-bottom:10px;">
			<label>
				<input id="agree2" type="checkbox" value="agree"><b style="font-size:16px;">개인정보 수집 및 이용 동의</b>
			</label>
		</div>
		<div id="agree_area">
			1.수집/이용 목적은 본인 확인 및 목적지에 정보를 통지입니다. 개인정보를 수집 및 이용하는데 동의합니다.<br>
			2.개인정보 이용 기간은 서비스 이용과 저장 정보는 최대 2년간 기록되며 이용목적 달성 시, 파기 될 수 있습니다.<br>
			3.개인정보 제공 동의를 거부할 권리가 있으며 동의 거부에 따른 불이익은 없습니다. 다만 서비스 이용에 어려움이 있을 수 있습니다.<br>
			4.만 14세 미만 아동의 경우 반드시 법적 대리인의 동의가 필요합니다. 아동과 법정대리인의 관계를 확인 하는 이외의 용도로 사용되지 않습니다.
		</div><br>
		<div class="checkbox" style="border:0px; margin-bottom:10px;">
			<label>
				<input id="agree3" type="checkbox" value="agree"><b style="font-size:16px;">개인정보 제3자 제공에 대한 동의</b>
			</label>
		</div>
		<div id="agree_area">
			0. 개인정보를 서비스를 사용하기 위해 동의합니다.<br>
			1. 개인정보를 제공받는 자 : 방문지와 목적지 담당자 및 담당 회사<br>
			2. 개인정보를 제공받는 자의 개인정보 이용 목적 : 방문 및 반입관리 목적<br>
			3. 제공하는 개인정보의 항목 : 성명 전화번호 소속<br>
			4. 개인정보를 제공받는 자의 개인정보 보유 및 이용 기간 : 제공 후 최대 2년<br>
			5. 동의를 거부할 수 있으며, 예시) 동의 거부시 방문/반입 예약 서비스가 제공되지 않습니다.

		</div><br>
		<div class="checkbox" style="border:0px; margin-bottom:10px;">
			<label>
				<input id="agree4" type="checkbox" value="agree"><b style="font-size:16px;">규정준수 이행 동의</b>
			</label>
		</div>
		<div id="agree_area">
			0. 방문/반입 예약 시스템을 오용하지 않으며, 오용시 형사처벌을 받을 수 있습니다.<br>
			1.개인정보의 수집·이용 목적 중 재화나 서비스의 홍보 또는 판매 권유 등을 위하여 해당 개인정보를 이용하여 정보주체에게 연락할 수 있다는 사실을 인지하여야합니다.<br>
			2. 처리하려는 개인정보의 항목 중 다음 각 목의 사항<br>
			가. 법 제18조에 따른 민감정보<br>
			나. 법 제19조제2호부터 제4호까지의 규정에 따른 여권번호, 운전면허의 면허번호 및 외국인등록번호<br>
			3. 개인정보의 보유 및 이용 기간(제공 시에는 제공받는 자의 보유 및 이용 기간을 말함)<br>
			4. 개인정보를 제공받는 자 및 개인정보를 제공받는 자의 개인정보 이용 목적
		</div><br>
		<div style="height:70px;background:#DEDEDE;text-align:center; padding-top:25px;">
			<label>
				<input id="agreeAll" type="checkbox" value="agree"><b style="font-size:16px;">위 약관에 전체 동의합니다.</b>
			</label>
		</div><br>
		<div style="text-align:center;">
			<button class="btn btn-primary" onclick="javascript:agree()">동의합니다.</button>
			<button class="btn" onclick="javascript:disagree()">동의하지 않습니다.</button>
		</div>
	</div>
</div>
</body>
</html>