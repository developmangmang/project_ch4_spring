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
		border-color: #1c3941;
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
	#tb_searchVisitor {
		width: 98%;	
		height: 520px;
	}
	#tb_searchVisitor thead {
		background-color: rgba(84, 84, 84, 0.8);
		color: #f6f3ee;
		border-style: solid;
		border-bottom-color: #545454;
	}
	#tb_searchVisitor tbody {
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
			<img src="${host}/resources/Style/images/logo/search_visitor.png" id="titleimg">
		</div>
		<div class="row" id="dashboard_area">
			<div class=" well col-lg-2" id="search_area" align="center">
				<form id="f_search">
	                <input type="hidden" name="com_no" value="<%=com_no %>">
	                <!-- 검색 타입 설정 -->
	                <table id="tb_search">
	                	<tr>
	                		<td colspan="2">
	                			 <select class="easyui-combobox" id="SearchType" name='SearchType'
	                			 		 style="width: 100%;"  data-options="panelHeight:'auto'">
									<option value="visit_apply_name" selected>신청자명</option>
									<option value="visitor_name">방문자명</option>
									<option value="visit_desti">목적지</option>
									<option value="visit_no">신청번호</option>
								</select>
	                		</td>
	                	</tr>
	                	<tr id="line">
	                		<td colspan="2">
	                			<input class="easyui-searchbox" id="searchText" name="visit_apply_name" 
	                					data-options="prompt:'Please Input Value',searcher:btn_search">
				                    <!-- <a class="easyui-linkbutton" type="button" data-options="iconCls:'icon-search'"
				                      onclick="btn_search()"></a> -->
	                		</td>
	                	</tr>
	                	<tr>
	                		<td>
	                			<label id="label">결제상태</label>
	                		</td>
	                	</tr>
	                	<tr id="line">
	                		<td>
	                			<select class="easyui-combobox" id="state" name="visit_permit_st" 
	                					style="width: 95%;" data-options="panelHeight:'auto'">
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
	                			<input class="easyui-datebox" id="startdate" name="visit_apply_date1"
	                					label="Start Date:" labelPosition="top">
	                		</td>
	                	</tr>
	                	<tr>
	                		<td>
	                			<input class="easyui-datebox" id=closedate name="visit_apply_date2"
	                					label="End Date:" labelPosition="top">
	                		</td>
	                	</tr>
	                </table>
 				</form>
				<!-- 부트 테이블 : search_ResultVisitor 참조 -->
			</div>
			<div class="col-lg-10">
				<table class="table table-bordered table-hover" id="tb_searchVisitor"></table>
			</div>
		</div>
	</div>
</div>
   <script type="text/javascript">
   //combobox 직접입력 방지
   $.fn.combobox.defaults.editable = false
   //datebox 직접입력 방지
   $.fn.datebox.defaults.editable = false
   // 검색방법 콤보박스로 textbox name값 변경
   $(document).ready(function(){
      $('#SearchType').combobox({
         onChange: function(newVal){
            $("#searchText").textbox('textbox').attr('name',newVal);
            $("#searchText").attr('textboxname',newVal);
            var inputHidden = $("#searchText").textbox('textbox').parent().find('input:last');
            inputHidden.attr('name',newVal);
         }
      });
      
   	  /* 부트스트랩 테이블 */
      $("#tb_searchVisitor").bootstrapTable({
             columns:[
                  {field:'VISIT_NO',title:'신청번호'}
                  ,{field:'VISIT_APPLY_DATE',title:'신청일'}
                  ,{field:'VISIT_APPLY_NAME',title:'신청자명'}
                  ,{field:'VISIT_APPLY_HP',title:'연락처'}
                  ,{field:'VISIT_DESTI',title:'목적지'}/* 현재위치 : 내부 외부 사내 .. */
                  ,{field:'VISIT_PERMIT_ST',title:'결재상태'}
                ]
            ,url:'/company/applyVisitList.ch4?com_no='+'<%=com_no %>'
            ,onDblClickRow : function(row, $element, field) {
               //테이블에서 신청번호 칸에 들어간 정보 가져오기
               var visit_no = $element.find('td').eq(0).text();
               location.href = '/company/applyVisitDetail.ch4?visit_no='+visit_no;
         }
      });
      //승인상태 변경 검색 이벤트
      $("#state").combobox({
         onChange: function(newVal){
            //alert("work");
            $.ajax({
               type:'post'
               ,url:'/company/applyVisitList.ch4'
               ,dataType: "json"
               ,data :$("#f_search").serialize()
               ,success: function(data){
                  $("#tb_sv").bootstrapTable('load',data);
               }
            });
         }
      });
      
      //신청일 변경 검색 이벤트
      $("#startdate").datebox({
         onSelect: function(date){
            $(this).datebox('setValue',date.getFullYear()+'-'+date.getMonth()+'-'+date.getDate());
            $.ajax({
               type:'post'
               ,url:'/company/applyVisitList.ch4'
               ,dataType: "json"
               ,data :$("#f_search").serialize()
               ,success: function(data){
                  $("#tb_sv").bootstrapTable('load',data);
               }
            });
         }
      });
      $("#closedate").datebox({
         onSelect: function(date){
            $(this).datebox('setValue',date.getFullYear()+'-'+date.getMonth()+'-'+date.getDate());
            $.ajax({
               type:'post'
               ,url:'/company/applyVisitList.ch4'
               ,dataType: "json"
               ,data :$("#f_search").serialize()
               ,success: function(data){
                  $("#tb_sv").bootstrapTable('load',data);
               }
            });
         }
      });
      
   });
   /* 검색버튼 기능 */
   function btn_search(value){
      /* 검색 조건을 통해 재출력 */
      $.ajax({
         type:'post'
         ,url:'/company/applyVisitList.ch4'
         ,dataType: "json"
         ,data :$("#f_search").serialize()
         ,success: function(data){
            $("#tb_sv").bootstrapTable('load',data);
         }
      });   
   }
   </script>
</body>
</html>