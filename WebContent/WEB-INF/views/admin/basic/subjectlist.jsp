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

<style>

div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
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

	//강의실 코드 수정 모달창 오픈
	//수정 버튼 id는 고유번호로
/* 	$("button#btnModify").on("click",function(){		
		//값 화면에 출력하기
		$("div#subjectModify").modal();
		$("input#CourseCodeMo").val("d");
	}); */

	//강의실 등록 모달창 오프
	$("button#btnAdd").on("click",function(){		
		//값 화면에 출력하기
		$("div#AddSubject").modal();	
	});

	//강의실 삭제 모달창 오픈
	$("button#btnDel").on("click",function(){		
		//값 화면에 출력하기
		$("div#subjectDel").modal();
		$("input#CourseCodeMo").val("d");
	});
	
	
	
/* 	//일괄 체크 표시하기
	$("input#AllCheck").on("change", function(){
		
		if ( $("input#AllCheck").is(":checked", true)){

			$("input#1").prop("checked",true);
			$("input#2").prop("checked",true);
			
		} else {

			$("input#1").prop("checked",false);
			$("input#2").prop("checked",false);

		}
	}); */
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
					<li class="dropdown active"><a class="dropdown-toggle"
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
					<li><a href="${contextPath}/admin/studentlist">수강생관리</a></li>
				</ul>
			</div>	
		<div class="container-fluid" style="background-color : black;" ><p style="color : white; margin-top:10px">기초정보관리 > 과목 관리 </p></div>
		</nav>








<div class="container-fluid full-width">
<h4>과목 관리</h4>
				 <table class="table table-bordered">
					<thead>
					<tr class="active">
							<th><form>
									<label class="checkbox-inline"> <input type="checkbox" id="allCheck" value="일관선택">
									</label>

								</form></th>
							<th>NO</th>
							<th>과목코드</th>
							<th>과목명</th>
					
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<form>
									<label class="checkbox-inline"> <input type="checkbox" id="1"
										value="과목코드">
									</label>

								</form>
							</td>
							<td>1</td>
							<td>SUB001</td>
							<td>JAVA</td>
					
						</tr>
						<tr>
							<td>
								<form>
									<label class="checkbox-inline"> <input type="checkbox"
										value="과목코드">
									</label>

								</form>
							</td>
							<td>2</td>
							<td>SUB002</td>
							<td>ORACLE</td>
						
						</tr>
						<tr>
							<td>
								<form>
									<label class="checkbox-inline"> <input type="checkbox"
										value="과목코드">
									</label>

								</form>
							</td>
							<td>3</td>
							<td>SUB003</td>
							<td>SPRING</td>
						
						</tr>
					</tbody>
				</table>
	
		<form style="position: relative;">
			<button id="btnDel" type="button" class="btn btn-default pull-left">삭제</button>
			<button id="btnAdd" type="button" class="btn btn-default pull-right">과목등록</button>
		</form>
	
	
		</div>
	



</div>

<div id="AllModal">
<!-- 과목 추가  -->
<div class="modal fade" id="AddSubject" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<p style="font-size: 40px;">&times;</p>
						</button>
						<h4 class="modal-title">과목 추가</h4>
					</div>
					<div class="modal-body">
						<form action="/action_page.php">
							<div class="form-group">
								<label for="addCourseCode">과목명 : </label> <input type="text"
									class="form-control" id="addCourseCode" placeholder="과목명을 입력하세요"
									name="addCourseCode">
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-default">확인</button>
							</div>
						</form>
					</div>
				</div>
			</div>
</div>



<!-- 과목 삭제  -->
<div class="modal fade" id="subjectDel" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<p style="font-size: 40px;">&times;</p>
						</button>
						<h4 class="modal-title">과목 삭제</h4>
					</div>
					<div class="modal-body">
						<form action="test.jsp">
							<div class="form-group">
							<!-- readonly는 text만 가능하다. -->
								<label for="delCourseCode">과목코드 : </label> <input type="text"
									class="form-control" id="delCourseCode" name="delCourseCode" readOnly = "readOnly">
							</div>
						
							<div class="form-group">
								<label for="delCourseName">과목명 : </label> <input type="text"
									class="form-control" id="delCourseName" 
									name="delCourseName" >
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-default">확인</button>
							</div>
						</form>
					</div>
				</div>
			</div>
</div>



</div>

</body>
</html>