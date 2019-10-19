<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> qnaList =(List<Map<String,Object>>)request.getAttribute("qnaList");
	
 %>
<!DOCTYPE html>
<%
if(qnaList != null){
	for(int i=0;i<qnaList.size();i++){
		

%>
	<div class="panel-heading panel-success" align="left" >
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
	<button class="btn btn-warning" data-toggle="collapse" data-target="#writeAnswer<%= qnaList.get(i).get("Q_NO")%>">답변 쓰기</button>
		</div>
	</div>
	<!-- 댓글내용 -->
	<div class="collapse" id="writeAnswer<%=qnaList.get(i).get("Q_NO")%>">
		<form id="sendAnswer">
			<div class="panel-body">
				<h5>댓글 내용</h5>
				<textarea class="easyui-textbox" placeholder="답변을 입력해주세요." 
					 		  id="a_content" name="a_content"
					 		  style="height:100px; width: 900px;">
				</textarea>
			</div>
			<div class="panel-footer">
				<button class="btn btn-danger" onClick="sendAnswer(<%=qnaList.get(i).get("Q_NO") %>)">답변 보내기</button>
			</div>
		</form>
	</div>
<%
	}
}
%>
