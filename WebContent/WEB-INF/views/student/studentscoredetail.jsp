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

<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/project.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%-- <script 
	src="${contextPath}/resources/script/util.js"></script>	 --%>

<style>
th {
	text-align:center;		
}
</style>

<script>
	$(document).ready(function() {
		
		$("div#modalForm").load("${contextPath}/modal.html");
		
		$('[data-toggle=popover').popover();	
		
		/* $("a.toggler").on("mouseover", function(){
			 var temp = $(this).find('img');
			$(this).children('img').attr("src", getBookImg()); 
			code = $(this).parent().attr("id");
			$(this).attr("data-content", '<img src="javascript:getBookImg('+code+')" style = "width:100%; height:30%;">')
		}); */
		
		$("a#resetPw").on("click", function(){
			$("div#myPWFormModal").modal();
		});
		
			var datas = '${studentsubject}'
			var subjectList = new Array();
			var valueList = new Array();
			<c:forEach items="${studentsubject}" var="item">
			subjectList.push("${item.subjectName}");
			var wr = "${item.writingScore}"
			var pr = "${item.practiceScore}"
			var at = "${item.attendanceScore}"
			valueList.push(parseInt(wr)+parseInt(pr)+parseInt(at));
			</c:forEach>
		
			ret = "[";
			for (var i = 0; i < subjectList.length; i++) {
			    ret += '{ "y":'+valueList[i]+', "label":"'+subjectList[i]+'"}' + (i == subjectList.length - 1 ? "" : ",");
			    
			}
			ret += "]";
		
			var temp = JSON.parse(ret);
		
			var chart = new CanvasJS.Chart("barChart", {
				animationEnabled: true,
				title:{
					text:"과목별 성적 그래프"
				},
				axisX:{
					valueFormatString: "#,##0.##",
					interval: 1
				},
				axisY2:{
					interlacedColor: "rgba(211, 211, 211,.2)",
					gridColor: "rgba(211, 211, 211,.1)",
					title: "총점"
				},
				data: [{
					type: "bar",
					name: "과목",
					axisYType: "secondary",
					color: "#778899",
					type: "column",
					dataPoints: temp
					
				}]
				
			});
			chart.render();
		
	/* data-toggle="modal" data-target="#myModal1" */
	});
</script>

</head>
<body>
	<div class="container">
		<div class="container-fluid">
			<a href="${contextPath}/student/list"><img
				src="${contextPath}/resources/img/sist_logo.png" alt="sist_logo.png">성적
				관리 프로그램</a>
			<ul class="nav navbar-nav navbar-right">

				<li><a href="${contextPath}/student/list"><span class="glyphicon glyphicon-user"></span>
						[수강생]님이 로그인 했습니다</a></li>
				<li><a id = "resetPw" href="#"><span class="glyphicon glyphicon-wrench"></span>
						비밀번호변경</a></li>
				<li><a href="${contextPath}/login/logoutform"><span class="glyphicon glyphicon-log-out"></span>
						로그아웃</a></li>
			</ul>
		</div>

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header"></div>
				<ul class="nav navbar-nav">
					<li><a href="${contextPath}/student/list">홈</a></li>
					<li class="active"><a href="${contextPath}/student/studentscore">성적 조회</a></li>
				</ul>
			</div>

			<div class="container-fluid" style="background-color: black;">
				<p style="color: white; margin-top: 10px;">
					<a id = "navi" href="${contextPath}/student/list">홈 </a> > <a id = "navi" href="${contextPath}/student/studentscore">성적 조회</a>  > <a id = "navi" href="${contextPath}/student/studentscoredetail">성적 상세보기</a>
				</p>
			</div>
		</nav>

		<div class="infoboard">
			<div class="panel panel-default">
				<div class="panel-body" style="text-align: center;">
					<h4>[${ocu}] ${octitle} (${dates})</h4>
				</div>
			</div>
			<table class="table table-bordered text-center" >
				<thead>
					<tr class="active">
						<th>no</th>
						<th>과목코드</th>
						<th>과목명</th>
						<th>기간</th>
						<th>교재명</th>
						<th>강사명</th>
						<th>출결배점</th>
						<th>출결점수</th>
						<th>실기배점</th>
						<th>실기점수</th>
						<th>필기배점</th>
						<th>필기점수</th>
						<th>시험날짜</th>
						<th>시험문제</th>
					</tr>
				</thead>
				<tbody>
					
					 <c:forEach var="sd" items="${studentsubject}" varStatus="idx">
					<tr>
						<td>${idx.count}</td>
						<td>${sd.openSubCode}</td>
						<td>${sd.subjectName}</td>
						<td>${sd.openSubStartDate}&#126;<br>${sd.openSubCloseDate}
						</td>
						<!-- data-toggle 부분에 회원 번호, ISBN 넣어야 함. -->
						<td><a class="toggler" href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content = '<img src="${sd.isbn}" style = "width:100%; height:30%;">'>
							
							${sd.bookName}</a></td>
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="<img src='${contextPath}/resources/pictures/instructor/avatar.png' style = 'width:100%; height:30%;'>">${sd.name_}</a></td>
						<td>${sd.attDistribution}</td>
						<td>${sd.attendanceScore}</td>
						<td>${sd.pracDistribution}</td>
						<td>${sd.practiceScore}</td>
						<td>${sd.wriDistribution}</td>
						<td>${sd.writingScore}</td>
						<td>${sd.testDate}</td>
						<td><a href="#">${sd.testFile}</a></td>
					</tr>
					</c:forEach>
					
					<%-- <tr>
						<td>1</td>
						<td>SUB002</td>
						<td>파이썬</td>
						<td>2017-11-01~<br>2018-01-01
						</td>
						<!-- data-toggle 부분에 회원 번호, ISBN 넣어야 함. -->
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="<img src='${contextPath}/resources/pictures/ajax_book2.jpg' style = 'width:100%; height:30%;'>">점프
								투 파이썬</a></td>
						<td><a href="#" data-toggle="popover" data-placement="top"
							data-trigger="hover" data-html="true"
							data-content="<img src='${contextPath}/resources/pictures/avatar.png' style = 'width:100%; height:30%;'>">이민종</a></td>
						<td>70</td>
						<td>70</td>
						<td>10</td>
						<td>0</td>
						<td>20</td>
						<td>20</td>
						<td>2017-11-03</td>
						<td><a href="#">java1.zip</a></td>
					</tr> --%>

				</tbody>
			</table>
			
			<!--그래프 나타날 영역.-->
			<div id="barChart" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
			
		</div>
	</div>
	
	<div id = "modalForm">
		
	</div>
	
	<script src="${contextPath}/resources/script/canvasjs.min.js"></script>
</body>

</html>