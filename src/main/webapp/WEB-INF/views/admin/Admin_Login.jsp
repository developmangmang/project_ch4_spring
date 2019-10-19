<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시스템 관리- CH4 방문자 관리 시스템</title>
<style type="text/css">
	#jumbo_adminlogin {
		margin-top : 30px;
		padding-top : 10px;
		height : 700px;
		background-image: url('../../Style/images/banner/banner_admin.jpg');
	}
	#login_background{
		background-color:rgba(223,223,223,0.7);
		height: 100%;
		padding-bottom: 50px;
		padding-top: 30px;
	}
	#btn_login {
		width: 30%;
		height: 40px;
	}
	.checkbox{
		border: 0px;
	}
	h2 {
		padding-left: 3%;
		margin-left: 8%;
		border-left: solid 7px;
		color: white;
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
        else{
			//전송
        	$('#f_adminlogin').attr("method","post");
    		$('#f_adminlogin').attr("action","company/login.ch4"); //전송을 하는 곳.
    		$('#f_adminlogin').submit(); 
        }
	} 
</script>
</head>
<body>
<%@ include file="../CommonForm/Top.jsp"%>
<div class="container" style="text-align: center;">
	<div id="jumbo_adminlogin" class="jumbotron">
		<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
			<div class="row" align="left" style="margin-top:80px;">
				<h2>ADMIN</h2>
			</div>
			<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
				<div id="login_background" class="row" align="center" >
					<h1 style="font-size: 50px;">Please sign in</h1>
					<div class="row">
						<div class="col-lg-offset-3 col-lg-6 col-lg-offset-3">
							<form class="f_adminlogin">
								<div class="row">
									<input id="admin_id" class="easyui-textbox"  prompt="id" data-options="iconCls:'icon-man'" style="width:300px; height: 40px;">
								</div>
								<div class="row"> 
									<input id="admin_pw" class="easyui-passwordbox" prompt="Password" iconWidth="28" style="width:300px; height: 40px;margin-top: -10px;">
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