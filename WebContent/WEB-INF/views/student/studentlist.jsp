<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   	
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>  

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

<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/project.css">

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
		
		$("a#resetPw").on("click", function(){
			$("div#myPWFormModal").modal();
		});
	});
</script>

</head>
<body>


	<div class="container">



		<div class="container-fluid">
			<a href="${contextPath}/student/list"><img src="${contextPath}/resources/img/sist_logo.png"
				alt="sist_logo.png">성적 관리 프로그램</a>
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
					<li class="active"><a href="${contextPath}/student/list">홈</a></li>
					<li><a href="${contextPath}/student/studentscore">성적 조회</a></li>
				</ul>
			</div>
		</nav>

				<div class="media" style="margin: 200px;">
					<div class="media-left">
					
					<!-- 학생 사진 -->
						<img src="${contextPath}/resources/pictures/instructor/avatar.png" class="media-object img-circle"
							style="width: 300px">
					</div>
					
					<!-- 학생 개인정보 -->
					<div class="media-body">
						<h4 class="media-heading" style="margin-left:25px; font-size:15px; color:DarkGray;">수강생명</h4>
						<p style="margin-left:25px; font-size:22px; margin-top:15px;"><b>${studentinfo.name_}</b></p>
						<h4 class="media-heading" style="margin-left:25px; font-size:15px; color:DarkGray;">주민번호</h4>
						<p style="margin-left:25px; font-size:22px; margin-top:15px;"><b>${studentinfo.ssn}</b></p>
						<h4 class="media-heading" style="margin-left:25px; font-size:15px; color:DarkGray;">전화번호</h4>
						<p style="margin-left:25px; font-size:22px; margin-top:15px;"><b>${studentinfo.phone }</b></p>
						<h4 class="media-heading" style="margin-left:25px; font-size:15px; color:DarkGray;">등록일</h4>
						<p style="margin-left:25px; font-size:22px; margin-top:15px;"><b>${studentinfo.studentRegDate}</b></p>
						<h4 class="media-heading" style="margin-left:25px; font-size:15px; color:DarkGray;">수강횟수</h4>
						<p style="margin-left:25px; font-size:22px; margin-top:15px;"><b>${studentinfo.count_}</b></p>
					</div>
				</div>
	</div>
	<div id = "modalForm">
		
	</div>
</body>
</html>