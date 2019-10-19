<%@page import="java.util.Map, java.util.HashMap"%>
<%@page import="java.util.List, java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
/*  	List<Map<String,Object>> qnaList = new ArrayList<>();
	Map<String, Object> pMap = new HashMap<>();
	pMap.put("Q_NO","1");
	pMap.put("Q_TITLE","q_title1");
	pMap.put("Q_CONTENT","q_content1");
	pMap.put("Q_DATE","q_date1");
	pMap.put("Q_EMAIL","q_email1");
	pMap.put("Q_WRITER","q_writer1");
	qnaList.add(pMap);
	pMap = new HashMap<>();
	pMap.put("Q_NO","2");
	pMap.put("Q_TITLE","q_title2");
	pMap.put("Q_CONTENT","q_content2");
	pMap.put("Q_DATE","q_date2");
	pMap.put("Q_EMAIL","q_email2");
	pMap.put("Q_WRITER","q_writer2");
	qnaList.add(pMap); 
	pMap = new HashMap<>();
	pMap.put("Q_NO","3");
	pMap.put("Q_TITLE","q_title3");
	pMap.put("Q_CONTENT","q_content3");
	pMap.put("Q_DATE","q_date3");
	pMap.put("Q_EMAIL","q_email3");
	pMap.put("Q_WRITER","q_writer3");
	qnaList.add(pMap); 
	pMap = new HashMap<>();
	pMap.put("Q_NO","4");
	pMap.put("Q_TITLE","q_title4");
	pMap.put("Q_CONTENT","q_content4");
	pMap.put("Q_DATE","q_date4");
	pMap.put("Q_EMAIL","q_email4");
	pMap.put("Q_WRITER","q_writer4");
	qnaList.add(pMap); 
	pMap = new HashMap<>();
	pMap.put("Q_NO","5");
	pMap.put("Q_TITLE","q_title5");
	pMap.put("Q_CONTENT","q_content5");
	pMap.put("Q_DATE","q_date5");
	pMap.put("Q_EMAIL","q_email5");
	pMap.put("Q_WRITER","q_writer5");
	qnaList.add(pMap);  */
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
<title>Insert title here</title>
<script type="text/javascript">
	//답변 보내기 
	function sendAnswer(){
		var content = $("#a_content").val();
		if(content==""){//답변 작성이 없을때
			alert("답변을 작성해 주세요.");
		}else{//답변을 작성했을때
			$('#sendAnswer').attr("method","post");
			$('#sendAnswer').attr("action","admin/sendAnswer.ch4"); //전송을 하는 곳.
			$('#sendAnswer').submit(); 
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
				<form id="sendAnswer">
					<input type="hidden" id="qno" name="qno" value="<%= qnaList.get(i).get("Q_NO") %>">
					<div class="panel-body">
						<h5>댓글 내용</h5>
						<textarea class="easyui-textbox" placeholder="답변을 입력해주세요." 
							 		  id="a_content" name="a_content"
							 		  style="height:100px; width: 900px;"></textarea>
					</div>
					<div class="panel-footer">
						<button class="btn btn-danger" type="button" onClick="sendAnswer()">답변 보내기</button>
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
<%@ include file="../CommonForm/Footer.jsp"%>
</body>
</html>