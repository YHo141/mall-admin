<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	if(session.getAttribute("loginAdminId") == null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div class="jumbotron">
	  <h1>관리자 메인 페이지</h1>
	  <p><%=session.getAttribute("loginAdminId") %>님 반갑습니다.</p>
	</div>
	<div><img class="img-thumbnail" src="/mall-admin/img/cart.jpg" width="400" height="300"></div>
	쇼핑몰 메인페이지 입니다.<br>
	2020.09.18 bootstrap을 사용하여서 2020.09.17에 만들었던 쇼핑몰을 꾸며 보았습니다.
</div>
</body>
</html>