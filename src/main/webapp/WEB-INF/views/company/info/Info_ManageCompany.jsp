<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 -->
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>종합 정보 관리 - CH4 방문/반입 자동화 시스템</title>
<!-- 공통코드 -->
<%@ include file="../../../Style/common/HeadUI.jsp"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.15.4/extensions/toolbar/bootstrap-table-toolbar.min.js">
</script>
<style type="text/css">
	html, body {
		margin: 0px;;
		width: 100%;
		height: 100%;
	}
	.container-fluid {
		margin: 0px 0px 0px 0px;
		padding: 0px 0px 0px 0px;
		background-color: #f6f3ee;
		height: 100%;
	}
	#header_area {
		margin-top : 30px;
		margin-bottom : 20px;
		border-bottom-style: solid;
		border-bottom-width: thick;
		padding-block-end: 20px;
		border-bottom-color: #7d1935;
	}
	#titleimg {
		margin-left: 30px;	
	}
	#tabmenu {
		overflow: hidden;
		height: 52px;
		margin-bottom: 2em;
		border-top: 2px solid #4a96ad;
		border-bottom: 2px solid #4a96ad;
	}
	#tabmenu ul {
		padding: 0px 0px 0px 0px;
		list-style: none;
		line-height: normal;
		text-align: center;
		display: table;
		margin-left: auto;
  		margin-right: auto;
	}
	#tabmenu li {
		display: inline-block;
	}
	#tabmenu a {
		display: block;
		padding: 0px 30px;
		line-height: 52px;
		border: none;
		text-decoration: none;
		text-transform: lowercase;
		text-align: center;
		text-transform: uppercase;
		font-size: 20px;
		font-weight: 600;
		color: #224651;
		font-family: 'Open Sans', sans-serif;
	}
	#menu a:hover, #menu .current_page_item a {
		background: #D7CFAD;
		text-decoration: none;
		color: #706C53;
	}
	#spanfor {
		font-size: 30px;
		font-weight: 400;
		font-family: "맑은고딕";
	}
	#tb_desti thead {
		background-color: rgba(84, 84, 84, 0.8);
		color: #f6f3ee;
		border-style: solid;
		border-bottom-color: #545454;
	}
	#tb_kiosk thead {
		background-color: rgba(84, 84, 84, 0.8);
		color: #f6f3ee;
		border-style: solid;
		border-bottom-color: #545454;
	}
	#tb_closeday thead {
		background-color: rgba(84, 84, 84, 0.8);
		color: #f6f3ee;
		border-style: solid;
		border-bottom-color: #545454;
	}
	#tb_desti, #tb_kiosk, #tb_closeday tbody {
		background-color: white;
		margin: 0px 0px 0px 0px;
	}
	#addDestiModal .modal-header {
		background-color: #7d1935;
	}
	#addDestiModal #desti_add {
		background-color: #7d1935;
	}
	#closeday .textbox{
		border-color: #7d1935;
	}
	#f_kiosk .textbox {
		border-color: #4a96ad;
	}
	#f_kiosk .textbox .combo-arrow{
		background-color: #4a96ad;
	}

