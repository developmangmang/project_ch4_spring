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
	#tb_kio thead {
		background-color: rgba(84, 84, 84, 0.8);
		color: #f6f3ee;
		border-style: solid;
		border-bottom-color: #545454;
	}
	#tb_red thead {
		background-color: rgba(84, 84, 84, 0.8);
		color: #f6f3ee;
		border-style: solid;
		border-bottom-color: #545454;
	}
	#tb_desti, #tb_kio, #tb_redday tbody {
		background-color: white;
		margin: 0px 0px 0px 0px;
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
					<a href="#redday" aria-controls="redday" role="tab" data-toggle="tab">
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
					<div class="row" style="margin-bottom: 10px;">
						<table class="table table-bordered table-hover" id="tb_desti"></table>
					</div>
					<div class="row" align="right">
						<button type="button" class="btn btn-info"
							style="float: left; margin-top: 10px; margin-left: 1%;"
							data-toggle="modal" data-target="#addDestiModal">목적지
							추가</button>
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
						<form id="f_kio">
							<button class="btn btn-primary" id="search_kio" type="button"
								style="float: right; margin-left: 1%;">search</button>
							<select class="form-control" id="combo-kio" name="KIOSK_ST"
								style="width: 120px; float: right;">
								<option value="정상">정상</option>
								<option value="고장">고장</option>
								<option value="수리요청">수리요청</option>
								<option value="수리중">수리중</option>
							</select>
						</form>
					</div>
					<div class="row">
						<table class="table table-bordered table-hover" id="tb_kio"></table>
					</div>
				</div>
			</div>
			<div role="tabpanel" class="tab-pane" id="redday">
				<div class="col-lg-offset-2 col-lg-8 col-lg-offset-2">
					<div class="row" style="margin-bottom: 30px;">
						<span id="spanfor">휴무일 관리</span>
					</div>
					<div class="row" style="margin-bottom: 10px;">
						<form id="f_redday">
							<div class="col-lg-4">
								<button type="button" class="btn btn-info" data-toggle="modal"
									data-target="#addRedModal">휴무일 추가</button>
							</div>
							<div class="col-lg-8" align="right">
								<input class="easyui-datebox" id="startdate" name="date1" 
										label ="시작일:" labelPosition="left" required> 
								<input class="easyui-datebox" id="closedate" name="date2"
									data-options="validType:'md[\'2015/11/05\']'"
									label ="종료일:" labelPosition="left" required> 
								<button id="search_reddate" type="button"
									class="btn btn-primary">search</button>
							</div>
						</form>
					</div>
					<div class="row">
						<table class="table table-bordered table-hover" id="tb_red"></table>
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
						<table>
							<tr>
								<td width=70 style="word-break: break-all">목적지명</td>
								<td><input class="easyui-textbox" id="DESTI_NAME_ADD"
									name="DESTI_NAME"></td>
							</tr>
							<tr>
								<td>위치</td>
								<td><input class="easyui-textbox" id="DESTI_LOC_ADD"
									name="DESTI_LCINFO"></td>
							</tr>
							<tr>
								<td>비고</td>
								<td><input class="easyui-textbox" id="DESTI_NOTES_ADD"
									name="DESTI_NOTES"></td>
							</tr>
						</table>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="desti_add"
						onclick="javascript:addDesti();">저장</button>
					<button type="button" class="btn" id="btn_close"
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
					<form id="f_desti_chage">
						<table>
							<tr>
								<td width=70 style="word-break: break-all">일련번호</td>
								<td><input class="easyui-textbox" id="DESTI_NO_INFO"
									name="DESTI_NO" readonly="readonly"></td>
							</tr>
							<tr>
								<td>목적지명</td>
								<td><input class="easyui-textbox" id="DESTI_NAME_INFO"
									name="DESTI_NAME"></td>
							</tr>
							<tr>
								<td>위치</td>
								<td><input class="easyui-textbox" id="DESTI_LOC_INFO"
									name="DESTI_LCINFO"></td>
							</tr>
							<tr>
								<td>비고</td>
								<td><input class="easyui-textbox" id="DESTI_NOTES_INFO"
									name="DESTI_NOTES"></td>
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
	<div id="kioskModal" class="modal fade" role="dialog"
		style="width: 50%; margin-left: 28%; margin-top: 10%;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">키오스크 정보 수정창</h4>
				</div>
				<div class="modal-body" style="align: center; padding-left: 30%">
					<form id="f_kio_change">
						<table>
							<tr>
								<td width=120 style="word-break: break-all">일련번호</td>
								<td><input class="easyui-textbox" id="kiosk_no"
									name="kiosk_no" readonly="readonly"></td>
							</tr>
							<tr>
								<td>위치</td>
								<td><input class="easyui-textbox" id="kiosk_location"
									name="KIOSK_GATE"></td>
							</tr>
							<tr>
								<td>상태</td>
								<td><select class="form-control" id="KIOSK_ST"
									name="KIOSK_ST" style="width: 100%;">
										<option value="정상">정상</option>
										<option value="고장">고장</option>
										<option value="수리요청">수리요청</option>
										<option value="수리중">수리중</option>
								</select></td>
							</tr>
							<tr>
								<td>비고</td>
								<td><input class="easyui-textbox" id="KIOSK_NOTES"
									name="KIOSK_NOTES"></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="kio_save"
						onclick='kio_save()'>변경 저장</button>
					<button type="button" class="btn" id="btn_close"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 휴무일 추가 모달창 -->
	<div id="addRedModal" class="modal fade" role="dialog"
		style="width: 50%; margin-left: 28%; margin-top: 10%;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">휴무일 추가</h4>
				</div>
				<div class="modal-body" style="align: center; padding-left: 30%">
					<form id="f_redday_add">
						<table>
							<tr>
								<td width=70 style="word-break: break-all">휴무일자</td>
								<td><input class="easyui-textbox" id="comcl_date"
									name="comcl_date"></td>
							</tr>
							<tr>
								<td>요일</td>
								<td><input class="easyui-textbox" id="comcl_dayweek"
									name="comcl_dayweek"></td>
							</tr>
							<tr>
								<td>비고</td>
								<td><input class="easyui-textbox" id="comcl_notes"
									name="comcl_notes"></td>
							</tr>
						</table>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-info" id="desti_add"
						onclick="javascript:addRed();">저장</button>
					<button type="button" class="btn" id="btn_close"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 휴무일 삭제 모달창 -->
	<div id="delRedModal" class="modal fade" role="dialog"
		style="width: 50%; margin-left: 28%; margin-top: 10%;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">휴무일 추가</h4>
				</div>

				<div class="modal-body" style="align: center; padding-left: 30%">
					<form id="f_redday_del">
						<table>
							<tr>
								<td width=70 style="word-break: break-all">목적지명</td>
								<td><input class="easyui-textbox" id="DATE_DEL"
									name="COMCL_DATE" readonly="readonly"></td>
							</tr>
							<tr>
								<td>위치</td>
								<td><input class="easyui-textbox" id="DAYWEEK_DEL"
									name="COMCL_DAYWEEK" readonly="readonly"></td>
							</tr>
							<tr>
								<td>비고</td>
								<td><input class="easyui-textbox" id="NOTES_DEL"
									name="COMCL_NOTES" readonly="readonly"></td>
							</tr>
						</table>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-danger" id="desti_add"
						onclick="javascript:addRed();">삭제</button>
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
		,url:'/project_ch4_pojo/json/desti.json'
		,pagination : 'true'
		,paginationPreText:"Previous"
	    ,paginationNextText:"Next"
		,pageSize:10//기본 페이지 사이즈
		,pageList:[10, 15, 20, 30] //칸수
		,search : 'true'
		,showSearchButton : 'true'
		,onDblClickRow : function(row, $element, field) {
			var des_no = $element.find("td").eq(0).html();
			var des_gate = $element.find("td").eq(1).html();
			var des_st = $element.find("td").eq(2).html();
			var des_note = $element.find("td").eq(3).html();

			$("#DESTI_NO_INFO").textbox('setValue', des_no);
			$("#DESTI_NAME_INFO").textbox('setValue', des_gate);
			$("#DESTI_LOC_INFO").textbox('setValue', des_st);
			$("#DESTI_NOTES_INFO").textbox('setValue', des_note);

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
			DESTI_NAME : nameSearch
		});
	});
	
