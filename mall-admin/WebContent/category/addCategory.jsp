<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if(session.getAttribute("loginAdminId") == null){
		response.sendRedirect("/mall-admin/login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addCategory.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div class="jumbotron">
	<h1>카테고리 입력</h1>
	</div>
	<div class="form-group">
	<form method="post" action="/mall-admin/category/addCategoryAction.jsp">
	<table class="table table-info table-striped">
		<tr>
		<td>category_name</td>
		<td><input class="form-control" type="text" name="categoryName"></td>
		<td><button type="submit" class="btn btn-primary">카테고리 추가</button></td>
		</tr>
	</table>
	<a href="/mall-admin/category/categoryList.jsp" class="btn btn-secondary">뒤로가기</a>
	</form>
	</div>
</div>
</body>
</html>