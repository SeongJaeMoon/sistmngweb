<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SIST_쌍용교육센터</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/project.css">

<style>
th{
	text-align:center;
}

</style>
<!-- Google Map API -->
<script src="https://maps.googleapis.com/maps/api/js"></script>

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		$("div#modalForm").load("${contextPath}/modal.html");

		$("a#resetPw").on("click", function() {
			$("div#myPWFormModal").modal();
		});
	});
</script>

</head>
<body>

	<div class="container">

		<div class="container-fluid">
			<a href="${contextPath}/admin/list"><img src="${contextPath}/resources/img/sist_logo.png"
				alt="sist_logo.png">성적 관리 프로그램</a>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${contextPath}/adminmain.jsp"><span
						class="glyphicon glyphicon-user"></span> [관리자]님이 로그인 했습니다</a></li>
				<li><a id="resetPw" href="#"><span
						class="glyphicon glyphicon-wrench"></span>비밀번호변경</a></li>
				<li><a href="${contextPath}/logoutform.jsp"><span
						class="glyphicon glyphicon-log-out"></span>로그아웃</a></li>
			</ul>
		</div>

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header"></div>
				<ul class="nav navbar-nav">
					<li class="active"><a
						href="${contextPath}/admin/list">홈</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">기초정보관리 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${contextPath}/admin/basiccourselist">과정 관리</a></li>
							<li><a href="${contextPath}/admin/subjectlist">과목 관리</a></li>
							<li><a href="${contextPath}/admin/classlist">강의실 관리</a></li>
							<li><a href="${contextPath}/admin/booklist">교재 관리</a></li>
						</ul>
					<li><a
						href="${contextPath}/admin/inst/inslist">강사계정관리</a></li>
					<li><a href="${contextPath}/admin/courselist">개설과정
							&amp; 과목관리</a></li>
					<li><a href="${contextPath}/admin/sutentlist">수강생관리</a></li>
				</ul>
			</div>
		</nav>

		<div class="container-fluid">
			<div class="col-sm-6">
				<h4>최근 추가된 수강생 목록</h4>
				<table class="table table-bordered text-center">
					<thead>
						<tr>
						  <th>회원번호</th>
						  <th>수강생명</th>
						</tr>
					</thead>	
					<tbody>
						<tr>
						 <td>MEM001</td>
						 <td>태훈강</td>
						<tr>
						<tr>
						 <td>MEM002</td>
						 <td>강태훈</td>
						<tr>
						<tr>
						 <td>MEM003</td>
						 <td>훈태강</td>
						<tr>
					</tbody>
				</table>
			</div>
			
			<div class="col-sm-6">
				<h4>최근 추가된 과정 목록</h4>
				<table class="table table-bordered text-center">
					<thead>
						<tr>
						  <th>개설과정코드</th>
						  <th>개설과정명</th>
						</tr>
					</thead>
					<tbody>
						<tr>
						 <td>OCU001</td>
						 <td>JAVA&amp;Python 개발자 양성 과정.</td>
						<tr>
						<tr>
						 <td>OCU004</td>
						 <td>python&amp;spark&amp;zeppline을 활용한 빅데이터 개발자 양성 과정.</td>
						<tr>
						<tr>
						 <td>OCU008</td>
						 <td>OpenCV를 활용한 그래픽 프로그랭 개발자 양성과정.</td>
						<tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="container-fluid">
			<h3>진행중인 과정</h3>
			<h2>2018.04.10 기준</h2>

			<div class="progress" style="height: 50px;">
				<div class="progress-bar  progress-bar-striped active"
					role="progressbar" aria-valuenow="70" aria-valuemin="0"
					aria-valuemax="100" style="width: 70%;">
					<p style="font-size: 30px; margin-top: 10px;">6개 과정</p>
				</div>
			</div>
		</div>

		<div class="container-fluid">
			<h3>강의실 사용</h3>
			<h2>2018.04.10 기준</h2>
			<div class="progress" style="height: 50px;">
				<div class="progress-bar  progress-bar-striped active"
					role="progressbar" aria-valuenow="70" aria-valuemin="0"
					aria-valuemax="100" style="width: 80%;">
					<p style="font-size: 30px; margin-top: 10px;">80% 사용중</p>
				</div>
			</div>
		</div>
	</div>
	<div id="modalForm"></div>
</body>
</html>