</style>
</head>
<body>
<%@ include file="../../CommonForm/Top.jsp"%>
<!-- Content -->
<div class="container-fluid">
	<%@ include file="../../CommonForm/InfoSideBar.jsp"%>
	<div style="padding-left: 16%; height: 100%">
		<div class="row" id="header_area"> 
			<img src="${host}/resources/Style/images/logo/info_total.png" id="titleimg">
		</div>
		<div id="tabmenu" class="container">
			<ul class="nav nav-tabs" >
				<li role="presentation" class="active">
					<a href="#desti" aria-controls="desti" role="tab" data-toggle="tab">
						목적지 관리
					</a>
				</li>
				<li role="presentation">
					<a href="#kio" aria-controls="kio" role="tab" data-toggle="tab">
						키오스크 관리
					</a>
				</li>
				<li role="presentation">
					<a href="#closeday" aria-controls="closeday" role="tab" data-toggle="tab">
						휴무일 관리
					</a>
				</li>
			</ul>
		</div>
		<div class="tab-content">
			<!-- 부트 테이블 : 목적지 관리 -->
			<div role="tabpanel" class="tab-pane fade in active" id="desti">
				<div class="col-lg-offset-2 col-lg-8 col-lg-offset-2">
					<div class="row" style="margin-bottom: 30px;">
						<span id="spanfor">목적지 관리</span>
					</div>
					<div class="row" align="right">
						<button type="button" class="btn"
							style="float: left; margin-top: 10px; margin-left: 1%; background-color: #4a96ad"
							data-toggle="modal" data-target="#addDestiModal">목적지추가</button>
					</div>
					<div class="row" style="margin-bottom: 10px;">
						<table class="table table-bordered table-hover" id="tb_desti"></table>
					</div>
				</div>
			</div>
			<!-- v패널 시작 -->
			<div role="tabpanel" class="tab-pane" id="kio">
				<div class="col-lg-offset-2 col-lg-8 col-lg-offset-2">
					<div class="row" style="margin-bottom: 30px;">
						<span id="spanfor">키오스크 관리</span>
					</div>
					<div class="row" style="margin-bottom: 10px;">
						<form id="f_kiosk">
						<input type="hidden" name="com_no" value="<%=com_no %>">
							<select class="form-control" id="cb_kiosk_st" name="kiosk_st"
								style="width: 140px;">
								<option value=""></option>
								<option value="정상">정상</option>
								<option value="고장">고장</option>
								<option value="수리요청">수리요청</option>
								<option value="수리중">수리중</option>
							</select>
						</form>
					</div>
					<div class="row">
						<table class="table table-bordered table-hover" id="tb_kiosk"></table>
					</div>
				</div>
			</div>
			<div role="tabpanel" class="tab-pane" id="closeday">
				<div class="col-lg-offset-2 col-lg-8 col-lg-offset-2">
					<div class="row" style="margin-bottom: 30px;">
						<span id="spanfor">휴무일 관리</span>
					</div>
					<div class="row" style="margin-bottom: 10px;">
						<form id="f_closeday">
						<input type="hidden" name="com_no" value="<%=com_no %>">
							<div class="col-lg-3">
								<button type="button" class="btn" data-toggle="modal"
								    style="background-color: #7d1935; color: white;"
									data-target="#addCloseModal">휴무일 추가</button>
							</div>
							<div class="col-lg-9" align="right">
								<input class="easyui-datebox" id="startdate" name="comcl_date1"
										label ="시작일:" labelPosition="left" >
								<input class="easyui-datebox" id="closedate" name="comcl_date2"
										label ="종료일:" labelPosition="left">
							</div>
						</form>
					</div>
					<div class="row">
						<table class="table table-bordered table-hover" id="tb_closeday"></table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	
