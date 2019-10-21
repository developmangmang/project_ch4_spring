<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	String confm_no = null;
 	if(null!=request.getParameter("confm_no")){
 		confm_no = (String)request.getParameter("confm_no");
 	}
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<!-- Link Import --> 
<%@ include file="../../Style/common/HeadUI.jsp"%> 
<title>반입신청 조회 - CH4 방문자 관리 시스템</title>
<style>
	h2#title {
		border-left: 5px solid #FFA054;
		padding-left: 10px;
	}
	#form1 {
		padding-left : 0px;
		padding-right : 0px;
	}
	.panel.panel-info {
		border: 2px solid #F1760F;
	}
	.panel-body {
		border: 0px;	
	}
	.img-circle {
		width : 100px;
		height : 100px;
		margin : 20px 20px 20px 20px;
		background-color : #FFA054;
	}
	.easyui-textbox {
		width : 90%;
	}
	#btn_search {
		background-color : #FFA054;
		border-color : #F1760F;
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
		border-top-color: #F1760F;
		border-bottom-width: 3px;
		border-bottom-color: #F1760F;
	}
	#tb_search th {
		background-color: #FFE0C7;
	}
	.modal-content {
		border: 0px;
	}
	.modal-header.detail {
		border-top-left-radius: 6px;
		border-top-right-radius: 6px;
		background-color: #337ab7;
	}
	.modal-body {
		padding-left: 100px;
		padding-right: 100px;
	}
	#md_cancle_body {
		padding-left: 0px;
		padding-right: 0px;
		text-align: center;
	}
	#md_cancle_header {
		background-color: #DDDDDD;
	}
	.modal-body.detail {
		padding-left: 50px;
		padding-right: 50px;
	}
	.row.table.basic {
		border-top: 2px solid #31708f;
		margin: 0 0 0 0;
	}
	.row.table.goods {
		border-top: 2px solid #3c763d;
		margin: 0 0 0 0;
	}
	.table th,
	.table td {
		text-align:center;
		border: 1px solid #EDEDED;
	}
	.table th {
		background-color: #DDDDDD;
	}
</style>
<script>
	var searchKeyword = "number";
