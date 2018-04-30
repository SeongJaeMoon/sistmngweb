<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- jstl-1.2.jar 파일 필요 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var = "contextPath" value ="<%=request.getContextPath() %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SIST_쌍용교육센터</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/project.css">


<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
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



						//일괄체크 표시하기
						$("input#AllCheck").on("change", function() {

							if ($("input#AllCheck").is(":checked", true)) {

								$("input#1").prop("checked", true);
								$("input#2").prop("checked", true);
								$("input#3").prop("checked", true);

							} else {

								$("input#1").prop("checked", false);
								$("input#2").prop("checked", false);
								$("input#3").prop("checked", false);
							}
				});
						
						
						
						
						$("button#btnDel").click(function() {
							$("div#studentDel").modal('show');
						});
						
						$("button#btnModify").click(function() {
							location.href="${pageContext.request.contextPath}/StudentManagementModify.jsp";
						});
		
						
						$('[data-toggle=popover').popover();

});
</script>
</head>
<body>

	<div class="container">

		<div class="container-fluid">
			<a href="${contextPath}/admin/list"><img src="${contextPath}/resources/img/sist_logo.png"
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
						href="${contextPath}/admin/instructor/instructorAccountManagement.jsp">강사계정관리</a></li>
					<li><a href="${contextPath}/admin/admincomain.jsp">개설과정
							&amp; 과목관리</a></li>
					<li class="active"><a href="${contextPath}/admin/studentlist">수강생관리</a></li>
				</ul>
			</div>
			<div class="container-fluid" style="background-color: black;">
			<p style="color: white; margin-top: 10px;">
				<a id="navi" href="${contextPath}/admin/stumanamain.jsp">수강생관리</a> > 
				<a id="navi" href="${contextPath}/admin/stdumanadetail.jsp">수강생 상세보기</a> >
				<a id="navi" href="${contextPath}/admin/stdumanacoudetail.jsp">수강과정 상세보기</a>
             </p>
			</div>
		</nav>



		<div class="container-fluid">
			
			<div class="row" >
			
			<div class="col-sm-4">
				<img src="resources/img/avatar.png" class="media-object img-circle" style="width:250px; height:250px;">
				
				<div class="container-fluid" style="margin-left:65px; margin-top:20px;">
				
					<button id="btnModify" type="submit" class="btn btn-default btn-sm">수정</button>
					<button id="btnDel" type="submit" class="btn btn-default btn-sm">삭제</button>
				</div>
			</div>
			
			<div class="col-sm-4">
				<h4 class="media-heading"
								style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">회원번호</h4>
							<h4 class="media-heading"
								style="margin-left: 25px; font-size: 20px; margin-top: 30px;">MEM001</h4>
							<h4 class="media-heading"
								style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">주민번호</h4>
							<h4 class="media-heading"
								style="margin-left: 25px; font-size: 20px; margin-top: 30px;">123455-1234567</h4>
							<h4 class="media-heading"
								style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">등록일</h4>
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
								style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">수강횟수</h4>
							<h4 class="media-heading"
								style="margin-left: 25px; font-size: 20px; margin-top: 30px;">2</h4>
				</div>
		</div>
			</div>







			<div style="position: relative; padding-top: 10px">
				<h4>수강 기록> COU002- 자바와 함께 [2018.03.03~2018.06.06]</h4>
			</div>




			<table class="table" style="margin-top:30px;">
				<thead>
					<tr class="active">
						
						<th>NO</th>
						<th>개설과목코드</th>
						<th>과목명</th>
						<th>기간</th>
						<th>강사명</th>
						<th>교재명</th>
						<th>출결배점/점수</th>
						<th>필기배점/점수</th>
						<th>실기배점/점수</th>
						<th>총점</th>
						<th>시험날짜</th>
						<th>시험문제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					
						<td>1</td>
						<td>OSU001</td>
						<td>JAVA</td>
						<td>2017.01.01~<br>2017.02.02</td>
						<td><a href = "#" data-toggle="popover" data-placement="top" data-trigger = "hover" data-html="true" data-content="<img src='${contextPath}/resources/pictures/ajax_book.jpg' style = 'width:100%; height:30%;'>">강태훈</a></td>
						<td><a href = "#" data-toggle="popover" data-placement="top" data-trigger = "hover" data-html="true" data-content="<img src='${contextPath}/resources/pictures/ajax_book.jpg' style = 'width:100%; height:30%;'>">JAVA와 함께!</a></td>
						<td>30/40</td>
						<td>30/40</td>
						<td>20/20</td>
						<td>80</td>
						<td>2017.01.15</td>
						<td><a href="${pageContext.request.contextPath}/파일링크">java_중간.zip</a></td>
					</tr>
					<tr>
					
						<td>2</td>
						<td>OSU002</td>
						<td>JAVA</td>
						<td>2017.01.01~<br>2017.02.02</td>
						<td><a href="${pageContext.request.contextPath}/">강태훈</a></td>
						<td><a href="${pageContext.request.contextPath}/">JAVA와 함께!</a></td>
						<td>30/40</td>
						<td>30/40</td>
						<td>20/20</td>
						<td>80</td>
						<td>2017.01.15</td>
						<td><a href="${pageContext.request.contextPath}/파일링크">java_중간.zip</a></td>
					</tr>
					<tr>
						
						<td>3</td>
						<td>OSU003</td>
						<td>JAVA</td>
						<td>2017.01.01~<br>2017.02.02</td>
						<td><a href="${pageContext.request.contextPath}/">강태훈</a></td>
						<td><a href="${pageContext.request.contextPath}/">JAVA와 함께!</a></td>
						<td>30/40</td>
						<td>30/40</td>
						<td>20/20</td>
						<td>80</td>
						<td>2017.01.15</td>
						<td><a href="${pageContext.request.contextPath}/파일링크">java_중간.zip</a></td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<!-- 수강생 삭제 -->
		<div class="modal modal-center fade" id="studentDel" role="dialog">
			<div class="modal-dialog modal-sm modal-center">
				<div class="modal-content">
					<div class="modal-body" style="width:auto; height:auto;">
						<button type="button" class="close" data-dismiss="modal"><p style="font-size:40px;">&times;</p></button>
						<p style="font-size:15px; margin-top:55px;">
							[MEM001 강태훈]을 삭제하시겠습니까?
						</p>
					</div>
					<div class="modal-footer">
							<button type="button" class="btn btn-default btn-block"
								data-dismiss="modal">삭제</button>
					</div>
				</div>
			</div>
		</div>
		
	
</body>
</html>