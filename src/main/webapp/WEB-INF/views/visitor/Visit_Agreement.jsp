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
<title>약관동의 - CH4 방문자 관리 시스템</title>
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
		<div style="height:120px;border:1px solid #ACACAC;">
		여
		기
		에
		는
		뭐라고
		적어야
		할까?
		</div><br>
		<div class="checkbox" style="border:0px; margin-bottom:10px;">
			<label>
				<input id="agree2" type="checkbox" value="agree"><b style="font-size:16px;">개인정보 수집 및 이용 동의</b>
			</label>
		</div>
		<div style="height:120px;border:1px solid #ACACAC;">
		뭔
		가
		가
		져
		올
		만
		한
		곳이 없을까?
		</div><br>
		<div class="checkbox" style="border:0px; margin-bottom:10px;">
			<label>
				<input id="agree3" type="checkbox" value="agree"><b style="font-size:16px;">개인정보 제3자 제공에 대한 동의</b>
			</label>
		</div>
		<div style="height:120px;border:1px solid #ACACAC;">
		개인정보 제3자 제공에 대한 동의
		개인정보 제3자 제공에 대한 동의
		개인정보 제3자 제공에 대한 동의
		개인정보 제3자 제공에 대한 동의
		개인정보 제3자 제공에 대한 동의
		개인정보 제3자 제공에 대한 동의
		</div><br>
		<div class="checkbox" style="border:0px; margin-bottom:10px;">
			<label>
				<input id="agree4" type="checkbox" value="agree"><b style="font-size:16px;">규정준수 이행 동의</b>
			</label>
		</div>
		<div style="height:120px;border:1px solid #ACACAC;">
		규정준수 이행 동의
		규정준수 이행 동의
		규정준수 이행 동의
		규정준수 이행 동의
		규정준수 이행 동의
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