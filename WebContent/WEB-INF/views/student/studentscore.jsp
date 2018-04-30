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

<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/project.css">

<style>
th{
	text-align:center;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
			<a href="${contextPath}/student/list"><img
				src="${contextPath}/resources/img/sist_logo.png" alt="sist_logo.png">성적
				관리 프로그램</a>
			<ul class="nav navbar-nav navbar-right">


				<li><a href="${contextPath}/student/list"><span
						class="glyphicon glyphicon-user"></span> [수강생]님이 로그인 했습니다</a></li>
				<li><a id="resetPw" href="#"><span
						class="glyphicon glyphicon-wrench"></span> 비밀번호변경</a></li>
				<li><a href="${contextPath}/login/logout"><span
						class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
			</ul>
		</div>

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header"></div>
				<ul class="nav navbar-nav">
					<li><a href="${contextPath}/student/list">홈</a></li>
					<li class="active"><a href="${contextPath}/student/studentscore">성적
							조회</a></li>
				</ul>
			</div>

			<div class="container-fluid" style="background-color: black;">
				<p style="color: white; margin-top: 10px;">
					<a id="navi" href="${contextPath}/student/list">홈 </a> > <a
						id="navi" href="${contextPath}/student/studentscore">성적 조회</a>		
				</p>
			</div> 

			<ul class="nav navbar-nav">

			</ul>
		</nav>

		<div class="infoboard">
			<h3>과정 리스트</h3>
			<table class="table table-bordered text-center">
				<thead>
					<tr>
						<th>no</th>
						<th>과정코드</th>
						<th>과정명</th>
						<th>기간</th>
						<th>강의실</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>COU001</td>
						<td><a href="${contextPath}/student/studentscoredetail">JAVA를
								응용한 사물인터넷 IOT 개발자 양성과정</a></td>
						<td>2017-12-01~2018-04-31</td>
						<td>1강의실</td>
					</tr>
					<tr>
						<td>2</td>
						<td>COU002</td>
						<td><a href="${contextPath}/stdent/studentscoredetail">파이썬
								빅데이터 개발자 양성과정</a></td>
						<td>2018-01-01~2018-06-01</td>
						<td>2강의실</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<div id="modalForm"></div>
</body>
</html>