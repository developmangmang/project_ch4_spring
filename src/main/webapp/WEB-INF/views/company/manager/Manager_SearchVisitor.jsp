   <%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<title>방문 신청 관리 - CH4 방문자 관리 시스템</title>
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
               <h1>방문 신청 관리</h1>
            </div>
         </div>
         <!-- 검색 툴바 -->
         <div class="col-lg-offset-1 col-lg-10">
            <div class="row">
               <form id="f_search">
                  <input type="hidden" name="com_no" value="<%=com_no %>">
                  <!-- 검색 타입 설정 -->
                  <div class='col-lg-2' style="padding: 5px;">
                     <select class="easyui-combobox" id="SearchType" name='SearchType'
                        style="width: 90%;">
                        <option value="visit_apply_name" selected>신청자명</option>
                        <option value="visitor_name">방문자명</option>
                        <option value="visit_desti">목적지</option>
                        <option value="visit_no">신청번호</option>
                     </select>
                  </div>
                  <div class='col-lg-2' style="padding: 5px;">
                     <!-- 검색창 : 콤보박스에 의한 분기 -->
                     <!-- 텍스트 박스에 대해 name값 변경 : 처음 값은 방문자명 // onChange 이벤트로 Name속성을 바꾸어 주기 -->
                     <input class="easyui-textbox" id="searchText" name="visit_apply_name"
                        style="width: 80%;"> <a class="easyui-linkbutton"
                        type="button" data-options="iconCls:'icon-search'"
                        onclick="btn_search()"></a>
                  </div>
                  <div class='col-lg-2' style="padding: 5px;">
                     <select class="easyui-combobox" id="state" name="visit_permit_st"
                        style="width: 100%;">
                        <option value="" selected>전체</option>
                        <option value="결재중">결재중</option>
                        <option value="승인">승인</option>
                        <option value="반려">반려</option>
                        <option value="취소">취소</option>
                     </select>
                  </div>
                  <!-- 날짜 검색 -->
                  <div class='col-lg-4' style="padding: 5px; padding-left: 15px;">
                     <div class="row">
                        <span style="font-weight: bold;">신청일</span>
                        <input class="easyui-datebox" id="startdate" name="visit_apply_date1" style="width: 40%;">
                        <b>~</b>
                        <input class="easyui-datebox" id=closedate name="visit_apply_date2" style="width: 40%;">
                     </div>
                  </div>
               </form>
            </div>
            <!-- 부트 테이블 : search_ResultVisitor 참조 -->
            <div class="row" style="width: 86%; margin-top:20px;">
               <table class="table table-bordered table-hover" id="tb_sv">
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
      $("#tb_sv").bootstrapTable({
             columns:[
                  {field:'VISIT_NO',title:'신청번호'}
                  ,{field:'VISIT_DAYE',title:'신청일'}
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
   function btn_search(){
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