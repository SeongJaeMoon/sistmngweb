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

		$("input#allCheck").click(function() {
			if ($(this).is(':checked')) {
				//테이블 전체 체크.
				$("table.table").find("input").prop("checked", true);
				$("button.btnRemove").removeAttr("disabled", "");
			} else {
				//체크 해제.
				$("table.table").find("input").prop("checked", false);
				$("button.btnRemove").attr("disabled", "disabled");
			}
		});
		
		
		
		
		
		
		
		//단일 체크 박스 선택시
		$("input[name='checkbox']").click(function() {
			if ($("input#allCheck").is(":checked")) {
				$("input#allCheck").prop("checked", false);
			}
			if ($("input[name='checkbox']:checked").length == 0) {
				$("button.btnRemove").attr("disabled", "disabled");
			} else {
				$("button.btnRemove").removeAttr("disabled");
			}
		});
		
		
		
		
		//페이징처리
		
		
		//수강생 등록
		
		$("button#btnAdd").click(function() {
			location.href="${pageContext.request.contextPath}/admin/stumanaadd.jsp";
		});
		
		//수강생 삭제
		$("button#btnDel").click(function() {
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
               <a id="navi" href="${contextPath}/admin/stundetlist">수강생관리</a>
            </p>
			</div>
		</nav>

	<div class="container-fluid" style="float: right; margin-bottom:10px;">
	
		<form class="form-inline" method="post">
			<!-- 검색 액션 -->
			<div class="form-group">
				<select class="form-control" id="key" name="key">
					<option value="mid_">Mid</option>
					<option value="name_">Name</option>
					<option value="phone">Phone</option>
				</select>
			</div>
			<div class="input-group">
				<input type="text" class="form-control" id="value" name="value"
					placeholder="Search">
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
		</form>
	</div>
	

		
		
		
		<div class="container-fluid full-width">

			<!-- <div class="checkbox">
				<label><input id="allCheck" type="checkbox" value="">전체선택</label>
			</div> -->

			<form class="form-inline"
				action="${pageContext.request.contextPath}/admin/studentmodify">
				<table class="table">
				
				<tr class="active">
					<th><label><input id="allCheck" type="checkbox" value=""></label></th>
					<th>회원번호</th>
					<th>회원명</th>
					<th>등록일</th>
					<th>전화번호</th>
					<th>수강횟수</th>
					<th>수정</th>
				</tr>
				<tr>
					<td><label class="checkbox-inline"
							style="margin-bottom: 15px;"> <input type="checkbox"
								value="MEM001"></label></td>
					<td><a href="${pageContext.request.contextPath}/admin/studentdetaillist">MEM001</a></td>
					<td>홍길동</td>
					<td>2018.02.02</td>
					<td>010-1234-1234</td>
					<td>2</td>
					<td><button type="submit" class="btn btn-default btn-xs"
								value="MEM001">수정</button></td>
				</tr>
				
				<tr>
					<td><label class="checkbox-inline"
							style="margin-bottom: 15px;"> <input type="checkbox"
								value="MEM002"></label></td>
					<td><a href="${pageContext.request.contextPath}/admin/studentdetaillist">MEM002</a></td>
					<td>홍길동</td>
					<td>2018.02.02</td>
					<td>010-1234-1234</td>
					<td>2</td>
					<td><button type="submit" class="btn btn-default btn-xs"
								value="MEM002">수정</button></td>
				</tr>
				
					


				</table>

			</form>
		</div>


		<ul class="pager">
			<li><a href="#">Previous</a></li>
			<li><a href="#">Next</a></li>
		</ul>


		<button type="submit" id ="btnDel" class="btn btn-default pull-left">삭제</button>
		<form action ="${pageContext.request.contextPath}/admin/studentaddform"><button id="btnAdd" type="submit" class="btn btn-default pull-right">등록</button></form>


	</div>








<div class="modal modal-center fade" id="studentDel" role="dialog">
	<div class="modal-dialog modal-sm modal-center">
		<div class="modal-content">
			<!-- <div class="modal-header">
					</div> -->
			<div class="modal-body" style="width: auto; height: auto;">
				<button type="button" class="close" data-dismiss="modal">
					<p style="font-size: 40px;">&times;</p>
				</button>
				<p style="font-size: 15px; margin-top: 55px;">[MEM001]을 삭제하시겠습니까?</p>
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