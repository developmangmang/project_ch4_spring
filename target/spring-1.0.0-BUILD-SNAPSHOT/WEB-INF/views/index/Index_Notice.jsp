<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	
%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8"> 
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<title>공지사항 - CH4 방문/반입 자동화 시스템</title>
<!-- Link Import --> 
<%@ include file="../../Style/common/HeadUI.jsp"%> 
<style type="text/css">
	h2 {
		text-align: left;
		padding-left: 20px;
		border-left: solid 7px;
		color: black;
 	}
	.banner_Content {
		margin-top: 0px;
		padding-top: 10px;
		height: 300px;
		background-image: url('${host}/resources/Style/images/banner/banner_top.jpg');
	}
	
	.jumbotron_Content a{
		font-size: 25px;
	}
	.Content_title h1{
		padding-top: 12px;
		padding-bottom: 12px;
	    border-width: thick;
	    margin-bottom: -10px;
	}
	.modal-head{
	    padding: 30px;
    	border-bottom: groove;
    	background-color: aliceblue;
	}
</style>
</head>
<body>
<script type="text/javascript">
var grade;
	$(document).ready(function(){
		$("#tb_notice").bootstrapTable({
			columns:[
		        {field:'N_NO',title:'글번호'}
		        ,{field:'N_TITLE',title:'제목'}
		        ,{field:'N_DATE',title:'작성일'}
		        ,{field:'N_FILE',title:'첨부파일'}
		        ,{field:'N_WRITER',title:'작성자'}
		        ,{field:'N_HIT',title:'조회수'}
		        ,{field:'N_CONTENT',visible:false}
		        ,{field:'N_GRADE',visible:false}
		   ]
			,url:'/index/noticeList.ch4'
			,pagination:'true'//페이지 네이션
			,paginationPreText:"Previous"
			,paginationNextText:"Next"
			,pageSize:5//기본 페이지 사이즈
			,pageList:[5, 10, 15, 20] //칸수
			,onClickRow:function(row,$element,field){
				//$element.attr('data-index',10)
				$element.toggleClass('single-select');//로우 클릭했을 때 색 변함.
	 			$("#n_title").text(row.N_TITLE);
	 			$("#n_date").text(row.N_DATE);
	 			$("#n_writer").text(row.N_WRITER);
	 			$("#n_content").textbox('setValue',row.N_CONTENT);
	 			$("#n_file").textbox('setValue',row.N_FILE);
	 			$("#n_hit").text(row.N_HIT); 
	 			grade = row.N_GRADE;
	 			if(grade!=null){
	 				var img = "<img src='${host}/resources/Style/images/write-board.png' style='margin-right: 20px;' >";
	 				$("#td_grade").html(img);
	 			}
 				
				$("#DetailNotice").modal('show');
			 }
		});////////////////end of bootstrapTable
	});
</script>
<script type="text/javascript">
	//검색하기
	function NoticeList(){
		var cb_search = $("#cb_search").val();
		var tb_search = $("#tb_search").val();
		 $("#tb_notice").bootstrapTable({
			url:"/index/noticeList.ch4?cb_search="+cb_search+"&tb_search="+tb_search
		}); 
	}////////////////////////end of NoticeList
	
	
</script>
	<!-- 미결과제 : 사진선택 디자인을 다시해야한다 게시판 형식 작성 -->
<!-- Top -->	<!-- 선택된 페이지 class : nav-item active // 나머지 페이지: nav-item -->
<%@ include file="../CommonForm/Top.jsp"%>
<!-- Banner -->
	<section class="banner_Content">
		<div class="jumbotron_Content">
			<div class="container_Banner_Content col-lg-offset-2 col-lg-3 col-lg-7" style="color: white;">
				<div class="row Content_title">
					<h1 style="font-size:60px; text-shadow: 4px 2px 2px gray; margin-top: 70px;">공지사항</h1><br>
				</div>
				<div class="row page_link" style="padding-left: 5px;">
					<a href="Index_Main.jsp">Home</a> → <a href="Index_Notice.jsp">Notice</a>
				</div>
			</div>
		</div> 
	</section>
	

<!-- 공지사항 게시판 -->
<div align="center">
	<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
	<div style="margin-top: 30px;"></div>
		<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
			<div class="row">
				<div class="well" style="margin-top: 10px;">
					<form>
						<div class="row" align="left" style="margin-left: 60px;">
							<label style="margin-right: 30px;">Search</label>
							<select id="cb_search" name="cb_search" class="easyui-combobox" panelHeight="auto" style="width:200px">
								<option selected value="">선택</option>    	
								<option value="n_title">제목</option>    	
								<option value="n_content">내용</option>    	
								<option value="n_writer">작성자</option>    	
					    	</select>
							  &ensp;&ensp;&ensp;
							<input class="easyui-textbox" id="tb_search" name="tb_search" style="width:400px;">
							<button onClick="javascript:NoticeList()" class="btn btn-info" id="btn_search" 
									style="height: 30px;margin-left: 17px;">
								검색
							</button>
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<table class="table table-bordered table-hover" id="tb_notice" >
					<thead style="background-color: #e1f1fd;">
						<tr>
							<td id="n_no" data-field="n_no" width="10%">NO</td>
							<td id="n_title" data-field="n_title" width="40%">TITLE</td>
							<td id="n_date" data-field="n_date" width="10%">DATE</td>
							<td id="n_writer" data-field="n_writer" width="20%">WRITER</td>
							<td id="n_hit" data-field="n_hit" width="10%">HIT</td>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</div>
<!-- 공통 Footer -->
<%@ include file="../CommonForm/Footer.jsp"%>
<!-- 상세조회 모달 창 -->
<div class="modal fade" id="DetailNotice" role="dialog">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<form id="f_Detail">
				<div class="modal-head" style="padding-top: 50px;">
					<table style="margin-left: 38px; margin-bottom: 20px;">
						<tr style="width:700px;">
							<td id="td_grade" style="width: auto"></td>
							<td id="n_title" name="n_title" style="width: auto;font-size: 30px; margin-right: 30px;">
							</td>
						</tr>
					</table>
					<table style="margin-left: 38px;">
						<tr>
							<td style="width:580px; font-size: 20px;" value="n_writer" id="n_writer" name="n_writer"> 
							</td>
							<td style="display: flex;">
								<p id="date" style="margin: 4px 10px;">작성일 : 
								<span value="n_date" id="n_date" name="n_date"
								   	style="width:auto; font-size: 13px;"></span></p>
							</td>
							<td>
								<img src='${host}/resources/Style/images/open-eye.png' style='margin-right: 5px;' >
								<span class="badge" value="n_hit" id="n_hit" name="n_hit" ></span>
							</td>
						</tr>
					</table>
				</div>
					<!-- Modal body -->
				<div class="modal-body" style="margin-left: 70px; ">
					<div class="row">
						<input class="easyui-textbox" style="width: 750px; height: 300px; padding: 15px; " multiline="true"
							   id="n_content" name="n_content" readonly="readonly">
					</div>
					<div class="row" style="margin-top: 10px;">
						<input class="easyui-textbox" id="n_file" name="n_file" 
							   style="margin-left: 50px; width: 600px; padding-left: 15px;" readonly="readonly">
					</div>
				</div>
					<!-- Modal footer -->
				<div class="modal-footer" style="margin-right: 61px;">
					<button role="button" class="btn btn-danger" id="closeDetail" name="closeDetail"  data-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>