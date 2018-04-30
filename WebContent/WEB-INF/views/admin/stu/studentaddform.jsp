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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/project.css">

<style>

div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
	
.btn-file {
    position: relative;
    overflow: hidden;
}
.btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
}

th{
	text-align:center;
}

</style>

<!-- Google Map API -->
<script src="https://maps.googleapis.com/maps/api/js"></script>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
$(document).ready(function(){

	   // jQuery methods go here...
	$("div#AllModal").load("${pageContext.request.contextPath}/admin/StudentManagement/modal.html");
	$("button#btnDel").on("click", function() {

	});
	
	//과정등록 활성화//비활성화
	$("input#addCourseCheck").on("change", function(){
		
		if ( $("input#addCourseCheck").is(":checked", true)){

			$("button#addCourseBtn").prop("disabled",false);
			$("button#addCourseBtn").click(function(){
				$("div#openCourseSel").modal();
				
			});
			
		} else {

			$("button#addCourseBtn").prop("disabled",true);							
		}
		
		
	});
	
	$("input[type='file']").on('change', function() {
		  var input = $(this);
		  var label = input.val().replace(/\\/g, '/').replace(/.*\//, '');  
		  $("#" + input.data("display-target")).val(label);
	});
	
	$("input#studentAddimage").click(function() {
		$("div#studentImage").modal('show');
	});
	
	$("a#addCourseList").click(function() {
		
		$("div#addCourseList").modal('show');
	});
	
	
	$("button#btnCansel").click(function() {
		location.href="${pageContext.request.contextPath}/stumanamain.jsp";
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
					<li><a href="${contextPath}/admin/courselist">개설과정
							&amp; 과목관리</a></li>
					<li class="active"><a href="${contextPath}/admin/studentlist">수강생관리</a></li>
				</ul>
			</div>
			<div class="container-fluid" style="background-color: black;">
				<p style="color: white; margin-top: 10px;">
               <a id="navi" href="${contextPath}/admin/studentlist">수강생관리</a> > <a
                  id="navi" href="${contextPath}/admin/studentaddform">수강생 등록</a>
            </p>
			</div>
		</nav>




		<div class="container-fluid">

			<div class="row">

				<div class="col-sm-4" style="position: relative">
					<input type="image" id="studentAddimage" src="${pageContext.request.contextPath}/resources/img/avatar.png" class="media-object img-circle" style="width:280px; height:280px; margin-top:30px;">


				</div>


				<form>



					<div class="col-sm-4">
						<h4 class="media-heading"
							style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">회원번호</h4>

						<h4 class="media-heading"
							style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">
							<input type="text">
						</h4>


						<h4 class="media-heading"
							style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">주민번호</h4>
						<h4 class="media-heading"
							style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">
							<input type="text">
						</h4>
						<h4 class="media-heading"
							style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">등록일</h4>
						<h4 class="media-heading"
							style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">
							<input type="date">
						</h4>
					</div>
					<div class="col-sm-4">
						<h4 class="media-heading"
							style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">이름</h4>
						<h4 class="media-heading"
							style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">
							<input type="text">
						</h4>
						<h4 class="media-heading"
							style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">전화번호</h4>
						<h4 class="media-heading"
							style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">
							<input type="text">
						</h4>
							

					</div>


				</form>


			</div>

		</div>

		<table class="table" style="margin-top:15px;">
			<thead>
				<tr class="active">

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
					<td>
					<a id="addCourseList" href="#openCourseSel" data-toggle="modal"
						data-target="#openCourseSel">클릭하여과정 등록!</a>
					<!-- <button id="btnCourseAdd" type="submit" class="btn btn-default">클릭하여 수강 과정 등록</button> -->
					</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>



			</tbody>
		</table>
		
		<button id="btnCansel" type="submit" class="btn btn-default pull-left">취소</button>
		<button id="btnAdd" type="submit" class="btn btn-default pull-right">등록</button>


	</div>
	
	
	<!-- 사진등록 모달 -->
	<div class="modal fade" id="studentImage" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content" style="width:450px;">
					<!-- <div class="modal-header">
        </div>
        <div class="modal-body"> -->
					<button type="button" class="close" data-dismiss="modal">
						<p style="font-size: 40px;">&times;</p>
					</button>

					<div class="media">
						<div class="media-left">

							<!-- 학생 사진 -->
							<img src="resources/img/avatar.png"
								class="media-object img-circle"
								style="width: 150px; margin-top: 40px; margin-left: 50px;">
						</div>

						<!-- 학생 개인정보 -->
						<div class="media-body">
							<h4 class="media-heading"
								style="margin-left: 25px; font-size: 25px; margin-top: 30px;">사진
								업로드</h4>

							<h4 class="media-heading"
								style="margin-left: 25px; margin-top: 30px; font-size: 15px; color: DarkGray;">수강생.jpg</h4>

							<div class="form-group" style="margin-top:10px; margin-left:25px;">
								<div class="container-floid">
									<div class="input-group">
										<label class="input-group-btn"> <span
											class="btn btn-default btn-file"> 파일선택 <input
												type="file" name="attach_file"
												data-display-target="attachFile">
										</span>
										</label>
									</div>
								</div>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default btn-block"
								data-dismiss="modal">확인</button>
						</div>
					</div>

				</div>
			</div>
			
		</div>

<!-- 개설과정 모달 -->
<div class="modal fade" id="addCourseList" role="dialog">
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
									<td><a href="${contextPath}/studentscoredetail.jsp">JAVA를
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
									<td><a href="${contextPath}/studentscoredetail.jsp">파이썬
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
									<td><a href="${contextPath}/studentscoredetail.jsp">JAVA를
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
</body>
</html>