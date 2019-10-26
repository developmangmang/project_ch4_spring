<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Main -> Agreement -> Select -> ApplyGoods (세션값 꺼내기)
	String com_no = "null";
	Map<String,Object> pMap = new HashMap<>();
	if(null!=request.getSession().getAttribute("pMap")){
		pMap = (Map<String,Object>)request.getSession().getAttribute("pMap");
	}
	if(null!=pMap.get("com_no")){
		com_no = (String)pMap.get("com_no");
	}
	String com_name = "null";
	if(null!=pMap.get("com_name")){
		com_name = (String)pMap.get("com_name");
	}
	String aplg_desti = "null";
	if(null!=pMap.get("visit_desti")){
		aplg_desti = (String)pMap.get("visit_desti");
	}
	String aplg_name = "null";
	if(null!=pMap.get("visit_apply_name")){
		aplg_name = (String)pMap.get("visit_apply_name");
	}
	String aplg_hp = "null";
	if(null!=pMap.get("visit_apply_hp")){
		aplg_hp = (String)pMap.get("visit_apply_hp");
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
<style>
	body {
		position: relative;
	}
	ul.nav-pills {
		padding-top: 70px;
		position: fixed;
	}
	#section1 {
		height: 420px;
		margin-bottom: 10px;
		font-size: 28px;
	}
	#section2 {
		height: 500px;
		margin-bottom: 10px;
		font-size: 28px;
	}
	div.panel-heading {
		font-size:20px;
		font-weight:bold;
	}
	div.panel-body {
		height: 100%;
		border: 0px;
	}
	table.table {
		margin-bottom:0px;
	}
	.row.table {
		margin-left:0px;
		margin-right:0px;
		text-align:center;
		font-size:14px;
	}
	.row.table.basic {
		border-top: 2px solid #31708f;
	}
	.row.table.goods {
		border-top: 2px solid #3c763d;
		margin-bottom:50px;
	}
	.table th,
	.table td {
		text-align:center;
		border: 1px solid #EDEDED;
	}
	.table th {
		background-color: #DDDDDD;
	}
	.modal-table {
		width: 100%;
		max-width: 100%;
		margin-bottom: 1rem;
		background-color: transparent;
	}
	.modal-table th,
	.modal-table td {
		text-align: center;
		padding: 0.75rem;
		vertical-align: middle;
	}
	.modal-content {
		border: 0px;
	}
	.modal-header.goods {
		background-color: #dff0d8;
	}
	.modal-header.log {
		border-top-left-radius: 6px;
		border-top-right-radius: 6px;
		background-color: #337ab7;
	}
	.modal-body {
		padding-left: 100px;
		padding-right: 100px;
	}
	.modal-body.log {
		padding-left: 50px;
		padding-right: 50px;
	}
	.modal-body p {
		margin: 0 0 0 0px;
	}
</style>
<title>반입 신청 - CH4 방문/반입 자동화 시스템</title>
<script type="text/javascript">
	var gIndex = 1;
	var now = new Date();
