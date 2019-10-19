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
<title>Admin_info</title>
<style type="text/css">
	.table thead{
		background-color: #337ab7;
		color: white;
	}
	
	.nav-link{
		font-size: 20px;
	}
	
	#side-bar{
		height: 1000px;
	}
</style>
<script type="text/javascript">
	function moveQnA(){
		alert("여기");
		location.href="admin/qnaBoard.ch4";
	}

</script>
</head> 
<body>
<script type="text/javascript">
	$(document).ready(function(){
		 jQuery.fn.bootstrapTable.columnDefaults.halign="center"
		$("#admin_info").bootstrapTable({
			columns:[
		        {field:'com_name',title:'회사명', width:'30', widthunit:'px'}
		        ,{field:'com_reg_date',title:'가입일',width:'100', widthunit:'px'}
		        ,{field:'com_addr',title:'주소',width:'200', widthunit:'px'}
		        ,{field:'com_hp',title:'전화번호',width:'150', widthunit:'px'}
		        ,{field:'com_type',title:'업종',width:'100', widthunit:'px'}
		        ,{field:'com_card_use',title:'출입증<br>사용여부',width:'50', widthunit:'px'}
		        ,{field:'com_bizno',title:'사업자번호',width:'150', widthunit:'px'}
		   ]
			,search:'true'
			//,url:'/project_ch4_pojo/View/Test/jsonAdminInfoList.json'
			,url:'admin/adminInfo.ch4'
			,pagination:'true'//페이지 네이션
			,paginationPreText:"Previous"
			,paginationNextText:"Next"
			,pageSize:5//기본 페이지 사이즈
			,pageList:[5, 10, 15, 20] //칸수
		});
	});
</script>
<%@ include file="../CommonForm/Top.jsp"%>
<div class="container-fluid">
	<div class="col-lg-2" style="background-color: black; "id="side-bar">
		<div class="sidebar bg-light">
			<div class="sidebar-sticky" style="margin-top: 140px;">
				<ul class="nav flex-column">
					<li class="nav-item">
			            <a class="nav-link" href="#">
			              <span data-feather="file"></span>
							고객정보관리
			            </a>
					</li>
					<li class="nav-item">
			            <a class="nav-link" href="javascript:moveQnA()">
			              <span data-feather="file"></span>
			              	QnA
			            </a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-lg-10" style="padding-left: 50px;padding-right: 50px;">
		<div class="row" style="margin-bottom: 20px;">
			<h1 style="font-weight: bold;">고객 정보 관리</h1>
		</div>
		<div class="row">
			<table id="admin_info" class="table"></table>
		</div>
	</div>
</div>
</body>
</html>