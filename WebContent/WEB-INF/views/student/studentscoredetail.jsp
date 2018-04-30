<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>	

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">

<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/project.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
th {
	text-align:center;		
}
</style>

<script>
	$(document).ready(function() {
		
		$("div#modalForm").load("${contextPath}/modal.html");
		
		$('[data-toggle=popover').popover();	
		
		$("a#resetPw").on("click", function(){
			$("div#myPWFormModal").modal();
		});
	/* 
		data-toggle="modal"
			data-target="#myModal1" */
	});
</script>

<script>
window.onload = function () {
	
var chart = new CanvasJS.Chart("barChart", {
	animationEnabled: true,
	
	title:{
		text:"과목별 성적 그래프"
	},
	axisX:{
		interval: 1
	},
	axisY2:{
		interlacedColor: "rgba(211, 211, 211,.2)",
		gridColor: "rgba(211, 211, 211,.1)",
		title: "총점"
	},
	data: [{
		type: "bar",
		name: "과목",
		axisYType: "secondary",
		color: "#778899",
		dataPoints: [
			{ y: 100, label: "자바" },
			{ y: 90, label: "파이썬" }
		]
	}]
});
chart.render();
}
</script>

</head>
<body>
	<div class="container">
		<div class="container-fluid">
			<a href="${contextPath}/student/list"><img
				src="${contextPath}/resources/img/sist_logo.png" alt="sist_logo.png">성적
				관리 프로그램</a>
			<ul class="nav navbar-nav navbar-right">

				<li><a href="${contextPath}/student/list"><span class="glyphicon glyphicon-user"></span>
						[수강생]님이 로그인 했습니다</a></li>
				<li><a id = "resetPw" href="#"><span class="glyphicon glyphicon-wrench"></span>
						비밀번호변경</a></li>
				<li><a href="${contextPath}/login/logoutform"><span class="glyphicon glyphicon-log-out"></span>
						로그아웃</a></li>
			</ul>
		</div>

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header"></div>
				<ul class="nav navbar-nav">
					<li><a href="${contextPath}/student/list">홈</a></li>
					<li class="active"><a href="${contextPath}/student/studentscore">성적 조회</a></li>
				</ul>
			</div>

			<div class="container-fluid" style="background-color: black;">
				<p style="color: white; margin-top: 10px;">
					<a id = "navi" href="${contextPath}/student/list">홈 </a> > <a id = "navi" href="${contextPath}/student/studentscore">성적 조회</a>  > <a id = "navi" href="${contextPath}/student/studentscoredetail">성적 상세보기</a>
				</p>
			</div>
		</nav>

		<div class="infoboard">
			<div class="panel panel-default">
				<div class="panel-body" style="text-align: center;">
					<h4>[OCO001] JAVA를 응용한 사물인터넷 IOT 개발자 양성과정 (2018-01-01 ~
						2018-06-30)</h4>
				</div>
			</div>
			<table class="table table-bordered text-center" >
				<thead>
					<tr class="active">
						<th>no</th>
						<th>과목코드</th>
						<th>과목명</th>
						<th>기간</th>
						<th>교재명</th>
						<th>강사명</th>
						<th>출결배점</th>
						<th>출결점수</th>
						<th>실기배점</th>
						<th>실기점수</th>
						<th>필기배점</th>
						<th>필기점수</th>
						<th>시험날짜</th>
						<th>시험문제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>SUB001</td>
						<td>자바</td>
						<td>2017-11-01~<br>2018-01-01
						</td>
						<!-- data-toggle 부분에 회원 번호, ISBN 넣어야 함. -->
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="<img src='${contextPath}/resources/pictures/ajax_book.jpg' style = 'width:100%; height:30%;'>">
								이것이 자바다</a></td>
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="<img src='${contextPath}/resources/pictures/avatar.png' style = 'width:100%; height:30%;'>">이민종</a></td>
						<td>70</td>
						<td>70</td>
						<td>10</td>
						<td>10</td>
						<td>20</td>
						<td>20</td>
						<td>2017-11-03</td>
						<td><a href="#">java1.zip</a></td>
					</tr>
					<tr>
						<td>1</td>
						<td>SUB002</td>
						<td>파이썬</td>
						<td>2017-11-01~<br>2018-01-01
						</td>
						<!-- data-toggle 부분에 회원 번호, ISBN 넣어야 함. -->
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="<img src='${contextPath}/resources/pictures/ajax_book2.jpg' style = 'width:100%; height:30%;'>">점프
								투 파이썬</a></td>
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="<img src='${contextPath}/resources/pictures/avatar.png' style = 'width:100%; height:30%;'>">이민종</a></td>
						<td>70</td>
						<td>70</td>
						<td>10</td>
						<td>0</td>
						<td>20</td>
						<td>20</td>
						<td>2017-11-03</td>
						<td><a href="#">java1.zip</a></td>
					</tr>
				</tbody>
			</table>
			
			<!--그래프 나타날 영역.-->
			<div id="barChart" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
			
		</div>
	</div>
	
	<div id = "modalForm">
		
	</div>
	<script src="${contextPath}/resources/script/canvasjs.min.js"></script>
</body>

</html>