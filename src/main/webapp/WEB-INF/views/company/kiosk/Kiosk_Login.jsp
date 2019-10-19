<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../../CommonForm/TapLogo.jsp"%>
<!-- Link Import --> 
<%@ include file="../../../Style/common/HeadUI.jsp"%> 
<title>Kiosk_login</title>
<style type="text/css">
	#jumbo_Kiosklogin {
		margin-top : 0px;
		padding-top : 10px;
		height : 600px;
		background-image: url('../../../Style/images/banner/home_banner.png');
	}
	#login_background{
		background-color:rgba(223,223,223,0.7);
		height: 100%;
		padding-bottom: 30px;
	}
	div.row{
		padding-top: 20px;
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
	function kiosklogin(){
		alert("로그인");
		if($('#kiosk_id').val()==""){
            $('#kiosk_id').focus();
            alert("아이디를 입력해주세요");
            return;
        }
        else{
        	//전송
        	$('#fkiosk_signin').attr("method","get");
    		$('#fkiosk_signin').attr("action","kiosk/kioskLogin.ch4?"); //전송을 하는 곳.
    		$('#fkiosk_signin').submit(); 
        }
	}
</script>
</head>
<body>
<%@ include file="../../CommonForm/Top.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
        $('#idSaveCheck').on('click', function name() {
			var user_id = $.cookie('kiosk_id');//쿠키값 꺼내기
            if($('input:checkbox[id="idSaveCheck"]').is(':checked')){
                alert('checked');
                if($('#kiosk_id').val()==""){
                    alert('id를 입력해주세요.');
                    $(this).attr('checked', false);
                }else{
                    // 쿠키에 저장
                    $.cookie('kiosk_id', $('#kiosk_id').val(), {expires: 7, path: '/'});

                }
            }else{
                $.removeCookie('kiosk_id', { path: '/' });
            }
        });
	});
</script>
<div class="container-fluid" style="text-align: center;">
	<div id="jumbo_Kiosklogin" class="jumbotron">
	<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
		<div class="row">
			<!-- 로그인//kiosk 버튼 -->
			<div class="col-lg-offset-8 col-lg-4">
				<button class="btn btn-light" id="koisk_join" style="width: 80px;">JOIN</button>
				<button class="btn btn-danger" id="koisk_main" style="width: 80px;">MAIN</button>
			</div>
		</div>
		<div class="row" align="left">
			<h2>KIOSK</h2>
		<div>
		<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
			<div id="login_background" class="row" align="center">
			<!-- 키오스크 로그인화면 -->
			<h1 style="font-size: 50px;">Please sign in</h1>
			&nbsp;
			<form class="fkiosk_signin">
				<div class="row">
					<div class="row">
						<input id="kiosk_id" class="easyui-textbox" prompt="  id" 
							   data-options="iconCls:'icon-man'"
							   style="height: 40px; width: 30%;">
					</div>
					<div class="row">
						<button id="btn_login" class="btn btn-lg btn-primary btn-block" onClick="kiosklogin()" type="submit">Sign in</button>
					</div>
					<div class="row">
						<div class="checkbox">
  							<label>
								<input type="checkbox"  id="idSaveCheck" value="SaveId" > SaveId
					    	</label>
					    </div>
					</div>
				</div>
			</form>
			</div>
		</div>
	</div>
	</div>
</div>
<%@ include file="../../CommonForm/Footer.jsp"%>
</body>
</html>