</script>
</head>
<body>
<%@ include file="../CommonForm/Top.jsp"%>
<script>
	$(document).ready(function(){
		$("#tb_search").bootstrapTable({
			columns:[
			    {field:'APLG_NO',title:'신청번호'},
			    {field:'APLG_DATE',title:'신청일자'},
			    {field:'COM_NAME',title:'반입지'},
			    {field:'APLG_REASON',title:'반입사유'},
			    {field:'APLG_TRANS_DATE',title:'반입일자'},
			    {field:'APLG_PERMIT_ST',title:'결제상태'}
			],
			onClickRow:function(row,$element,field){
				var aplg_no = $element.find("td:first").html();
				$("#input_update").attr('value',aplg_no)
				$.ajax({
					type: 'get',
					dataType: 'json',
					url: '/goods/detail.ch4?aplg_no='+aplg_no,
					success: function(result){
						//값 뿌리기 전에 테이블 자식노드 제거
						$("#tb_detail1 tbody").empty();
						$("#tb_detail2 tbody").empty();
						$("#tb_goods tbody").empty();
						//////////////////////  값 뿌려주기  /////////////////////////
						var infoMap = result.infoMap;
						var gmList = result.gmList;
	    				var row = "<tr><td>"+infoMap.APLG_NO+"</td>"
	    							+"<td>"+infoMap.APLG_DATE+"</td>"
	    							+"<td>"+infoMap.APLG_PERMIT_ST+"</td>"
	    							+"<td>"+infoMap.APLG_NAME+"</td>"
	    							+"<td>"+infoMap.APLG_HP+"</td></tr>";
	    				$("#tb_detail1 tbody").append(row);
	    				row = "<tr><td>"+infoMap.COM_NAME+"</td>"
	    						+"<td>"+infoMap.APLG_DESTI+"</td>"
	    						+"<td>"+infoMap.APLG_TRANS_DATE+"</td>"
	    						+"<td>"+infoMap.APLG_REASON+"</td></tr>";
	    				$("#tb_detail2 tbody").append(row);
	    				for(i=0;i<gmList.length;i++){
		    				row = "<tr><td>"+gmList[i].GMNG_NAME+"</td>"
	    							+"<td>"+gmList[i].GMNG_TYPE+"</td>"
	    							+"<td>"+gmList[i].GMNG_QUAN+"</td>"
		    						+"<td>"+gmList[i].GMNG_CONFM+"</td></tr>";
	    					$("#tb_goods tbody").append(row);
	    				}
						//////////////////////  값 뿌려주기  /////////////////////////
					}
				});
				//반입이력 조회 Modal 띄우기
				$("#md_detail").modal('show');
			},
		});
		<%if(null!=confm_no){%>
			$("#input_num").textbox('setValue','<%=confm_no %>');
			$.ajax({
				type: "POST",
				url: "/goods/search.ch4",
				data: $("#form_search_num").serialize(),
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
		<% } %>
		//신청조회 검색조건이 신청번호일때
		$('.nav-tabs a[href="#nav_search1"]').on('shown.bs.tab', function(){
			//form전송 할때 조건문 조건값
			searchKeyword = "number";
		});
		//신청조회 검색조건이 신청자이름 & 연락처일때
		$('.nav-tabs a[href="#nav_search2"]').on('shown.bs.tab', function(){
			searchKeyword = "name&hp";
		});
		$("#btn_search").click(function(){
			//신청번호로 조회니?
			if("number"==searchKeyword){
				if(!($("#input_num").textbox('getValue'))){
					alert("신청번호를 입력해 주세요.");
					$("#input_num").textbox('textbox').focus();
					return;
				}
				$.ajax({
					type: "POST",
					url: "/goods/search.ch4",
					data: $("#form_search_num").serialize(),
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
			//이름 & 연락처로 조회니?
			else if("name&hp"==searchKeyword){
				if(!($("#input_search_name").textbox('getValue'))){
					alert("신청자 성명을 입력해 주세요.");
					$("#input_search_name").textbox('textbox').focus();
					return;
				}
				if(!($("#input_search_hp1").textbox('getValue'))){
					alert("신청자 연락처를 입력해 주세요.");
					$("#input_search_hp1").textbox('textbox').focus();
					return;
				}
				if(!($("#input_search_hp2").textbox('getValue'))){
					alert("신청자 연락처를 입력해 주세요.");
					$("#input_search_hp2").textbox('textbox').focus();
					return;
				}
				if(!($("#input_search_hp3").textbox('getValue'))){
					alert("신청자 연락처를 입력해 주세요.");
					$("#input_search_hp3").textbox('textbox').focus();
					return;
				}
				var search_hp = $("#input_search_hp1").textbox('getValue') + "-"
								+ $("#input_search_hp2").textbox('getValue') + "-"
								+ $("#input_search_hp3").textbox('getValue');
				$("#input_search_hp").attr("value",search_hp);
				$.ajax({
					type: "POST",
					url: "/goods/search.ch4",
					data: $("#form_search_name").serialize(),
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
		});
	});
	//반입신청 변경 페이지 이동
	function applyUpdate(){
		$("#form_next").attr('action','/goods/changeGoods.ch4');
		$("#form_next").submit();
	}
	//반입신청 확인 Modal 띄우기
	function confirmCancle(){
		$("#md_cancle").modal("show");
	}
	//반입신청 취소
	function applyCancle(){	
		$("#form_next").attr('action','/goods/cancle.ch4');
		$("#form_next").submit();
	}
	//신청취소 Modal 끄기
	function closeCancle(){
		$("#md_cancle").modal("hide");
		//모달 하나를 끄면 원래있던 모달의 스크롤이 해제됨..
		//그래서 같이 꺼버림
		$("#md_detail").modal('hide');
	}
	
</script>
<div class="container">
	<div class="row">
		<div id="form1" class="col-lg-offset-1 col-lg-10">
			<div style="text-align:left;">
				<h2 id="title"><b>반입신청 조회</b></h2>
			</div>
			<div class="panel panel-info">
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-offset-1 col-lg-2">
							<img class="img-circle" src="http://localhost:8080/resources/Style/images/crud/searchbox.png">
						</div>
						<div class="col-lg-6" style="padding-left:0px;padding-right:30px;">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#nav_search1">신청번호</a></li>
								<li><a data-toggle="tab" href="#nav_search2">신청자정보</a></li>
							</ul>
							<div class="tab-content">
								<div id="nav_search1" class="tab-pane fade in active" style="text-align:center;">
									<!------------------ 이 구간은 신청번호로 조회시 값이 전송되는 구간 -------------------->
									<form id="form_search_num" method="POST">
										<input type="hidden" name="searchType" value="num">
										<br>
										<input id="input_num" class="easyui-textbox" name="aplg_no" data-options="prompt:'신청번호를 입력하세요.'" style="width:300px;">
									</form>
									<!------------------ 이 구간은 조회시 값이 전송되는 구간 끝 ------------------>
								</div>
								<div id="nav_search2" class="tab-pane fade" style="padding-top:10px; text-align:center;">
									<!------------------ 이 구간은 이름 & 연락처로 조회시 값이 전송되는 구간 -------------------->
									<form id="form_search_name" method="POST">
										<input type="hidden" name="searchType" value="info">
										<input id="input_search_name" class="easyui-textbox" name="aplg_name" data-options="prompt:'성명'" style="width:300px;"><br><br>
										<input id="input_search_hp" type="hidden" name="aplg_hp">
										<input id="input_search_hp1" class="easyui-textbox" type="number" data-options="prompt:'010'">&ensp; - &ensp;
										<input id="input_search_hp2" class="easyui-textbox" type="number" data-options="prompt:'XXXX'">&ensp; - &ensp;
										<input id="input_search_hp3" class="easyui-textbox" type="number" data-options="prompt:'XXXX'">
									</form>
									<!------------------ 이 구간은 조회시 값이 전송되는 구간 끝 ------------------>
								</div>
							</div>
						</div>
						<div class="col-lg-2" style="padding-left:0px;padding-right:40px;margin : 10px 0px 10px 0px;">
							<button id="btn_search" class="btn btn-info" type="button">조회</button>
						</div>
					</div>
				</div>
			</div><br>
			<table id="tb_search" class="table"></table>
		</div>
	</div>
</div>
<!-- 반입신청 조회 상세페이지 Modal -->
<div id="md_detail" class="modal fade" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header detail">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" style="color:white;">상세보기</h4>
			</div>
			<div class="modal-body detail" >
				<div class="container-fluid">
				    <h4 style="margin-bottom:10px; border-left: 3px solid #31708f; padding-left:4px;"><b>신청자 정보</b></h4>
			    	<div class="row table basic">
			    		<table id="tb_detail1" class="table">
			    			<thead>
				    			<tr>
				    				<th>신청번호</th>
				    				<th>신청일자</th>
				    				<th>결제상태</th>
				    				<th>성명</th>
				    				<th>연락처</th>
				    			</tr>
			    			</thead>
			    			<tbody>
			    			</tbody>
			    		</table>
			    	</div>
			    	<h4 style="margin-bottom:10px; border-left: 3px solid #31708f; padding-left:4px;"><b>반입상세</b></h4>
			    	<div class="row table basic">
			    		<table id="tb_detail2" class="table">
			    			<thead>
			    				<tr>
				    				<th>반입지</th>
				    				<th>목적지</th>
				    				<th>반입날짜</th>
				    				<th>반입사유</th>
			    				</tr>
			    			</thead>
			    			<tbody>
			    			</tbody>
			    		</table>
				    </div>
					<div class="row">
				    	<div class="col-lg-8">
					    	<h4 style="border-left: 3px solid #3c763d; padding-left:4px;"><b>물품 정보</b></h4>
					    </div>
					</div>
				    <div class="row table goods">
				    	<table id="tb_goods" class="table">
				    		<thead>
				    			<tr>
									<th>물품명</th>
									<th>물품종류</th>
									<th>EA</th>
									<th>승인여부</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    		</tbody>
				    	</table>
				    </div>
				</div>
			</div>
			<div class="modal-footer">
				<form id="form_next" method="POST">
					<input id="input_update" type="hidden" name="aplg_no" value="">
				</form>
        		<button id="btn_update" type="button" class="btn btn-primary" onClick="applyUpdate()">신청변경</button>
        		<button id="btn_cancle" type="button" class="btn btn-danger" onClick="confirmCancle()">신청취소</button>
        		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        	</div>
		</div>
	</div>
</div>
<!-- 신청취소 확인 Modal -->
<div id="md_cancle" class="modal fade" role="dialog">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div id="md_cancle_header" class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">신청 취소</h4>
			</div>
			<div id="md_cancle_body" class="modal-body">
				<p>접수하신 반입신청을 취소하시겠습니까?</p>
				<button type="button" class="btn btn-basic" onClick="closeCancle()">아니요</button>
				<button type="button" class="btn btn-danger" onClick="applyCancle()">예</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>