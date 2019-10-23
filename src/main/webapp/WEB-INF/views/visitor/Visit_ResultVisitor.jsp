<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //신청번호
   String visit_no = "null";
   if(null!=(request.getAttribute("visit_no"))){
      visit_no = (String)request.getAttribute("visit_no");
   }
   //신청일자
   String visit_apply_date = "null";
   Date date = new Date();
   SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
   visit_apply_date = form.format(date);
   //신청자 이름
   String visit_apply_name = "null";
   if(null!=request.getParameter("visit_apply_name")){
      visit_apply_name = (String)request.getParameter("visit_apply_name");
   }
   //신청자 연락처
   String visit_apply_hp = "null";
   if(null!=request.getParameter("visit_apply_hp")){
      visit_apply_hp = (String)request.getParameter("visit_apply_hp");
   }
   //방문유형
   String visit_type = "null";
   if(null!=request.getParameter("visit_type")){
      visit_type = (String)request.getParameter("visit_type");
   }
   //방문주기
   String visit_term = "헤딩없음";
   if(null!=request.getParameter("visit_term")){
      visit_term = (String)request.getParameter("visit_term");
   }
   //방문요일
   String visit_day = "해당없음";
   if(null!=request.getParameter("visit_day")){
      visit_day = (String)request.getParameter("visit_day");
   }
   //방문날짜
   String visit_date = "null";
   if(null!=request.getParameter("visit_date")){
      visit_date = (String)request.getParameter("visit_date");
   }
   //방문지
   String com_name = "null";
   if(null!=request.getParameter("com_name")){
      com_name = (String)request.getParameter("com_name");
   }
   //목적지
   String visit_desti = "null";
   if(null!=request.getParameter("visit_desti")){
      visit_desti = (String)request.getParameter("visit_desti");
   }
   //방문목적
   String visit_purps = "null";
   if(null!=request.getParameter("visit_purps")){
      visit_purps = (String)request.getParameter("visit_purps");
   }
   //방문자 이름 & 연락처
   List<Map<String,Object>> vtAddList = new ArrayList<>();
   if(null!=request.getAttribute("vtAddList")){
      vtAddList = (List<Map<String,Object>>)request.getAttribute("vtAddList");
   }
   
   //반입기기
   List<Map<String,Object>> tkAddList = new ArrayList<>();
   if(null!=request.getAttribute("tkAddList")){
      tkAddList = (List<Map<String,Object>>)request.getAttribute("tkAddList");
   }
   
   //주차   
   List<Map<String,Object>> pkAddList = new ArrayList<>();
   if(null!=request.getAttribute("pkAddList")){
      pkAddList = (List<Map<String,Object>>)request.getAttribute("pkAddList");
   }
   String com_no = "null";
   if(null!=request.getParameter("com_no")){
      com_no = (String)request.getParameter("com_no");
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
<title>신청결과 - CH4 방문자 관리 시스템</title>
<style>
   body {
      position: relative;
   }
   #section1 {
      height: 450px;
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
   #md_cancle_body {
      padding-left: 0px;
      padding-right: 0px;
      text-align: center;
   }
   #md_cancle_header {
      background-color: #DDDDDD;
   }
</style>
</head>
<body>
<%@ include file="../CommonForm/Top.jsp"%>
<script type="text/javascript">
   $(document).ready(function(){
      //쓸거
      <% for(int i=0;i<vtAddList.size();i++){ %>
      var vRow = "<tr><td>"+"<%=vtAddList.get(i).get("visitor_name") %>"
               +"</td><td>"+"<%=vtAddList.get(i).get("visitor_hp") %>"+"</td></tr>";
      $("#tb_visitor tbody").append(vRow);
      <% } %>
      
      //쓸거
      <% for(int i=0;i<tkAddList.size();i++){ %>
      var dRow = "<tr><td>"+"<%=tkAddList.get(i).get("tkin_kind") %>"
               +"</td><td>"+"<%=tkAddList.get(i).get("tkin_brand") %>"+"</td>"
               +"</td><td>"+"<%=tkAddList.get(i).get("tkin_model") %>"+"</td></tr>";
      $("#tb_device tbody").append(dRow);
      <% } %>
      
      //쓸거
      <% for(int i=0;i<pkAddList.size();i++){ %>
      var pRow = "<tr><td>"+"<%=pkAddList.get(i).get("parking_num") %>"
               +"</td><td>"+"<%=pkAddList.get(i).get("parking_kind") %>"+"</td>"
               +"</td><td>"+"<%=pkAddList.get(i).get("parking_model") %>"+"</td></tr>";
      $("#tb_parking tbody").append(pRow);
      <% } %>
   });
   function applyUpdate(){
      //alert("수정");
      $("#form_next").attr("action","/visitor/changeVisitor.ch4");
      $("#form_next").submit();
   }
   //방문신청 확인 Modal 띄우기
   function confirmCancle(){
      $("#md_cancle").modal("show");
   }
   //오시는길
   function navigation(){   
      $("#form_navi").attr('action','/visitor/navigation.ch4');
      $("#form_navi").submit();
   }
   //방문신청 취소
   function applyCancle(){   
      $("#form_next").attr('action','/visitor/cancle.ch4');
      $("#form_next").submit();
   }
