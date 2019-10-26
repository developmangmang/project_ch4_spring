<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//신청번호
	String aplg_no = "null";
	//신청일자
	String aplg_date = "null";
	//신청자 이름
	String aplg_name = "null";
	//신청자 연락처
	String aplg_hp = "null";
	//반입날짜
	String aplg_trans_date = "null";
	//목적지
	String aplg_desti = "null";
	//반입사유
	String aplg_reason = "null";
	
	Map<String,Object> rMap = new HashMap<>();
	if(null!=request.getAttribute("rMap")){
		rMap = (Map<String,Object>)request.getAttribute("rMap");
	}
	//기본정보
	Map<String,Object> infoMap = new HashMap<>();
	if(null!=rMap.get("infoMap")){
		infoMap = (Map<String,Object>)rMap.get("infoMap");
		aplg_no = (String)infoMap.get("APLG_NO");
		aplg_date = (String)infoMap.get("APLG_DATE");
		aplg_name = (String)infoMap.get("APLG_NAME");
		aplg_hp = (String)infoMap.get("APLG_HP");
		aplg_trans_date = (String)infoMap.get("APLG_TRANS_DATE");
		aplg_desti = (String)infoMap.get("APLG_DESTI");
		aplg_reason = (String)infoMap.get("APLG_REASON");
	}
	//물품관리 테이블
	List<Map<String,Object>> gmList = new ArrayList<>();
	if(null!=rMap.get("gmList")){
		gmList = (List<Map<String,Object>>)rMap.get("gmList");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 -->
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>신청 상세 - CH4 방문/반입 자동화 시스템</title>
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
	function gpermission(){
		if(!($("#desti_hidden").val())){
			alert('실반입장소를 선택하세요.');
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
				<div class="col-lg-offset-1 col-lg-10" style="margin-top:20px;margin-bottom:20px;">
					<div style="font-size: 35px; width: 78%; float: left;">
						<h1>반입 신청 상세</h1>
					</div>
				</div>
				<div class="col-lg-offset-1 col-lg-10">
					<div id="section1" class="panel panel-info">
						<div class="panel-heading">기본 반입정보</div>
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
											<td><%=aplg_no%></td>
											<td><%=aplg_date%></td>
											<td><%=aplg_name%></td>
											<td><%=aplg_hp%></td>
										</tr>
									</tbody>
								</table>
							</div>
							<h4
								style="margin-bottom: 10px; border-left: 3px solid #31708f; padding-left: 4px;">
								<b>상세정보</b>
							</h4>
							<div class="row table basic">
								<table class="table">
									<thead>
										<tr>
											<th>반입날짜</th>
											<th>목적지</th>
											<th style="width:200px;">실반입장소</th>
											<th>반입사유</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><%=aplg_trans_date%></td>
											<td><%=aplg_desti%></td>
											<td>
												<select id="desti_combo" name="confm_desti" class="easyui-combobox" style="width:150px;" data-options="panelHeight:'300px'">
												<option value=""></option>
												</select>
											</td>
											<td><%=aplg_reason%></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div id="section2" class="panel panel-success">
						<div class="panel-heading">물품 정보</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-lg-8">
									<h4 style="border-left: 3px solid #3c763d; padding-left: 4px;">
										<b>반입 물품 정보</b>
									</h4>
								</div>
							</div>
							<div class="row table goods">
								<table id="tb_goods" class="table">
									<thead>
										<tr>
											<th style="width: 40%;">물품명</th>
											<th style="width: 40%;">물품종류</th>
											<th style="width: 20%;">EA</th>
										</tr>
									</thead>
									<tbody>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div style="float: right; margin-bottom: 20%;">
						<button type="button" id="btn_permission" class="btn btn-primary" onClick="javascript:gpermission()">반입 신청 승인</button>
						<button type="button" id="btn_return" class="btn btn-danger">반입 신청 반려</button>
						<button type="button" class="btn btn-default" onClick="javascript:history.back()">이전페이지</button>
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
		<input type="hidden" id="aplg_no_hidden" name="aplg_no" value="<%=aplg_no %>"> 
		<input type="hidden" id="permit_id_hidden" name="aplg_permit_id" value="<%=cmng_id %>">
		<input type="hidden" id="permit_st_hidden" name="aplg_permit_st" value="">
		<input type="hidden" id="notes_hidden" name="aplg_notes" value="">
		<input type="hidden" id="desti_hidden" name="confm_desti" value="">
	</form>
<script type="text/javascript">
	$(document).ready(function(){
		<% for(int i=0;i<gmList.size();i++){ %>
		var gRow = "<tr><td>"+"<%=gmList.get(i).get("GMNG_NAME") %>"
					+"</td><td>"+"<%=gmList.get(i).get("GMNG_TYPE") %>"+"</td>"
					+"</td><td>"+"<%=gmList.get(i).get("GMNG_QUAN") %>"+"</td></tr>";
		$("#tb_goods tbody").append(gRow);
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