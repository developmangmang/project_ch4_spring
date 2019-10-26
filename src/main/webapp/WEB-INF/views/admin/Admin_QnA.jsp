<%@page import="java.util.Map, java.util.HashMap"%>
<%@page import="java.util.List, java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<Map<String,Object>> qnaList = null;
	qnaList = (List<Map<String,Object>>)request.getAttribute("qnaList");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<%@ include file="../CommonForm/TapLogo.jsp"%>
<!-- Link Import --> 
<%@ include file="../../Style/common/HeadUI.jsp"%> 
<title>관리자 QnA - CH4 방문/반입 자동화 시스템</title>
<script type="text/javascript">
	//답변 보내기 
	function sendAnswer(index){
		var content = $("#content"+index).textbox().val();
		if(content==""){//답변 작성이 없을때
			alert("답변을 작성해 주세요.");
		}else{//답변을 작성했을때
			$('#a_content'+index).attr('value',content);
			$('#sendAnswer'+index).attr("method","post");
			$('#sendAnswer'+index).attr("action","/admin/sendAnswer.ch4"); //전송을 하는 곳.
			$('#sendAnswer'+index).submit(); 
		}
		
	}
	//더보기 눌렀을 때 새로운 리스트 호출
	function moreView(){
		//rno = 리스트를 불러올 때 시작 값.
		rno = $(".panel-heading").length+1;//현재 화면에 있는 패널의 길이 만큼 구한것.
			$.ajax({
			url : 'admin/qnaList.ch4&rno='+rno
					//이 url에서 연결될 화면이 qnaList.jsp임.
			,method:'get'
			,success:function(data){
				alert(data);
				$('#moreList').append(data);				
			}
		});
	}
</script>
<style type="text/css">
	h3 {
		padding-left: 3%;
		border-left: solid 7px;
		color: black;
	}
	.panel-success {
	    background-color: #dff0d8;
	}
</style>
</head>

<body>
<%@ include file="../CommonForm/Top.jsp"%>

<div class="container">
	<div class="col-lg-offset-1 col-lg-10 col-lg-offset-1">
		<div class="row">
      		<h3>Q&A</h3>
		</div>
		<!-- 내용 부분 -->
	 	<div class="row" style="margin-bottom: 20px;">
			<div id="panel" class="panel panel-success" >
				<!-- 본문 내용 -->
<%
	if(qnaList.size()>0 && qnaList != null){
		for(int i=0;i<qnaList.size();i++){
%>
				<div class="panel-heading" align="left">
					<div class="row">
						<div class="col-lg-8">
							<h5><%=qnaList.get(i).get("Q_TITLE") %></h5>
						</div>
						<div class="col-lg-2">
							<h5><%=qnaList.get(i).get("Q_WRITER")%></h5>
						</div>
						<div class="col-lg-2">
							<h5><%=qnaList.get(i).get("Q_DATE")%></h5>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-offset-0.3 col-lg-10">
							<h4><%=qnaList.get(i).get("Q_CONTENT")%></h4>
						</div>
					</div>
					<div class="row" align="right" style="margin-right: 20px;">
						<button class="btn btn-warning" data-toggle="collapse" data-target="#writeAnswer<%=i%>">답변 쓰기</button>
					</div>
				</div>
				<!-- 댓글내용 -->
				<div class="collapse" id="writeAnswer<%=i%>">
				<form id="sendAnswer<%=i %>">
					<input type="hidden" id="qno" name="q_no" value="<%= qnaList.get(i).get("Q_NO") %>">
					<input type="hidden" name="q_email" value="<%=qnaList.get(i).get("Q_EMAIL") %>">
					<input type="hidden" name="q_title" value="<%=qnaList.get(i).get("Q_TITLE") %>">
					<input type="hidden" id="a_content<%=i %>" name="a_content">
					<div class="panel-body">
						<h5>댓글 내용</h5>
						<textarea class="easyui-textbox" placeholder="답변을 입력해주세요." 
							 		  id="content<%=i %>"
							 		  style="height:100px; width: 900px;"></textarea>
					</div>
					<div class="panel-footer">
						<button class="btn btn-danger" type="button" onClick="sendAnswer(<%=i %>)">답변 보내기</button>
					</div>
				</form>
				</div>
				<!-- 댓글 내용 끝. -->
<%			
		}
	}
%>
		<div id="moreList"></div>
      		</div>
		<!-- 내용 부분  끝-->
		<!-- 더보기 -->
		<div align="center">
			<button class="btn btn-default" type="button" onclick="moreView()">더 보 기</button>
		</div>
    	</div>
	</div>
</div>
</body>
</html>