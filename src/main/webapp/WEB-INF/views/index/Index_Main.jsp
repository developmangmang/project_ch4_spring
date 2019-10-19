<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Web icon 설정 --> 
<title>안내관리인 메인 페이지</title>
<!-- 공통코드 -->
<%@ include file="../../Style/common/HeadUI.jsp"%>
<style>
figure.snip1200 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  margin: 10px;
  min-width: 220px;
  max-width: 310px;
  max-height: 310px;
  width: 100%;
  background: #000000;
  color: #ffffff;
  text-align: center;
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.15);
  font-size: 16px;
}
figure.snip1200 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.45s ease-in-out;
  transition: all 0.45s ease-in-out;
}
figure.snip1200 img {
  max-width: 100%;
  position: relative;
  opacity: 0.9;
}
figure.snip1200 figcaption {
  position: absolute;
  top: 45%;
  left: 7%;
  right: 7%;
  bottom: 45%;
  border: 1px solid white;
  border-width: 1px 1px 0;
}
figure.snip1200 .heading {
  overflow: hidden;
  -webkit-transform: translateY(50%);
  transform: translateY(50%);
  position: absolute;
  bottom: 0;
  width: 100%;
}
figure.snip1200 h2 {
  display: table;
  margin: 0 auto;
  padding: 0 10px;
  position: relative;
  text-align: center;
  width: auto;
  text-transform: uppercase;
  font-weight: 400;
}
figure.snip1200 h2 span {
  font-weight: 800;
}
figure.snip1200 h2:before,
figure.snip1200 h2:after {
  position: absolute;
  display: block;
  width: 1000%;
  height: 1px;
  content: '';
  background: white;
  top: 50%;
}
figure.snip1200 h2:before {
  left: -1000%;
}
figure.snip1200 h2:after {
  right: -1000%;
}
figure.snip1200 p {
  top: 50%;
  -webkit-transform: translateY(-50%);
  transform: translateY(-50%);
  position: absolute;
  width: 100%;
  padding: 0 20px;
  margin: 0;
  opacity: 0;
  line-height: 1.6em;
  font-size: 0.9em;
}
figure.snip1200 a {
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  position: absolute;
  z-index: 1;
}
figure.snip1200:hover img,
figure.snip1200.hover img {
  opacity: 0.25;
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}
figure.snip1200:hover figcaption,
figure.snip1200.hover figcaption {
  top: 7%;
  bottom: 7%;
}
figure.snip1200:hover p,
figure.snip1200.hover p {
  opacity: 1;
  -webkit-transition-delay: 0.35s;
  transition-delay: 0.35s;
}
	/* 사이드바 설정 */
	aside {
	    width: 15%;
	    height: 100%;
	    position: fixed;
	    background-color: rgb(14,30,43);
	    overflow: auto;
	}
	/* 사이드바 overflow 시 스크롤바 안보이게 하기 */
	aside::-webkit-scrollbar { 
	    display: none; 
	}
	/* 메인 페이지 프레임 구간 설정 */
	.mainContent {
		margin:20px 20px 10px 17%;
	}
	#Main_head{
		background-image: url('/project_ch4_pojo/Style/images/crud/index_images.png');
		margin-left:7%;
		margin-top:35px;
		text-align: center;
		height: 300px;
		
	}
	#Main_title{
		background-color:rgba(223,223,223,0.7);
		margin: 70px 30px 50px 30px;
		padding: 30px;
		vertical-align: middle;
	}
</style>
<script type="text/javascript">
	function moveMain(){
		alert("여기");
		location.href="index/indexMain.ch4";
	}
	function MoveCustomerSupport(){
		alert("여기");
		location.href="index/customerSupport.ch4";
	}
	function MoveQuestion(){
		alert("여기");
		location.href="index/question.ch4";
	}
	function MoveAskJoin(){
		alert("여기");
		location.href="index/askJoin.ch4";
	}
	function MoveStory(){
		alert("여기");
		location.href="index/story.ch4";
	}
	$(".hover").mouseleave(
		function () {
			$(this).removeClass("hover");
		}
	);