</script>
<div class="container-fluid">
   <div class="row">
       <div class="col-lg-8 col-lg-offset-2"> 
          <div style="text-align:center;">
             <img src="${host}/resources/Style/images/crud/visitor_logo_default.png" class="img-thumbnail" style="width:30%;border:0px;">
             <h3 style="margin-top:10px;">"고객님의 방문신청이 <b style="font-size:40px; color:#b22222;">접수</b><b style="font-size:24px; color:#4169e1;">(<%=visit_no %>)</b>되었습니다."</h3>
          </div><br>
          <div class="row" style="text-align:center;">
             <h5 style="margin-bottom:20px;font-weight:bold;">※신청내용 변경 또는 취소는 당일 오후 4시까지 가능하며</h5>
             <h5 style="font-weight:bold;">신청번호를 모를 경우 이용에 제한될 수 있는 점 양해바랍니다.</h5>
          </div><br>
          <div class="row">
             <div style="text-align:center;"> 
               <button id="btn_update" class="btn btn-primary" type="button" onclick="applyUpdate()" style="width:120px;margin-right:20px;">신청변경</button>
               <button id="btn_cancle" class="btn btn-danger" type="button" onclick="confirmCancle()" style="width:120px;margin-right:20px;">신청취소</button>
               <button id="btn_navi" class="btn btn-default" type="button" onclick="navigation()" style="width:120px;margin-right:20px;">오시는길</button>
               <button id="btn_main" class="btn btn-info" type="button" onclick="location.href='/service/visitor.ch4'" style="width:120px;">메인으로</button>
            </div>
         </div><br><br>
         <div class="row">
             <div class="col-lg-10">
               <h2 style="margin-bottom:20px; border-left: 4px solid #17405D; padding-left:8px;"><b>신청 정보</b></h2>
             </div>
         </div>
          <input id="com_no" type="hidden" name="com_no" value="">
         <div id="section1" class="panel panel-info">    
             <div class="panel-heading">기본 방문정보</div>
             <div class="panel-body">
                <h4 style="margin-bottom:10px; border-left: 3px solid #31708f; padding-left:4px;"><b>신청자 정보</b></h4>
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
                            <td><%=visit_no %></td>
                            <td><%=visit_apply_date %></td>
                            <td><%=visit_apply_name %></td>
                            <td><%=visit_apply_hp %></td>
                         </tr>
                      </tbody>
                   </table>
                </div>
                <h4 style="margin-bottom:10px; border-left: 3px solid #31708f; padding-left:4px;"><b>방문기간</b></h4>
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
                            <td><%=visit_type %></td>
                            <td><%=visit_term %></td>
                            <td><%=visit_day %></td>
                            <td><%=visit_date %></td>
                         </tr>
                      </tbody>
                   </table>
                </div>
                <h4 style="margin-bottom:10px; border-left: 3px solid #31708f; padding-left:4px;"><b>방문상세</b></h4>
                <div class="row table basic">
                   <table class="table">
                      <thead>
                         <tr>
                            <th>방문지</th>
                            <th>목적지</th>
                            <th>방문목적</th>
                         </tr>
                      </thead>
                      <tbody>
                         <tr>
                            <td><%=com_name %></td>
                            <td><%=visit_desti %></td>
                            <td><%=visit_purps %></td>
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
                   </div>
                </div>
                <div class="row table visitor">
                   <table id="tb_visitor" class="table">
                      <thead>
                         <tr>
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
                   </div>
                </div>
                <div class="row table device">
                   <table id="tb_device" class="table">
                      <thead>
                         <tr>
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
                </div>
                <div class="row table parking">
                   <table id="tb_parking" class="table">
                      <thead>
                         <tr>
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
         </div>
       </div>
     </div>
</div>
<!-- 신청취소 확인 Modal -->
<div id="md_cancle" class="modal fade" role="dialog">
   <div class="modal-dialog modal-sm">
      <div class="modal-content">
         <div id="md_cancle_header" class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">신청 취소</h4>
         </div>
         <div id="md_cancle_body" class="modal-body">
            <p>접수하신 방문신청을 취소하시겠습니까?</p>
            <button type="button" class="btn btn-basic" data-dismiss="modal">아니요</button>
            <button type="button" class="btn btn-danger" onClick="applyCancle()">예</button>
         </div>
      </div>
   </div>
</div>
<form id="form_next" method="POST">
   <input type="hidden" name="visit_no" value="<%=visit_no %>">
</form>
<form id="form_navi" method="POST">
   <input type="hidden" name="com_no" value="<%=com_no %>">
</form>
</body>
</html>