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
* {
	font-family: nanum-gothic;
}

div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}

/* input file type */
.input-file {
	display: inline-block;
}

.input-file [type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0 none;
}

.input-file .file-label {
	display: inline-block;
	min-width: 53px;
	height: 27px;
	line-height: 24px;
	padding: 0 10px;
	border-radius: 2px;
	font-size: 13px;
	background-color: #333;
	color: #fff;
	text-align: center;
}

.input-file .file-name {
	width: 300px;
	background: #f5f5f5;
	height: 27px;
	line-height: 26px;
	text-indent: 5px;
	border: 1px solid #bbb;
}


th{
	text-align:center;
}
</style>

<script>
$(function() {
	$("#datepicker").datepicker();
});
function maxLengthCheck(object) {
	if (object.value.length > object.maxLength)
		object.value = object.value.slice(0, object.maxLength)
}
	$(document).ready(function() {

		$("div#modalForm").load("${contextPath}/modal.html");
		$("div#modalForm2").load("${contextPath}/instruct/instructmodal.html");
		
		$('[data-toggle=popover').popover();

		$("a#resetPw").on("click", function() {
			$("div#myPWFormModal").modal();
		});

	$("button.btnRemove")
			.on(
					"click",
					function() {
						//모달창을 띄울 때 값이 남아있는 것을 Refresh 하기 위해 remove 적용.
						console.log("delete btn");
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
							value += "<thead><th>시험코드</th><th>시험날짜</th></thead><tbody>";
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
	
	$("button.btnUpdate").click(function(){
		/* $("div#addTest").find("div#form-group").remove(); */
		var date = $(this).parents("td").parents("tr").find("td:nth-child(4)");
		var wr1 = $(this).parents("td").parents("tr").find("td:nth-child(5)");
		var wr2 =  $(this).parents("td").parents("tr").find("td:nth-child(6)");
		var wr3 =  $(this).parents("td").parents("tr").find("td:nth-child(7)");
		console.log(date.text(), wr1.text(), wr2.text(), wr3.text());
		$("div#addTest").find("div.form-group").find("input#datepicker").val(date.text());
		$("div#addTest").find("div.form-group").find("input#attDistribution").val(wr1.text());
		$("div#addTest").find("div.form-group").find("input#wriDistribution").val(wr2.text());
		$("div#addTest").find("div.form-group").find("input#pracDistribution").val(wr3.text());
		$("div#addTest").modal("show");
		
	});
	
	$("button.btnAdd").click(function(){
		
		//4~7
		$("div#addTest").find("div.form-group").find("input#datepicker").val('');
		$("div#addTest").find("div.form-group").find("input#attDistribution").val('');
		$("div#addTest").find("div.form-group").find("input#wriDistribution").val('');
		$("div#addTest").find("div.form-group").find("input#pracDistribution").val('');
		
		$("div#addTest").modal("show");
	});

	// jQuery methods go here...
	$("input[type='file']").on('change', function() {
		var input = $(this);
		var label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
		$("#" + input.data("display-target")).val(label);
	});
});
</script>

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
				<li><a href="#" id="resetPw"><span
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
					<li class="active"><a href="${contextPath}/instructor/testlist">시험&amp;성적 관리</a></li>
				</ul>
			</div>

			<div class="container-fluid" style="background-color: black;">
				<p style="color: white; margin-top: 10px;">
					시험&성적 관리 > <a id="navi" href="${contextPath}/instructor/testmng">종료된
						과목 리스트</a> > <a id="navi" href="${contextPath}/instructor/testlist">시험
						리스트</a>
				</p>
			</div>
		</nav>


		<div class="infoboard">
			<div class="panel panel-default">
				<div class="panel-body" style="text-align: center;">
					<h4>[OCO001] JAVA를 응용한 사물인터넷 IOT 개발자 양성과정 (2018-01-01 ~
						2018-06-30)</h4>
					<h4>[OSU001] JAVA (2018-01-01 ~ 2018-01-31)</h4>
				</div>
			</div>
			
			
			<h3 style="margin-top: 70px;">시험 리스트</h3>
			<table class="table table-bordered text-center">

				<!-- 1 -->
				<tr class="active">
					<th><input type="checkbox" id="allCheck" name="allCheck"></th>
					<th>No</th>
					<th>시험코드</th>
					<th>시험날짜</th> 
					<th>출결배점</th>
					<th>필기배점</th>
					<th>시험배점</th>
					<th>시험문제</th>
					<th>수정</th>
				</tr>
				<tr>
					<td><input type="checkbox" name="checkbox" value ="TES001"></td>
					<td>1</td>
					<td><a href ="${contextPath}/instructor/scorelist">TES001</a></td>
					<td>2018-04-05</td>
					<td>30</td>
					<td>30</td>
					<td>40</td>
					<td><a href="#">tes001.zip</a></td>
					<td><button class="btn btn-default btn-sm btnUpdate" value ="TES001">수정</button></td>
				</tr>
				<tr>
					<td><input type="checkbox" name="checkbox" value ="TES002"></td>
					<td>2</td>
					<td><a href ="${contextPath}/instructor/scorelist">TES002</a></td>
					<td>2018-04-10</td>
					<td>25</td>
					<td>25</td>
					<td>50</td>
					<td><a href="#">tes002.zip</a></td>
					<td><button class="btn btn-default btn-sm btnUpdate" value ="TES002">수정</button></td>
				</tr>
			</table>

			<form style="position: relative;">

				<button type="button" class="btn btn-default pull-left btnRemove" disabled="disabled">삭제</button>

				<button type="button" class="btn btn-default pull-right btnAdd">시험 등록</button>

			</form>


		</div>
	</div>

	<div id = "modalForm"></div>
	<div id = "modalForm2"></div>
</body>

</html>