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
		
		
		

		$("button#btnCourseDel").click(function() {
			$("div#courseDelete").modal('show');
		});
		
		$("button#btnCourseAdd").click(function() {
			$("div#courseAdd").modal('show');
		});
		
		$("button#btnStudentDel").click(function() {
			$("div#studentDel").modal('show');
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
				<li><a href="#"><span class="glyphicon glyphicon-user"></span>
						[관리자]님이 로그인 했습니다</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-wrench"></span>
						비밀번호변경</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-log-out"></span>
						로그아웃</a></li>
			</ul>
		</div>
		<nav class="navbar navbar-inverse" id="navi">
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
					<li><a href="${contextPath}/admin/courselist">개설과정
							&amp; 과목관리</a></li>
					<li class="active"><a href="${contextPath}/admin/studentlist">수강생관리</a></li>
				</ul>
			</div>
			
		<div class="container-fluid" style="background-color: black;">
            <p style="color: white; margin-top: 10px;">
               <a id="navi" href="${contextPath}/admin/studentlist" style="color:white;">수강생관리</a> > <a
                  id="navi" href="${contextPath}/admin/studentdetaillist" style="color:white;">수강생 상세보기</a>
            </p>
         </div>
         
         
		</nav>


		<div class="container-fluid" id="infoboard">

			<div class="row">

				<div class="col-sm-4">
					<img src="resources/img/avatar.png" class="media-object img-circle"
						style="width: 250px; height: 250px;">

					<div style="margin-left: 80px; margin-top: 20px;">

						<button id="studentChange" type="button" onclick="location.href='${pageContext.request.contextPath}/admin/stu/studentmodify'" class="btn btn-default btn-sm">
						수정
						</button>
						<button id="btnStudentDel" type="submit" class="btn btn-default btn-sm">삭제</button>
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



			<div style="position: relative; padding-top: 10px">
				<h4>수강 기록> COU002- 자바와 함께 [2018.03.03~2018.06.06]</h4>
			</div>
			
			
			<table class="table table-striped">
				<thead>
					<tr>
						<th>
							<form>
								<label class="checkbox-inline" style="margin-bottom:10px;" > <input type="checkbox"
									value="일관선택" id="AllCheck">
								</label>

							</form>
						</th>
						<th>NO</th>
						<th>과정코드</th>
						<th>과정명</th>
						<th>기간</th>
						<th>강의실</th>
						<th>수료여부</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><form>
								<label class="checkbox-inline" style="margin-bottom:10px;"> <input type="checkbox"
									value="일관선택" id="1">
								</label>

							</form></td>
						<td>1</td>
						<td>OCC001</td>
						<td><a href="${pageContext.request.contextPath}/admin/studentcoursedetaillist">자바를 배우자!</a></td>
						<td>2018.01.01~2018.04.04</td>
						<td>별님강의실</td>
						<td>수료중</td>
					</tr>
					<tr>
						<td><form>
								<label class="checkbox-inline"  style="margin-bottom:10px;"> <input type="checkbox"
									value="일관선택" id="2">
								</label>

							</form></td>
						<td>2</td>
						<td>OCC002</td>
						<td><a href="${pageContext.request.contextPath}/admin/studentcoursedetaillist">오라클 과정</a></td>
						<td>2017.01.01~2017.06.06</td>
						<td>달님강의실</td>
						<td>중도탈락/2017.03.03</td>
					</tr>

				</tbody>
			</table>



			<button id="btnCourseDel" type="submit" class="btn btn-default pull-left">삭제</button>
			<button id="btnCourseAdd" type="submit" class="btn btn-default pull-right">과정등록</button>


		</div>
	</div>

	<div class="modal fade" id="courseDelete" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<!-- <div class="modal-header">
					</div> -->
				<div class="modal-body" style="width: auto; height: auto;">
					<button type="button" class="close" data-dismiss="modal">
						<p style="font-size: 40px;">&times;</p>
					</button>
					<p style="font-size: 15px; margin-top: 55px;">
						[OCC001-자바와 함께] 과정을 삭제하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default btn-block"
						data-dismiss="modal">삭제</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="courseAdd" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content" style="width: 900px;">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<p style="font-size: 40px;">&times;</p>
						</button>
						<h3 style="margin-left: 350px;">
							<b>개설 과정 선택</b>
						</h3>

					</div>
					<div class="modal-body">
						<h4>
							<b>개설과정 목록</b>
						</h4>
						<table class="table table-striped">
							<thead>
								<tr>
									<th>
										<div class="radio">
											<label><input type="radio" name="optradio"
												style="margin-top: 20px;"></label>
										</div>
									</th>

									<th>NO</th>
									<th>과정코드</th>
									<th>과정명</th>
									<th>기간</th>
									<th>강의실</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<div class="radio">
											<label><input type="radio" name="optradio"></label>
										</div>
									</td>
									<td>1</td>
									<td>COU001</td>
									<td><a href="">JAVA를
											응용한 사물인터넷 IOT 개발자 양성과정</a></td>
									<td>2017-12-01~2018-04-31</td>
									<td>1강의실</td>
								</tr>
								<tr>
									<td>
										<div class="radio">
											<label><input type="radio" name="optradio"></label>
										</div>
									</td>
									<td>2</td>
									<td>COU002</td>
									<td><a href="">파이썬
											빅데이터 개발자 양성과정</a></td>
									<td>2018-01-01~2018-06-01</td>
									<td>2강의실</td>
								</tr>
								<tr>
									<td>
										<div class="radio">
											<label><input type="radio" name="optradio"></label>
										</div>
									</td>
									<td>3</td>
									<td>COU001</td>
									<td><a href="">JAVA를
											응용한 사물인터넷 IOT 개발자 양성과정</a></td>
									<td>2017-12-01~2018-04-31</td>
									<td>1강의실</td>
								</tr>
							</tbody>
						</table>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default"
							style="margin-right: 400px;" data-dismiss="modal">SUBMIT</button>
					</div>
				</div>

			</div>
		</div>
		
		
		<div class="modal modal-center fade" id="studentDel" role="dialog">
			<div class="modal-dialog modal-sm modal-center">
				<div class="modal-content">
					<div class="modal-body" style="width:auto; height:auto;">
						<button type="button" class="close" data-dismiss="modal"><p style="font-size:40px;">&times;</p></button>
						<p style="font-size:15px; margin-top:55px;">
							[]을 삭제하시겠습니까?
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