//키오스크 관리 테이블
	$("#tb_kio").bootstrapTable({
		columns:[
        	{field:'KIOSK_NO',title:'일련번호'}
        	,{field:'KIOSK_GATE',title:'위치'}
        	,{field:'KIOSK_ST',title:'상태'}
        	,{field:'KIOSK_NOTES',title:'비고'}
        	]
		,url:'/project_ch4_pojo/json/kiosk.json'
		,pagination : 'true'
		,paginationPreText:"Previous"
		,paginationNextText:"Next"
		,pageSize:10//기본 페이지 사이즈
		,pageList:[10, 15, 20, 30] //칸수
	    ,onDblClickRow:function(row,$element,field){
	    	var ki_no = $element.find("td").eq(0).html();
			var ki_gate = $element.find("td").eq(1).html();
			var ki_st = $element.find("td").eq(2).html();
			var ki_note = $element.find("td").eq(3).html();

			$("#kiosk_no").textbox('setValue',ki_no);
 			$("#kiosk_location").textbox('setValue',ki_gate);
 			$("#KIOSK_ST").val(ki_st);
 			$("#KIOSK_NOTES").textbox('setValue',ki_note);
			
			$("#kioskModal").modal('show');
	     }
	});
	//검색 버튼 기능
	$("#search_kio").click(function(){
		var combo_k = $("#combo-kio").val();
		//alert(combo_k);
		$.ajax({
			type:'post'
			,url:'/project_ch4_pojo/json/kiosk.json'/* 실제 사용할 URL 변경하기  : company/???.ch4 */
			,dataType: "json"
			,data :$("#f_kio").serialize()
			,success: function(data){
				//alert(combo_k);
				$("#bt_kio").bootstrapTable('load',data);
			}
		});
	});
	
