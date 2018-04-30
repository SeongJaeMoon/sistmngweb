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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic"
	rel="stylesheet">

<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/project.css">

<style>
th {
	text-align: center;
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {

		$("div#modalForm").load("${contextPath}/modal.html");

		$('[data-toggle=popover').popover();

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
				src="${contextPath}/resources/img/sist_logo.png"
				alt="sist_logo.png">성적 관리 프로그램</a>
			<ul class="nav navbar-nav navbar-right">

				<li><a href="${contextPath}/instructor/info"><span
						class="glyphicon glyphicon-user"></span> [강사]님이 로그인 했습니다</a></li>
				<li><a href="#" id="resetPw"><span
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
					강의 스케줄 조회 > <a id="navi" href="${contextPath}/instructor/schedule">과정
						리스트</a> > <a id="navi" href="${contextPath}/instructor/lectureinfo">과정별
						과목/수강생 리스트</a>
				</p>
			</div>
		</nav>


		<div class="panel panel-default">
			<div class="panel-body">
				<h4 style="text-align: center;">[OCO001] JAVA를 응용한 사물인터넷 IOT
					개발자 양성과정 (2018-01-01 ~ 2018-06-30)</h4>
			</div>
		</div>

		<div class="infoboard">
			<h3 style="margin-top: 70px;">과목 리스트</h3>
			<table class="table table-bordered text-center">
				<thead>
					<tr class="active">
						<th>No</th>
						<th>과목코드</th>
						<th>과목명</th>
						<th>과목기간</th>
						<th>교재명</th>

						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>OSU001</td>
						<td>자바</td>
						<td>2018-01-01 ~ 2018-01-31</td>
						<!-- data-toggle 부분에 회원 번호, ISBN 넣어야 함. -->
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="<img src='${contextPath}/resources/pictures/ajax_book.jpg' style = 'width:100%; height:30%;'>">자바의신</a></td>

						<td>강의 종료</td>
					</tr>
					<tr>
						<td>2</td>
						<td>OSU002</td>
						<td>스프링</td>
						<td>2018-04-01 ~ 2018-04-30</td>
						<!-- data-toggle 부분에 회원 번호, ISBN 넣어야 함. -->
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="<img src='${contextPath}/resources/pictures/ajax_book.jpg' style = 'width:100%; height:30%;'>">스프링
								훑어보기</a></td>

						<td>강의중</td>
					</tr>
				</tbody>
			</table>


			<h3 style="margin-top: 70px;">수강생 리스트</h3>

			<table class="table table-bordered text-center">
				<thead>
					<tr class="active">
						<th>No</th>
						<th>회원코드</th>
						<th>이름</th>

						<th>전화번호</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>MEM001</td>
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="<img src='${contextPath}/resources/pictures/ajax_book.jpg' style = 'width:100%; height:30%;'>">강태훈</a></td>

						<td>010-1234-5678</td>
						<td>2017-10-31</td>
					</tr>
					<tr>
						<td>1</td>
						<td>MEM002</td>
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="<img src='${contextPath}/resources/pictures/ajax_book.jpg' style = 'width:100%; height:30%;'>">김선호</a></td>

						<td>010-1234-5678</td>
						<td>2017-10-31</td>
					</tr>
				</tbody>
			</table>


		</div>
	</div>

	<div id="modalForm"></div>
</body>
</html>