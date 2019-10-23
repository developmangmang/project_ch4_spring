<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 -->
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>반입 신청 관리 - CH4 방문자 관리 시스템</title>
<!-- 공통코드 -->
<%@ include file="../../../Style/common/HeadUI.jsp"%>
</head>
<body>
	<%@ include file="../../CommonForm/Top.jsp"%>
	<!-- Content -->
	<div class="mainContent">
		<%@ include file="../../CommonForm/ManagerSideBar.jsp"%>
		<div style="padding-left: 200px">
			<div class="col-lg-offset-1 col-lg-10"
				style="margin-top: 20px; margin-bottom: 20px;">
				<div
					style="margin: 30px 20px 10px 0px; font-size: 35px; width: 50%; float: left;">
					<h1>반입 신청 관리</h1>
				</div>
			</div>
			<!-- 검색 조건 설정 -->
			<div class="col-lg-offset-1 col-lg-10">
				<div class="row">
					<form id="f_search">
						<input type="hidden" name="com_no" value="<%=com_no %>">
						<div class='col-lg-2' style="padding: 5px;">
							<select class="easyui-combobox" id="SearchType" name='SearchType'
								 style="width: 90%;">
								<option value="aplg_no" selected>신청번호</option>
								<option value="aplg_name">신청자</option>
								<option value="aplg_desti">목적지
								<option>
							</select>
						</div>
						<div class='col-lg-2' style="padding: 5px;">
							<!-- 검색창 : 콤보박스에 의한 분기 -->
							<input class="easyui-textbox" id="searchText" name="aplg_no"
								style="width: 80%;"> <a class="easyui-linkbutton"
                        		type="button" data-options="iconCls:'icon-search'"
                        		onclick="btn_search()"></a>
						</div>
						<div class='col-lg-2' style="padding: 5px;">
							<select class="easyui-combobox" id="state" name="aplg_permit_st"
								style="width: 100%;">
								<option value="" selected>전체</option>
								<option value="결재중">결재중</option>
								<option value="승인">승인</option>
								<option value="반려">반려</option>
								<option value="취소">취소</option>
							</select>
						</div>
						<!-- 날짜 검색 -->
						<div class='col-lg-4' style="padding: 5px; padding-left:15px;">
							<div class="row">
								<span style="font-weight: bold;">신청일</span>
								<input class="easyui-datebox" id="startdate" name="aplg_date1" style="width: 40%;">
								<b>~</b>
								<input class="easyui-datebox" id=closedate name="aplg_date2" style="width: 40%;">
							</div>
						</div>
					</form>
				</div>
				<!-- 부트 테이블 : search_ResultVisitor 참조-->
				<div class="row" style="width: 86%; margin-top:20px;">
					<table class="table table-bordered table-hover" id="tb_searchGood">
					</table>
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
		$("#tb_searchGood").bootstrapTable({
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
						$("#tb_searchGood").bootstrapTable('load',data);
					}
				});
			}
		});
		//날짜 콤보
		$("#startdate").datebox({
			onSelect: function(date){
				$(this).datebox('setValue',date.getFullYear()+'-'+date.getMonth()+'-'+date.getDate());
				$.ajax({
					type:'post'
					,url:'/company/applyGoodsList.ch4'
					,dataType: "json"
					,data :$("#f_search").serialize()
					,success: function(data){
						$("#tb_searchGood").bootstrapTable('load',data);
					}
				});
			}
		});
		$("#closedate").datebox({
			onSelect: function(date){
				$(this).datebox('setValue',date.getFullYear()+'-'+date.getMonth()+'-'+date.getDate());
				$.ajax({
					type:'post'
					,url:'/company/applyGoodsList.ch4'
					,dataType: "json"
					,data :$("#f_search").serialize()
					,success: function(data){
						$("#tb_searchGood").bootstrapTable('load',data);
					}
				});
			}
		});
	});
	/* 검색버튼 기능 */
	   function btn_search(){
	      /* 검색 조건을 통해 재출력 */
	      $.ajax({
	         type:'post'
	         ,url:'/company/applyGoodsList.ch4'
	         ,dataType: "json"
	         ,data :$("#f_search").serialize()
	         ,success: function(data){
	            $("#tb_searchGood").bootstrapTable('load',data);
	         }
	      });   
	   }
	</script>
</body>
</html>