</script>
</head>
<body>
<%@ include file="../CommonForm/Top.jsp"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-2">
		<!-- Side Bar -->
		<aside>
			<div class="panel-group" style="margin-top:90px">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a href="#" onClick="moveMain()">
							<i class="fa fa-home" aria-hidden="true"></i>메인페이지</a>
						</h4>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" href="#collapse1">
							<i class="fa fa-users" aria-hidden="true"></i>고객지원</a>
						</h4>
					</div>
					<div id="collapse1" class="panel-collapse collapse in">
						<div class="panel-body">
							<a  href="#" onClick="MoveCustomerSupport()">
							<i class="fa fa-search-plus" aria-hidden="true"></i>고객지원</a><br> 
							<a  href="#" onClick="MoveQuestion()">
							<i class="fa fa-search-plus" aria-hidden="true"></i>안내 공지</a><br> 
							<a  href="#" onClick="MoveAskJoin()">
							<i class="fa fa-list-alt" aria-hidden="true"></i>가입문의</a><br> 
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a href="#" onClick="MoveStory()">
							<i class="fa fa-home" aria-hidden="true"></i>개발스토리</a>
						</h4>
					</div>
				</div>
			</div>
		</aside>
	</div>
	<div class="col-lg-9">
		<div class=" row Main_head">
			<div align="center" style="margin-top: 50px;">
				<h1 style=" font-weight: bold;" >CH4</h1>
				<h3><font style="color: #5a5a5a; ">This is the Customer Support page.</font></h3>
				<p style="width: 500px;">
					<font style="color: gray;">This is a service page for the customer.-You can use services such as announcements, 
						  1:1 questions, and more.<br>
						  You can move using the menu at the bottom.
					</font>
				</p>
			</div>
			<div class="row" style="margin-left:7%" id="Main_title">
		    	<div class="container">
			        <!-- Portfolio Item 1 -->
			        <div class="col-md-6 col-lg-3">
						<figure class="snip1200">
							<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg" alt="sq-sample27" />
							<figcaption>
								<p>서비스에 대한 공지를 보실 수 있습니다.</p>
								<div class="heading">
									<h2> <span> 고객 지원 </span> </h2>
								</div>
							</figcaption>
							<a href="#"></a>
						</figure>
					</div>
			        <!-- Portfolio Item 2 -->
			       	<div class="col-md-6 col-lg-3">
						<figure class="snip1200">
							<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg" alt="sq-sample27" />
							<figcaption>
								<p>ch4가 제공하는 서비스에 대한 질문을 남기기는 곳입니다.</p>
								<div class="heading">
									<h2> <span> Question </span> </h2>
								</div>
							</figcaption>
							<a href="#" onClick="MoveQuestion()"></a>
						</figure>
			        </div>
			        <!-- Portfolio Item 3 -->
					<div class="col-md-6 col-lg-3">
						<figure class="snip1200">
							<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg" alt="sq-sample27" />
							<figcaption>
								<p>서비스 가입에 대한 질문을 할 수 있는 곳입니다.</p>
								<div class="heading">
									<h2> <span>가입문의</span> </h2>
								</div>
							</figcaption>
							<a href="#"></a>
						</figure>
					</div>
			           <!-- Portfolio Item 4 -->
					<div class="col-md-6 col-lg-3">
						<figure class="snip1200">
							<img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sq-sample27.jpg" alt="sq-sample27" />
							<figcaption>
								<p>개발에 대한 내용을 보실 수 있습니다.</p>
								<div class="heading">
									<h2> <span>Story</span> </h2>
								</div>
							</figcaption>
							<a href="#"></a>
						</figure>
					</div>
		        </div>
		  	</div>
		</div>
	</div>
</div>



  
 
<!-- 공통 Footer -->
<%@ include file="../CommonForm/Footer.jsp"%>
</body>
</html>