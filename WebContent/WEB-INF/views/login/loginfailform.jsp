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

<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0
		rgba(0, 0, 0, 0.19);
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<Style>
</Style>

<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>

	<div class="container centered">
		<h1 style="font-size: xx-large; text-align: center;">
			<a href="${contextPath}/login.jsp"><img src="${contextPath}/resources/img/sist_logo.png" alt="sist_logo.png">
			</a> 방명록 <small>v1.0</small> <span
				style="font-size: small; color: #777777;"></span>
		</h1>
		<div id=myModal class="modal-content"
			style="margin: auto; width: 50%;">

			<div class="modal-header" style="margin: 20px;">
				<h4 class="modal-title">
					<i class="material-icons">&#xe8f9;</i>로그인
				</h4>
				<p>
					<Strong>로그인에 실패했습니다.</Strong>
				</p>
			</div>
			<div class="modal-body">
				<a href="${contextPath}/inst/login" class="btn btn-default btn-block">MAIN</a>
			</div>

			<div class="modal-footer" style="margin: 20px; padding-top: 50px"></div>
		</div>
	</div>

</body>
</html>