<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<!-- Link Import --> 
<%@ include file="../../Style/common/HeadUI.jsp"%> 
<title>회원가입 - CH4 방문자 관리 시스템</title>
<style>
	div #label{
		vertical-align: middle;
	}
	span#help_block{
		display: none;
	}
	.textbox-label {
		width: 100px;
		height: 50px;
		line-height: 40px;
		vertical-align: middle;
		white-space: nowrap;
		margin: 10px;
		padding-right: 5px;
	}
	.well {
		padding-right: 30px;
		padding-left: 30px;
		padding-top: 30px;
		padding-bottom: 20px;
	}
	#_easyui_textbox_input1,#_easyui_textbox_input2,#_easyui_textbox_input3,
	#_easyui_textbox_input4,#_easyui_textbox_input5,#_easyui_textbox_input6,
	#_easyui_textbox_input7,#_easyui_textbox_input8
	{
		height:40px;
	}
	.btn{
		height:40px;
		width: 120px;
	}
	.tb {
		width: 485px;
	}
	.tb_id{
		width:350px;
	}
	.tb_combo {
		width: 320px;
	}
	table td{
		padding-bottom: 10px;
		align:'left';
		
	}
	table th{
		width: 120px;
	}
	#cmng_permit_hp1,#cmng_permit_hp2, #cmng_permit_hp3{
		width: 153px;
	}
</style>
<script type="text/javascript">
	function join(){
		//모든 칸이 쓰였는지 확인
		if($("#cmng_id").val()==""){
			alert("아이디를 입력해주세요.");
			$("#cmng_id").textbox('textbox').focus();
			return;
		}
		if($("#cmng_pw").val()==""){
			alert("비밀번호를 입력해주세요.");
			$("#cmng_pw").passwordbox('textbox').focus();
			return;
		}
		if($("#id_check").val()=="unchecked"){
			alert("중복검사를 해주세요.");
			return;
		}
		if($("#re_cmng_pw").val()==""){
			alert("비밀번호를 확인 해주세요.");
			$("#re_cmng_pw").passwordbox('textbox').focus();
			return;
		}
		if($("#cmng_name").val()==""){
			alert("성함을 입력 해주세요.");
			$("#cmng_name").textbox('textbox').focus();
			return;
		}
		if($('#combo_company').combobox()){
			
		}
		if($("#cmng_permit_hp1").val()==""){
			alert("핸드폰 번호를 입력 해주세요.");
			$("#cmng_permit_hp").textbox('textbox').focus();
			return;
		}
		if($("#cmng_permit_hp2").val()==""){
			alert("핸드폰 번호를 입력 해주세요.");
			$("#cmng_permit_hp").textbox('textbox').focus();
			return;
		}
		if($("#cmng_permit_hp3").val()==""){
			alert("핸드폰 번호를 입력 해주세요.");
			$("#cmng_permit_hp").textbox('textbox').focus();
			return;
		}
		if($("#cmng_grade").val()==""){
			alert("등급을 선택 해주세요.");
			$("#cmng_grade").combobox('textbox').focus();
			return;
		}
		else{
			var cmng_permit_hp = $("#cmng_permit_hp1").val()+'-'
								+$("#cmng_permit_hp2").val()+'-'
								+$("#cmng_permit_hp3").val();
			alert(cmng_permit_hp);
			$("#cmng_permit_hp").attr('value',cmng_permit_hp);
		} 
		//url 보내기
		$('#form_join').attr("method","post");
		$('#form_join').attr("action","/company/join.ch4?"); //전송을 하는 곳.
		$('#form_join').submit(); 
	}
	//아이디 중복 체크
	
	function checkid() {
		var id = $("#cmng_id").val();
		if($('#idcheck').text()=='※중복검사.'){
			$.ajax({
				method : 'get',
				url : '/company/isExistID.ch4?cmng_id=' + id,
				dataType : "text",
				success : function(data) {
					alert(data);
					if (data == "사용 가능한 아이디입니다.") {
						$('#idcheck').html(data);
						$('#id_check').attr('value', 'checked');
						$("#cmng_pw").textbox('textbox').focus();
						return;
					} else {
						$('#idcheck').html(
								'<span style="color:red;">' + data + '</span>');
						$('#id_check').attr('value', 'unchecked');
						$("#cmng_id").textbox('textbox').focus();
						$("#cmng_id").textbox('textbox').val('');
						return;
					}
				}
			});//////////end of ajax
		}
		else{
			alert('아이디 형식을 맞춰주세요...');
		}
	}
