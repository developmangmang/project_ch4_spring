<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 -->
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>방문 현황 - CH4 방문/반입 자동화 시스템</title>
<!-- 공통코드 -->
<%@ include file="../../../Style/common/HeadUI.jsp"%>
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
		margin-top : 10px;
		margin-bottom : 20px;
		border-bottom-style: solid;
		border-bottom-width: thick;
		padding-block-end: 20px;
		border-bottom-color: #4a96ad;
	}
	#titleimg {
		margin-left: 30px;	
	}
	#dashboard_area {
		height: 100%;
	}
	#search_area {
		background-color: rgba(74, 150, 173, 0.5);
		/* height: 100%; */
		padding: 20px 10px 30px 10px;
	}
	#tb_search {
		width: 90%;
	}
	#tb_search input {
		height: 40px;
		width: 90%;
	}
	#tb_search .textbox {
		border-color: #1c3941;
		margin-bottom: 10px;
	}
	#tb_search .combo-arrow {
    	background-color: #ebe4da;
	}
	#tb_search #line {
		 border-bottom: solid;
		 border-bottom-style: dotted;
		 border-bottom-color: #ebe4da;
	}
	#tb_search #label {
		margin-top: 20px;
		font-size: medium;
		font-family: "맑은 고딕",monospace;
	}
	#tb_logVisitor {
		width: 98%;	
	}
	#tb_logVisitor thead {
		background-color: rgba(84, 84, 84, 0.8);
		color: #f6f3ee;
		border-style: solid;
		border-bottom-color: #545454;
	}
	#tb_logVisitor tbody {
		background-color: white;
		margin: 0px 0px 0px 0px;
	}
	.bootstrap-table .fixed-table-pagination>.pagination-detail .pagination-info {
	    margin-left: 20px;
	}
