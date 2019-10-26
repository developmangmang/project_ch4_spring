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
<title>방문/반입 신청 - CH4 방문/반입 자동화 시스템</title>
<style>
	#title {
		border-left: 5px solid #195A92;
		padding-left: 10px;
	}
	#jumbo_visit {
		margin-top : 0px;
		padding-top : 10px;
		height : 600px;
		background-image: url('${host}/resources/Style/images/banner/speedGate (2).jpg');
	}
	.panel {
		border-top-left-radius: 20px;
		border-top-right-radius: 20px;
	}
	.panel-heading {
		font-size : 20px;
		padding-left: 40px;
		text-align:left;
	}
	#form1 {
		padding-left : 0px;
		padding-right : 0px;
	}
	.img-circle {
		width : 100px;
		height : 100px;
		margin : 20px 20px 20px 20px;
		background-color : #42788A;
	}
	.easyui-combobox {
		width : 85%;
	}
	.easyui-textbox {
		width : 90%;
	}
	.btn {
		width : 100%;
		height : 120px;
		font-size : 22px;
		padding-top : 0px;
		padding-bottom : 0px;
		padding-left : 0px;
		padding-right : 0px;
	}
	#col_btn .btn {
		display: inline;
		width : 40%;
		height : 50px;
		font-size : 18px;
		padding-top : 0px;
		padding-bottom : 0px;
		padding-left : 0px;
		padding-right : 0px;
		margin-right: 10px;
	}
	.btn#btn_search {
		width : 100%;
		height : 80px;
		font-size : 22px;
		padding-top : 0px;
		padding-bottom : 0px;
		padding-left : 0px;
		padding-right : 0px;
	}
	label {
		margin-top : 10px;
		margin-bottom : 10px;
		font-size : 22px;
	}
	label.radio-inline {
		margin-top : 5px;
		margin-bottom : 5px;
		font-size : 14px;
	}
	#input_apply_hp1,#input_apply_hp2,#input_apply_hp3 {
		width: 27%;
	}
	#input_search_hp1,#input_search_hp2,#input_search_hp3 {
		width: 80px;
	}
</style>
</head>
<body>
<%@ include file="../CommonForm/Top.jsp"%>
<script>
	//입력값을 약관동의 페이지로 가져가는 함수
	function applyNext(){
		//url정해지면 삭제 예정
		//location.href = "Visit_Agreement.jsp";
		if(!($("#combo_company").combobox('getValue'))){
			alert("방문지를 선택해 주세요.");
			$("#combo_company").combobox('textbox').focus();
			return;
		}
		if(!($("#combo_desti").combobox('getValue'))){
			alert("목적지를 선택해 주세요.");
			$("#combo_desti").combobox('textbox').focus();
			return;
		}
		if(!($("#input_apply_name").textbox('getValue'))){
			alert("신청자 성명을 입력해 주세요.");
			$("#input_apply_name").textbox('textbox').focus();
			return;
		}
		if(!($("#input_apply_hp1").textbox('getValue'))){
			alert("신청자 연락처를 입력해 주세요.");
			$("#input_apply_hp1").textbox('textbox').focus();
			return;
		}
		if(!($("#input_apply_hp2").textbox('getValue'))){
			alert("신청자 연락처를 입력해 주세요.");
			$("#input_apply_hp2").textbox('textbox').focus();
			return;
		}
		if(!($("#input_apply_hp3").textbox('getValue'))){
			alert("신청자 연락처를 입력해 주세요.");
			$("#input_apply_hp3").textbox('textbox').focus();
			return;
		}
		var apply_hp = $("#input_apply_hp1").textbox('getValue') + "-"
						+ $("#input_apply_hp2").textbox('getValue') + "-"
						+ $("#input_apply_hp3").textbox('getValue');
		$("#input_apply_hp").attr("value",apply_hp);
		//url주소 정해지면 활성화 예정
		$("#form_apply").attr('action','/visitor/applyRequest.ch4');
		$("#form_apply").submit();
	}
	//조회페이지 넘어가는 함수
	function searchVisitor(){
		location.href = "/visitor/searchVisitor.ch4";
	}
	function searchGoods(){
		location.href = "/goods/searchGoods.ch4";
	}
	function searchVQR(){
		location.href = "/visitor/searchVQRcode.ch4";
	}
	function searchGQR(){
		location.href = "/goods/searchGQRcode.ch4";
	}
