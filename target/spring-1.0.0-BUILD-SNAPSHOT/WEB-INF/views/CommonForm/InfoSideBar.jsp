<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String cmng_id = "null";
	String cmng_name = "null";
	String com_no = "null";
	String com_name = "null";
	String dept_name = "null";
	if (null != request.getSession().getAttribute("sMap")) {
		Map<String, Object> sMap = (Map<String, Object>) request.getSession().getAttribute("sMap");
		cmng_id = (String) sMap.get("cmng_id");
		cmng_name = (String) sMap.get("cmng_name");
		com_no = (String) sMap.get("com_no");
		com_name = (String) sMap.get("com_name");
		dept_name = (String) sMap.get("dept_name");
	}
%>
<style>
	/* 사이드바 설정 */
	aside {
	    width: 200px;
	    height: 100%;
	    position: fixed;
	    background-color: #D9EDF7;
	    overflow: auto;
	}
	/* 사이드바 overflow 시 스크롤바 안보이게 하기 */
	aside::-webkit-scrollbar { 
	    display: none; 
	}
	#info {
		text-align: center;
		margin-top: 20px;
		margin-bottom: 10px;
		padding-bottom: 10px;
		border-bottom: 1px solid #E9D4F9;
	}
	#pg_side .panel-info {
		border: 0px;
		background: rgba(0,0,0,0.0);
	}
	#pg_side .panel-info .panel-heading {
		color: #000000;
		background: rgba(0,0,0,0.0);
	}
	#pg_side .panel-info .panel-body {
		padding-top: 5px;
		padding-bottom: 5px;
		border: 0px;
		color: #000000;
		background: rgba(0,0,0,0.0);
	}
	#pg_side .panel-info .panel-body a {
		margin-left: 20px;
		color: #000000;
	}
	#btn_logout {
		width: 90%;
		height: 40px;
		background-color: #337AB7;
		color: #ffffff;
		border: 0px;
		padding: 0px;
		border-radius: 10px;
	}
</style>
<script>
	function logout(){
		location.href = '/company/logout.ch4';
	}
</script>
<aside>
	<div id="info">
		<h4><b><%=com_name %></b></h4>
		<h5><b><%=dept_name %></b></h5>
		<h4><b><%=cmng_name %></b>(님)</h4>
		<button id="btn_logout" type="button" onClick="logout()">로그아웃</button>
	</div>
	<div id="pg_side" class="panel-group">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/info/info_main.ch4">
					<i class="fa fa-home" aria-hidden="true"></i>메인페이지</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/info/logVisitor.ch4">
					<i class="fa fa-list-alt" aria-hidden="true"></i>방문자현황관리</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/info/logGoods.ch4">
					<i class="fa fa-truck" aria-hidden="true"></i>반입현황관리</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/info/totalManage.ch4">
					<i class="fa fa-search-plus" aria-hidden="true"></i>종합 관리</a>
				</h4>
			</div>
		</div>
	</div>
</aside>