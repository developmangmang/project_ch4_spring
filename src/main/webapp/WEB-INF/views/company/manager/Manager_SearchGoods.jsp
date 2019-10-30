<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 -->
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>신청 관리 - CH4 방문/반입 자동화 시스템</title>
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
		border-bottom-color: #7d1935;
	}
	#titleimg {
		margin-left: 30px;	
	}
	#dashboard_area {
		height: 100%;
	}
	#search_area {
		background-color: rgba(125, 25, 53, 0.7);
		/* height: 100%; */
		padding: 30px 10px 30px 10px;
	}
	#tb_search {
		width: 90%;
	}
	#tb_search input {
		height: 40px;
		width: 90%;
	}
	#tb_search .textbox {
		border-color: #7d1935;
		margin-bottom: 15px;
	}
	#tb_search .combo-arrow {
    	background-color: #ebe4da;
	}
	#tb_search #line {
		 border-bottom: solid;
		 margin-bottom: 10px;
		 border-bottom-style: dotted;
		 border-bottom-color: #ebe4da;
	}
	#tb_search #label {
		margin-top: 30px;
		font-size: medium;
		font-family: "맑은 고딕",monospace;
	}
	#tb_searchGoods {
		width: 95%;	
	}
	#tb_searchGoods thead {
		background-color: rgba(84, 84, 84, 0.8);
		color: #f6f3ee;
		border-style: solid;
		border-bottom-color: #545454;
	}
	#tb_searchGoods tbody {
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
			<img src="${host}/resources/Style/images/logo/search_goods.png" id="titleimg">
		</div>
		<div class="row"  id="dashboard_area">
			<div class=" well col-lg-2" id="search_area" align="center">
				<form id="f_search">
					<input type="hidden" name="com_no" value="<%=com_no %>">
						<table id="tb_search">
							<tr>
								<td colspan="2">
									<select class="easyui-combobox" id="SearchType" name='SearchType' 
											style="width: 100%;" data-options="panelHeight:'auto'">								
										<option value="aplg_no" selected>신청번호</option>
										<option value="aplg_name">신청자</option>
										<option value="aplg_desti">목적지<option>
									</select>
								</td>
							</tr>
							<tr id="line">
								<td colspan="2">
									<input class="easyui-searchbox" id="searchText" name="aplg_name"
											data-options="searcher:search">
								</td>
							</tr>
							<tr>
	                			<td>
	                				<label id="label">결제상태</label>
	                			</td>
							</tr>
							<tr id="line">
								<td>
									<select class="easyui-combobox" id="state" name="aplg_permit_st"
											style="width: 100%;"  data-options="panelHeight:'auto'">
										<option value="" selected>전체</option>
										<option value="결재중">결재중</option>
										<option value="승인">승인</option>
										<option value="반려">반려</option>
										<option value="취소">취소</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<label id="label">신청일</label>
								</td>
							</tr>
							<tr>
								<td>
									<input class="easyui-datebox" id="startdate" name="aplg_date1"
											label="Start Date:" labelPosition="top">
								</td>
							</tr>
							<tr>
								<td>
									<input class="easyui-datebox" id=closedate name="aplg_date2"
											label="End Date:" labelPosition="top">
								</td>
							</tr>
						</table>
					</form>
				</div>
				<!-- 부트 테이블 : search_ResultVisitor 참조-->
				<div class="col-lg-10">
					<table class="table table-bordered table-hover" id="tb_searchGoods"></table>
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
			}
		});

		/* 테이블 데이터 */
		$("#tb_searchGoods").bootstrapTable({
			columns:[
				{field:"APLG_NO",title:'신청번호'}
				,{field:"APLG_DATE",title:'신청일'}
				,{field:"APLG_NAME",title:'신청자명'}
				,{field:"APLG_HP",title:'연락처'}
				,{field:"APLG_DESTI",title:'목적지'}
				,{field:"APLG_PERMIT_ST",title:'결재상태'}
			]
			,url:'/company/applyGoodsList.ch4?com_no='+'<%=com_no %>'
			,onDblClickRow : function(row, $element, field) {
				//테이블에서 신청번호 칸에 들어간 정보 가져오기
				var aplg_no = $element.find('td').eq(0).text();
				location.href = '/company/applyGoodsDetail.ch4?aplg_no='+aplg_no;
			}
		});
	
		//방문현황 콤보
		$("#state").combobox({
			onChange: function(newVal){
				//alert("work");
				$.ajax({
					type:'post'
					,url:'/company/applyGoodsList.ch4'
					,dataType: "json"
					,data :$("#f_search").serialize()
					,success: function(data){
						$("#tb_searchGoods").bootstrapTable('load',data);
					}
				});
			}
		});
		//날짜 콤보
		$("#startdate").datebox({
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
				$(this).datebox('setValue',confm_visit_date);
				$.ajax({
					type:'post'
					,url:'/company/applyGoodsList.ch4'
					,dataType: "json"
					,data :$("#f_search").serialize()
					,success: function(data){
						$("#tb_searchGoods").bootstrapTable('load',data);
					}
				});
			}
		});
		$("#closedate").datebox({
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
				$(this).datebox('setValue',confm_visit_date);
				$.ajax({
					type:'post'
					,url:'/company/applyGoodsList.ch4'
					,dataType: "json"
					,data :$("#f_search").serialize()
					,success: function(data){
						$("#tb_searchGoods").bootstrapTable('load',data);
					}
				});
			}
		});
	});
	/* 검색버튼 기능 */
	   function search(){
		//alert("여기");
	      /* 검색 조건을 통해 재출력 */
	      $.ajax({
	         type:'post'
	         ,url:'/company/applyGoodsList.ch4'
	         ,dataType: "json"
	         ,data :$("#f_search").serialize()
	         ,success: function(data){
	            $("#tb_searchGoods").bootstrapTable('load',data);
	         }
	      });   
	   }
	</script>
</body>
</html>