<!-- 목적지추가 모달창 -->
<div id="addDestiModal" class="modal fade" role="dialog"
	style="width: 50%; margin-left: 28%; margin-top: 10%;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">목적지 추가</h4>
			</div>
			<div class="modal-body" style="align: center; padding-left: 30%">
				<p>일련번호는 자동으로 추가됩니다.</p>
				<form id="f_desti_add">
				<input type="hidden" name="com_no" value="<%=com_no %>">
					<table>
						<tr>
							<td width=70 style="word-break: break-all">목적지명</td>
							<td><input class="easyui-textbox" id="desti_name_add"
								name="desti_name"></td>
						</tr>
						<tr>
							<td>위치</td>
							<td><input class="easyui-textbox" id="desti_loc_add"
								name="desti_lcinfo"></td>
						</tr>
						<tr>
							<td>비고</td>
							<td><input class="easyui-textbox" id="desti_notes_add"
								name="desti_notes"></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info" id="desti_add"
					onclick="javascript:addDesti();">save</button>
				<button type="button" class="btn btn_default" id="btn_close"
					data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

	<!-- 상세정보 모달창 : 상세조회/수정/삭제 -->
	<div id="destiModal" class="modal fade" role="dialog"
		style="width: 50%; margin-left: 28%; margin-top: 10%;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">목적지 상세정보</h4>
				</div>

				<div class="modal-body" style="align: center; padding-left: 30%">
					<form id="f_desti_detail">
						<input type="hidden" name="com_no" value="<%=com_no %>">
						<table>
							<tr>
								<td width=70 style="word-break: break-all">일련번호</td>
								<td><input class="easyui-textbox" id="desti_no_detail"
									name="desti_no" readonly="readonly"></td>
							</tr>
							<tr>
								<td>목적지명</td>
								<td><input class="easyui-textbox" id="desti_name_detail"
									name="desti_name"></td>
							</tr>
							<tr>
								<td>위치</td>
								<td><input class="easyui-textbox" id="desti_loc_detail"
									name="desti_lcinfo"></td>
							</tr>
							<tr>
								<td>비고</td>
								<td><input class="easyui-textbox" id="desti_notes_detail"
									name="desti_notes"></td>
							</tr>
						</table>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="desti_change"
						onclick="javascript:updateDesti();">수정</button>
					<button type="button" class="btn btn-danger" id="desti_delete"
						onclick="javascript:deletDesti();">삭제</button>
					<button type="button" class="btn" id="btn_close"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 키오스크 모달 상세정보 -->
	<div id="kioskModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">키오스크 정보 수정창</h4>
				</div>
				<div class="modal-body" style="align: center; padding-left: 30%">
					<form id="f_kiosk_detail">
					<input type="hidden" name="com_no" value="<%=com_no%>">
						<table>
							<tr>
								<td width=100 style="word-break: break-all">일련번호</td>
								<td><input class="easyui-textbox" id="kiosk_no"
									name="kiosk_no" readonly="readonly"></td>
							</tr>
							<tr>
								<td>위치</td>
								<td><input class="easyui-textbox" id="kiosk_gate"
									name="kiosk_gate"></td>
							</tr>
							<tr>
								<td>상태</td>
								<td>
									<select class="form-control" id="kiosk_st"
										name="kiosk_st">
										<option value="정상">정상</option>
										<option value="고장">고장</option>
										<option value="수리요청">수리요청</option>
										<option value="수리중">수리중</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>비고</td>
								<td><input class="easyui-textbox" id="kiosk_notes"
									name="kiosk_notes"></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="kiosk_save"
						onclick='kioskUpd()'>변경 저장</button>
					<button type="button" class="btn" id="btn_close"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 휴무일 추가 모달창 -->
	<div id="addCloseModal" class="modal fade" role="dialog"
		style="width: 50%; margin-left: 28%; margin-top: 10%;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">휴무일 추가</h4>
				</div>
				<div class="modal-body" style="align: center; padding-left: 30%">
					<form id="f_Addcloseday">
					<input type="hidden" name="com_no" value="<%=com_no %>">
						<table>
							<tr>
								<td width=70 style="word-break: break-all">휴무일자</td>
								<td><input class="easyui-textbox" id="comcl_date_add"
									name="comcl_date"></td>
							</tr>
							<tr>
								<td>요일</td>
								<td><input class="easyui-textbox" id="comcl_dayweek_add"
									name="comcl_dayweek"></td>
							</tr>
							<tr>
								<td>비고</td>
								<td><input class="easyui-textbox" id="comcl_notes_add"
									name="comcl_notes"></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info"
						onclick="javascript:addCloseDay();">저장</button>
					<button type="button" class="btn" id="btn_close"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

<!-- 휴무일 삭제 모달창 -->
<div id="detCloseModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">휴무일 삭제</h4>
			</div>
			<div class="modal-body" style="align: center; padding-left: 30%">
				<form id="f_closeday_del">
				<input type="hidden" name="com_no" value="<%=com_no %>">
					<table>
						<tr>
							<td width=70 style="word-break: break-all">휴무날짜</td>
							<td><input class="easyui-textbox" id="comcl_date_del"
								name="comcl_date" readonly="readonly"></td>
						</tr>
						<tr>
							<td>휴무요일</td>
							<td><input class="easyui-textbox" id="comcl_dayweek_del"
								name="comcl_dayweek" readonly="readonly"></td>
						</tr>
						<tr>
							<td>비고</td>
							<td><input class="easyui-textbox" id="comcl_notes_del"
								name="comcl_notes" readonly="readonly"></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger"
					onclick="javascript:delCloseDay();">삭제</button>
				<button type="button" class="btn" id="btn_close"
					data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