</script>
</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="300">
<%@ include file="../CommonForm/Top.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		//목적지 combobox 초기화 + 이전페이지 정보 반영
		$("#aplg_desti").combobox({
			valueField: 'DEPT_NAME',
			textField: 'DEPT_NAME',
			url: "/visitor/deptList.ch4?com_no="+'<%=com_no %>'
		});
		$("#aplg_desti").combobox('select','<%=aplg_desti%>');
		//반입일자 선택 범위 (당일~내년 당일) 제한
		$('#aplg_trans_date').datebox().datebox('calendar').calendar({
            validator: function(date){
                var now = new Date();
                var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
                var d2 = new Date(now.getFullYear()+1, now.getMonth(), now.getDate());
                return d1<=date && date<=d2;
            }
        });
		$('#aplg_trans_date').datebox('setValue',now.getFullYear()+'-'+now.getMonth()+'-'+now.getDate());
		///////////////////////// 반입이력 이벤트  //////////////////////////
		//반입이력 조회 Modal 띄우기
		$("#btn_log").on('click',function(){
			$("#md_log").modal('show');
		});
		//신청일자 조회 시작일 선택시 마지막일 선택범위 제한
		$('#aplg_date1').datebox({
			onSelect: function(date){
				firstDate = date;
				$('#aplg_date2').datebox().datebox('calendar').calendar({
		            validator: function(date){
		                var now = new Date();
		                var d1 = new Date(firstDate.getFullYear(), firstDate.getMonth(), firstDate.getDate());
		                var d2 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
		                return d1<=date && date<=d2;
		            }
		        });
			}
		});
		//신청일자 조회 시작일 범위 (작년 당일~올해 당일) 제한
		$('#aplg_date1').datebox().datebox('calendar').calendar({
            validator: function(date){
                var now = new Date();
                var d1 = new Date(now.getFullYear()-1, now.getMonth(), now.getDate());
                var d2 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
                return d1<=date && date<=d2;
            }
        });
		//신청일자 조회 마지막일 범위 (시작일~당일) 제한
		$('#aplg_date2').datebox().datebox('calendar').calendar({
            validator: function(date){
                var now = new Date();
                var d1 = new Date(now.getFullYear(), now.getMonth()-1, now.getDate());
                var d2 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
                return d1<=date && date<=d2;
            }
        });
		//신청일자 시작일 마지막일 (한달전~당일) 기본세팅
		$('#aplg_date1').datebox('setValue',now.getFullYear()+'-'+now.getMonth()+'-'+now.getDate());
		$('#aplg_date2').datebox('setValue',now.getFullYear()+'-'+(now.getMonth()+1)+'-'+now.getDate());
		//내 반입(신청)이력 조회
		$("#btn_search_log").on('click',function(){
			$.ajax({
				type: 'POST',
				data: $("#form_search_log").serialize(),
				dataType: 'json',
	 			url: '/goods/preGoodsList.ch4',
				success: function(result){
					//재검색 할 경우 이전 검색기록 제거
					$("#tb_log #tr_log").remove();
					$.each(result,function(index,item){
						var row = "<tr id='tr_log'>"
								+"<td><input id='aplg_no' type='radio' name='aplg_no' value='"+item.APLG_NO+"'></td>"
								+"<td>"+item.APLG_DATE+"</td>"
								+"<td>"+item.APLG_DESTI+"</td>"
								+"<td>"+item.APLG_REASON+"</td>"
								+"<td>"+item.APLG_TRANS_DATE+"</td>"
								+"<td>"+item.GOODS+"</td></tr>";
						$("#tb_log tbody").append(row);
					});
				}
			});
		});
		//선택한 이력 재사용
		$("#btn_reflect").on('click',function(){
			var radio = $("input[name=aplg_no]:checked");
			if(!(radio.val())){
				alert("재사용할 이력을 선택하세요.");
				return;
			}
			//선택된 라디오의 부모의 부모요소 = <tr>
			var tr = radio.parent().parent();
			//선택된 row의 값 가져오기
			var aplg_desti = tr.find("td").eq(2).text();
			var aplg_reason = tr.find("td").eq(3).text();
			//가져온 값 입력폼에 반영하기
			$("#aplg_desti").combobox('select',aplg_desti);
			$("#aplg_reason").textbox('setValue',aplg_reason);
			$("#input_reflect").attr('value',$("input[name=aplg_no]:checked").val());
			$.ajax({
				type: 'POST',
				data: $("#form_reflect").serialize(),
				dataType: 'json',
				url: '/goods/preGoodsListDetail.ch4',
				success: function(result){
					//기존 추가 정보 제거
					$("#tb_goods tbody").empty();
					gIndex=1;
					//정보 걸러내기
					var gmList = result.gmList;
					//받은정보 뿌리기
					for(i=0;i<gmList.length;i++){
						var goodsname = gmList[i].GMNG_NAME;
						var goodsinfo = gmList[i].GMNG_TYPE;
						var EA = gmList[i].GMNG_QUAN;
						var row = "<tr id='gRow"+gIndex+"'><td><input id='chkGoods' type='checkbox' value='"+gIndex+"'></td>"
								+"<td><input id='gmng_name' type='hidden' name='gmng_names' value='"+goodsname+"'>"+goodsname+"</td>"
								+"<td><input id='gmng_type' type='hidden' name='gmng_types' value='"+goodsinfo+"'>"+goodsinfo+"</td>"
								+"<td><input id='gmng_quan' type='hidden' name='gmng_quans' value='"+EA+"'>"+EA+"</td></tr>";
						$("#tb_goods tbody").append(row);
						gIndex++;
					}
					//모달끄기
					$("#md_log").modal('hide');
				}
			});
		});
		///////////////////////물품 추가 이벤트//////////////////////
		////////////물품 추가 modal 띄우기 시작
		$("#btn_addRowGoods").on('click',function(){
			$("#md_goods").modal("show");
		})
		////////////물품 추가 modal 띄우기 끝.
		//입력값 테이블에 row추가하기 
		$("#addGoods").on('click',function(){
			if(!($("#v_goodsname").val())){
				alert("물품명을 입력해 주세요.");
				$("#v_goodsname").textbox('textbox').focus();
				return;
			}
			if(!($("#v_goodsinfo").val())){
				alert("물품종류를 입력해 주세요.");
				$("#v_goodsinfo").textbox('textbox').focus();
				return;
			}
			if(!($("#v_ea").val())){
				alert("물품수량를 입력해 주세요.");
				$("#v_ea").textbox('textbox').focus();
				return;
			}
			var goodsname = $("#v_goodsname").val();
			var EA = $("#v_ea").val();
			var goodsinfo = $("#v_goodsinfo").val();
			var row = "<tr id='gRow"+gIndex+"'><td><input id='chkGoods' type='checkbox' value='"+gIndex+"'></td>"
					+"<td><input id='gmng_name' type='hidden' name='gmng_names' value='"+goodsname+"'>"+goodsname+"</td>"
					+"<td><input id='gmng_type' type='hidden' name='gmng_types' value='"+goodsinfo+"'>"+goodsinfo+"</td>"
					+"<td><input id='gmng_quan' type='hidden' name='gmng_quans' value='"+EA+"'>"+EA+"</td></tr>";
			$("#tb_goods tbody").append(row);
			$("#v_goodsname").textbox('setValue',null);
			$("#v_goodsinfo").textbox('setValue',null);
			$("#v_ea").textbox('setValue',null);
			$("#md_goods").modal("hide");
			gIndex++;
		});
		//입력값 테이블에 row추가하기  끝.
		//전체선택
		$("#chkAllGoods").on('click',function(){
			var chkAll = $(this).is(":checked");
			if(chkAll) {
		    	$("#tb_goods input:checkbox").prop("checked", true);
			}
		    else {
		    	$("#tb_goods input:checkbox").prop("checked", false);
		    }
		});
		//전체선택 끝.
		//선택된 row 제거하기
		$("#btn_delRowGoods").on('click',function(){
			var doRemove = false; //체크박스가 선택이되어 삭제가 된경우만 true
			$("#tb_goods #chkGoods:checked").each(function(){
				$(this).parent().parent().remove();
				doRemove = true;
			});
			//삭제된 건이 있으면...
			if(doRemove){
				//삭제되지 않은 row의 index초기화를 위한 변수
				var reset = 1;
				//row 전체조회
				for(var i=1;i<gIndex;i++){
					var gRow = $("#gRow"+i);
					//해당row가 존재하니?
					//스크립트의 if문에서 undefined는 false로 인식
					//.html()을 본래 해당 태그의 자식노드 전체의 html구문을 반환함
					//만약 자식노드가 없다면 undefined
					//지워진 row는 자식노드가 없으므로 조건에서 제외
					//그런데 해당row가 지워졌다면 값이 null이거나 undefined일텐데 굳이 .html()을 쓴이유는?
					//dom에 해당하는 노드가 없다면 해당 노드를 '생성'해버림 => 즉 선언한 순간 존재하는 노드
					//그렇기 때문에 .html()없이 vRow를 쓰면 정의가 되어있으므로 true로 인식
					if(gRow.html()){
						if(i!=reset){
							$("#gRow"+i+" #chkGoods").attr('value',reset);
							$("#gRow"+i).attr('id',"gRow"+reset);
						}
						reset++;
					}
				}
				gIndex = reset;
				$("#tb_goods input:checkbox").prop("checked", false);
			}
			//없으면 == checked가 없음
			else {
				alert("삭제할 정보를 선택하시기 바랍니다.");
			}
		});
	});
	function apply(){
		//필수 입력사항 체크
		if(!($("#aplg_trans_date").datebox('getValue'))){
			alert("반입일자를 선택해 주세요.");
			$("#aplg_trans_date").datebox('textbox').focus();
			return;
		}
		if(!($("#aplg_desti").combobox('getValue'))){
			alert("목적지를 선택해 주세요.");
			$("#aplg_desti").combobox('textbox').focus();
			return;
		}
		if(!($("#aplg_reason").textbox().val())){
			alert("반입사유를 입력해 주세요.");
			$("#aplg_reason").textbox('textbox').focus();
			return;
		}
		//반입물품 최소 1건 등록
		if(gIndex==1){
			alert("반입물품을 등록하세요.");
			var offset = $("#section2").offset();
	        $('html').animate({scrollTop : offset.top}, 100);
			return;
		}
		//url주소 결정되면 활성화
		alert(
			"신청자 이름: "+$("#aplg_name").val()+"\n"
			+"신청자 연락처: "+$("#aplg_hp").val()+"\n"
			+"반입사유: "+$("#aplg_reason").textbox('getValue')+"\n"
			+"목적지: "+$("#aplg_desti").combobox('getValue')+"\n"
			+"반입날짜: "+$("#aplg_date").val()+"\n"
			+"물품명: "+$("#gmng_name").val()+"\n"
			+"EA: "+$("#gmng_quan").val()+"\n"
			+"물품종류: "+$("#gmng_type").val()+"\n"
		);
		$("#form_apply").submit();
	}
