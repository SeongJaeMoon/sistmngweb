<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>

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
			<a href="${contextPath}/instructor/info"><img
				src="${contextPath}/resources/img/sist_logo.png" alt="sist_logo.png">성적
				관리 프로그램</a>
			<ul class="nav navbar-nav navbar-right">

				<li><a href="${contextPath}/instructor/info"><span
						class="glyphicon glyphicon-user"></span> [강사]님이 로그인 했습니다</a></li>
				<li><a id="resetPw" href="#"><span
						class="glyphicon glyphicon-wrench"></span> 비밀번호변경</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-log-out"></span>
						로그아웃</a></li>

			</ul>
		</div>


		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header"></div>
				<ul class="nav navbar-nav">
					<%-- <li><a href="${contextPath}/instruct/instructorInfo.jsp">홈</a></li> --%>
					<li class="active"><a href="#">강사 정보 확인</a></li>
					<li><a href="${contextPath}/instructor/schedule">강의 스케줄 조회</a></li>
					<li><a href="${contextPath}/instructor/testmng">시험&성적 관리</a></li>
				</ul>
			</div>
		</nav>

		<div class="media" style="margin: 100px 200px 200px 200px;">
			<div class="media-left">

				<!-- 학생 사진 -->
				<img src="${contextPath}/resources/pictures/instructor/avatar.png"
					class="media-object img-circle" style="width: 300px">
			</div>

			<!-- 학생 개인정보 -->
			<div class="media-body">
				<h4 class="media-heading"
					style="margin-left: 25px; font-size: 15px; color: DarkGray;">강사명</h4>
				<p style="margin-left: 25px; font-size: 22px; margin-top: 15px;">
					<b>소지섭</b>
				</p>
				<h4 class="media-heading"
					style="margin-left: 25px; font-size: 15px; color: DarkGray;">주민번호</h4>
				<p style="margin-left: 25px; font-size: 22px; margin-top: 15px;">
					<b>781010-1234567</b>
				</p>
				<h4 class="media-heading"
					style="margin-left: 25px; font-size: 15px; color: DarkGray;">전화번호</h4>
				<p style="margin-left: 25px; font-size: 22px; margin-top: 15px;">
					<b>010-1234-5678</b>
				</p>
				<h4 class="media-heading"
					style="margin-left: 25px; font-size: 15px; color: DarkGray;">등록일</h4>
				<p style="margin-left: 25px; font-size: 22px; margin-top: 15px;">
					<b>2015.02.14</b>
				</p>
				<h4 class="media-heading"
					style="margin-left: 25px; font-size: 15px; color: DarkGray;">강의가능
					과목</h4>
				<div style="margin-left: 25px; font-size: 22px; margin-top: 15px;">
					<ul>
						<li>Java</li>
						<li>Python</li>
						<li>HTML</li>
						<li>CSS</li>
					</ul>
				</div>
			</div>
		</div>

	</div>


	<div id="modalForm"></div>

</body>
</html>