<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<%
	if(session.getAttribute("loginAdminId") == null){
		response.sendRedirect("/mall-admin/login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>categoryLsit</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div class="jumbotron">
	<h1>카테고리 목록</h1>
	</div>
	<div>
		<a href="/mall-admin/category/addCategory.jsp" class="btn btn-primary">카테고리 추가</a>
	</div>
	<%
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> list = categoryDao.selectCategoryList();
	%>
	<table class="table table-dark table-striped table-hover">
		<thead>
			<tr>
				<th>category_id</th>
				<th>category_name</th>
			</tr>
		</thead>
		<tbody class="text-success">
			<%
				for(Category c : list){
			%>
					<tr>
						<td><%=c.categoryId %></td>
						<td><%=c.categoryName %></td>
						<td><a href="/mall-admin/category/categoryUpdateForm.jsp?categoryId=<%=c.categoryId %>&categoryName=<%=c.categoryName %>" class="btn btn-primary">수정</a></td>
						<td><a href="/mall-admin/category/categoryDeleteAction.jsp?categoryId=<%=c.categoryId %>" class="btn btn-danger">삭제</a></td>
					</tr>
			<%
				}
			%>
		</tbody>
	</table>
</div>
</body>
</html>