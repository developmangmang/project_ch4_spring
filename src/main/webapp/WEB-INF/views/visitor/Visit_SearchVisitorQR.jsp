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
<title>QR조회 - CH4 방문자 관리 시스템</title>
<style>
	h2#title {
		border-left: 5px solid #FF5F41;
		padding-left: 10px;
	}
	#form1 {
		padding-left : 0px;
		padding-right : 0px;
	}
	.panel.panel-info {
		border: 2px solid #FF5F41;
	}
	.panel-body {
		border: 0px;	
	}
	.img-circle {
		width : 100px;
		height : 100px;
		margin : 20px 20px 20px 20px;
		background-color : #FF7C63;
	}
	.easyui-textbox {
		width : 90%;
	}
	#btn_search {
		background-color : #FF7C63;
		border-color : #FF5F41;
		width : 100%;
		height : 120px;
		font-size : 22px;
		padding-top : 0px;
		padding-bottom : 0px;
		padding-left : 0px;
		padding-right : 0px;
	}
	#input_search_hp1,#input_search_hp2,#input_search_hp3 {
		width: 80px;
	}
	#tb_search thead tr th {
		border-top-width: 3px;
		border-top-color: #FF5F41;
		border-bottom-width: 3px;
		border-bottom-color: #FF5F41;
	}
	#tb_search th {
		background-color: #FFC3B8;
	}
	.modal-content {
		border: 0px;
	}
	.modal-body {
		text-align: center;
	}
	#md_qr_body {
		padding-left: 0px;
		padding-right: 0px;
		text-align: center;
	}
	#md_qr_header {
		background-color: #FFC3B8;
	}
	.table th,
	.table td {
		text-align:center;
		border: 1px solid #EDEDED;
	}
	.table th {
		background-color: #FFC3B8;
	}
</style>
</head>
<body>
<%@ include file="../CommonForm/Top.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#tb_search").bootstrapTable({
			columns:[
			    {field:'CONFM_NO',title:'방문번호'},
			    {field:'COM_NAME',title:'방문지'},
			    {field:'CONFM_DESTI',title:'방문장소'},
			    {field:'CONFM_VISIT_DATE',title:'방문일자'},
			    {field:'CONFM_DATE',title:'승인일자'},
			    {field:'show_qr',title:'QR코드',events: window.operateEvents,
			          formatter: operateFormatterQR,width:150},
			    {field:'qrPath',title:'QRpath',visible:false}
			]
		});
		
	});
	function operateFormatterQR(value, row, index) {
		var qrPath = row.qrPath;
		var confm_visit_date = row.CONFM_VISIT_DATE;
	    return [
	      "<button class='btn QR' type='button' style='margin-right:10px;' data-toggle='tooltip' data-replace='right' title='QR보기'>"
	      +"<img src='http://192.168.0.189:8080/resources/Style/images/crud/QR_icon.png'></button>"
	      +"<button class='btn download' type='button' data-toggle='tooltip' data-replace='right' title='다운로드'>"
	      +"<a href='"+qrPath+"' download='myQR_"+confm_visit_date+".png'>"
	      +"<img src='http://192.168.0.189:8080/resources/Style/images/crud/download_icon.png'></a></button>"
	    ].join('')
	}
	window.operateEvents = {
		'click .btn.QR': function (e, value, row, index) {
			var qrPath = row.qrPath;
			var QR = "<img class='img_thumbnail' src='"+qrPath+"'>";
			$("#md_qr_body").empty();
			$("#md_qr_body").append(QR);
			$("#md_QR").modal('show');
		}
	}
	function searchQR(){
		if(!($("#input_search_name").textbox('getValue'))){
			alert("방문자 성명을 입력해 주세요.");
			$("#input_search_name").textbox('textbox').focus();
			return;
		}
		if(!($("#input_search_hp1").textbox('getValue'))){
			alert("방문자 연락처를 입력해 주세요.");
			$("#input_search_hp1").textbox('textbox').focus();
			return;
		}
		if(!($("#input_search_hp2").textbox('getValue'))){
			alert("방문자 연락처를 입력해 주세요.");
			$("#input_search_hp2").textbox('textbox').focus();
			return;
		}
		if(!($("#input_search_hp3").textbox('getValue'))){
			alert("방문자 연락처를 입력해 주세요.");
			$("#input_search_hp3").textbox('textbox').focus();
			return;
		}
		var search_hp = $("#input_search_hp1").textbox('getValue') + "-"
						+ $("#input_search_hp2").textbox('getValue') + "-"
						+ $("#input_search_hp3").textbox('getValue');
		$("#input_search_hp").attr("value",search_hp);
		$.ajax({
			type: "POST",
			url: "/visitor/qrCodeList.ch4",
			data: $("#form_search").serialize(),
			dataType: "json",
			success: function(result){
				if(!result){
					alert("조회결과가 없습니다.");
					return;
				}
				$("#tb_search").bootstrapTable('load',result);
			},
			error: function(){
				alert("error");
			}
		});
	}
</script>
<div class="container">
	<div class="row">
		<div id="form1" class="col-lg-offset-1 col-lg-10">
			<div style="text-align:left;">
				<h2 id="title"><b>방문 QR 조회</b></h2>
			</div>
			<div class="panel panel-info">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-offset-1 col-lg-2">
							<img class="img-circle" src="http://192.168.0.189:8080/resources/Style/images/crud/QR.png">
						</div>
						<div class="col-lg-6" style="padding-top:30px;text-align:center;">
							<!------------------ 이 구간은 이름 & 연락처로 조회시 값이 전송되는 구간 -------------------->
							<form id="form_search" method="POST">
								<input id="input_search_name" class="easyui-textbox" name="confm_name" data-options="prompt:'방문자 성명'" style="width:300px;"><br><br>
								<input id="input_search_hp" type="hidden" name="confm_hp">
							</form>
							<!------------------ 이 구간은 조회시 값이 전송되는 구간 끝 ------------------>
							<input id="input_search_hp1" class="easyui-textbox" type="number" data-options="prompt:'010'">&ensp; - &ensp;
							<input id="input_search_hp2" class="easyui-textbox" type="number" data-options="prompt:'XXXX'">&ensp; - &ensp;
							<input id="input_search_hp3" class="easyui-textbox" type="number" data-options="prompt:'XXXX'">
						</div>
						<div class="col-lg-2" style="padding-left:0px;padding-right:40px;margin : 10px 0px 10px 0px;">
							<button id="btn_search" class="btn btn-info" type="button" onClick="searchQR()">조회</button>
						</div>
					</div>
				</div>
			</div><br>
			<table id="tb_search" class="table"></table>
		</div>
	</div>
</div>
<!-- QR코드 이미지 Modal -->
<div id="md_QR" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div id="md_qr_header" class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div id="md_qr_body" class="modal-body">
				
			</div>
		</div>
	</div>
</div>
<!-- 방문번호로 정보조회 FORM전송 -->
<form id="form_search_info" action="" method="post">
	<input id="confm_no" type="hidden" name="confm_no" value="">
</form>
</body>
</html>