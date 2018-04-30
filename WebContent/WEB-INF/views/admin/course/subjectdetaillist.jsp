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
		$("div#modalForm2").load("${contextPath}/admin/adminmodal.html");

		$("a#resetPw").on("click", function() {
			$("div#myPWFormModal").modal();
		});

		$("a.MEM001").on("click",function(){
			$("div#studentModal").modal();
		});
		

		$("a.BOK001").on("click",function(){
			$("div#bookModal").modal();
		});
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
					<li><a
						href="${contextPath}/admin/inslist">강사계정관리</a></li>
					<li class="active"><a href="${contextPath}/admin/courselist">개설과정
							&amp; 과목관리</a></li>
					<li><a href="${contextPath}/admin/studentlist">수강생관리</a></li>
					
				</ul>
			</div>

			<div class="container-fluid" style="background-color: black;">
				<p style="color: white; margin-top: 10px;">
					<a id="navi" href="${contextPath}/admin/list">홈</a> > <a
						id="navi" href="${contextPath}/admin/courselist">개설 과정 관리</a> >
						<a id="navi"  href="${contextPath}/admin/coursedetaillist" > 개설 과목 관리</a> >
						<a id="navi"  href="${contextPath}/admin/subjectdetaillist" > 과목 상세 보기</a> 
				</p>
			</div>
		</nav>
		<div class="infoboard">
			<div class="panel panel-default">
				<div class="panel-body">
					<h4 style="text-align:center;">JAVA를
								응용한 사물인터넷 IOT 개발자 양성과정(2017-12-01~2018-04-31)</h4>
				</div>
			</div>
			<h3>과목 정보 [OSU001 / Java]</h3> 
			<table class="table table-bordered text-center">
				<thead>
					<tr class="active">
						<th>no</th>
						<th>과목코드</th>
						<th>교재명</th>
						<th>강사명</th>
						<th>기간</th>
						<th>강의실명</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>SUB001</td>
						<td><a href="#" class ="BOK001">이것이 자바다.</a></td>
						<td>이민종</td>
						<td>2017-12-01~2018-01-01</td>
						<td>1강의실</td>
					</tr>
				</tbody>
			</table>
			<h3>시험 정보</h3> 
			<table class="table table-bordered text-center">
				<thead>
					<tr class="active">
						<th>no</th>
						<th>시험코드</th>
						<th>시험날짜</th>
						<th>출결배점</th>
						<th>실기배점</th>
						<th>필기배점</th>
						<th>시험문제파일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>TES001</td>
						<td>2017-11-03</td>
						<td>70</td>
						<td>10</td>
						<td>20</td>
						<td><a href="${contextPath}/admin/adminsudetail.jsp">java1.zip</a></td>
					</tr>
					<tr>
						<td>1</td>
						<td>TES002</td>
						<td>2018-01-01</td>
						<td>70</td>
						<td>10</td>
						<td>20</td>
						<td><a href="${contextPath}/admin/adminsudetail.jsp">java1.zip</a></td>
					</tr>
				</tbody>
			</table>	
			<h3>수강생 성적리스트</h3> 
			<table class="table table-bordered text-center">
				<thead>
					<tr class="active">
						<th>no</th>
						<th>수강생명</th>
						<th>수강생전화번호</th>
						<th>출결점수</th>
						<th>실기점수</th>
						<th>필기점수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><a href="#" class ="MEM001">강태훈</a></td>
						<td>010-1111-2345</td>
						<td>70</td>
						<td>10</td>
						<td>20</td>
					</tr>
					<tr>
						<td>1</td>
						<td><a href="${contextPath}/admin/adminsudetail.jsp">성재문</a></td>
						<td>010-2345-1234</td>
						<td>70</td>
						<td>10</td>
						<td>20</td>
					</tr>
				</tbody>
			</table>		
		</div>
	</div>
	<div class="modal fade" id="studentModal" role="dialog">
	<div class="modal-dialog">

		<div class="modal-content" style="width: 450px;">
			<button type="button" class="close" data-dismiss="modal">
				<p style="font-size: 40px;">&times;</p>
			</button>

			<div class="media">

				<!-- 학생 사진 -->
				<img src="${contextPath}/resources/pictures/avatar.png" class="media-object img-circle"
					style="width: 150px; margin-left: 150px;">
			</div>

			<!-- 학생 개인정보 -->
			<div class="media-body">
				<h4 class="media-heading"
					style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">수강생명</h4>
				<h4 class="media-heading"
					style="margin-left: 25px; font-size: 20px; margin-top: 15px;">강태훈</h4>
				<h4 class="media-heading"
					style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">회원번호</h4>
				<h4 class="media-heading"
					style="margin-left: 25px; font-size: 20px; margin-top: 15px;">MEM001</h4>
				<h4 class="media-heading"
					style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">연락처</h4>
				<h4 class="media-heading"
					style="margin-left: 25px; font-size: 20px; margin-top: 15px;">010-1111-2345</h4>

				<div class="form-group" style="margin-top: 10px; margin-left: 25px;">
					<div class="container-floid"></div>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-block"
					data-dismiss="modal">확인</button>
			</div>
		</div>

	</div>
</div>



<div class="modal fade" id="bookModal" role="dialog">
	<div class="modal-dialog">

		<div class="modal-content" style="width: 450px;">
			<button type="button" class="close" data-dismiss="modal">
				<p style="font-size: 40px;">&times;</p>
			</button>

			<div class="media">

				<!-- 책 사진 -->
				<img src="${contextPath}/resources/pictures/ajax_book2.jpg" class="media-object img-rounded"
					style="width: 150px; margin-left: 150px;">
			</div>

			<!--책 정보 -->
			<div class="media-body">
				<h4 class="media-heading"
					style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">교재명</h4>
				<h4 class="media-heading"
					style="margin-left: 25px; font-size: 20px; margin-top: 15px;">이것이 자바다.</h4>
				<h4 class="media-heading"
					style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">교재번호</h4>
				<h4 class="media-heading"
					style="margin-left: 25px; font-size: 20px; margin-top: 15px;">BOK001</h4>
				<h4 class="media-heading"
					style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">출판사</h4>
				<h4 class="media-heading"
					style="margin-left: 25px; font-size: 20px; margin-top: 15px;">한빛
					출판사</h4>

				<div class="form-group" style="margin-top: 10px; margin-left: 25px;">
					<div class="container-floid"></div>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-block"
					data-dismiss="modal">확인</button>
			</div>
		</div>

	</div>
</div>
	<div id="modalForm"></div>
	<div id="modalForm2"></div>
</body>
</html>