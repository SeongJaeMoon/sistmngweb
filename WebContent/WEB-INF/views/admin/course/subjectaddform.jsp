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

		$("button.btnCancle").on("click", function() {
			location.assign("${contextPath}/admin/coursedetaillist");
		});

		$("button.btnAdd").on("click", function() {
			
		});
		
		$("input#subject").on("click", function(){
			$("div#addModal").find("div#addTable").remove();
				var names = ['Java', 'Python'];
				var id = ['SUB001', 'SUB002'];
				var value = "";
				value += "<div id='addTable'><form role='form' method='post'><div class='form-group'><p style='font-size: 15px; margin-top: 55px; text-align:center;'>과목을 선택해주세요.</p><table class='table table-striped'>";
				value += "<thead><th>선택</th><th>과목코드</th><th>과목명</th></thead><tbody>";
				for(var i = 0; i < id.length; ++i){
					value +='<tr><td><label><input type="radio" name="check" value = '+id[i]+'></label></td><td>'+id[i]+'</td><td>'+names[i]+'</td></tr>';					
				}
	
				value += "</tbody></table><div class='modal-footer'><button type='submit' class='btn btn-default btn-block btn-add'data-dismiss='modal'>확인</button></div></form></div></div>"; 
				$("div#addModal div.modal-body").after(value);
				$("div#addModal").modal('show');
			
		});
		
		$("input#instructs").on("click", function(){
			$("div#addModal").find("div#addTable").remove();
				var names = ['이민종', '박효신'];
				var id = ['MEM001', 'MEM002'];
				var value = "";
				value += "<div id='addTable'><form role='form' method='post'><p style='font-size: 15px; margin-top: 55px; text-align:center;'>강사를 선택해주세요.</p><table class='table table-striped'>";
				value += "<thead><th>선택</th><th>강사코드</th><th>강사명</th></thead><tbody><div class='form-group'>";
				for(var i = 0; i < id.length; ++i){
					value +='<tr><td><label><input type="radio" name="check" value = '+id[i]+'></label></td><td>'+id[i]+'</td><td>'+names[i]+'</td></tr>';					
				}
	
				value += "</tbody></table><div class='modal-footer'><button type='submit' class='btn btn-default btn-block btn-add'data-dismiss='modal'>확인</button></div></form></div></div>"; 
				$("div#addModal div.modal-body").after(value);
				$("div#addModal").modal('show');
			
		});

		
		$("input#books").on("click", function(){
			$("div#addModal").find("div#addTable").remove();
				var names = ['이것이 자바다', '점프 투 파이썬'];
				var id = ['BOK001', 'BOK002'];
				var isbn = ['1234', '1235'];
				var img_url = ['${contextPath}/resources/pictures/ajax_book.jpg','${contextPath}/resources/pictures/ajax_book2.jpg'];
				var publisher = ['한빛','한빛'];
				var value = "";
				value += "<div id='addTable'><form role='form' method='post'><p style='font-size: 15px; margin-top: 55px; text-align:center;'>교재를 선택해주세요.</p><table class='table table-striped'>";
				value += "<thead><th>선택</th><th>이미지</th><th>ISBN</th><th>교재코드</th><th>교재명</th><th>출판사</th></thead><tbody><div class='form-group'>";
				for(var i = 0; i < id.length; ++i){
					value +='<tr><td><label><input type="radio" name="check" value = '+id[i]+'></label></td><td><img src="'+img_url[i]+'"style = "width:50px; height:50px;"></td><td>'+isbn[i]+'</td><td>'+id[i]+'</td><td>'+names[i]+'</td><td>'+publisher[i]+'</td></tr>';					
				}
	
				value += "</tbody></table><div class='modal-footer'><button type='submit' class='btn btn-default btn-block btn-add'data-dismiss='modal'>확인</button></div></form></div></div>"; 
				$("div#addModal div.modal-body").after(value);
				$("div#addModal").modal('show');
			
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
						id="navi" href="${contextPath}/admin/courselist">개설 과정 관리</a> > <a id ="navi" href="${contextPath}/admin/coursedetaillist"> 개설 과목 관리 </a> 
					> <a id="navi" href="${contextPath}/admin/subjectaddform"> 개설
						과목 등록 </a>
				</p>
			</div>
		</nav>
		<div class="infoboard">
			<div class="panel panel-default">
				<div class="panel-body">
					<p style="text-align: center; font-size: 20px;">JAVA를
								응용한 사물인터넷 IOT 개발자 양성과정(2017-12-01~2018-04-31)</p>
				</div>
			</div>
			<form action="" method="post">
				<!-- <input type="hidden" name="ocu_id" id="ocu_id"> -->

				<div class="form-group">
					<label for="subject">개설과목:</label> <input type="text"
						class="form-control" id="subject" name="subject"
						placeholder="과목을 보려면 클릭하세요." required>
				</div>

				<div class="form-group">
					<label for="startRegDate">개설 과목 시작일:</label> <input type="date"
						class="form-control" id="startRegDate" name="startRegDate" required>
				</div>

				<div class="form-group">
					<label for="EndRegDate">개설 과목 종료일:</label> <input type="date"
						class="form-control" id="EndRegDate" name="EndRegDate" required>
				</div>

				<div class="form-group">
					<label for="instructs">강사:</label> <input type="text"
						class="form-control" id="instructs" name="instructs"
						placeholder="강사를 보려면 클릭하세요." required>
				</div>
				<div class="form-group">
					<label for="books">교재:</label> <input type="text"
						class="form-control" id="books" name="books"
						placeholder="교재를 보려면 클릭하세요.">
						
				</div>

				<button type="button" class="btn btn-default pull-left btnCancle">취소</button>
				<button type="button" class="btn btn-default pull-right btnAdd">과목 등록</button>
			</form>
		</div>
	</div>
	<div id="modalForm"></div>
	<div id="modalForm2"></div>
</body>
</html>