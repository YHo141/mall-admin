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
<title>categoryUpdateForm</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div class="jumbotron">
	<h1>카테고리 목록 수정</h1>
	</div>
	<%
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String categoryName = request.getParameter("categoryName");
	%>
	<div class="form-group">
		<form method="post" action="/mall-admin/category/categoryUpdateAction.jsp">
			<table class="table table-info table-striped table-hover">
				<tr>
					<th>카테고리 번호</th>
					<td><input class="form-control" type="text" name="categoryId" value="<%=categoryId %>" readonly="readonly">
				</tr>
				<tr>
					<th>카테고리 이름</th>
					<td><textarea class="form-control" rows="10" cols="50" name="categoryName"><%=categoryName %></textarea>
				</tr>
			</table>
			<a href="/mall-admin/category/categoryList.jsp" class="btn btn-secondary">뒤로가기</a>
			<button type="submit" class="btn btn-primary">수정</button>
		</form>
	</div>
</div>
</body>
</html>