//combobox 직접입력 방지
$.fn.combobox.defaults.editable = false
//datebox 직접입력 방지
$.fn.datebox.defaults.editable = false
$(document).ready(function(){
//목적지 관리 테이블 데이터 
	$("#tb_desti").bootstrapTable({
		columns:[
	         {field:'DESTI_NO',title:'일련번호'}
	         ,{field:'DESTI_NAME',title:'목적지명'}
	         ,{field:'DESTI_LCINFO',title:'위치정보'}
	         ,{field:'DESTI_NOTES',title:'비고'}
	         ]
		,url:"/info/destiList.ch4?com_no="+"<%=com_no%>"
		,pagination : 'true'
		,paginationPreText:"Previous"
	    ,paginationNextText:"Next"
		,pageSize:10//기본 페이지 사이즈
		,pageList:[10, 15, 20, 30] //칸수
		,search : 'true'
		,showSearchButton : 'true'
		,onClickRow : function(row, $element, field) {
			var desti_no = $element.find("td").eq(0).html();
			var desti_name = $element.find("td").eq(1).html();
			var desti_lcinfo = $element.find("td").eq(2).html();
			var desti_notes = $element.find("td").eq(3).html();
			$("#desti_no_detail").textbox('setValue', desti_no);
			$("#desti_name_detail").textbox('setValue', desti_name);
			$("#desti_loc_detail").textbox('setValue', desti_lcinfo);
			$("#desti_notes_detail").textbox('setValue', desti_notes);
			$("#destiModal").modal('show');
		}
	});
	//목적지 검색 버튼 기능
	$("#search_deti").click(function() {
		var nameSearch = $("#nameSearch").val();
		//alert(nameSearch);
		$("#tb_desti").bootstrapTable('refreshOptions', {
			filterOptions : {
				filterAlgorithm : 'or'
			}
		});
		$("#tb_desti").bootstrapTable('filterBy', {
			desti_name : nameSearch
		});
	});
	
//키오스크 관리 테이블
	$("#tb_kiosk").bootstrapTable({
		columns:[
        	{field:'KIOSK_NO',title:'일련번호'}
        	,{field:'KIOSK_GATE',title:'위치'}
        	,{field:'KIOSK_ST',title:'상태'}
        	,{field:'KIOSK_NOTES',title:'비고'}
        	]
		,url:"/info/kiosk.ch4?com_no="+"<%=com_no%>"
		,pagination : 'true'
		,paginationPreText:"Previous"
		,paginationNextText:"Next"
		,pageSize:10//기본 페이지 사이즈
		,pageList:[10, 15, 20, 30] //칸수
	    ,onClickRow:function(row,$element,field){
	    	var ki_no = $element.find("td").eq(0).html();
			var ki_gate = $element.find("td").eq(1).html();
			var ki_st = $element.find("td").eq(2).html();
			var ki_note = $element.find("td").eq(3).html();
			$("#kiosk_no").textbox('setValue',ki_no);
 			$("#kiosk_gate").textbox('setValue',ki_gate);
 			$("#kiosk_st").val(ki_st);
 			$("#kiosk_notes").textbox('setValue',ki_note);
			$("#kioskModal").modal('show');
	     }
	});
	$("#cb_kiosk_st").combobox({
		onChange : function(newVal){
			$.ajax({
				type:'post'
				,url:"/info/kiosk.ch4"
				,dataType: "json"
				,data :$("#f_kiosk").serialize()
				,success: function(data){
					$("#tb_kiosk").bootstrapTable('load',data);
				}
			});
		}
	});
//휴무일 관리 테이블
	$("#tb_closeday").bootstrapTable({
		columns:[
        	{field:'COMCL_DATE',title:'날짜'}
        	,{field:'COMCL_DAYWEEK',title:'요일'}
        	,{field:'COMCL_NOTES',title:'비고'}
        	]
		,url:"/info/closeday.ch4?com_no="+"<%=com_no%>"
		,pagination : 'true'
		,paginationPreText:"Previous"
		,paginationNextText:"Next"
		,pageSize:10//기본 페이지 사이즈
		,pageList:[10, 15, 20, 30] //칸수
		,onClickRow:function(row,$element,field){
			alert("휴무일은 삭제 후, 복구 할 수 없습니다.");
			var comcl_date = row.COMCL_DATE;
			var comcl_day = row.COMCL_DAYWEEK;
			var comcl_note = row.COMCL_NOTES;
			$("#comcl_date_del").textbox('setValue',comcl_date);
 			$("#comcl_dayweek_del").textbox('setValue',comcl_day);
 			$("#comcl_notes_del").textbox('setValue',comcl_note);
			$("#detCloseModal").modal('show');
     	}
	});
	
	$("#startdate").datebox({
		onSelect : function(date){
			var year = date.getFullYear();
 			var month = +date.getMonth()+1;
 			if(month<10){
 				month = '0'+month;
 			}
 			var day = date.getDate();
 			if(day<10){
 				day = '0'+day;
 			}
 			var comcl_date = year+'-'+month+'-'+day;
 			alert(comcl_date);
 			$(this).datebox('setValue',comcl_date);
 			$.ajax({
 				type:'post'
 				,url : '/info/closeday.ch4'
 				,dataType:'json'
 				,data : $("#f_closeday").serialize()
 				,success: function(data){
 					$("#tb_closeday").bootstrapTable('load',data);
 				}
 			});
		}
	});
	
	$("#closedate").datebox({
		onSelect : function(date){
			var year = date.getFullYear();
 			var month = +date.getMonth()+1;
 			if(month<10){
 				month = '0'+month;
 			}
 			var day = date.getDate();
 			if(day<10){
 				day = '0'+day;
 			}
 			var comcl_date = year+'-'+month+'-'+day;
 			alert(comcl_date);
 			$(this).datebox('setValue',comcl_date);
 			$.ajax({
 				type:'post'
 				,url : '/info/closeday.ch4'
 				,dataType:'json'
 				,data : $("#f_closeday").serialize()
 				,success: function(data){
 					$("#tb_closeday").bootstrapTable('load',data);
 				}
 			});
		}
	});
	
});//	end of dom

