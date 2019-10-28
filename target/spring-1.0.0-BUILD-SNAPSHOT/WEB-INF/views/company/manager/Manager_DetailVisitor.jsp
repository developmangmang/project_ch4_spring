<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
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
	String visit_term = "헤딩없음";
	//방문요일
	String visit_day = "해당없음";
	//방문날짜
	String visit_date = "null";
	//목적지
	String visit_desti = "null";
	//방문목적
	String visit_purps = "null";
	
	Map<String,Object> rMap = new HashMap<>();
	if(null!=request.getAttribute("rMap")){
		rMap = (Map<String,Object>)request.getAttribute("rMap");
	}
	//기본정보
	Map<String,Object> infoMap = new HashMap<>();
	if(null!=rMap.get("infoMap")){
		infoMap = (Map<String,Object>)rMap.get("infoMap");
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
		visit_desti = (String)infoMap.get("VISIT_DESTI");
		visit_purps = (String)infoMap.get("VISIT_PURPS");
	}
	//방문자 이름 & 연락처
	List<Map<String,Object>> vtList = new ArrayList<>();
	if(null!=rMap.get("vtList")){
		vtList = (List<Map<String,Object>>)rMap.get("vtList");
	}
	
	//반입기기
	List<Map<String,Object>> tkList = new ArrayList<>();
	if(null!=rMap.get("tkList")){
		tkList = (List<Map<String,Object>>)rMap.get("tkList");
	}
	
	//주차	
	List<Map<String,Object>> pkList = new ArrayList<>();
	if(null!=rMap.get("pkList")){
		pkList = (List<Map<String,Object>>)rMap.get("pkList");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 -->
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>방문 신청 디테일</title>
<!-- 공통코드 -->
<%@ include file="../../../Style/common/HeadUI.jsp"%>
<!-- CSS Style Import -->
<style type="text/css">
/* 스크롤 메뉴 */
ul.nav-pills {
	position: fixed;
}

/* class 스타일 */
div.col-lg-7 #section1 {
	height: 500px;
	margin-bottom: 10px;
	font-size: 28px;
}

div.col-lg-7 #section2, #section3, #section4 {
	height: 300px;
	margin-bottom: 10px;
	font-size: 28px;
}

div.panel-heading {
	font-size: 20px;
	font-weight: bold;
}

div.panel-body {
	height: 100%;
	border: 0px;
}

table.table {
	margin-bottom: 0px;
}

.row.table {
	margin-left: 0px;
	margin-right: 0px;
	text-align: center;
	font-size: 14px;
}

.row.table.basic {
	border-top: 2px solid #31708f;
}

.row.table.visitor {
	border-top: 2px solid #3c763d;
	margin-bottom: 50px;
}

.row.table.device {
	border-top: 2px solid #8a6d3b;
	margin-bottom: 50px;
}

.row.table.parking {
	border-top: 2px solid #333333;
	margin-bottom: 50px;
}

.table th, .table td {
	text-align: center;
	border: 1px solid #EDEDED;
}

.table th {
	background-color: #DDDDDD;
}
</style>
<script type="text/javascript">
	var now = new Date();
	//신청 승인 처리
	function vpermission(){
		if(!($("#desti_hidden").val())){
			alert('실방문장소를 선택하세요.');
			$("#desti_combo").combobox('textbox').focus();
			return;
		}
		$("#permit_st_hidden").val("승인");
		$("#f_decide").attr("method","post");
		$("#f_decide").attr("action","/company/mngPermit.ch4");
		$("#f_decide").submit();
	}
	//신청 반려 처리
	function greturn(){
		$("#permit_st_hidden").val("반려");
		$("#notes_hidden").attr("value",$("#reason").val());
		$("#f_decide").attr("method","post");
		$("#f_decide").attr("action","/company/mngPermit.ch4");
		$("#f_decide").submit();
	}
