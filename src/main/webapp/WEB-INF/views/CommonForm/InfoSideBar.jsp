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
	    width: 15%;
	    height: 100%;
	    position: fixed;
	    background-color: rgba(49,49,49, 0.9);
	    overflow: auto;
	}
	/* 사이드바 overflow 시 스크롤바 안보이게 하기 */
	aside::-webkit-scrollbar { 
	    display: none; 
	}
	#imglogo {
		height: 100px;
		margin-top: 30px;
		border-radius: 30px;
   }
	#info {
		text-align: center;
		margin-top: 20px;
		margin-bottom: 10px;
		padding-bottom: 10px;
		border-bottom: 1px solid #274f5a;
	}
	#head_font {
		font-weight: 500;
		font-family: font-family: Spoqa Han Sans, Sans-serif;
		color: #f6f3ee;
   }
	#pg_side .panel-info {
		border: 0px;
		background: rgba(0,0,0,0.0);
		padding: 5px;
	}
	#pg_side .panel-info .panel-heading {
		color: #f6f3ee;
		background: rgba(0,0,0,0.0);
	}
	#pg_side .panel-info .panel-heading a {
		font-size: x-large;
	}
	#pg_side .panel-info .panel-body {
		padding-top: 5px;
		padding-bottom: 5px;
		border: 0px;
		color: #f6f3ee;
		font-size:large;
		background: rgba(0,0,0,0.0);
	}
	#pg_side .panel-info .panel-body a {
		margin-left: 20px;
		color: #f0f0f0;
	}
	#btn_logout {
		width: 90%;
		height: 40px;
		background-color: #4a96ad;
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
	<div align="center">
		<img src="${host}/resources/Style/images/logo/search2.png" id="imglogo">
	</div>
	<div id="info">
		<h2 id="head_font"><%=com_name %></h4>
		<h4 id="head_font"><%=dept_name %></h5>
		<h3 id="head_font"><%=cmng_name %>(님)</h4>
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
					<i class="fa fa-list-alt" aria-hidden="true"></i>방문현황조회</a>
				</h4>
			</div>
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="/info/logGoods.ch4">
					<i class="fa fa-truck" aria-hidden="true"></i>반입현황조회</a>
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