// 목적지 추가 버튼 기능 구현
	function addDesti() {
		$.ajax({
			type:'post'
			,url:"/info/destiAdd.ch4"
			,dataType: "json"
			,data :$("#f_desti_add").serialize()
			,success: function(data){
				$('#addDestiModal').modal('hide');
				$("#tb_desti").bootstrapTable('load',data);
			}
		});
		$('#desti_name_add').textbox('setValue',"");
		$('#desti_loc_add').textbox('setValue',"");
		$('#desti_notes_add').textbox('setValue',"");
	}
// 목적지 수정 버튼 기능 구현 
	function updateDesti() {
		$.ajax({
			type : 'post'
			,url : "/info/destiUpd.ch4"
			,dataType:'json'
			,data : $("#f_desti_detail").serialize()
			,success: function(data){
				$('#destiModal').modal('hide');
				$("#tb_desti").bootstrapTable('load',data);
			}
		});
	}
// 목적지 삭제 버튼 기능 구현
	function deletDesti() {
		$.ajax({
			type : 'post'
			,url : "/info/destiDel.ch4"
			,dataType :'json'
			,data : $("#f_desti_detail").serialize()
			,success: function(data){
				$('#destiModal').modal('hide');
				$("#tb_desti").bootstrapTable('load',data);
			}
		});
		/* //삭제할 정보의 일련번호 전달
		$("#f_desti_detail").attr("method","post");
		$("#f_desti_detail").attr("action","/info/destiDel.ch4");
		$("#f_desti_detail").submit(); */
	}
//키오스크 상태 변경 : 버튼 > 함수 > 내용변경
	function kioskUpd() {
 		$.ajax({
			type:'post'
			,url:"/info/kioskUpd.ch4"
			,dataType: "json"
			,data : $("#f_kiosk_detail").serialize()
			,success: function(data){
				$("#kioskModal").modal('hide');
				$("#tb_kiosk").bootstrapTable('load',data);
			}
		}); 
	}
//휴무일 관리 추가 : 버튼 > 모달 > 삭제
	function addCloseDay() {
		$.ajax({
			type:'post'
			,url:"/info/closeDayAdd.ch4"
			,dataType: "json"
			,data :$("#f_Addcloseday").serialize()
			,success: function(data){
				$('#addCloseModal').modal('hide');
				$("#tb_closeday").bootstrapTable('load',data);
			}
		});
		$('#comcl_date_add').textbox('setValue',"");
		$('#comcl_dayweek_add').textbox('setValue',"");
		$('#comcl_notes_add').textbox('setValue',"");
		
	}
//휴무일 삭제 추가 : 모달 > 삭제
	function delCloseDay() {
		$.ajax({
			type:'post'
			,url:"/info/closeDayDel.ch4"
			,dataType: "json"
			,data :$("#f_closeday_del").serialize()
			,success: function(data){
				$('#detCloseModal').modal('hide');
				$("#tb_closeday").bootstrapTable('load',data);
			}
		});
	}
</script>
</body>
</html>