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
		$("div#modalForm2").load("${contextPath}/confirmmodal.html");

		$("a#resetPw").on("click", function() {
			$("div#myPWFormModal").modal();
		});

		$("button.btnRemove").on("click", function() {
			$("div#deleteModal").find("div#deleteTable").remove();
			//CheckBox 검사
			if($('input:checkbox[name="checkbox"]').is(":checked")){

				var names = [];
				var id = [];
				$('input:checkbox[name="checkbox"]:checked').each(function() {
					id.push($(this).val()); //Check된 Checkbox의 "value" 얻기.
					names.push($(this).parents('tr').find("td:nth-child(4)").text()); //Check된 Checkbox의 "과정명" 얻기.
				});	
				
				var value = "";
				value += "<div id='deleteTable'><table class='table table-striped'>";
				value += "<thead><th>과정코드</th><th>과정명</th></thead><tbody>";
				for(var i = 0; i < id.length; ++i){
					value +='<tr><td>'+id[i]+'</td><td>'+names[i]+'</td></tr>';					
				}	
				value += "</tbody></table></div>"; 
				$("div#deleteModal div.modal-body").after(value);
				$("div#deleteModal").modal('show');
			}
		});
		
		
		$("button.btnAdd").on("click", function(){
			location.assign("${contextPath}/admin/courseaddform");
		});
		
		//전체 체크 선택.
		$("input#allCheck").click(function(){
			if($(this).is(':checked')){
				//테이블 전체 체크.
				$("table.table").find("input").prop("checked", true);
				$("button.btnRemove").removeAttr("disabled", "");
			}else{
				//체크 해제.
				 $("table.table").find("input").prop("checked", false);
				 $("button.btnRemove").attr("disabled", "disabled");
			}							
		});
		//단일 체크 박스 선택시
		$("input[name='checkbox']").click(function(){
			if($("input#allCheck").is(":checked")){
				$("input#allCheck").prop("checked", false); 
			}
			if($("input[name='checkbox']:checked").length == 0){
				$("button.btnRemove").attr("disabled", "disabled");
			}else{				
				$("button.btnRemove").removeAttr("disabled");
			}
		});
		
		$("button.btnUpdate").click(function(){
			location.assign("${contextPath}/admin/courseadd");
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
						id="navi" href="${contextPath}/admin/courselist">개설 과정 관리</a>
				</p>
			</div>
		</nav>
		<div class="infoboard">
			<!-- <div class="panel panel-default">
				<div class="panel-body">
					<p style="text-align: center; font-size: 20px;">OCU001 -
						JAVA&파이썬 개발자 양성과정 (2017-11-11~2018-01-01)</p>
					<p style="text-align: center;">OCU001 - JAVA&파이썬 개발자 양성과정
						(2017-11-11~2018-01-01)</p>
				</div>
			</div> -->
			<h3>개설 과정 리스트</h3>
			<table class="table table-bordered text-center">
				<thead>
					<tr class ="active">
						<th><input type="checkbox" id="allCheck" name="allCheck"></th>
						<th>no</th>
						<th>개설 과정코드</th>
						<th>개설 과정명</th>
						<th>개설 과정 기간</th>
						<th>강의실 명</th>
						<th>과목 등록 수</th>
						<th>수강생 인원</th>
						<th>수정</th>
					</tr>
				</thead>
				<tbody id = "list">
				 <tr>
						<td><input type="checkbox"  name="checkbox" value ="OCU001"></td>
						<td>1</td>
						<td>OCU001</td>
						<td><a href="${contextPath}/admin/coursedetaillist">JAVA를
								응용한 사물인터넷 IOT 개발자 양성과정</a></td>
						<td>2017-12-01~2018-04-31</td>
						<td>1강의실</td>
						<td>8</td>
						<td>20</td>
						<!-- 버튼에 id 값 넣어야 함.-->
						<td><button type="button" class="btn btn-default btn-small btnUpdate"
								value="OCU001">수정</button></td>
					</tr>
					<tr>
						<td><input type="checkbox" name = "checkbox" value ="OCU002"></td>
						<td>2</td>
						<td>OCU002</td>
						<td><a href="${contextPath}/admin/coursedetaillist">파이썬
								빅데이터 개발자 양성과정</a></td>
						<td>2018-01-01~2018-06-01</td>
						<td>2강의실</td>
						<td>8</td>
						<td>20</td>
						<!-- 버튼에 id 값 넣어야 함.-->
						<td><button type="button" class="btn btn-default btn-small btnUpdate"
								value="OCU001">수정</button></td>
					</tr>
					<tr>
						<td>&times;</td>
						<td>3</td>
						<td>OCU003</td>
						<td><a href="${contextPath}/admin/coursedetaillist">자바 개발자 양성 과정</a></td>
						<td>2018-04-01~2018-11-01</td>
						<td>3강의실</td>
						<td>8</td>
						<td>20</td>
						<!-- 버튼에 id 값 넣어야 함.-->
						<td><button type="button" class="btn btn-default btn-small btnUpdate"
								value="OCU003">수정</button></td>
					</tr>
				</tbody>
			</table>
			<button type="button" class="btn btn-default pull-left btnRemove" disabled = "disabled">삭제</button>
			<button type="button" class="btn btn-default pull-right btnAdd" >과정 등록</button>
		</div>
	</div>
	<div id="modalForm"></div>
	<div id="modalForm2"></div>
	
</body>
</html>