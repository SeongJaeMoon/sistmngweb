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

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">

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
			<a href="${contextPath}/instructor/info"><img
				src="${contextPath}/resources/img/sist_logo.png" alt="sist_logo.png">성적
				관리 프로그램</a>
			<ul class="nav navbar-nav navbar-right">


				<li><a href="${contextPath}/instructor/info"><span
						class="glyphicon glyphicon-user"></span> [강사]님이 로그인 했습니다</a></li>
				<li><a href="#" id ="resetPw"><span
						class="glyphicon glyphicon-wrench"></span> 비밀번호변경</a></li>
				<li><a href="${contextPath}/logoutform.jsp"><span
						class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
			</ul>
		</div>



		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header"></div>
				<ul class="nav navbar-nav">
					<li><a href="${contextPath}/instructor/info">강사 정보 확인</a></li>
					<li class="active"><a href="#">강의 스케줄 조회</a></li>
					<li><a href="${contextPath}/instructor/testmng">시험&성적 관리</a></li>
				</ul>
			</div>

			<div class="container-fluid" style="background-color: black;">
				<p style="color: white; margin-top: 10px;">
					강의 스케줄 조회 > <a id="navi"
						href="${contextPath}/instructor/schedule">과정 리스트</a>
				</p>
			</div>
		</nav>


		<div class="infoboard">

			<h3 style="margin-top: 70px;">예정 과정 리스트</h3>
			<table class="table table-bordered text-center">
				<thead>
					<tr class="active">
						<th>No</th>
						<th>과정코드</th>
						<th>과정명</th>
						<th>과정기간</th>
						<th>개설 과목수</th>
						<th>강의실</th>
						<th>등록인원</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>OCO003</td>
						<td><a href="${contextPath}/instructor/lectureinfo">JAVA를
								응용한 사물인터넷 IOT 개발자 양성과정</a></td>
						<td>2018-07-01 ~ 2018-12-31</td>
						<td>5개</td>
						<td>1강의실</td>
						<td>-</td>
					</tr>
				</tbody>
			</table>


			<h3 style="margin-top: 70px;">진행 과정 리스트</h3>
			<table class="table table-bordered text-center">
				<thead>
					<tr class="active">
						<th>No</th>
						<th>과정코드</th>
						<th>과정명</th>
						<th>과정기간</th>
						<th>개설 과목수</th>
						<th>강의실</th>
						<th>등록인원</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>OCO002</td>
						<td><a href="${contextPath}/instructor/lectureinfo">JAVA를
								응용한 사물인터넷 IOT 개발자 양성과정</a></td>
						<td>2018-01-01 ~ 2018-06-30</td>
						<td>5개</td>
						<td>1강의실</td>
						<td>-</td>
					</tr>
				</tbody>
			</table>


			<h3 style="margin-top: 70px;">종료 과정 리스트</h3>
			<table class="table table-bordered text-center">
				<thead>
					<tr class="active">
						<th>No</th>
						<th>과정코드</th>
						<th>과정명</th>
						<th>과정기간</th>
						<th>개설 과목수</th>
						<th>강의실</th>
						<th>등록인원</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>OCO000</td>
						<td><a href="${contextPath}/instructor/lectureinfo">JAVA를
								응용한 사물인터넷 IOT 개발자 양성과정</a></td>
						<td>2017-01-01 ~ 2017-06-30</td>
						<td>5개</td>
						<td>1강의실</td>
						<td>-</td>
					</tr>
					<tr>
						<td>2</td>
						<td>OCO001</td>
						<td><a href="${contextPath}/instructor/lectureinfo">JAVA를
								응용한 사물인터넷 IOT 개발자 양성과정</a></td>
						<td>2017-07-01 ~ 2017-12-31</td>
						<td>5개</td>
						<td>1강의실</td>
						<td>-</td>
					</tr>
				</tbody>
			</table>






		</div>
	</div>


	<div id = modalForm></div>
</body>
</html>