</script>
<div class="container-fluid">
	<div class="row">
	    <div class="col-lg-offset-1 col-lg-1" id="myScrollspy" style="padding-left:50px;text-align:center;">
		    <ul class="nav nav-pills nav-stacked">
		      <li class="active"><a href="#section1">기본 반입정보</a></li>
		      <li><a href="#section2">물품 등록</a></li>
		    </ul>
	    </div>
	    <div class="col-lg-7 col-lg-offset-1">
		    <div class="row">
		    	<div class="col-lg-10">
					<h2 id="apply_title" style="margin-bottom:20px; border-left: 4px solid #17405D; padding-left:8px;"><b>반입 신청</b> (<%=com_name %>)</h2>
		    	</div>
		    	<div class="col-lg-2" style="text-align:right; padding-top:30px;">
					<button id="btn_log" class="btn btn-primary">반입이력</button>
		    	</div>
			</div>
			<!------------------------------------- 신청 폼 시작 -------------------------------------->
	    	<form id="form_apply" action="/goods/add.ch4" method="POST">
		    	<input id="com_no" type="hidden" name="com_no" value="<%=com_no %>">
		    	<input id="com_name" type="hidden" name="com_name" value="<%=com_name %>">
				<!-- 반입정보  -->
				<div id="section1" class="panel panel-info">    
				    <div class="panel-heading">기본 반입정보</div>
				    <div class="panel-body">
				    	<h4 style="margin-bottom:10px; border-left: 3px solid #31708f; padding-left:4px;"><b>신청자 정보</b></h4>
				    	<div class="row table basic">
				    		<table class="table">
				    			<tr>
					    			<th>성명</th>
					    			<td><input type="hidden" name="aplg_name" value="<%=aplg_name %>"><%=aplg_name %></td>
					    			<th>전화번호</th>
					    			<td><input type="hidden" name="aplg_hp" value="<%=aplg_hp %>"><%=aplg_hp %></td>
				    			</tr>
				    		</table>
				    	</div>
				    	<h4 style="margin-bottom:10px; border-left: 3px solid #31708f; padding-left:4px;"><b>반입일자</b></h4>
				    	<h6 style="margin-bottom:10px;">신청일로부터 1년 이내로 가능합니다.</h6>
				    	<div class="row table basic">
				    		<table class="table">
								<tr>
									<th>반입일자</th>
									<td>
										<input id="aplg_trans_date" class="easyui-datebox" name="aplg_trans_date" style="height:100%">
									</td>
								</tr>
				    		</table>
				    	</div>
				    	<h4 style="margin-bottom:10px; border-left: 3px solid #31708f; padding-left:4px;"><b>상세정보</b></h4>
				    	<div class="row table basic">
				    		<table class="table">
				    			<thead>
				    				<tr>
					    				<th>목적지</th>
					    				<th>반입사유</th>
				    				</tr>
				    			</thead>
				    			<tbody>
				    				<tr>
				    					<td>
				    						<select id="aplg_desti" name="aplg_desti" class="easyui-combobox" style="width:80%;">
				    							<option value="">목적지</option>
				    						</select>
				    					</td>
				    					<td><input id="aplg_reason" class="easyui-textbox" name="aplg_reason" data-options="prompt:'예시)물품주문'" style="width:80%;"></td>
				    				</tr>
				    			</tbody>
				    		</table>
				    	</div>	
				    </div>
				</div>
				<!-- 물품 등록 -->
				<div id="section2" class="panel panel-success">    
					<div class="panel-heading">물품 등록</div>
					<div class="panel-body">
						<div class="row">
				    		<div class="col-lg-8">
						    	<h4 style="border-left: 3px solid #3c763d; padding-left:4px;"><b>반입 물품 정보</b></h4>
						    </div>
						    <div class="col-lg-4" style="text-align:right;">
								<button id="btn_addRowGoods" type="button" class="btn btn-default">물품 추가</button>
								<button id="btn_delRowGoods" type="button" class="btn btn-danger">선택삭제</button>
			    			</div>
					    </div>
					    <div class="row table goods">
				    		<table id="tb_goods" class="table">
				    			<thead>
				    				<tr>
				    					<th><input id="chkAllGoods" type="checkbox"></th>
					    				<th style="width:30%;">물품명</th>
					    				<th style="width:40%;">물품 정보</th>
					    				<th style="width:20%;">EA</th>
				    				</tr>
				    			</thead>
				    			<tbody>
				    			</tbody>
				    		</table>
				    	</div>
				   </div>
			    </div><br>
				<div style="text-align:center;"> 
					<button id="btn_apply" class="btn btn-primary" type="button" onclick="javascript:apply()" style="width:150px;margin-right:20px;">신청</button>
					<button id="btn_cancel" class="btn" type="button" onclick="location.href='/service/visitor.ch4'" style="width:150px;">취소</button>
				</div>
			</form>
	    </div>
  	</div>
