<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="<%=request.getContextPath()%>"></c:set>

<%
	request.setCharacterEncoding("UTF-8");
%>
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
		

	});
</script>


</head>
<body>

	<div class="container">

		<div class="center-block" style="width: 300px; margin-top: 150px">
			<h3>welcome to TEAM One!</h3>
			<!-- DB 처리 필요. -->
			<form action="${contextPath}/login/loginRequest" method="post">
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-user"></i></span> <input id="id_" type="text"
						class="form-control" name="id_" placeholder="Username">
				</div>
				<div class="input-group">
					<span class="input-group-addon"><i
						class="glyphicon glyphicon-lock"></i></span> <input id="password"
						type="password" class="form-control" name="password"
						placeholder="Password">
				</div>
				<div class="radio">
					<label class="radio-inline"> <input type="radio" name="optradio" checked="checked" value ="1">수강생</label> 
					<label class="radio-inline"> <input type="radio" name="optradio" value = "2">관리자</label> 
					<label class="radio-inline"> <input type="radio" name="optradio" value = "3">강사</label>
				</div>
				<button type="submit"
					style="background-color: black; color: #ffffff; font-weight: bold;"
					class="btn btn-basic btn-block">Login</button>
				<button type="button" class="btn btn-basic btn-block"
					style="font-weight: bold;">아이디/비밀번호찾기</button>
			</form>
		</div>

	</div>

</body>
</html>