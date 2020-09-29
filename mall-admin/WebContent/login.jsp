<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId") != null){
		System.out.println("로그인중 입니다.");
		response.sendRedirect("/mall-admin/index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div class="jumbotron">
	<h1>관리자 로그인</h1>
	</div>
	<form method="post" action="/mall-admin/loginAction.jsp" class="was-validated">	<!-- 절대주소 -->
	<div class="form-group">
	<table class="table table-bordered">
		<tr>
			<td>관리자 ID</td>
			<td><input class="form-control" type="text" name="adminId" value="admin" required></td>
		</tr>
		<tr>
			<td>관리자 PW</td>
			<td><input class="form-control" type="password" name="adminPw" value="1234" required></td>
		</tr>
	</table>
	<button type="submit" class="btn btn-primary"><img src="/mall-admin/img/key.jpg" width="50" height="40" alt="">로그인</button>
	</div>
	</form>
		<div><a href="/mall/login/login.jsp" class="btn btn-secondary">사용자 계정</a></div>
	</div>

</body>
</html>