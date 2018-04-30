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

<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/project.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

th {
	text-align: center;
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
		$('[data-toggle="popover"]').popover();
	});
</script>
</head>
<body>

	<div class="container">

	<div class="container-fluid">
			<a href="${contetPath}/admin/list"><img src="${contextPath}/resources/img/sist_logo.png"
				alt="sist_logo.png">성적 관리 프로그램</a>
			<ul class="nav navbar-nav navbar-right">


				<li><a href="#"><span class="glyphicon glyphicon-user"></span>
						[관리자]님이 로그인 했습니다</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-wrench"></span>
						비밀번호변경</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-log-out"></span>
						로그아웃</a></li>


			</ul>
		</div>

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header"></div>
				<ul class="nav navbar-nav">
					<li><a
						href="${contextPath}/admin/list">홈</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">기초정보관리 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="${contextPath}/admin/basiccourselist">과정 관리</a></li>
							<li><a href="${contextPath}/admin/subjectlist">과목 관리</a></li>
							<li><a href="${contextPath}/admin/classlist">강의실 관리</a></li>
							<li><a href="${contextPath}/admin/booklist">교재 관리</a></li>
						</ul>
					<li class="active"><a
						href="${contextPath}/admin/inslist">강사계정관리</a></li>
					<li><a href="${contextPath}/admin/courselist">개설과정
							&amp; 과목관리</a></li>
					<li><a href="${contextPath}/admin/studentlist">수강생관리</a></li>
					
				</ul>
			</div>
			
			<div class="container-fluid" style="background-color: black;">
				<p style="color: white; margin-top: 10px">
					<a id="navi"
						href="${contextPath}/admin/list">홈</a>
					> <a id="navi"
						href="${contextPath}/admin/inslist">강사계정관리</a>
					> <a id = "navi" href="${contextPath}/admin/insdetail">강사 상세보기</a>
				</p>
			</div>
		</nav>

		<div class="container-fluid full-width">

			<div class="row">

				<div class="col-sm-4">
					<img src="${pageContext.request.contextPath}/resources/ny.jpg"
						class="media-object img-circle"
						style="width: 250px; height: 250px;">
				</div>

				<div class="col-sm-4">
					<h4 class="media-heading"
						style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">강사번호</h4>
					<h4 class="media-heading"
						style="margin-left: 25px; font-size: 20px; margin-top: 30px;">TEA001</h4>
					<h4 class="media-heading"
						style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">주민번호</h4>
					<h4 class="media-heading"
						style="margin-left: 25px; font-size: 20px; margin-top: 30px;">123455-1234567</h4>
					<h4 class="media-heading"
						style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">강사등록일</h4>
					<h4 class="media-heading"
						style="margin-left: 25px; font-size: 20px; margin-top: 30px;">2017.01.12</h4>
				</div>
				<div class="col-sm-4">
					<h4 class="media-heading"
						style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">이름</h4>
					<h4 class="media-heading"
						style="margin-left: 25px; font-size: 20px; margin-top: 30px;">강태훈</h4>
					<h4 class="media-heading"
						style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">전화번호</h4>
					<h4 class="media-heading"
						style="margin-left: 25px; font-size: 20px; margin-top: 30px;">010-1234-1234</h4>
					<h4 class="media-heading"
						style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">강의가능과목</h4>
					<h4 class="media-heading"
						style="margin-left: 25px; font-size: 20px; margin-top: 30px;">HTML,JAVA</h4>
				</div>
			</div>

			<div class="infoboard">
				<h3 style="margin-top: 70px;">진행중인 과목 리스트</h3>
				<table class="table table-bordered text-center">
					<tr class="active">
						<th>No</th>
						<th>과목코드</th>
						<th>과목코드</th>
						<th>과목명</th>
						<th>과목기간</th>
						<th>교재명</th>
						<th>출판사</th>
						<th>상태</th>
					</tr>
					<tr>
						<td>1</td>
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="[OCU001] 자바 응용 개발자 과정(2018-01-01~2018-06-30)">OCO001</a></td>
						<td>OSU001</td>
						<td>JAVA</td>
						<td>2018-01-01 ~ 2018-01-31</td>
						<!-- data-toggle 부분에 회원 번호, ISBN 넣어야 함. -->
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="<img src='${contextPath}/admin/instructor/resources/img/handok_small.png' style = 'width:100%; height:30%;'>">
								이것이 자바다</a></td>
						<td>한빛</td>
						<td>강의 종료</td>
					</tr>
					<tr>
						<td>2</td>
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="[OCU001] 자바 응용 개발자 과정(2018-01-01~2018-06-30)">OCO002</a></td>
						<td>OSU002</td>
						<td>Oracle DB</td>
						<td>2018-02-01 ~ 2018-02-28</td>
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="<img src='${contextPath}/admin/instructor/resources/img/handok_small.png' style = 'width:100%; height:30%;'>">
								이것이 자바다</a></td>
						<td>한빛</td>
						<td>강의 종료</td>
					</tr>
				</table>
			</div>

			<div class="infoboard">
				<h3 style="margin-top: 70px;">예정된 과목 리스트</h3>
				<table class="table table-bordered text-center">
					<tr class="active">
						<th>No</th>
						<th>과목코드</th>
						<th>과목코드</th>
						<th>과목명</th>
						<th>과목기간</th>
						<th>교재명</th>
						<th>출판사</th>
						<th>상태</th>
					</tr>
					<tr>
						<td>1</td>
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="[OCU001] 자바 응용 개발자 과정(2018-01-01~2018-06-30)">OCO001</a></td>
						<td>OSU001</td>
						<td>JAVA</td>
						<td>2018-01-01 ~ 2018-01-31</td>
						<!-- data-toggle 부분에 회원 번호, ISBN 넣어야 함. -->
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="<img src='${contextPath}/admin/instructor/resources/img/handok_small.png' style = 'width:100%; height:30%;'>">
								이것이 자바다</a></td>
						<td>한빛</td>
						<td>강의 종료</td>
					</tr>
					<tr>
						<td>2</td>
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="[OCU001] 자바 응용 개발자 과정(2018-01-01~2018-06-30)">OCO002</a></td>
						<td>OSU002</td>
						<td>Oracle DB</td>
						<td>2018-02-01 ~ 2018-02-28</td>
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="<img src='${contextPath}/admin/instructor/resources/img/handok_small.png' style = 'width:100%; height:30%;'>">
								이것이 자바다</a></td>
						<td>한빛</td>
						<td>강의 종료</td>
					</tr>
				</table>
			</div>

			<div class="infoboard">
				<h3 style="margin-top: 70px;">종료된 과목 리스트</h3>
				<table class="table table-bordered text-center">
					<tr class="active">
						<th>No</th>
						<th>과목코드</th>
						<th>과목코드</th>
						<th>과목명</th>
						<th>과목기간</th>
						<th>교재명</th>
						<th>출판사</th>
						<th>상태</th>
					</tr>
					<tr>
						<td>1</td>
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="[OCU001] 자바 응용 개발자 과정(2018-01-01~2018-06-30)">OCO001</a></td>
						<td>OSU001</td>
						<td>JAVA</td>
						<td>2018-01-01 ~ 2018-01-31</td>
						<!-- data-toggle 부분에 회원 번호, ISBN 넣어야 함. -->
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="<img src='${contextPath}/admin/instructor/resources/img/handok_small.png' style = 'width:100%; height:30%;'>">
								이것이 자바다</a></td>
						<td>한빛</td>
						<td>강의 종료</td>
					</tr>
					<tr>
						<td>2</td>
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="[OCU001] 자바 응용 개발자 과정(2018-01-01~2018-06-30)">OCO002</a></td>
						<td>OSU002</td>
						<td>Oracle DB</td>
						<td>2018-02-01 ~ 2018-02-28</td>
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="<img src='${contextPath}/admin/instructor/resources/img/handok_small.png' style = 'width:100%; height:30%;'>">
								이것이 자바다</a></td>
						<td>한빛</td>
						<td>강의 종료</td>
					</tr>
				</table>
			</div>

			<!-- 비밀번호 변경 모달 -->
			<div id="myLoginFormModal" class="modal fade" role="dialog">

				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content" style="width: 500px; height: 420px;">

						<!-- <div class="modal-header">
					</div> -->

						<div class="modal-body" style="padding: 40px 50px;">
							<button type="button" class="close" data-dismiss="modal">
								<p style="font-size: 50px;">&times;</p>
							</button>

							<form role="form" method="post"
								action="${contextPath}/inst/login" style="margin-top: 40px;">
								<div class="form-group"
									style="margin-left: 14px; margin-right: 14px;">
									<label for="pw"> 변경할 비밀번호를 입력해 주세요</label> <input
										type="password" class="form-control" id="loginformpw"
										name="pw_" placeholder="******" required="required">
								</div>
								<div class="form-group"
									style="margin-left: 14px; margin-right: 14px;">
									<label for="pw"> 다시한번 입력해 주세요</label> <input type="password"
										class="form-control" id="loginformpw" name="pw_"
										placeholder="******" required="required">
								</div>

								<div class="form-group"
									style="margin-left: 14px; margin-right: 14px;">
									<label for="pw"><b>현재 비밀번호를 입력해 주세요</b></label> <input
										type="password" class="form-control" id="loginformpw"
										name="pw_" placeholder="******" required="required">
								</div>

								<div class="modal-footer">
									<button type="button" class="btn btn-default btn-block"
										data-dismiss="modal">수정</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>
</body>
</html>