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
		$("div#modalForm2").load("${contextPath}/instruct/instructmodal.html");
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
				src="${contextPath}/resources/img/sist_logo.png" alt="sist_logo.png">성적
				관리 프로그램</a>
			<ul class="nav navbar-nav navbar-right">

				<li><a href="${contextPath}/instructor/info"><span
						class="glyphicon glyphicon-user"></span> [강사]님이 로그인 했습니다</a></li>
				<li><a href="#" id=""><span
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
					<li><a href="${contextPath}/instructor/schedule/schedule">강의 스케줄 조회</a></li>
					<li class="active"><a href="#">시험&amp;성적 관리</a></li>
				</ul>
			</div>

			<div class="container-fluid" style="background-color: black;">
				<p style="color: white; margin-top: 10px;">
					시험&성적 관리 > <a id="navi" href="${contextPath}/instructor/testmng">종료된
						과목 리스트</a>
				</p>
			</div>
		</nav>



		<div class="infoboard">
			<h3 style="margin-top: 70px;">종료된 과목 리스트</h3>
			<table class="table table-bordered text-center">

				<!-- 1 -->
				<tr class="active">
					<th>No</th>
					<th>과정코드</th>
					<th>과목코드</th>
					<th>과목명</th>
					<th>과목기간</th>
					<th>교재명</th>
					<th>출판사</th>
					<th>상태</th>
				</tr>
				<tr>
					<!-- <td rowspan="3">1</td> -->
					<td>1</td>
					<td><a href="#" data-toggle="popover" data-placement="top"
						data-trigger="hover" data-html="true"
						data-content="[OCU001] 자바 응용 개발자 과정(2018-01-01~2018-06-30)">OCO001</a></td>
					<td>OSU001</td>
					<td><a href="${contextPath}/instructor/testlist">JAVA</a></td>
					<td>2018-01-01 ~ 2018-01-31</td>
					<!-- data-toggle 부분에 회원 번호, ISBN 넣어야 함. -->
					<td><a href="#" data-toggle="popover" data-placement="top"
						data-trigger="hover" data-html="true"
						data-content="<img src='${contextPath}/resources/pictures/ajax_book.jpg' style = 'width:100%; height:30%;'>">
							이것이 자바다</a></td>
					<td>한빛</td>
					<td>강의 종료</td>
				</tr>
				<!-- <tr>
					<th>과정코드</th>
					<th>과정명</th>
					<th>과정기간</th>
					<th>강의실</th>
					<th>등록인원</th>
					<th>강의 상태</th>
				</tr>
				<tr style="border-bottom:2px solid gray;">
					<td>OCO001</td>
					<td>JAVA를 응용한 사물인터넷 IOT 개발자 양성과정</td>
					<td>2018-01-01 ~ 2018-06-31</td>
					<td>1강의실</td>
					<td>20명</td>
					<td>진행중</td>
				</tr>
 -->

				<!-- 2 -->

				<tr>
					<!-- <td rowspan="3">2</td> -->
					<td>2</td>
					<td><a href="#" data-toggle="popover" data-placement="top"
						data-trigger="hover" data-html="true"
						data-content="[OCU001] 자바 응용 개발자 과정(2018-01-01~2018-06-30)">OCO002</a></td>
					<td>OSU002</td>
					<td><a href="${contextPath}/instructor/testlist">Oracle
							DB</a></td>
					<td>2018-02-01 ~ 2018-02-28</td>
					<td><a href="#" data-toggle="popover" data-placement="top"
						data-trigger="hover" data-html="true"
						data-content="<img src='${contextPath}/resources/pictures/ajax_book.jpg' style = 'width:100%; height:30%;'>">
							이것이 자바다</a></td>
					<td>한빛</td>
					<td>강의 종료</td>
				</tr>
				<!-- <tr>
					<th>과정코드</th>
					<th>과정명</th>
					<th>과정기간</th>
					<th>강의실</th>
					<th>등록인원</th>
					<th>강의 상태</th>
				</tr>
				<tr>
					<td>OCO001</td>
					<td>JAVA를 응용한 사물인터넷 IOT 개발자 양성과정</td>
					<td>2018-01-01 ~ 2018-06-31</td>
					<td>1강의실</td>
					<td>20명</td>
					<td>진행중</td>
				</tr> -->
			</table>


		</div>
	</div>

	<div id="modalForm"></div>
	<div id="modalForm2"></div>
</body>
</html>