//휴무일 관리 테이블
	$("#tb_red").bootstrapTable({
		columns:[
        	{field:'COMCL_DATE',title:'날짜'}
        	,{field:'COMCL_DAYWEEK',title:'요일'}
        	,{field:'COMCL_NOTES',title:'비고'}
        	]
		,url:'/project_ch4_pojo/json/redday.json'
		,pagination : 'true'
		,paginationPreText:"Previous"
		,paginationNextText:"Next"
		,pageSize:10//기본 페이지 사이즈
		,pageList:[10, 15, 20, 30] //칸수
		,onDblClickRow:function(row,$element,field){
			alert("휴무일은 삭제 후, 복구 할 수 없습니다.");
			
			var date = $element.find("td").eq(0).html();
			var day = $element.find("td").eq(1).html();
			var note = $element.find("td").eq(2).html();
			
			$("#DATE_DEL").textbox('setValue',date);
 			$("#DAYWEEK_DEL").textbox('setValue',day);
 			$("#NOTES_DEL").textbox('setValue',note);
			
			$("#delRedModal").modal('show');
     	}
	});
	//검색 버튼 기능
	$("#search_reddate").click(function(){
		var sdate = $("#startdate").val();
		var cdate = $("#closedate").val();
		
		if(sdate!=""&&cdate!="") {
			if(sdate>cdate){
				alert("검색할 기간의 시작일이 종료일보다 빨라야 합니다");
			} else {
				$.ajax({
					type:'post'
					,url:'/project_ch4_pojo/json/redday.json'/* 실제 사용할 URL 변경하기  : company/???.ch4 */
					,dataType: "json"
					,data :$("#f_redday").serialize()
					,success: function(data){
						//alert(sdate+'..'+cdate);
						$("#bt_red").bootstrapTable('load',data);
					}
				});	
			}
		}
		else {
			alert("검색할 기간의 시작일과 종료일 범위를 지정해 주세요");
		}
	});

});//	end of dom

// 목적지 추가 버튼 기능 구현
	function addDesti() {
		//alert("새로넣어죠");
		var date = $('#DATE_ADD').val();
		var dayweek = $('#DAYWEEK_ADD').val();
		var notice = $('#NOTES_ADD').val();
		//폼태그 : ** 일련번호를 생성해서 최종적으로 같이 넣어준다 **
		$("#f_desti_add").attr("method","get");
		$("#f_desti_add").attr("action","/destiADD.ch4");
		$("#f_desti_add").submit();
	}
// 목적지 수정 버튼 기능 구현 
	function updateDesti() {
		//alert("시작부터 밑장빼기냐");
		var nonoC = $('#DESTI_NO_INFO').val();
		var nameC = $('#DESTI_NAME_INFO').val();
		var locaC = $('#DESTI_LOC_INFO').val();
		var notiC = $('#DESTI_NOTES_INFO').val();
		//alert(nonoC);
		//수정 정보 전송
		$("#f_desti_chage").attr("method","post");
		$("#f_desti_chage").attr("action","/destiUPD.ch4");
		$("#f_desti_chage").submit();
	}
// 목적지 삭제 버튼 기능 구현
	function deletDesti() {
		//삭제할 정보의 일련번호 전달
		$("#f_desti_chage").attr("method","post");
		$("#f_desti_chage").attr("action","/destiDEL.ch4");
		$("#f_desti_chage").submit();
	}
	
//키오스크 상태 변경 : 버튼 > 함수 > 내용변경
	function kio_save() {
		//폼태그 : 화면 전송 시, 새창에서 목적지 관리로 탭이뜨는 것 해결해야함
		$("#f_kio_change").attr("method","post");
		$("#f_kio_change").attr("action","/kiosk.ch4");
		$("#f_kio_change").submit();
	}
	
//휴무일 관리 추가 : 버튼 > 모달 > 삭제
	function addRed() {
		//폼태그 : 화면 전송 시, 새창에서 목적지 관리로 탭이뜨는 것 해결해야함
		$("#f_redday_add").attr("method","post");
		$("#f_redday_add").attr("action","/reddayadd.ch4");
		$("#f_redday_add").submit();
	}
//휴무일 삭제 추가 : 모달 > 삭제
	function DELRed() {
		//폼태그 전송
		$("#f_redday_del").attr("method","post");
		$("#f_redday_del").attr("action","/reddaydel.ch4");
		$("#f_redday_del").submit();
	}
</script>
</body>
</html>