</style>
</head>
<body>
<%@ include file="../../CommonForm/Top.jsp"%>
<div class="container-fluid">
	<%@ include file="../../CommonForm/ManagerSideBar.jsp"%>
	<div style="padding-left: 16%; height: 100%">
		<div class="row" id="header_area"> 
			<img src="${host}/resources/Style/images/logo/log_visitor.png" id="titleimg">
		</div>
		<div class="row" id="dashboard_area">
			<div class=" well col-lg-2" id="search_area" align="center">
				<form id="f_search">
					<input type="hidden" name="com_no" value="<%=com_no %>">
					<table id="tb_search">
						<tr>
	                		<td>
	                			<label id="label">일자 검색</label>
	                		</td>
	                	</tr>
						<tr id="line">
							<td>
								<div class="easyui-calendar" id="calender" style="width:250px;height:250px;"></div>
								<input type="hidden" id="confm_visit_date" name="confm_visit_date">
							</td>
						</tr>
						<tr>
	                		<td>
	                			<label id="label">검색 조건</label>
	                		</td>
	                	</tr>
	                	<tr>
	                		<td>
								<select class="easyui-combobox" id="SearchType" name='SearchType' 
										style="width: 95%"  data-options="panelHeight:'auto'">
									<option value="confm_no">방문번호</option>
									<option value="confm_name" selected>방문자명</option>
									<option value="confm_desti">목적지</option>
								</select>
	                		</td>
	                	</tr>
	                	<tr id="line">
	                		<td>
	                			<input class="easyui-searchbox" id="searchText" name="confm_name"
	                					data-options="searcher:search">
	                		</td>
	                	</tr>
               			<tr>
	                		<td>
	                			<label id="label">방문현황</label>
	                		</td>
	                	</tr>
               			<tr id="line">
	                		<td>
	                			<select class="easyui-combobox" id="state" name="cmg_notes" 
	                					style="width: 95%"  data-options="panelHeight:'auto'">
									<option value="" selected>전체</option>
									<option value="방문중">방문중</option>
									<option value="외출">외출</option>
									<option value="방문종료">방문종료</option>
								</select>
	                		</td>
	                	</tr>
               			<tr>
	                		<td>
	                			<label id="label">출입시간</label>
	                		</td>
	                	</tr>
               			<tr>
	                		<td>
	                			<select class="easyui-combobox" id="time" name="cmg_inout" 
	                					style="width: 95%" data-options="panelHeight:'auto'">
									<option value="" selected>전체</option>
									<option value="00">00시</option>
									<option value="01">01시</option>
									<option value="02">02시</option>
									<option value="03">03시</option>
									<option value="04">04시</option>
									<option value="05">05시</option>
									<option value="06">06시</option>
									<option value="07">07시</option>
									<option value="08">08시</option>
									<option value="09">09시</option>
									<option value="10">10시</option>
									<option value="11">11시</option>
									<option value="12">12시</option>
									<option value="13">13시</option>
									<option value="14">14시</option>
									<option value="15">15시</option>
									<option value="16">16시</option>
									<option value="17">17시</option>
									<option value="18">18시</option>
									<option value="19">19시</option>
									<option value="20">20시</option>
									<option value="21">21시</option>
									<option value="22">22시</option>
									<option value="23">23시</option>
								</select>
	                		</td>
	                	</tr>
					</table>
				</form>
			</div>
			<div class="col-lg-10">
				<table class="table table-bordered table-hover" id="tb_logVisitor"></table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	//combobox 직접입력 방지
	$.fn.combobox.defaults.editable = false
	//datebox 직접입력 방지
	$.fn.datebox.defaults.editable = false
	
	/* 검색방법 콤보박스로 textbox name값 변경 */
	$(document).ready(function(){
		$('#SearchType').combobox({
			onChange: function(newVal){
				$("#searchText").textbox('textbox').attr('name',newVal);
				$("#searchText").attr('textboxname',newVal);
				var inputHidden = $("#searchText").textbox('textbox').parent().find('input:last');
				inputHidden.attr('name',newVal);
	// 			$("span.textbox > .textbox-value").attr('name',newVal);
			}
		});
	
	/* 테이블 데이터 */
		var now = new Date();
		var year = now.getFullYear();
		var month = +now.getMonth()+1;
		if(month<10){
			month = '0'+month;
		}
		var day = now.getDate();
		if(day<10){
			day = '0'+day;
		}
		var confm_visit_date = year+'-'+month+'-'+day;
		$("#tb_logVisitor").bootstrapTable({
		    columns:[
		         {field:'CONFM_NO',title:'방문번호'}
		         ,{field:'CMG_INOUT',title:'출입시간'}
		         ,{field:'CONFM_NAME',title:'방문자명'}
		         ,{field:'CMG_ENTRC',title:'출입위치'}/* 출입위치 : 사용게이트 */
		         ,{field:'CMG_NOTES',title:'처리상태'}
		         ,{field:'CONFM_DESTI',title:'목적지'}
		    ]
			,url: "/company/inOutVisitorList.ch4?confm_visit_date="+confm_visit_date+"&com_no="+'<%=com_no %>'
		    ,pagination:'true'//페이지 네이션
		    ,paginationPreText:"Previous"
		    ,paginationNextText:"Next"
		    ,pageSize:10//기본 페이지 사이즈
		    ,pageList:[10, 15, 20, 30] //칸수
		});
		
	// 캘린더 검색 기능
		$('#calender').calendar({
			onSelect: function(date){
				var year = date.getFullYear();
				var month = +date.getMonth()+1;
				if(month<10){
					month = '0'+month;
				}
				var day = date.getDate();
				if(day<10){
					day = '0'+day;
				}
				var confm_visit_date = year+'-'+month+'-'+day;
				$('#confm_visit_date').attr('value',confm_visit_date);
				$.ajax({
					type:'post'
					,url:"/company/inOutVisitorList.ch4"
					,dataType: "json"
					,data :$("#f_search").serialize()
					,success: function(data){
						$("#tb_logVisitor").bootstrapTable('load',data);
					}
				});
			}
		});
	//방문현황 콤보 박스
		$("#state").combobox({
			onChange: function(newVal){
				$.ajax({
					type:'post'
					,url:"/company/inOutVisitorList.ch4" 
					,dataType: "json"
					,data :$("#f_search").serialize()
					,success: function(data){
						$("#tb_logVisitor").bootstrapTable('load',data);
					}
				});
			}
		});
	//출입시간 콤보박스
		$("#time").combobox({
			onChange: function(newVal){
				$.ajax({
					type:'post'
					,url:"/company/inOutVisitorList.ch4" 
					,dataType: "json"
					,data :$("#f_search").serialize()
					,success: function(data){
						$("#tb_logVisitor").bootstrapTable('load',data);
					}
				});
			}
		});
		
	});
	
	/* 버튼 검색 */
	function search(){
		$.ajax({
				type:'post'
				,url:"/company/inOutVisitorList.ch4" 
				,dataType: "json"
				,data :$("#f_search").serialize()
				,success: function(data){
					$("#tb_logVisitor").bootstrapTable('load',data);
				}
		});
	}
</script>
</body>
</html>