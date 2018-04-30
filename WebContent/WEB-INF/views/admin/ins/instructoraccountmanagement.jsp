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
	$(document)
			.ready(
					function() {
						$("button.btnRemove")
								.on(
										"click",
										function() {
											//모달창을 띄울 때 값이 남아있는 것을 Refresh 하기 위해 remove 적용.
											$("div#deleteModal").find(
													"div#deleteTable").remove();
											//CheckBox 검사
											if ($(
													'input:checkbox[name="checkbox"]')
													.is(":checked")) {

												var names = [];
												var id = [];
												$(
														'input:checkbox[name="checkbox"]:checked')
														.each(
																function() {
																	id
																			.push($(
																					this)
																					.val()); //Check된 Checkbox의 "value" 얻기.
																	//td:nth-child("이부분") 컬럼 갯 수가 다를 경우 숫자 바꾸면 됩니다.
																	names
																			.push($(
																					this)
																					.parents(
																							'tr')
																					.find(
																							"td:nth-child(4)")
																					.text()); //Check된 Checkbox의 "과정명" 얻기.
																});

												//컬럼에서 읽어온 과정코드와 과정명을 이용한 모달창에 테이블 만들기.
												var value = "";
												value += "<div id='deleteTable'><table class='table table-striped'>";
												value += "<thead><th>과정코드</th><th>과정명</th></thead><tbody>";
												for (var i = 0; i < id.length; ++i) {
													value += '<tr><td>' + id[i]
															+ '</td><td>'
															+ names[i]
															+ '</td></tr>';
												}
												value += "</tbody></table></div>";
												//모달창에 after를 이용해 테이블 코드 붙여주기.
												$(
														"div#deleteModal div.modal-body")
														.after(value);
												//모달창 띄우기.
												$("div#deleteModal").modal(
														'show');
											}
										});

						//전체 체크 선택.
						$("input#allCheck").click(
								function() {
									if ($(this).is(':checked')) {
										//테이블 전체 체크.
										$("table.table").find("input").prop(
												"checked", true);
										$("button.btnRemove").removeAttr(
												"disabled", "");
									} else {
										//체크 해제.
										$("table.table").find("input").prop(
												"checked", false);
										$("button.btnRemove").attr("disabled",
												"disabled");
									}
								});
						//단일 체크 박스 선택시
						$("input[name='checkbox']")
								.click(
										function() {
											if ($("input#allCheck").is(
													":checked")) {
												$("input#allCheck").prop(
														"checked", false);
											}
											if ($("input[name='checkbox']:checked").length == 0) {
												$("button.btnRemove").attr(
														"disabled", "disabled");
											} else {
												$("button.btnRemove")
														.removeAttr("disabled");
											}
										});
					});
</script>
</head>
<body>

	<div class="container">
		<div class="container-fluid">
			<a href="${contextPath}/admin/list"><img
				src="${contextPath}/resources/img/sist_logo.png" alt="sist_logo.png">성적 관리
				프로그램</a>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="glyphicon glyphicon-user"></span>
						[관리자]님이 로그인 했습니다</a></li>
				<li><a href="#" data-toggle="modal"
					data-target="#myLoginFormModal"><span
						class="glyphicon glyphicon-wrench"></span> 비밀번호변경</a></li>
				<li><a href="${contextPath}/inst/login"><span
						class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
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
						href="${contextPath}/admin/inslist"> 강사계정관리</a>
				</p>
			</div>
		</nav>

		<div class="container">
			<h4>강사계정관리</h4>
			<table class="table table-bordered"style="text-align:center;">
				<thead>
					<tr class="active">
						<th><label><input type="checkbox" value="allCheck"
								id="allCheck"></label></th>
						<th>No</th>
						<th>강사 번호</th>
						<th>이름</th>
						<th>주민등록번호</th>
						<th>전화번호</th>
						<th>강의 가능 과목</th>
						<th>강사등록일</th>
						<th>수정</th>
						<th>자세히</th>
					</tr>

				</thead>
				<tbody>
					<tr>
						<td><label><input type="checkbox"></label></td>
						<td>1</td>
						<td>TEA001</td>
						<td>최유미</td>
						<td>111134-*******</td>
						<td>010-4567-5678</td>
						<td>HTML,Python</td>
						<td>2018-01-01</td>
						<td><button type="button" class="btn btn-default btn-xs"
								onclick="location.href='${contextPath}/inst/edit'">수정</button></td>
						<td><button type="button" class="btn btn-default btn-xs"
								onclick="location.href='${contextPath}/inst/detail'">자세히</button></td>
					</tr>
					<tr>
						<td><label><input type="checkbox" value=""></label></td>
						<td>2</td>
						<td>TEA002</td>
						<td>김선호</td>
						<td>940904-*******</td>
						<td>010-1234-5678</td>
						<td>HTML,Python</td>
						<td>2018-01-01</td>
						<td><button type="button" class="btn btn-default btn-xs"
								onclick="location.href='${contextPath}/inst/edit'">수정</button></td>
						<td><button type="button" class="btn btn-default btn-xs"
								onclick="location.href='${contextPath}/inst/detail'">자세히</button></td>
					</tr>

				</tbody>

			</table>
		</div>
		<div style="float: left;">
			<td><button type="button" class="btn btn-default btnReplyRemove"
					data-toggle="modal" data-target="#myModal">삭제</button></td>
		</div>
		<div style="float: right;">
			<td><button type="button" class="btn btn-default btnReplyAdd"
					onclick="location.href='${contextPath}/inst/insert'">등록</button></td>

		</div>

		<div class="modal modal-center fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm modal-center">
				<div class="modal-content">
					<!-- <div class="modal-header">
					</div> -->
					<div class="modal-body" style="width: auto; height: auto;">
						<button type="button" class="close" data-dismiss="modal">
							<p style="font-size: 40px;">&times;</p>
						</button>
						<p style="font-size: 15px; margin-top: 55px;">삭제하시겠습니까?</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-block"
							data-dismiss="modal">삭제</button>
					</div>
				</div>
			</div>
		</div>

		<div id="deleteModal" class="modal modal-center fade" role="dialog">
			<div class="modal-dialog modal-sm modal-center" style="width: 500px;">
				<div class="modal-content">
					<div class="modal-body" style="width: auto; height: auto;">
						<button type="button" class="close deleteClose"
							data-dismiss="modal">
							<p style="font-size: 40px;">&times;</p>
						</button>
					</div>
					<!-- 테이블 추가 위치 -->
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-block btnDelete"
							data-dismiss="modal">확인</button>
					</div>
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
</body>
</html>