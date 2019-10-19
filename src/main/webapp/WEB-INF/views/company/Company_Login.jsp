<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   Cookie[] cookie = request.getCookies();//쿠키 - 아이디 기억하기
   String id= "";//쿠키에서 찾은 아이디 값을 저장할 변수
   if(cookie!=null){
      for(int i =0;i<cookie.length;i++){
         if(cookie[i].getName().trim().equals("id")){//id라는 이름의 키가 있을 경우.
            id=cookie[i].getValue();//쿠키에 담기
         }
      }
   }
   String msg = null;
    if(request.getAttribute("msg")!=null){
      msg = (String)request.getAttribute("msg");
   } 
    //msg = "PW";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<!-- Link Import --> 
<%@ include file="../../Style/common/HeadUI.jsp"%> 
<title>방문/반입 관리 - CH4 방문자 관리 시스템</title>
<style type="text/css">
/* 점보트론 이미지 및 크기 */
#jumbo_companylogin {
   margin-top: 0px;
   padding-top: 10px;
   height: 600px;
   background-image: url('http://localhost:8000/resources/Style/images/banner/speedGate (2).jpg');
}
/* 배경 투명도 및 크기  */
#login_background {
   background-color: rgba(223, 223, 223, 0.7);
   height: 400px;
   padding-bottom: 30px;
}
/* 구분에 대한 css */
h2 {
   padding-left: 3%;
   margin-left: 8%;
   border-left: solid 7px;
   color: white;
   font-weight: 700;
   font-family: sans-serif;
}
#com_join,#kiosk {
   width: 80px;
}
#signtitle {
   font-size: 50px;
   margin-bottom: 30px;
}

#cmng_id {
   width: 350px;
   height: 50px;
   margin-bottom: 10px;
}
#cmng_pw {
   width: 350px;
   height: 50px;
   margin-bottom: 10px;
}
#btn_login {
   width: 350px;
   height: 50px;
}
.checkbox {
   border: 0px;
   margin-top: 20px;
   margin-bottom: 20px;
}
</style>
<script type="text/javascript">
   //로그인 버튼을 눌렀을 때 이벤트
   function login(){
      alert("로그인");
      if($('#cmng_id').val()==""){//아이디를 적지 않았을 때 
            $('#cmng_id').focus();
            alert("아이디를 입력해주세요");
            return;
        }
      if($('#cmng_pw').val()==""){
            $('#cmng_pw').focus();
            alert("비밀번호를 입력해주세요");
            return;
        }
        else{
           //전송
           $('#fsignin').attr("method","post");
          $('#fsignin').attr("action","/company/login.ch4"); //전송을 하는 곳.
          $('#fsignin').submit(); 
        }
   }
   function moveKiosk(){
      alert("키오스크");
   }
   function moveJoin(){
      alert("회원가입");
      
   }
</script>
</head>
<body>
<script type="text/javascript">
   $(document).ready(function(){
   
      var msg = "<%= msg%>" ;
      if(msg=="ID"){
         alert("아이디가 틀렸습니다.");
      }
      else if(msg=="PW"){
         alert("비밀번호가 틀렸습니다.");
      }
   });
</script>
<%@ include file="../CommonForm/Top.jsp"%>
<div class="container-fluid" style="text-align: center;">
   <div id="jumbo_companylogin" class="jumbotron">
      <div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
         <div class="row">
         <!-- 로그인//kiosk 버튼 -->
            <div class="col-lg-offset-8 col-lg-4">
               <button class="btn btn-light" id="com_join"type="button"
                     onClick="moveJoin()">JOIN</button>
               <button class="btn btn-danger" id="kiosk" type="button"
                     onClick="moveKiosk()">KIOSK</button>
            </div>
         </div>
         <div class="row" align="left">
            <h2>COMPANY</h2>
         <div>
         <div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
            <div id="login_background" class="row" align="center">
               &nbsp;
               <h1 id="signtitle">Please sign in</h1>
               &nbsp;
               <!-- 로그인화면 -->
               <form class="fsignin" id="fsignin">
                  <div align="center"> 
                     <div class="row">
                        <div class="col-lg-offset-2 col-lg-8 col-lg-offset-2">
                           <div class="row" style="margin-bottom: 10px;">
                              <input id="cmng_id" name="cmng_id" value="<%=id %>" class="easyui-textbox" 
                                    style="height: 40px;"
                                    prompt="id" data-options="iconCls:'icon-man'">
                           </div>
                           <div class="row">
                              <input id="cmng_pw" name="cmng_pw" class="easyui-passwordbox" 
                                    style="height: 40px;"
                                    prompt="Password" iconWidth="28">
                           </div>
                        </div>
                     </div>
                     <div class="row" >
                        <div class="checkbox">
                              <label>
                              <input type="checkbox" id="logincheck" name="logincheck" value="remember-me" <% if(id.length() > 1) out.print("checked"); %>> Remember me
                            </label>
                         </div>
                     </div>
                  </div>
               </form>
               <div  align="center">
                  <div class="row">
                     <div class="col-lg-offset-2 col-lg-8 col-lg-offset-2">
                        <button id="btn_login"  class="btn btn-lg btn-primary btn-block" onClick="login()" type="submit">Sign in</button>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<%@ include file="../CommonForm/Footer.jsp"%>
</body>
</html>