</script>
</head>
<body>
<%@ include file="../CommonForm/Top.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#combo_company").combobox({
			valueField: 'COM_NO',
			textField: 'COM_NAME',
			url: "/visitor/companyList.ch4",
			onChange:function(newValue){
				var com_name = $(this).textbox('getText');
				$("#com_name").attr("value",com_name);
				$("#combo_dept").combobox({
					valueField: 'DEPT_NO',
					textField: 'DEPT_NAME',
					url: "/visitor/deptList.ch4?com_no="+newValue
				});
			}
		});
		$("#cmng_id").textbox('textbox').blur(function(){
			if($("#cmng_id").val()==''){
				$("#cmng_id").textbox('textbox').focus();
				$('#idcheck').html('<span style="color:red;">※아이디를 입력해주세요.</span>');
			}
		});
		$("#cmng_id").textbox('textbox').keyup(function(){
			var id = $("#cmng_id").textbox('textbox').val();
		    var fid = id;
		    if(id.length>1){
			    fid = id.substring(0,1);
		    }
	        var fCheck = /^[0-9]/;
			if(fCheck.test(fid)){
				$('#idcheck').html('<span style="color:red;">※첫글자는 영문으로 입력</span>');
				return;
			}
			var idCheck = /^[a-zA-Z](?=.*[a-zA-Z])(?=.*[0-9]).{5,17}$/;
			if (idCheck.test($("#cmng_id").textbox('textbox').val())) {
				$("#idcheck").html("<span style='color:red;'>※중복검사.</span>");
	            return;
			}else {
	            $("#idcheck").html("<span style='color:red;'>※영문과 숫자조합으로 6~18자리 이내로 만들어주세요.</span>");
	            return;
			}   
		});
		//비밀번호와 비밀번호 확인 칸이 같은지 확인
		$("#re_cmng_pw").passwordbox('textbox').blur(function(){
            var pwd=$("#cmng_pw").textbox('textbox').val();
          	var rePwd=$("#re_cmng_pw").textbox('textbox').val();
	        if(rePwd!=pwd){//비밀번호 다르다면
	        	$("#pwcheck").html("<span style='color:red;'>※다시 확인해주세요.</span>");
	        	$("#cmng_pw").passwordbox('textbox').focus();
	        	$("#cmng_pw").passwordbox('setValue', '');
	        	$("#re_cmng_pw").passwordbox('setValue', '');
	        	return;
	        }else{
	        	$("#cmng_name").textbox('textbox').focus();
	        	$("#pwcheck").html("<span style='color:red;'></span>");
	        }
	    });
	});
</script>
<div class="container-fluid">
	<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
		<div class="row page-header" style="padding-top: 10px">
			<h1 class="text-center col-12 mb-0" style="padding-bottom: 20px;">JOIN</h1>
		</div>
		<div class="row">
			<div class="well col-lg-offset-2 col-lg-8 col-lg-offset-2">
				<div class="" align="center">
				<form id="form_join">
						<table>
							<tr>
								<th> 아이디 </th>
								<td colspan="2">
									<input id="cmng_id" name="cmng_id" class="tb_id easyui-textbox"
											prompt="아이디를 입력하세요.">
								</td>
								<td align="center">
									<input type="hidden" id="id_check" value="unchecked">
									<button id="btn_chekck" class="btn btn-danger"
											onClick="checkid()" type="button">
												중복검사
									</button>
								</td>
							</tr>
							<tr>
								<td></td>
								<td colspan="3">
									<div id="idcheck"></div>
								</td>
							</tr>
							<tr>
								<th>비밀번호 </th>
								<td colspan="3">
									<input id="cmng_pw" name="cmng_pw" class="tb easyui-passwordbox"
										   prompt="비밀번호를 입력하세요.">
								</td>
							</tr>
							<tr>
								<th>비밀번호 확인 </th>
								<td colspan="3">
									<input id="re_cmng_pw" name="re_cmng_pw" class="tb easyui-passwordbox" 
										   prompt="비밀번호를 다시  입력 해 주세요">
								</td>
							</tr>
							<tr>
								<td></td>
								<td colspan="3">
									<div id="pwcheck"></div>
								</td>
							</tr>
							<tr>
								<th>성명  </th>
								<td colspan="3">
									<input id="cmng_name" name="cmng_name" class="tb easyui-textbox"
										   prompt="이름을 입력해주세요">
								</td>
							</tr>
							<tr>
								<th>회사명</th>
								<td colspan="3">
									<select class="tb_combo easyui-combobox" id="combo_company" name="com_no"
									 data-options="panelHeight:'auto'">
										<option value="">회사명</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>부서명</th>
								<td colspan="3">
									<select class="tb_combo easyui-combobox" id="combo_dept" name="dept_no"
									 data-options="panelHeight:'auto'">
										<option value="">부서명</option>
									</select>
								</td>
							</tr>
							<tr align="left">
								<th>연락처 </th>
								<td id="hp1" colspan="3" >
									<input type="hidden" id="cmng_permit_hp" name="cmng_hp" > 
									<input id="cmng_permit_hp1" name="cmng_permit_hp" class="easyui-textbox"
										   prompt="010">
									<span>-</span>
									<input id="cmng_permit_hp2" class="easyui-textbox">
									<span>-</span>
									<input id="cmng_permit_hp3" class="easyui-textbox">
								</td>
							</tr>
							<tr>
								<th>등급 </th>
								<td colspan="3">
									 <select class="tb_combo easyui-combobox" name="cmng_grade" id="cmng_grade" 
									 		 data-options="panelHeight:'auto'">
							                <option value=""></option>
							                <option value="승인자">승인자</option>
							                <option value="안내데스크">안내데스크</option>
							             </select>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<div class="row" align="center" style="padding-top: 50px">
			<button id="btn_join" class="btn btn-primary" 
				    onClick="join()">
				        회원가입&emsp;<i class="fa fa-check spaceLeft"></i>
			</button>
		</div>
	</div>
</div>
</body>
</html>