</script>
</head>
<body>
	<!-- java script -->
	<%@ include file="../../CommonForm/Top.jsp"%>

	<div class="mainContent">
		<%@ include file="../../CommonForm/ManagerSideBar.jsp"%>
		<div style="padding-left: 200px">
			<div class="col-lg-12">
				<div class="col-lg-offset-1 col-lg-10"
					style="margin-top: 20px; margin-bottom: 20px;">
					<div style="font-size: 35px; width: 78%; float: left;">
						<h1>방문 신청 상세</h1>
					</div>
				</div>
				<div class="col-lg-offset-1 col-lg-10">
					<div id="section1" class="panel panel-info">
						<div class="panel-heading">기본 방문정보</div>
						<div class="panel-body">
							<h4
								style="margin-bottom: 10px; border-left: 3px solid #31708f; padding-left: 4px;">
								<b>신청자 정보</b>
							</h4>
							<div class="row table basic">
								<table class="table">
									<thead>
										<tr>
											<th>신청번호</th>
											<th>신청일자</th>
											<th>성명</th>
											<th>연락처</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><%=visit_no%></td>
											<td><%=visit_apply_date%></td>
											<td><%=visit_apply_name%></td>
											<td><%=visit_apply_hp%></td>
										</tr>
									</tbody>
								</table>
							</div>
							<h4
								style="margin-bottom: 10px; border-left: 3px solid #31708f; padding-left: 4px;">
								<b>방문기간</b>
							</h4>
							<div class="row table basic">
								<table class="table">
									<thead>
										<tr>
											<th>방문유형</th>
											<th>방문주기</th>
											<th>방문요일</th>
											<th>방문날짜</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><%=visit_type%></td>
											<td><%=visit_term%></td>
											<td><%=visit_day%></td>
											<td><%=visit_date%></td>
										</tr>
									</tbody>
								</table>
							</div>
							<h4
								style="margin-bottom: 10px; border-left: 3px solid #31708f; padding-left: 4px;">
								<b>방문상세</b>
							</h4>
							<div class="row table basic">
								<table class="table">
									<thead>
										<tr>
											<th>방문지</th>
											<th>목적지</th>
											<th style="width:200px;">실방문장소</th>
											<th>방문목적</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><%=com_name%></td>
											<td><%=visit_desti%></td>
											<td>
												<select id="desti_combo" name="confm_desti" class="easyui-combobox" style="width:150px;" data-options="panelHeight:'300px'">
												<option value=""></option>
												</select>
											</td>
											<td><%=visit_purps%></td>
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
									<h4 style="border-left: 3px solid #3c763d; padding-left: 4px;">
										<b>방문자 정보</b>
									</h4>
								</div>
							</div>
							<div class="row table visitor">
								<table id="tb_visitor" class="table">
									<thead>
										<tr>
											<th style="width: 40%;">성명</th>
											<th style="width: 50%;">연락처</th>
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
									<h4 style="border-left: 3px solid #8a6d3b; padding-left: 4px;">
										<b>반입기기 정보</b>
									</h4>
								</div>
							</div>
							<div class="row table device">
								<table id="tb_device" class="table">
									<thead>
										<tr>
											<th style="width: 30%;">기종</th>
											<th style="width: 30%;">제조사</th>
											<th style="width: 30%;">모델명</th>
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
									<h4 style="border-left: 3px solid #333333; padding-left: 4px;">
										<b>차량 정보</b>
									</h4>
								</div>
							</div>
							<div class="row table parking">
								<table id="tb_parking" class="table">
									<thead>
										<tr>
											<th style="width: 40%;">차량번호</th>
											<th style="width: 20%;">차종</th>
											<th style="width: 30%;">차량모델명</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div style="float: right; margin-bottom: 20%;">
						<button type="button" id="permission" class="btn btn-primary"
							onClick="javascript:vpermission()">방문 신청 승인</button>
						<button type="button" id="btn_return" class="btn btn-danger">방문
							신청 반려</button>
						<button type="button" class="btn btn-default"
							onClick="javascript:history.back()">이전페이지</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 반려 사유 모달 -->
	<div class="modal fade" id="returnModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">반려 사유</h4>
				</div>
				<div class="modal-body">
					<h4>반려사유</h4>
					<textarea id="reason" rows="5" cols="60%" style="margin-left: 10%;"></textarea>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" onClick="javascript:greturn()">반려 제출</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<form id="f_decide">
		<input type="hidden" id="visit_no_hidden" name="visit_no" value="<%=visit_no %>"> 
		<input type="hidden" id="permit_id_hidden" name="visit_permit_id" value="<%=cmng_id %>">
		<input type="hidden" id="permit_st_hidden" name="visit_permit_st" value="">
		<input type="hidden" id="notes_hidden" name="visit_permit_notes" value="">
		<input type="hidden" id="desti_hidden" name="confm_desti" value="">
	</form>
<script type="text/javascript">
	$(document).ready(function(){
		//쓸거
		<% for(int i=0;i<vtList.size();i++){ %>
		var vRow = "<tr><td>"+"<%=vtList.get(i).get("VISITOR_NAME") %>"
					+"</td><td>"+"<%=vtList.get(i).get("VISITOR_HP") %>"+"</td></tr>";
		$("#tb_visitor tbody").append(vRow);
		<% } %>
		
		//쓸거
		<% for(int i=0;i<tkList.size();i++){ %>
		var dRow = "<tr><td>"+"<%=tkList.get(i).get("TKIN_KIND") %>"
					+"</td><td>"+"<%=tkList.get(i).get("TKIN_BRAND") %>"+"</td>"
					+"</td><td>"+"<%=tkList.get(i).get("TKIN_MODEL") %>"+"</td></tr>";
		$("#tb_device tbody").append(dRow);
		<% } %>
		
		//쓸거
		<% for(int i=0;i<pkList.size();i++){ %>
		var pRow = "<tr><td>"+"<%=pkList.get(i).get("PARKING_NUM") %>"
					+"</td><td>"+"<%=pkList.get(i).get("PARKING_KIND") %>"+"</td>"
					+"</td><td>"+"<%=pkList.get(i).get("PARKING_MODEL") %>"+"</td></tr>";
		$("#tb_parking tbody").append(pRow);
		<% } %>
		$("#desti_combo").combobox({
			valueField: 'DESTI_NAME',
			textField: 'DESTI_NAME',
			url: '/company/destiList.ch4?com_no='+'<%=com_no %>',
			onChange: function(newValue){
				$("#desti_hidden").attr('value',newValue);
			}
		});
		//반려 사유 등록
		$("#btn_return").click(function(){
			$("#returnModal").modal();
		});
	});
</script>
</body>
</html>