</script>
<div class="container-fluid" style="text-align:center;">
	<div id="jumbo_visit" class="jumbotron">
		<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
			<div class="row">
				<div style="text-align:left;">
					<h2 id="title"><b>방문/반입 신청</b></h2>
				</div>
				<!------------------ 이 구간은 신청시 값이 전송되는 구간 -------------------->
				<form id="form_apply" method="POST">
					<div id="form1" class="col-lg-6">
						<input id="com_name" type="hidden" name="com_name">
						<div class="panel panel-primary">
							<div class="panel-heading">1. 방문지/목적지 선택</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-4">
										<img class="img-circle" src="${host}/resources/Style/images/crud/buildings.png">
									</div>
									<div class="col-lg-8">
										<br>
										<select id="combo_company" class="easyui-combobox" name="com_no" label="방문지" labelPosition="left">
											<option value="">방문지</option>
											<option value="test">테스트</option>
										</select><br><br>
										<select id="combo_desti" class="easyui-combobox" name="visit_desti" label="목적지" labelPosition="left">
											<option value="">목적지</option>
											<option value="test">테스트</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="form1" class="col-lg-6">
						<div class="panel panel-primary">
							<div class="panel-heading">2. 신청자</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-lg-4">
										<img class="img-circle" src="${host}/resources/Style/images/crud/clipboard.png">
									</div>
									<div class="col-lg-5" style="padding-left:0px;padding-right:0px;">
										<br>
										<input id="input_apply_name" class="easyui-textbox" name="visit_apply_name" data-options="prompt:'성명'"><br><br>
										<input id="input_apply_hp" type="hidden" name="visit_apply_hp">
										<input id="input_apply_hp1" class="easyui-textbox" type="number" data-options="prompt:'010'"> - 
										<input id="input_apply_hp2" class="easyui-textbox" type="number" data-options="prompt:'XXXX'"> - 
										<input id="input_apply_hp3" class="easyui-textbox" type="number" data-options="prompt:'XXXX'">
									</div>
									<div class="col-lg-3" style="padding-left:0px;padding-right:20px;margin : 10px 0px 10px 0px;">
										<button id="btn_apply" class="btn btn-primary" type="button" onClick="javascript:applyNext()">신청</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				<!------------------ 이 구간은 신청시 값이 전송되는 구간 끝 ------------------>
			</div>
			<div class="row">
				<div id="form1" class="col-lg-12">
					<div class="panel panel-info">
						<div class="panel-heading">3. 신청조회/안내</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-2">
									<img class="img-circle" src="${host}/resources/Style/images/crud/searchbox.png" style="background-color:#6EAFA8">
								</div>
								<div id="col_btn" class="col-lg-4" style="padding-left:0px;padding-right:10px;">
									<div class="row" style="text-align:center;padding-top:15px;">
										<button class="btn btn-info" type="button" onClick="searchVisitor()">
											<img src="${host}/resources/Style/images/crud/visit_icon.png"> 방문조회
										</button>
										<button class="btn btn-warning" type="button" onClick="searchGoods()">
											<img src="${host}/resources/Style/images/crud/goods_icon.png"> 반입조회
										</button>
									</div>
									<div class="row" style="text-align:center;padding-top:15px;">
										<button class="btn btn-basic" type="button" onClick="searchVQR()">
											<img src="${host}/resources/Style/images/crud/qr_search_icon.png"> 방문QR
										</button>
										<button class="btn btn-basic" type="button" onClick="searchGQR()">
											<img src="${host}/resources/Style/images/crud/qr_search_icon.png"> 반입QR
										</button>
									</div>
								</div>
								<div class="col-lg-6" style="padding-left:0px;padding-right:0px;text-align:center;">
									<label for="img_process">신청 절차안내</label><br>
									<img id="img_process" src="${host}/resources/Style/images/crud/img_process.png">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	//방문지 초기화
	$("#combo_company").combobox({
		valueField: 'COM_NO',
		textField: 'COM_NAME',
		url: "/visitor/companyList.ch4",
		onChange:function(newValue){
			//alert("방문지: "+$("#combo_company").combobox('getValue'));
			var com_name = $(this).textbox('getText');
			$("#com_name").attr("value",com_name);
			$("#combo_desti").combobox({
				valueField: 'DEPT_NAME',
				textField: 'DEPT_NAME',
				url: "/visitor/deptList.ch4?com_no="+newValue
			});
		}
	});
});
</script>
</html>