<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>반입 현황 - CH4 방문/반입 자동화 시스템</title>
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
		padding-block-end: 10px;
		border-bottom-color: #7d1935;
	}
	#titleimg {
		margin-left: 30px;	
	}
	#dashboard_area {
		height: 100%;
	}
	#search_area {
		background-color: rgba(125, 25, 53, 0.5);
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
		border-color: #7d1935;
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
		margin-top: 15px;
		font-size: medium;
		font-family: "맑은 고딕",monospace;
	}
	#tb_logGoods {
		width: 98%;	
	}
	#tb_logGoods thead {
		background-color: rgba(84, 84, 84, 0.8);
		color: #f6f3ee;
		border-style: solid;
		border-bottom-color: #545454;
	}
	#tb_logGoods tbody {
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
			<img src="${host}/resources/Style/images/logo/log_goods.png" id="titleimg">
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
								<input type="hidden" id="confm_trans_date" name="confm_trans_date">
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
                        				style="width: 95%;" data-options="panelHeight:'auto'">
									<option value="confm_no">물품번호</option>
									<option value="confm_name">물품명</option>
									<option value="confm_desti">반입장소</option>
								</select>
	                		</td>
	                	</tr>
	                	<tr id="line">
	                		<td>
	                			<input class="easyui-searchbox" id="searchText" name="aplg_name"
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
	                			<select class="easyui-combobox" id="state" name="confm_state"
										style="width: 95%;"  data-options="panelHeight:'auto'">
									<option value="" selected>전체</option>
									<option value="미반입">미반입</option>
									<option value="반입완료">반입완료</option>
									<option value="취소">취소</option>
									<option value="오류">오류</option>
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
	                			<select class="easyui-combobox" id="time" name="confm_trans_time"
									style="width: 230px;" data-options="penelHeight:'auto'">
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
			   <table class="table table-bordered table-hover" id="tb_logGoods"></table>
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
      var confm_trans_date = year+'-'+month+'-'+day;
      $("#tb_logGoods").bootstrapTable({
         columns:[
            {field:"CONFM_NO",title:'물품번호'}
            ,{field:"CONFM_DESTI",title:'방문장소'}
            ,{field:"CONFM_STATE",title:'반입현황'}
            ,{field:"CONFM_NAME",title:'물품명'}
            ,{field:"CONFM_TYPE",title:'물품종류'}
            ,{field:"CONFM_QUAN",title:'물품개수'}
            ,{field:"CONFM_TRANS_QUAN",title:'반입개수'}
            ,{field:"CONFM_TRANS_TIME",title:'반입시간'}
         ]
         ,pagination:'true'
         ,paginationPreText:"Previous"
         ,paginationNextText:"Next"
         ,toolbarAlign : 'right'
         ,url: "/company/inOutGoodsList.ch4?confm_trans_date="+confm_trans_date+"&com_no="+'<%=com_no %>'
          ,pageSize:10//기본 페이지 사이즈
          ,pageList:[2, 4, 6, 8] //칸수
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
            var confm_trans_date = year+'-'+month+'-'+day;
            $('#confm_trans_date').attr('value',confm_trans_date);
            $.ajax({
               type:'post'
               ,url:"/company/inOutGoodsList.ch4"
               ,dataType: "json"
               ,data :$("#f_search").serialize()
               ,success: function(data){
                  $("#tb_logGoods").bootstrapTable('load',data);
               }
            });
         }
      });
   //방문현황 콤보 박스
      $("#state").combobox({
         onChange: function(newVal){
            $.ajax({
               type:'post'
               ,url:"/company/inOutGoodsList.ch4"
               ,dataType: "json"
               ,data :$("#f_search").serialize()
               ,success: function(data){
                  $("#tb_logGoods").bootstrapTable('load',data);
               }
            });
         }
      });
   //출입시간 콤보박스
      $("#time").combobox({
         onChange: function(newVal){
            $.ajax({
               type:'post'
               ,url:"/company/inOutGoodsList.ch4"
               ,dataType: "json"
               ,data :$("#f_search").serialize()
               ,success: function(data){
                  $("#tb_logGoods").bootstrapTable('load',data);
               }
            });
         }
      });
      
   });
   /* 버튼 검색 */
   function search(){
      /* 검색 조건을 통해 재출력 */
      $.ajax({
         type:'post'
         ,url:"/company/inOutGoodsList.ch4"
         ,dataType: "json"
         ,data :$("#f_search").serialize()
         ,success: function(data){
            $("#tb_logGoods").bootstrapTable('load',data);
         }
      });   
   }
</script>
</body>
</html>