</div>
<!-- 반입물품 추가 시 입력폼 Modal -->
<div id="md_goods" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header goods">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">물품 정보 입력</h4>
			</div>
			<div class="modal-body" style="text-align:center;">
				<table class="modal-table">
					<tr>
						<th><p>물품명</p></th>
						<td><input id="v_goodsname" class="easyui-textbox"></td>
					</tr>
					<tr>
						<th><p>물품종류</p></th>
						<td><input id="v_goodsinfo" class="easyui-textbox" data-options="prompt:'예시)노트북,의자,도서'"></td>
					</tr>
					<tr>
						<th><p>EA</p></th>
						<td><input id="v_ea" class="easyui-textbox" type="number"></td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
        		<button type="button" class="btn btn-primary" id="addGoods">추가</button>
        		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        	</div>
		</div>
	</div>
</div>
<!-- 반입이력 조회 Modal -->
<div id="md_log" class="modal fade" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header log">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" style="color:white;">반입이력 (<%=com_name %>)</h4>
			</div>
			<div class="modal-body log" >
				<div class="container-fluid">
					<div class="row table basic">
						<table class="table">
				    		<tr>
				    			<th>
				    				<form id="form_search_log" action="" method="POST">
				    					<input type="hidden" name="com_no" value="<%=com_no %>">
				    					<input type="hidden" name="aplg_name" value="<%=aplg_name %>">
				    					<input type="hidden" name="aplg_hp" value="<%=aplg_hp %>">
										<input id="aplg_date1" class="easyui-datebox" name="aplg_date1" label="신청일자" style="width:230px;height:30px">
								    	&emsp;<span>~</span>&emsp;
								    	<input id="aplg_date2" class="easyui-datebox" name="aplg_date2" style="width:150px;height:30px">
								    	&emsp;&emsp;
								    	<button id="btn_search_log" type="button" class="btn btn-primary">조회</button>
							    	</form>
				    			</th>
				    		</tr>
				    	</table>
					</div>
					<h6 style="margin-bottom:10px;">※이전 신청/반입이력을 재사용 신청할 수 있습니다.</h6>
				    <div class="row table basic">
				    	<table id="tb_log" class="table">
				    		<thead>
					    		<tr>
					    			<th style="width:60px;">선택</th>
					    			<th>신청일자</th>
					    			<th>목적지</th>
					    			<th>반입사유</th>
					    			<th>반입일자</th>
					    			<th>반입물품</th>
					    		</tr>
				    		</thead>
				    		<tbody>
				    		</tbody>
				    	</table>
				    </div>
				</div>
			</div>
			<div class="modal-footer">
				<form id="form_reflect" method="POST">
					<input id="input_reflect" type="hidden" name="aplg_no" value="">
				</form>
        		<button id="btn_reflect" type="button" class="btn btn-primary">재사용</button>
        		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        	</div>
		</div>
	</div>
</div>
</body>
</html>