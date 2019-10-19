<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//방문지(회사) 코드
	String com_no = "null";
	//신청번호
	String visit_no = "null";
	//신청일자
	String visit_apply_date = "null";
	//신청자 이름
	String visit_apply_name = "null";
	//신청자 연락처
	String visit_apply_hp = "null";
	//방문유형
	String visit_type = "null";
	//방문주기
	String visit_term = "해당없음";
	//방문요일
	String visit_day = "해당없음";
	//방문날짜
	String visit_date = "null";
	String visit_date1 = "null";
	String visit_date2 = "null";
	//방문지
	String com_name = "null";
	//목적지
	String visit_desti = "null";
	//방문목적
	String visit_purps = "null";
	//반입기기유무
	String visit_tkin_encc = "null";
	//주차유무
	String visit_vhcle_encc = "null";
	
	Map<String,Object> rMap = null;
	if(null!=request.getAttribute("rMap")){
		rMap = (Map<String,Object>)request.getAttribute("rMap");
	}
	//기본정보
	Map<String,Object> infoMap = new HashMap<>();
	if(null!=rMap){
		infoMap = (Map<String,Object>)rMap.get("infoMap");
		com_no = (String)infoMap.get("COM_NO");
		visit_no = (String)infoMap.get("VISIT_NO");
		visit_apply_date = (String)infoMap.get("VISIT_APPLY_DATE");
		visit_apply_name = (String)infoMap.get("VISIT_APPLY_NAME");
		visit_apply_hp = (String)infoMap.get("VISIT_APPLY_HP");
		visit_type = (String)infoMap.get("VISIT_TYPE");
		if("정기방문".equals(visit_type)){
			visit_term = (String)infoMap.get("VISIT_TERM");
			visit_day = (String)infoMap.get("VISIT_DAY");
		}
		visit_date = (String)infoMap.get("VISIT_DATE");
		StringTokenizer st = new StringTokenizer(visit_date,"~");
		visit_date1 = st.nextToken();
		visit_date2 = new String();
		if(st.hasMoreTokens()){
			visit_date2 = st.nextToken();
			
		}
		com_name = (String)infoMap.get("COM_NAME");
		visit_desti = (String)infoMap.get("VISIT_DESTI");
		visit_purps = (String)infoMap.get("VISIT_PURPS");
		visit_tkin_encc = (String)infoMap.get("VISIT_TKIN_ENCC");
		visit_vhcle_encc = (String)infoMap.get("VISIT_VHCLE_ENCC");
	}
	//방문자 리스트
	List<Map<String,Object>> vtList = new ArrayList<>();
	if(null!=rMap){
		vtList = (List<Map<String,Object>>)rMap.get("vtList");
	}
	//반입기기 리스트
	List<Map<String,Object>> tkList = new ArrayList<>();
	if(null!=rMap){
		tkList = (List<Map<String,Object>>)rMap.get("tkList");
	}
	//주차 리스트
	List<Map<String,Object>> pkList = new ArrayList<>();
	if(null!=rMap){
		pkList = (List<Map<String,Object>>)rMap.get("pkList");
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
		padding-bottom:100px;
	}
	ul.nav-pills {
		padding-top: 70px;
		position: fixed;
	}
	#section1 {
		height: 500px;
		margin-bottom: 10px;
		font-size: 28px;
	}
	#section2,#section3,#section4 {
		height: 300px;
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
	.row.table.visitor {
		border-top: 2px solid #3c763d;
		margin-bottom:50px;
	}
	.row.table.device {
		border-top: 2px solid #8a6d3b;
		margin-bottom:50px;
	}
	.row.table.parking {
		border-top: 2px solid #333333;
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
	.modal-header.visitor {
		border-top-left-radius: 6px;
		border-top-right-radius: 6px;
		background-color: #dff0d8;
	}
	.modal-header.device {
		border-top-left-radius: 6px;
		border-top-right-radius: 6px;
		background-color: #fcf8e3;
	}
	.modal-header.parking {
		border-top-left-radius: 6px;
		border-top-right-radius: 6px;
		background-color: #f5f5f5;
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
<title>신청변경 - CH4 방문자 관리 시스템</title>
<script type="text/javascript">
	//등록한 방문자 수,반입기기 수,차량 수
	var vIndex = 1;
	var dIndex = 1;
	var pIndex = 1;
	//오늘날짜 변수
	var now = new Date();
</script>
</head>
<body data-spy="scroll" data-target="#myScrollspy" data-offset="300">
<%@ include file="../CommonForm/Top.jsp"%>
<script type="text/javascript">
	<% if(rMap==null){ %>
		alert("잘못된 페이지 요청입니다. 이전 페이지로 돌아갑니다.");
		history.back();
	<% } %>
	$(document).ready(function(){
		//////////////////////////////  방문자 정보 세팅  //////////////////////////////
		//실제로 쓸 for문
		<% for(int i=0;i<vtList.size();i++){ %>
		var vRow = "<tr id='vRow"+vIndex+"'><td><input id='chkVisitor' type='checkbox'></td>"
					+"<td><input id='visitor_name' type='hidden' name='visitor_names' value='"
					+"<%=vtList.get(i).get("VISITOR_NAME") %>"+"'>"+"<%=vtList.get(i).get("VISITOR_NAME") %>"+"</td>"
					+"<td><input id='visitor_hp' type='hidden' name='visitor_hps' value='"
					+"<%=vtList.get(i).get("VISITOR_HP") %>"+"'>"+"<%=vtList.get(i).get("VISITOR_HP") %>"+"</td></tr>";
		$("#tb_visitor tbody").append(vRow);
		vIndex++;
		<% } %>
		//////////////////////////////  방문자 정보 세팅  끝 //////////////////////////////
		//////////////////////////////  반입기기정보 세팅  //////////////////////////////
		//실제로 쓸 for문
		<% for(int i=0;i<tkList.size();i++){ %>
		var dRow = "<tr id='dRow'><td><input id='chkDevice' type='checkbox'></td>"
					+"<td><input id='tkin_kind' type='hidden' name='tkin_kinds' value='"
					+"<%=tkList.get(i).get("TKIN_KIND") %>"+"'>"+"<%=tkList.get(i).get("TKIN_KIND") %>"+"</td>"
					+"<td><input id='tkin_brand' type='hidden' name='tkin_brands' value='"
					+"<%=tkList.get(i).get("TKIN_BRAND") %>"+"'>"+"<%=tkList.get(i).get("TKIN_BRAND") %>"+"</td>"
					+"<td><input id='tkin_model' type='hidden' name='tkin_models' value='"
					+"<%=tkList.get(i).get("TKIN_MODEL") %>"+"'>"+"<%=tkList.get(i).get("TKIN_MODEL") %>"+"</td></tr>";
		$("#tb_device tbody").append(dRow);
		dIndex++;
		<% } %>
		//////////////////////////////  반입기기정보 세팅 끝 //////////////////////////////
		//////////////////////////////  주차정보 세팅  //////////////////////////////
		//실제로 쓸 for문
		<% for(int i=0;i<pkList.size();i++){ %>
		var pRow = "<tr id='pRow'><td><input id='chkParking' type='checkbox'></td>"
					+"<td><input id='parking_num' type='hidden' name='parking_nums' value='"
					+"<%=pkList.get(i).get("PARKING_NUM") %>"+"'>"+"<%=pkList.get(i).get("PARKING_NUM") %>"+"</td>"
					+"<td><input id='parking_kind' type='hidden' name='parking_kinds' value='"
					+"<%=pkList.get(i).get("PARKING_KIND") %>"+"'>"+"<%=pkList.get(i).get("PARKING_KIND") %>"+"</td>"
					+"<td><input id='parking_model' type='hidden' name='parking_models' value='"
					+"<%=pkList.get(i).get("PARKING_MODEL") %>"+"'>"+"<%=pkList.get(i).get("PARKING_MODEL") %>"+"</td>"+"</tr>";
		$("#tb_parking tbody").append(pRow);
		pIndex++;
		<% } %>
		//////////////////////////////  주차정보 세팅  끝 //////////////////////////////
		
		//목적지 combobox 초기화 + 이전페이지 정보 반영
		$("#visit_desti").combobox({
			valueField: 'DEPT_NAME',
			textField: 'DEPT_NAME',
			url: "/visitor/deptList.ch4?com_no="+"<%=com_no %>"
		});
		$("#visit_desti").combobox('select','<%=visit_desti%>');
		///////////////////////// 방문날짜 이벤트  //////////////////////////
		//방문시작일 선택시 마지막일 선택범위 (시작일+1~내년 당일) 제한
		$('#visit_date1').datebox({
			onSelect: function(date){
				var firstDate = date;
				$('#visit_date2').datebox().datebox('calendar').calendar({
		            validator: function(date){
		                var d1 = new Date(firstDate.getFullYear(), firstDate.getMonth(), firstDate.getDate()+1);
		                var d2 = new Date(now.getFullYear()+1, now.getMonth(), now.getDate());
		                return d1<=date && date<=d2;
		            }
		        });
				//최소기간을 정해버리면 disable이 풀림.....
				//그래서 '일일방문'에선 다시 사용못하게 막아야함
				if("일일방문"==$("#visit_type").val()){
					$("#visit_date2").datebox("disable");
				}
			}
		});
		//방문일자 선택범위 (당일~내년 당일) 제한
		$('#visit_date1').datebox().datebox('calendar').calendar({
            validator: function(date){
                var d1 = new Date(now.getFullYear(), now.getMonth(), now.getDate());
                var d2 = new Date(now.getFullYear()+1, now.getMonth(), now.getDate());
                return d1<=date && date<=d2;
            }
        });
		//방문일자 마지막일 범위 초기세팅
		$('#visit_date2').datebox().datebox('calendar').calendar({
            validator: function(date){
            	var visit_date1 = '<%=visit_date1 %>'; 
            	var date_array = visit_date1.split("-");
            	var year = parseInt(date_array[0]);
            	var month = parseInt(date_array[1]);
            	var day = parseInt(date_array[2]);
                var d1 = new Date(year,month-1,day+1);
                var d2 = new Date(now.getFullYear()+1, now.getMonth(), now.getDate());
                return d1<=date && date<=d2;
            }
        });
		$("#visit_date2").datebox("disable");
		//방문일자  초기세팅 신청한 방문날짜로
		$('#visit_date1').datebox('setValue','<%=visit_date1 %>');
		<%if(visit_date2.length()>0){%>$('#visit_date2').datebox('setValue','<%=visit_date2 %>');<%}%>
		$("#visit_term").combobox("disable");
		$("#visit_day").combobox("disable");
		//방문유형 선택시 입력폼 Enable,Disable
		$("#visit_type").combobox({
			onChange: function(newValue){
				if("일일방문"==newValue){	//datebox 1개만 Enable
					$("#visit_term").combobox("clear");
					$("#visit_day").combobox("clear");
					$("#visit_date2").datebox("setValue",null);
					$("#visit_term").combobox("disable");
					$("#visit_day").combobox("disable");
					$("#visit_date2").datebox("disable");
				}
				else if("기간방문"==newValue){	//datebox 2개만 Enable
					$("#visit_term").combobox("clear");
					$("#visit_day").combobox("clear");
					$("#visit_term").combobox("disable");
					$("#visit_day").combobox("disable");
					$("#visit_date2").datebox("enable");
				}
				else {	//정기방문 : 전부 Enable
					$("#visit_term").combobox("enable");
					$("#visit_day").combobox("enable");
					$("#visit_date2").datebox("enable");
				}
			}
		});
		$("#visit_type").combobox('select','<%=visit_type %>');
		<%if(visit_term.length()>0){%>$("#visit_term").combobox('select','<%=visit_term %>');<%}%>
		<%if(visit_day.length()>0){%>$("#visit_day").combobox('select','<%=visit_day %>');<%}%>
		///////////////////////// 방문자 추가 이벤트 /////////////////////////
		//방문자 추가 modal 띄우기
		$("#btn_addRowVisitor").on('click',function(){
			if(vIndex>10){
				alert("방문인원은 최대 10명입니다.");
				return;
			}
			$("#md_visitor").modal("show");
		});
		//입력값 테이블에 row 추가하기
		$("#addVisitor").on('click',function(){
			if(!($("#v_name").val())){
				alert("방문자 성명을 입력해 주세요.");
				$("#v_name").textbox('textbox').focus();
				return;
			}
			if(!($("#v_hp1").val())){
				alert("연락처를 입력해 주세요.");
				$("#v_hp1").textbox('textbox').focus();
				return;
			}
			if(!($("#v_hp2").val())){
				alert("연락처를 입력해 주세요.");
				$("#v_hp2").textbox('textbox').focus();
				return;
			}
			if(!($("#v_hp3").val())){
				alert("연락처를 입력해 주세요.");
				$("#v_hp3").textbox('textbox').focus();
				return;
			}
			var name = $("#v_name").val();
			var hp = $("#v_hp1").val()+'-'+$("#v_hp2").val()+'-'+$("#v_hp3").val();
			var row = "<tr id='vRow"+vIndex+"'><td><input id='chkVisitor' type='checkbox'></td>"
					+"<td><input id='visitor_name' type='hidden' name='visitor_names' value='"+name+"'>"+name+"</td>"
					+"<td><input id='visitor_hp' type='hidden' name='visitor_hps' value='"+hp+"'>"+hp+"</td></tr>";
			$("#tb_visitor tbody").append(row);
			$("#v_name").textbox('setValue',null);
			$("#v_hp1").textbox('setValue',null);
			$("#v_hp2").textbox('setValue',null);
			$("#v_hp3").textbox('setValue',null);
			$("#md_visitor").modal("hide");
			vIndex++;
		});
		//전체선택
		$("#chkAllVisitor").on('click',function(){
			var chkAll = $(this).is(":checked");
			if(chkAll) {
		    	$("#tb_visitor input:checkbox").prop("checked", true);
			}
		    else {
		    	$("#tb_visitor input:checkbox").prop("checked", false);
		    }
		});
		//선택된 row 제거하기
		$("#btn_delRowVisitor").on('click',function(){
			var doRemove = false; //체크박스가 선택이되어 삭제가 된경우만 true
			$("#tb_visitor #chkVisitor:checked").each(function(){
				$(this).parent().parent().remove();
				doRemove = true;
			});
			//삭제된 건이 있으면...
			if(doRemove){
				//삭제되지 않은 row의 index초기화를 위한 변수
				var reset = 1;
				//row 전체조회
				for(var i=1;i<vIndex;i++){
					var vRow = $("#vRow"+i);
					//해당row가 존재하니?
					//스크립트의 if문에서 undefined는 false로 인식
					//.html()을 본래 해당 태그의 자식노드 전체의 html구문을 반환함
					//만약 자식노드가 없다면 undefined
					//지워진 row는 자식노드가 없으므로 조건에서 제외
					//그런데 해당row가 지워졌다면 값이 null이거나 undefined일텐데 굳이 .html()을 쓴이유는?
					//dom에 해당하는 노드가 없다면 해당 노드를 '생성'해버림 => 즉 선언한 순간 존재하는 노드
					//그렇기 때문에 .html()없이 vRow를 쓰면 정의가 되어있으므로 true로 인식
					if(vRow.html()){
						if(i!=reset){
							$("#vRow"+i+" #chkVisitor").attr('value',reset);
							$("#vRow"+i).attr('id',"vRow"+reset);
						}
						reset++;
					}
				}
				vIndex = reset;
				$("#tb_visitor input:checkbox").prop("checked", false);
			}
			//없으면 == checked가 없음
			else {
				alert("삭제할 정보를 선택하시기 바랍니다.");
			}
		});
		////////////////////////////////////////////////////////////////
		///////////////////////// 반입기기 추가 이벤트 /////////////////////////
		$("#btn_addRowDevice").on('click',function(){
			$("#d_kind").combobox('clear');
			$("#d_brand").combobox('clear');
			$("#d_brand").combobox({
				editable: false
			});
			$("#md_device").modal("show");
		});
		$("#d_kind").combobox({
			onChange:function(newValue){
				$("#d_brand").combobox({
					valueField: 'value',
					textField: 'brand',
					url: "../../json/"+newValue+".json"
				});
				if("etc"==newValue){
					$("#d_brand").combobox({
						editable: true
					});
				}
			}
		});
		$("#addDevice").on('click',function(){
			if(!($("#d_kind").combobox('getValue'))){
				alert("기종을 선택해 주세요.");
				$("#d_kind").combobox('textbox').focus();
				return;
			}
			if(!($("#d_brand").combobox('getValue'))){
				alert("제조사를 선택해 주세요.");
				$("#d_brand").combobox('textbox').focus();
				return;
			}
			if(!($("#d_model").val())){
				alert("모델명을 입력해 주세요.");
				$("#d_model").textbox('textbox').focus();
				return;
			}
			var kind = $("#d_kind").combobox('getText');
			var brand = $("#d_brand").combobox('getText');
			var model = $("#d_model").val();
			var row = "<tr id='dRow"+dIndex+"'><td><input id='chkDevice' type='checkbox'></td>"
					+"<td><input id='tkin_kind' type='hidden' name='tkin_kinds' value='"+kind+"'>"+kind+"</td>"
					+"<td><input id='tkin_brand' type='hidden' name='tkin_brands' value='"+brand+"'>"+brand+"</td>"
					+"<td><input id='tkin_model' type='hidden' name='tkin_models' value='"+model+"'>"+model+"</td></tr>";
			$("#tb_device tbody").append(row);
			$("#d_name").textbox('setValue',null);
			$("#d_model").textbox('setValue',null);
			$("#md_device").modal("hide");
			dIndex++;
		});
		$("#chkAllDevice").on('click',function(){
			var chkAll = $(this).is(":checked");
			if(chkAll) {
		    	$("#tb_device input:checkbox").prop("checked", true);
			}
		    else {
		    	$("#tb_device input:checkbox").prop("checked", false);
		    }
		});
		$("#btn_delRowDevice").on('click',function(){
			var doRemove = false;
			$("#tb_device #chkDevice:checked").each(function(){
				$(this).parent().parent().remove();
				doRemove = true;
			});
			if(doRemove){
				var reset = 1;
				for(var i=1;i<dIndex;i++){
					var dRow = $("#dRow"+i);
					if(dRow.html()){
						if(i!=reset){
							$("#dRow"+i+" #chkDevice").attr('value',reset);
							$("#dRow"+i).attr('id',"dRow"+reset);
						}
						reset++;
					}
				}
				dIndex = reset;
				$("#tb_device input:checkbox").prop("checked", false);
			}
			else {
				alert("삭제할 정보를 선택하시기 바랍니다.");
			}
		});
		////////////////////////////////////////////////////////////////
		///////////////////////// 차량 추가 이벤트 ///////////////////////////
		$("#p_num").textbox('textbox').attr('maxlength', '8');
		$("#btn_addRowParking").on('click',function(){
			$("#p_kind").combobox('clear');
			$("#p_model").combobox('clear');
			$("#md_parking").modal("show");
		});
		$("#p_kind").combobox({
			onChange:function(newValue){
				$("#p_model").combobox({
					valueField: 'value',
					textField: 'model',
					url: "../../json/"+newValue+".json"
				});
			}
		});
		$("#addParking").on('click',function(){
			if(!($("#p_num").val())){
				alert("차량번호를 입력해 주세요.");
				$("#p_num").textbox('textbox').focus();
				return;
			}
			if(!($("#p_kind").combobox('getValue'))){
				alert("차종을 선택해 주세요.");
				$("#p_kind").combobox('textbox').focus();
				return;
			}
			if(!($("#p_model").combobox('getValue'))){
				alert("차량 모델을 선택해 주세요.");
				$("#p_model").combobox('textbox').focus();
				return;
			}
			var num = $("#p_num").val();
			var kind = $("#p_kind").combobox('getText');
			var model = $("#p_model").combobox('getText');
			var row = "<tr id='pRow"+pIndex+"'><td><input id='chkParking' type='checkbox'></td>"
					+"<td><input id='parking_num' type='hidden' name='parking_nums' value='"+num+"'>"+num+"</td>"
					+"<td><input id='parking_kind' type='hidden' name='parking_kinds' value='"+kind+"'>"+kind+"</td>"
					+"<td><input id='parking_model' type='hidden' name='parking_models' value='"+model+"'>"+model+"</td></tr>";
			$("#tb_parking tbody").append(row);
			$("#p_num").textbox('setValue',null);
			$("#p_kind").combobox('select','차종');
			$("#p_model").combobox('select','차량모델명');
			$("#md_parking").modal("hide");
			pIndex++;
		});
		$("#chkAllParking").on('click',function(){
			var chkAll = $(this).is(":checked");
			if(chkAll) {
		    	$("#tb_parking input:checkbox").prop("checked", true);
			}
		    else {
		    	$("#tb_parking input:checkbox").prop("checked", false);
		    }
		});
		$("#btn_delRowParking").on('click',function(){
			var doRemove = false;
			$("#tb_parking #chkParking:checked").each(function(){
				$(this).parent().parent().remove();
				doRemove = true;
			});
			if(doRemove){
				var reset = 1;
				for(var i=1;i<pIndex;i++){
					var pRow = $("#pRow"+i);
					if(pRow.html()){
						if(i!=reset){
							$("#pRow"+i+" #chkParking").attr('value',reset);
							$("#pRow"+i).attr('id',"pRow"+reset);
						}
						reset++;
					}
				}
				pIndex = reset;
				$("#tb_parking input:checkbox").prop("checked", false);
			}
			else {
				alert("삭제할 정보를 선택하시기 바랍니다.");
			}
		});
		////////////////////////////////////////////////////////////////
	});
	function update(){
		//필수 입력사항 체크
		if(!($("#visit_date1").datebox('getValue'))){
			alert("방문 시작일를 선택해 주세요.");
			$("#visit_date1").datebox('textbox').focus();
			return;
		}
		//input에 넣을 value '시작일'
		var visit_date = $("#visit_date1").datebox('getValue');
		//기간,정기방문은 마지막일 필수
		if("일일방문"!=$("#visit_type").combobox('getValue')){
			if(!($("#visit_date2").datebox('getValue'))){
				alert("방문 마지막일를 선택해 주세요.");
				$("#visit_date2").datebox('textbox').focus();
				return;
			}
			//input에 넣을 value '시작일~마지막일'
			visit_date += "~" + $("#visit_date2").datebox('getValue');
			if("정기방문"==$("#visit_type").combobox('getValue')){
				if(!($("#visit_term").combobox('getValue'))){
					alert("방문주기를 선택해 주세요.");
					$("#visit_term").combobox('textbox').focus();
					return;
				}
				if(!($("#visit_day").combobox('getValue'))){
					alert("방문요일를 선택해 주세요.");
					$("#visit_day").combobox('textbox').focus();
					return;
				}
			}
		}
		//날짜 input에 value 넣기
		$("#visit_date").val(visit_date);
		if(!($("#visit_desti").combobox('getValue'))){
			alert("목적지를 선택해 주세요.");
			$("#visit_desti").combobox('textbox').focus();
			return;
		}
		if(!($("#visit_purps").textbox().val())){
			alert("방문목적을 입력해 주세요.");
			$("#visit_purps").textbox('textbox').focus();
			return;
		}
		//방문자 최소 1명 등록
		if(vIndex==1){
			alert("방문자를 등록하세요.");
			var offset = $("#section2").offset();
	        $('html').animate({scrollTop : offset.top}, 100);
			return;
		}
		//반입기기,주차등록 유무 체크(form전송으로 넘길값 지정)
		if(dIndex==1){
			$("#visit_tkin_encc").val('X');
		}
		else{
			$("#visit_tkin_encc").val('O');
		}
		if(pIndex==1){
			$("#visit_vhcle_encc").val('X');
		}
		else{
			$("#visit_vhcle_encc").val('O');
		}
		//url주소 결정되면 활성화
		alert(
			"신청자 이름: "+$("#visit_apply_name").val()+"\n"
			+"신청자 연락처: "+$("#visit_apply_hp").val()+"\n"
			+"방문목적: "+$("#visit_purps").textbox('getValue')+"\n"
			+"목적지: "+$("#visit_desti").combobox('getValue')+"\n"
			+"방문유형: "+$("#visit_type").combobox('getValue')+"\n"
			+"방문주기: "+$("#visit_term").combobox('getValue')+"\n"
			+"방문요일: "+$("#visit_day").combobox('getValue')+"\n"
			+"방문날짜: "+$("#visit_date").val()+"\n"
			+"반입기기유무: "+$("#visit_tkin_encc").val()+"\n"
			+"차량유무: "+$("#visit_vhcle_encc").val()+"\n"
			+"방문자이름: "+$("#visitor_name").val()+"\n"
			+"기종: "+$("#tkin_kind").val()+"\n"
			+"기기제조사: "+$("#tkin_brand").val()+"\n"
			+"모델명: "+$("#tkin_model").val()+"\n"
			+"차종: "+$("#parking_kind").val()+"\n"
			+"모델명: "+$("#parking_model").val()+"\n"
			+"차량번호: "+$("#parking_num").val()+"\n"
		);
		$("#form_update").submit();
	}
</script>
<div class="container-fluid">
	<div class="row">
	    <div class="col-lg-offset-1 col-lg-1" id="myScrollspy" style="padding-left:50px;text-align:center;">
		    <ul class="nav nav-pills nav-stacked">
		      <li class="active"><a href="#section1">기본 방문정보</a></li>
		      <li><a href="#section2">방문자 등록</a></li>
		      <li><a href="#section3">반입기기</a></li>
		      <li><a href="#section4">주차등록</a></li>
		    </ul>
	    </div>
	    <div class="col-lg-7 col-lg-offset-1"> 
			<div class="row">
		    	<div class="col-lg-10">
					<h2 style="margin-bottom:20px; border-left: 4px solid #17405D; padding-left:8px;"><b>신청 변경</b> (<%=com_name %>)</h2>
		    	</div>
			</div>
	    <!------------------------------------- 신청 폼 시작 -------------------------------------->
	    <form id="form_update" action="/visitor/update.ch4" method="POST">
	    	<input id="com_no" type="hidden" name="com_no" value="<%=com_no %>">
	    	<input id="visit_no" type="hidden" name="visit_no" value="<%=visit_no %>">
	    	<input id="visit_tkin_encc" type="hidden" name="visit_tkin_encc" value="<%=visit_tkin_encc %>">
	    	<input id="visit_vhcle_encc" type="hidden" name="visit_vhcle_encc" value="<%=visit_vhcle_encc %>">
		    <div id="section1" class="panel panel-info">    
			    <div class="panel-heading">기본 방문정보</div>
			    <div class="panel-body">
			    	<h4 style="margin-bottom:10px; border-left: 3px solid #31708f; padding-left:4px;"><b>신청자 정보</b></h4>
			    	<div class="row table basic">
			    		<table class="table">
			    			<tr>
			    				<th>성명</th>
			    				<td><input id="visit_apply_name" type="hidden" name="visit_apply_name" value="<%=visit_apply_name %>"><%=visit_apply_name %></td>
			    				<th>연락처</th>
			    				<td><input id="visit_apply_hp" type="hidden" name="visit_apply_hp" value="<%=visit_apply_hp %>"><%=visit_apply_hp %></td>
			    			</tr>
			    		</table>
			    	</div>
			    	<h4 style="margin-bottom:10px; border-left: 3px solid #31708f; padding-left:4px;"><b>방문기간</b></h4>
			    	<h6 style="margin-bottom:10px;">신청일로부터 1년 이내로 가능합니다.</h6>
			    	<div class="row table basic">
			    		<table class="table">
			    			<thead>
			    				<tr>
				    				<th>방문유형</th>
				    				<th>방문주기</th>
				    				<th>방문요일</th>
			    				</tr>
			    			</thead>
			    			<tbody>
			    				<tr>
			    					<td>
			    						<select id="visit_type" class="easyui-combobox" name="visit_type" style="width:80%;" data-options="panelHeight:'auto'">
			    							<option value="일일방문">일일방문</option>
			    							<option value="기간방문">기간방문</option>
			    							<option value="정기방문">정기방문</option>
			    						</select>
			    					</td>
			    					<td>
			    						<select id="visit_term" class="easyui-combobox" name="visit_term" style="width:80%;" data-options="panelHeight:'auto'">
			    							<option value="">방문주기</option>
			    							<option value="매주">매주</option>
			    							<option value="격주">격주</option>
			    							<option value="첫째주">첫째주</option>
			    							<option value="둘째주">둘째주</option>
			    							<option value="셋째주">셋째주</option>
			    							<option value="넷째주">넷째주</option>
			    							<option value="마지막주">마지막주(넷째주포함)</option>
			    						</select>
			    					</td>
			    					<td>
			    						<select id="visit_day" class="easyui-combobox" name="visit_day" style="width:80%;" data-options="panelHeight:'auto'">
			    							<option value="">방문요일</option>
			    							<option value="월요일">월요일</option>
			    							<option value="화요일">화요일</option>
			    							<option value="수요일">수요일</option>
			    							<option value="목요일">목요일</option>
			    							<option value="금요일">금요일</option>
			    							<option value="토요일">토요일</option>
			    							<option value="일요일">일요일</option>
			    						</select>
			    					</td>
			    				</tr>
			    			</tbody>
			    		</table>
			    		<table class="table">
			    			<tr>
			    				<th>방문날짜</th>
			    				<td>
			    					<input id="visit_date" type="hidden" name="visit_date" value="">
			    					<input id="visit_date1" class="easyui-datebox" style="width:30%;height:100%">
			    					&emsp;&emsp;<span>~</span>&emsp;&emsp;
			    					<input id="visit_date2" class="easyui-datebox" style="width:30%;height:100%">
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
				    				<th>방문목적</th>
			    				</tr>
			    			</thead>
			    			<tbody>
			    				<tr>
			    					<td>
			    						<select id="visit_desti" class="easyui-combobox" name="visit_desti" style="width:80%;" data-options="panelHeight:'300px'">
			    							<option value="">목적지</option>
			    							<option value="test">테스트</option>
			    						</select>
			    					</td>
			    					<td><input id="visit_purps" class="easyui-textbox" name="visit_purps" value="<%=visit_purps %>" data-options="prompt:'예시)업무협의'" style="width:80%;"></td>
			    				</tr>
			    			</tbody>
			    		</table>
			    	</div>
			    </div>
		    </div>
		    <div id="section2" class="panel panel-success">    
			    <div class="panel-heading">방문자 등록</div>
			    <div class="panel-body">
			    	<div class="row">
			    		<div class="col-lg-8">
					    	<h4 style="border-left: 3px solid #3c763d; padding-left:4px;"><b>방문자 정보</b></h4>
					    	<h6 style="margin-bottom:10px;">방문자는 최대 10명으로 제한합니다.</h6>
					    </div>
					    <div class="col-lg-4" style="text-align:right;padding-top:20px;">
							<button id="btn_addRowVisitor" class="btn btn-default" type="button">방문자 추가</button>
							<button id="btn_delRowVisitor" class="btn btn-danger" type="button">선택삭제</button>
		    			</div>
				    </div>
			    	<div class="row table visitor">
			    		<table id="tb_visitor" class="table">
			    			<thead>
			    				<tr>
			    					<th><input id="chkAllVisitor" type="checkbox"></th>
				    				<th style="width:40%;">성명</th>
				    				<th style="width:50%;">연락처</th>
			    				</tr>
			    			</thead>
			    			<tbody>
			    			</tbody>
			    		</table>
			    	</div>
			    </div>
		    </div>
		    <div id="section3" class="panel panel-warning">    
			    <div class="panel-heading">반입기기</div>
			    <div class="panel-body">
			    	<div class="row">
			    		<div class="col-lg-8">
					    	<h4 style="border-left: 3px solid #8a6d3b; padding-left:4px;"><b>반입기기 정보</b></h4>
					    	<h6 style="margin-bottom:10px;">소지하실 상용정보 통신기기를 모두 등록 해주시기 바랍니다.</h6>
				    	</div>
				    	<div class="col-lg-4" style="text-align:right;padding-top:20px;">
							<button id="btn_addRowDevice" class="btn btn-default" type="button">기기 추가</button>
							<button id="btn_delRowDevice" class="btn btn-danger" type="button">선택삭제</button>
		    			</div>
				    </div>
				    <div class="row table device">
			    		<table id="tb_device" class="table">
			    			<thead>
			    				<tr>
			    					<th><input id="chkAllDevice" type="checkbox"></th>
				    				<th style="width:30%;">기종</th>
				    				<th style="width:30%;">제조사</th>
				    				<th style="width:30%;">모델명</th>
			    				</tr>
			    			</thead>
			    			<tbody>
			    			</tbody>
			    		</table>
			    	</div>
			    </div>
		    </div>
		    <div id="section4" class="panel panel-default">    
			    <div class="panel-heading">주차등록</div>
			    <div class="panel-body">
			    	<div class="row">
			    		<div class="col-lg-8">
			    			<h4 style="border-left: 3px solid #333333; padding-left:4px;"><b>차량 정보</b></h4>
				    	</div>
				    	<div class="col-lg-4" style="text-align:right;padding-top:5px;">
							<button id="btn_addRowParking" class="btn btn-default" type="button">차량 추가</button>
							<button id="btn_delRowParking" class="btn btn-danger" type="button">선택삭제</button>
		    			</div>
				    </div>
			    	<div class="row table parking">
				    	<table id="tb_parking" class="table">
				    		<thead>
				    			<tr>
				    				<th><input id="chkAllParking" type="checkbox"></th>
									<th style="width:40%;">차량번호</th>
									<th style="width:20%;">차종</th>
									<th style="width:30%;">차량모델명</th>
				    			</tr>
				    		</thead>
				    		<tbody>
				    		</tbody>
				    	</table>
				    </div>
			    </div>
		    </div><br>
			<div style="text-align:center;"> 
				<button id="btn_update" class="btn btn-primary" type="button" onclick="javascript:update()" style="width:150px;margin-right:20px;">수정</button>
				<button id="btn_cancel" class="btn" type="button" onclick="location.href='/service/visitor.ch4'" style="width:150px;">취소</button>
			</div>
	    </form>
	    <!------------------------------------- 신청 폼 끝 -------------------------------------->
	    </div>
  	</div>
</div>
<!-- 방문자 추가 시 입력폼 Modal -->
<div id="md_visitor" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header visitor">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">방문자 정보 입력</h4>
			</div>
			<div class="modal-body" style="text-align:center;">
				<table class="modal-table">
					<tr>
						<th><p>성명</p></th>
						<td><input id="v_name" class="easyui-textbox"></td>
					</tr>
					<tr>
						<th><p>전화번호</p></th>
						<td>
							<input id="v_hp1" class="easyui-textbox" type='number' style="width:60px;"> -
							<input id="v_hp2" class="easyui-textbox" type='number' style="width:60px;"> -
							<input id="v_hp3" class="easyui-textbox" type='number' style="width:60px;">
						</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
        		<button type="button" class="btn btn-primary" id="addVisitor">추가</button>
        		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        	</div>
		</div>
	</div>
</div>
<!-- 반입기기 추가 시 입력폼 Modal -->
<div id="md_device" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header device">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">반입기기 정보 입력</h4>
			</div>
			<div class="modal-body" style="text-align:center;">
				<table class="modal-table">
					<tr>
						<th><p>기종</p></th>
						<td>
							<select id="d_kind" class="easyui-combobox" data-options="panelHeight:'auto'">
								<option value="">기종</option>
								<option value="laptop">노트북</option>
								<option value="phone">휴대전화</option>
								<option value="tablet">태블릿</option>
								<option value="mp3">MP3</option>
								<option value="device_etc">기타(PMP,디지털카메라)</option>
							</select>
						</td>
					</tr>
					<tr>
						<th><p>제조사</p></th>
						<td>
							<select id="d_brand" class="easyui-combobox" data-options="panelHeight:'auto'">
								<option value="">제조사</option>
							</select>
							
						</td>
					</tr>
					<tr>
						<th><p>모델명</p></th>
						<td>
							<input id="d_model" class="easyui-textbox">
						</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
        		<button type="button" class="btn btn-primary" id="addDevice">추가</button>
        		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        	</div>
		</div>
	</div>
</div>
<!-- 차량 추가 시 입력폼 Modal -->
<div id="md_parking" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header parking">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">차량 정보 입력</h4>
			</div>
			<div class="modal-body" style="text-align:center;">
				<table class="modal-table">
					<tr>
						<th><p>차량번호</p></th>
						<td>
							<input id="p_num" class="easyui-textbox" style="width:250px;" data-options="prompt:'예시)OOO가1234'">
						</td>
					</tr>
					<tr>
						<th><p>차종</p></th>
						<td>
							<select id="p_kind" class="easyui-combobox" data-options="panelHeight:'auto'">
								<option value=''>차종</option> 
								<option value='car'>승용차</option> 
								<option value='van'>승합차</option> 
								<option value='working_vehicle'>작업차</option> 
								<option value='specialty_vehicle'>특수차</option> 
								<option value='motorcycle'>오토바이</option> 
							</select>
						</td>
					</tr>
					<tr>
						<th><p>모델명</p></th>
						<td>
							<select id="p_model" class="easyui-combobox" data-options="panelHeight:'200px'">
								<option value="">차량모델명</option>
							</select>
						</td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
        		<button type="button" class="btn btn-primary" id="addParking">추가</button>
        		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        	</div>
		</div>
	</div>
</div>
</body>
</html>