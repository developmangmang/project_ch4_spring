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
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.15.4/extensions/toolbar/bootstrap-table-toolbar.min.js"></script>
</head>
<body>
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
	$("#bt_kio").bootstrapTable({
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
	$("#bt_red").bootstrapTable({
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
	<%@ include file="../../CommonForm/Top.jsp"%>

	<!-- Content -->
	<div class="mainContent">
		<%@ include file="../../CommonForm/InfoSideBar.jsp"%>
		<div style="padding-left: 200px">
			<div class="col-lg-12">
				<div class="col-lg-offset-1 col-lg-10"
					style="margin-top: 20px; margin-bottom: 20px;">
					<div
						style="margin: 30px 20px 10px 0px; font-size: 35px; width: 50%; float: left;">종합
						관리 페이지</div>
				</div>
			</div>

			<!-- Nav tabs 구현 -->
			<div class="col-lg-offset-1 col-lg-10">
				<div role="tabpanel">
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#desti"
							aria-controls="desti" role="tab" data-toggle="tab">목적지 관리</a></li>
						<li role="presentation"><a href="#kio" aria-controls="kio"
							role="tab" data-toggle="tab">키오스크 관리</a></li>
						<li role="presentation"><a href="#redday"
							aria-controls="redday" role="tab" data-toggle="tab">휴무일 관리</a></li>
					</ul>

					<!-- Tab panes 구현 -->
					<div class="tab-content">
						<!-- 부트 테이블 : 목적지 관리 -->
						<div role="tabpanel" class="tab-pane fade in active" id="desti">
							<div class="col-lg-12">
								<div class='col-sm-1'></div>
								<div class='col-lg-8' style="margin-left: 5%; margin-top: 2%;">
									<div class='col-lg-12'>
										<span style="font-size: 30px;">목적지 관리</span>
									</div>
									<button type="button" class="btn btn-info"
										style="float: left; margin-top: 10px; margin-left: 1%;"
										data-toggle="modal" data-target="#addDestiModal">목적지
										추가</button>
									<table class="table table-bordered table-hover" id="tb_desti"></table>
								</div>
							</div>
						</div>
						<!-- 부트 테이블 : 키오스크 관리 -->
						<div role="tabpanel" class="tab-pane" id="kio">
							<div class="col-lg-12">
								<div class='col-sm-1'></div>
								<div class='col-lg-8' style="margin-left: 5%; margin-top: 2%;">
									<div class='col-lg-12' style="margin-bottom: 1%;">
										<span style="font-size: 30px;">키오스크 관리</span>
									</div>

									<div class='col-lg-12' style="margin-bottom: 1%; padding: 0px;">
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
									<table class="table table-bordered table-hover" id="bt_kio"></table>
								</div>
							</div>
						</div>
						<!-- 부트테이블 : 휴무일 관리 -->
						<div role="tabpanel" class="tab-pane" id="redday">
							<div class="col-lg-12">
								<div class='col-sm-1'></div>
								<div class='col-lg-8' style="margin-left: 5%; margin-top: 2%;">
									<div class='col-lg-12' style="margin-bottom: 1%;">
										<span style="font-size: 30px;">휴무일 관리</span>
									</div>
									<div style="margin-bottom: 1%;">
										<div class='col-lg-12'
											style="margin-bottom: 1%; padding-right: 0px;">
											<form id="f_redday">
												<button type="button" class="btn btn-info"
													style="float: left;" data-toggle="modal"
													data-target="#addRedModal">휴무일 추가</button>
												<div align="right" style="padding: 0px;">
													<span style="font-weight: bold;">시작일</span> <input
														class="easyui-datebox" id="startdate" name="date1"
														style="width: 120px;" required> <b>&nbsp;~&nbsp;</b>
													<span style="font-weight: bold;">종료일</span> <input
														class="easyui-datebox" id="closedate" name="date2"
														data-options="validType:'md[\'2015/11/05\']'"
														style="width: 120px;" required>
													<button id="search_reddate" type="button"
														class="btn btn-primary">search</button>
												</div>
											</form>
										</div>
									</div>
									<table class="table table-bordered table-hover" id="bt_red"></table>
								</div>
							</div>
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
								<td width=70 style="word-break: break-all">목적지명</td>
								<td><input class="easyui-textbox" id="DATE_ADD"
									name="COMCL_DATE"></td>
							</tr>
							<tr>
								<td>위치</td>
								<td><input class="easyui-textbox" id="DAYWEEK_ADD"
									name="COMCL_DAYWEEK"></td>
							</tr>
							<tr>
								<td>비고</td>
								<td><input class="easyui-textbox" id="NOTES_ADD"
									name="COMCL_NOTES"></td>
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
</body>
</html>