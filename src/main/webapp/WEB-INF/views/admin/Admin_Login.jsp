<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 -->
<%@ include file="../CommonForm/TapLogo.jsp"%>
<title>관리자 로그인 - CH4 방문/반입 자동화 시스템</title>
<%@ include file="../../Style/common/HeadUI.jsp"%>
<style type="text/css">
	#jumbo_adminlogin {
		margin-top : 0px;
		padding-top : 10px;
		height : 600px;
		background-image: url('${host}/resources/Style/images/banner/speedGate (1).jpg');
	}
	/* 배경 투명도 및 크기  */
	#login_background {
	   background-color: rgba(223, 223, 223, 0.7);
	   height: 400px;
	   padding-bottom: 30px;
	}
	#admin_id {
	   width: 350px;
	   height: 50px;
	   margin-bottom: 10px;
	}
	#admin_pw {
	   width: 350px;
	   height: 50px;
	   margin-bottom: 10px;
	}
	#btn_login {
	   width: 350px;
	   height: 50px;
	}
	#signtitle {
	   font-size: 50px;
	   margin-bottom: 30px;
	}
	.checkbox{
		border: 0px;
	}
	h2 {
	   padding-left: 3%;
	   margin-left: 8%;
	   border-left: solid 7px;
	   color: white;
	   font-weight: 700;
	   font-family: sans-serif;
	}
</style>
<script type="text/javascript">
	function login(){
		//아이디와 비번이 쓰였는지에대한 체크
		if($('#admin_id').val()==""){
            $('#admin_id').focus();
            alert("아이디를 입력해주세요");
            return;
        }
		if($('#admin_pw').val()==""){
            $('#admin_pw').focus();
            alert("비밀번호를 입력해주세요");
            return;
        }
		//전송
        $('#f_adminlogin').attr("method","post");
    	$('#f_adminlogin').attr("action","/admin/adminLogin.ch4"); //전송을 하는 곳.
    	$('#f_adminlogin').submit(); 
	} 
</script>
</head>
<body>
<%@ include file="../CommonForm/Top.jsp"%>
<div class="container-fluid" style="text-align: center;">
	<div id="jumbo_adminlogin" class="jumbotron">
		<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
			<div class="row" align="left" style="margin-top:50px;">
				<h2>ADMIN</h2>
			</div>
			<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
				<div id="login_background" class="row" align="center" >
					&nbsp;
					<h1 id="signtitle">Please sign in</h1>
					&nbsp;
					<div class="row">
						<div class="col-lg-offset-3 col-lg-6 col-lg-offset-3">
							<form  id="f_adminlogin" class="f_adminlogin">
								<div class="row" style="margin-bottom:10px;">
									<input id="admin_id" class="easyui-textbox" name="adminID"  prompt="id" data-options="iconCls:'icon-man'" style="height: 40px;">
								</div>
								<div class="row"> 
									<input id="admin_pw" class="easyui-passwordbox" name="adminPW" prompt="Password" iconWidth="28" style="height: 40px;">
								</div>
								<div class="row">
									<button id="btn_login" type="button" class="btn btn-lg btn-primary btn-block" style="margin-top: 50px;" onClick="javascript:login()">Sign in</button>
								</div>
							</form>
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