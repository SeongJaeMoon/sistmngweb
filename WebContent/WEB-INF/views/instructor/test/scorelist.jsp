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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<style>
th{
	text-align:center;
}
</style>

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
				<li><a id = "resetPw" href="#"><span
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
					<li><a href="${contextPath}/instructor/schedule">강의 스케줄
							조회</a></li>
					<li class="active"><a href="#">시험&성적 관리</a></li>
				</ul>
			</div>

			<div class="container-fluid" style="background-color: black;">
				<p style="color: white; margin-top: 10px;">
					시험&성적 관리 > <a id="navi" href="${contextPath}/instructor/testmng">종료된
						과목 리스트</a> > <a id="navi" href="${contextPath}/instructor/testlist">시험
						리스트</a> > <a id="navi" href="${contextPath}/instructor/scorelist">
						수강생 성적 리스트</a>
				</p>
			</div>
		</nav>


		<div class="infoboard">
			<div class="panel panel-default">
				<div class="panel-body" style="text-align: center;">
					<h4>[OCO001] JAVA를 응용한 사물인터넷 IOT 개발자 양성과정 (2018-01-01 ~
						2018-06-30)</h4>
					<h4>[OSU001] JAVA (2018-01-01 ~ 2018-01-31)</h4>
					<h4>[TES001] 시험일 2018-01-15 (출결배점 : 30 / 필기배점 : 30 / 실기배점 :40)</h4>
				</div>
			</div>


			<h3 style="margin-top: 70px;">수강생 성적 리스트</h3>
			<table class="table table-bordered text-center">

				<!-- 1 -->
				<tr class="active">
					<th><input type="checkbox" id="allCheck" name = "allCheck"></th>
					<th>No</th>
					<th>회원코드</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>등록일</th>
					<th>상태</th>
					<th>출결점수</th>
					<th>필기점수</th>
					<th>실기점수</th>
					<th>총점</th>
					<th>수정</th>
				</tr>
				<tr>
					<td><input type="checkbox" name ="checkbox"></td>
					<td>1</td>
					<td>MEM001</td>
					<td>안동현</td>
					<td>010-1234-5678</td>
					<td>2018-01-01</td>
					<td>수강중</td>
					<td><input id="wriScore" oninput="maxLengthCheck(this)"
						type="number" maxlength="3" min="1" max="100" value = "30"/></td>
					<td><input id="wriScore" oninput="maxLengthCheck(this)"
						type="number" maxlength="3" min="1" max="100" value = "20"/></td>
					<td><input id="wriScore" oninput="maxLengthCheck(this)" value = "30"
						type="number" maxlength="3" min="1" max="100" /></td>
					<td>100</td>
					<td><button class="btn btn-default btn-sm btnUpdate">수정</button></td>
				</tr>
				<tr>
					<td><input type="checkbox" name ="checkbox"></td>
					<td>2</td>
					<td>MEM002</td>
					<td>강태훈</td>
					<td>010-1234-5678</td>
					<td>2018-01-01</td>
					<td>중도탈락</td>
					<td><input id="wriScore" oninput="maxLengthCheck(this)"
						type="number" maxlength="3" min="1" max="100" /></td>
					<td><input id="wriScore" oninput="maxLengthCheck(this)"
						type="number" maxlength="3" min="1" max="100" /></td>
					<td><input id="wriScore" oninput="maxLengthCheck(this)"
						type="number" maxlength="3" min="1" max="100"/></td>
					<td>100</td>
					<td><button class="btn btn-default btn-sm btnUpdate">수정</button></td>
				</tr>
			</table>

			<form style="position: relative;">

				<button type="button"
					class="btn btn-default pull-left btnAllUpdate" data-toggle="modal"
					data-target="#updateModal" disabled = "disabled">삭제</button>

			</form>


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
						action="${pageContext.request.contextPath}/login/login"
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

<script>
	$(document).ready(function() {

		$("div#modalForm").load("${contextPath}/modal.html");

		$('[data-toggle=popover').popover();

		$("a#resetPw").on("click", function() {
			$("div#myPWFormModal").modal();
		});


	$("button.btnUpdate").click(function(){
		$(this).parents("tr").find("td:nth-child(8)").removeAttr("disabled");
		$(this).parents("tr").find("td:nth-child(9)").removeAttr("disabled");
		$(this).parents("tr").find("td:nth-child(10)").removeAttr("disabled");	 
		$(this).parents("td").siblings().find('input#wriScore').removeAttr("disabled");
	}); 
	
	$("button.btnAllUpdate")
			.on(
					"click",
					function() {
						//모달창을 띄울 때 값이 남아있는 것을 Refresh 하기 위해 remove 적용.
						$("div#deleteModal").find("div#deleteTable").remove();
						//CheckBox 검사
						if ($('input:checkbox[name="checkbox"]').is(":checked")) {

							var names = [];
							var id = [];
							$('input:checkbox[name="checkbox"]:checked').each(
									function() {
										id.push($(this).val()); //Check된 Checkbox의 "value" 얻기.
										//td:nth-child("이부분") 컬럼 갯 수가 다를 경우 숫자 바꾸면 됩니다.
										names.push($(this).parents('tr').find(
												"td:nth-child(4)").text()); //Check된 Checkbox의 "과정명" 얻기.
									});

							//컬럼에서 읽어온 과정코드와 과정명을 이용한 모달창에 테이블 만들기.
							var value = "";
							value += "<div id='deleteTable'><table class='table table-striped'>";
							value += "<thead><th>과정코드</th><th>과정명</th></thead><tbody>";
							for (var i = 0; i < id.length; ++i) {
								value += '<tr><td>' + id[i] + '</td><td>'
										+ names[i] + '</td></tr>';
							}
							value += "</tbody></table></div>";
							//모달창에 after를 이용해 테이블 코드 붙여주기.
							$("div#deleteModal div.modal-body").after(value);
							//모달창 띄우기.
							$("div#deleteModal").modal('show');
						}
					});

	//전체 체크 선택.
	$("input#allCheck").click(function() {
		if ($(this).is(':checked')) {
			//테이블 전체 체크.
			$("table.table").find("input").prop("checked", true);			
			$("button.btnAllUpdate").removeAttr("disabled", "");
		} else {
			//체크 해제.
			$("table.table").find("input").prop("checked", false);
			$("button.btnAllUpdate").attr("disabled", "disabled");
		}
	});
	//단일 체크 박스 선택시
	$("input[name='checkbox']").click(function() {
		if ($("input#allCheck").is(":checked")) {
			$("input#allCheck").prop("checked", false);
		}
		if ($("input[name='checkbox']:checked").length == 0) {
			$("button.btnAllUpdate").attr("disabled", "disabled");
		} else {
			$("button.btnAllUpdate").removeAttr("disabled");
			
			}
		});
	});
	
	
	
</script>
<div id = "modalForm">

</div>
</html>