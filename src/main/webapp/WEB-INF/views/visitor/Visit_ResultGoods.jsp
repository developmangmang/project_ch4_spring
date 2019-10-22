<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
   //신청번호
   String aplg_no = "null";
   if(null!=(request.getAttribute("aplg_no"))){
      aplg_no = (String)request.getAttribute("aplg_no");
   }
   //신청일자
   String aplg_date = "null";
   Date date = new Date();
   SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
   aplg_date = form.format(date);
   //신청자 이름
   String aplg_name = "null";
   if(null!=request.getParameter("aplg_name")){
      aplg_name = (String)request.getParameter("aplg_name");
   }
   //신청자 연락처
   String aplg_hp = "null";
   if(null!=request.getParameter("aplg_hp")){
      aplg_hp = (String)request.getParameter("aplg_hp");
   }
   //반입날짜
   String aplg_trans_date = "null";
   if(null!=request.getParameter("aplg_trans_date")){
      aplg_trans_date = (String)request.getParameter("aplg_trans_date");
   }
   //반입지
   String com_name = "null";
   if(null!=request.getParameter("com_name")){
      com_name = (String)request.getParameter("com_name");
   }
   //목적지
   String aplg_desti = "null";
   if(null!=request.getParameter("aplg_desti")){
      aplg_desti = (String)request.getParameter("aplg_desti");
   }
   //반입목적
   String aplg_reason = "null";
   if(null!=request.getParameter("aplg_reason")){
      aplg_reason = (String)request.getParameter("aplg_reason");
   }
   //반입물품
   List<Map<String,Object>> gmAddList = new ArrayList<>();
   if(null!=request.getAttribute("gmAddList")){
      gmAddList = (List<Map<String,Object>>)request.getAttribute("gmAddList");
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
      height: 350px;
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
      <% for(int i=0;i<gmAddList.size();i++){ %>
      var gRow = "<tr><td>"+"<%=gmAddList.get(i).get("gmng_name") %>"
               +"</td><td>"+"<%=gmAddList.get(i).get("gmng_type") %>"+"</td>"
               +"</td><td>"+"<%=gmAddList.get(i).get("gmng_quan") %>"+"</td></tr>";
      $("#tb_goods tbody").append(gRow);
      <% } %>
   });
   function applyUpdate(){
      //alert("수정");
      $("#form_next").attr("action","/goods/changeGoods.ch4");
      $("#form_next").submit();
   }
   //반입신청 확인 Modal 띄우기
   function confirmCancle(){
      $("#md_cancle").modal("show");
   }
   //오시는길
   function navigation(){   
      $("#form_navi").attr('action','/goods/navigation.ch4');
      $("#form_navi").submit();
   }
   //반입신청 취소
   function applyCancle(){   
      $("#form_next").attr('action','/goods/cancle.ch4');
      $("#form_next").submit();
   }
</script>
<div class="container-fluid">
   <div class="row">
       <div class="col-lg-8 col-lg-offset-2"> 
          <div style="text-align:center;">
             <img src="http://192.168.0.189:8080/resources/Style/images/crud/transport_logo_default.png" class="img-thumbnail" style="width:30%;border:0px;">
             <h3 style="margin-top:10px;">"고객님의 반입신청이 <b style="font-size:40px; color:#b22222;">접수</b><b style="font-size:24px; color:#4169e1;">(<%=aplg_no %>)</b>되었습니다."</h3>
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
             <div class="panel-heading">기본 반입정보</div>
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
                            <td><%=aplg_no %></td>
                            <td><%=aplg_date %></td>
                            <td><%=aplg_name %></td>
                            <td><%=aplg_hp %></td>
                         </tr>
                      </tbody>
                   </table>
                </div>
                <h4 style="margin-bottom:10px; border-left: 3px solid #31708f; padding-left:4px;"><b>상세정보</b></h4>
                <div class="row table basic">
                   <table class="table">
                      <thead>
                         <tr>
                            <th>반입날짜</th>
                            <th>목적지</th>
                            <th>반입사유</th>
                         </tr>
                      </thead>
                      <tbody>
                         <tr>
                            <td><%=aplg_trans_date %></td>
                            <td><%=aplg_desti %></td>
                            <td><%=aplg_reason %></td>
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
                      <h4 style="border-left: 3px solid #3c763d; padding-left:4px;"><b>반입 물품 정보</b></h4>
                   </div>
                </div>
                <div class="row table goods">
                   <table id="tb_goods" class="table">
                      <thead>
                         <tr>
                            <th style="width:40%;">물품명</th>
                            <th style="width:40%;">물품종류</th>
                            <th style="width:20%;">EA</th>
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
            <p>접수하신 반입신청을 취소하시겠습니까?</p>
            <button type="button" class="btn btn-basic" data-dismiss="modal">아니요</button>
            <button type="button" class="btn btn-danger" onClick="applyCancle()">예</button>
         </div>
      </div>
   </div>
</div>
<form id="form_next" method="POST">
   <input type="hidden" name="aplg_no" value="<%=aplg_no %>">
</form>
<form id="form_navi" method="POST">
   <input type="hidden" name="com_no" value="<%=com_no %>">
</form>
</body>
</html>