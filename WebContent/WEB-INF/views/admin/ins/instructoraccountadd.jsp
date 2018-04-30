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

<link rel="stylesheet" type="text/css"
	href="${contextPath}/resources/css/project.css">

<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

#wrapper {
	width: 500px;
	height: 750px;
	margin: 0 auto;
	border: 1px;
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

		//전체 체크 선택.
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
	});

	function Check(form) {
		//'확인' 버튼을 클릭했을 때 실행되는 메서드
		var msg = "";

		if (form.cb1.checked)
			msg += form.cb1.value + "  ";
		if (form.cb2.checked)
			msg += form.cb2.value + "  ";
		if (form.cb3.checked)
			msg += form.cb3.value + "  ";

		document.getElementById("usr123").value = msg;
	}
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
					> <a id="navi"
						href="${contextPath}/admin/insaddform">강사등록</a>
				</p>
			</div>
		</nav>
		
		<div id="wrapper" style="text-align: center">
		<h3>강사등록</h3>
			<img src="avatar.png" width="200" height="200" align="top">
			<input type="file" />
			<div class="form-group">
				<label for="usr1">강사명</label> <input type="text"
					style="text-align: center;" class="form-control" id="usr1">
				<label for="usr2">주민등록번호</label> <input type="text"
					style="text-align: center;" class="form-control" id="usr2">
				<label for="usr3">전화번호</label> <input type="text"
					style="text-align: center;" class="form-control" id="usr3">
				<label for="usr4">강사등록일</label> <input type="date"
					class="form-control" id="usr4" name="regDate">
			</div>
			<label for="usr5">강의 가능 과목</label>
			<button type="button" class="btn btn-default" data-toggle="modal"
				data-target="#myModal">찾아보기</button>
			<input type="text" style="height: 200px;" class="form-control"
				id="usr123" disabled=disabled>
		</div>
		<div style="float: right;">
			<button type="button" class="btn btn-default" id="add"
				data-toggle="modal" data-target="#myModal2">등록</button>
		</div>
	</div>

	<!-- 강의 가능 과목 모달 -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">과목</h4>
				</div>
				<form name="form1">
					<div class="modal-body">
						<table class="table table-bordered" style="text-align:center;">
							<thead>
								<tr>
									<th><label><input type="checkbox" value="allCheck" id="allCheck"></label></th>
									<th>No</th>
									<th>과목 코드</th>
									<th>과목명</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox" name="cb1" value="C#"></td>
									<td>1</td>
									<td>SUB001</td>
									<td>C#</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="cb2" value="ASP.NET"></td>
									<td>2</td>
									<td>SUB002</td>
									<td>ASP.NET</td>
								</tr>
								<tr>
									<td><input type="checkbox" name="cb3" value="XML"></td>
									<td>3</td>
									<td>SUB003</td>
									<td>XML</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" value="확인"
							onclick="Check(this.form);" data-dismiss="modal">확인</button>
					</div>
				</form>
			</div>

		</div>
	</div>

	<!-- 강사 등록 모달 -->
	<div class="modal modal-center fade" id="myModal2" role="dialog">
		<div class="modal-dialog modal-sm modal-center">
			<div class="modal-content">
				<!-- <div class="modal-header">
					</div> -->
				<form
					action="${contextPath}/inst/list">
					<div class="modal-body" style="width: auto; height: auto;">
						<button type="button" class="close" data-dismiss="modal">
							<p style="font-size: 40px;">&times;</p>
						</button>
						<p style="font-size: 15px; margin-top: 55px;">등록하시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-default btn-block">등록</button>
					</div>
				</form>
			</div>
		</div>
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

					<form role="form" method="post" action="${contextPath}/inst/login"
						style="margin-top: 40px;">
						<div class="form-group"
							style="margin-left: 14px; margin-right: 14px;">
							<label for="pw"> 변경할 비밀번호를 입력해 주세요</label> <input type="password"
								class="form-control" id="loginformpw" name="pw_"
								placeholder="******" required="required">
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
								type="password" class="form-control" id="loginformpw" name="pw_"
								placeholder="******" required="required">
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

</body>
</html>