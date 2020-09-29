<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
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
<title>productUpdateForm</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div class="jumbotron">
	<h1>상품 수정</h1>
	</div>
	<%
		int productId = Integer.parseInt(request.getParameter("productId"));
		String productName = request.getParameter("productName");
		int productPrice = Integer.parseInt(request.getParameter("productPrice"));
		String productContent = request.getParameter("productContent");
		String productSoldout = request.getParameter("productSoldout");
	%>
	<div class="form-group">
		<form method="post" action="/mall-admin/product/productUpdateAction.jsp">
			<table class="table table-info table-striped table-hover">
				<tr>
					<th>상품 번호</th>
					<td><input class="form-control" type="text" name="productId" value="<%=productId %>" readonly="readonly"></td>
				</tr>
				<tr>
					<th>상품 이름</th>
					<td><input class="form-control" type="text" name="productName" value="<%=productName %>"></td>
				</tr>
				<tr>
					<th>상품 가격</th>
					<td><input class="form-control" type="text" name="productPrice" value="<%=productPrice %>"></td>
				</tr>
				<tr>
					<th>상품 내용</th>
					<td><input class="form-control" type="text" name="productContent" value="<%=productContent %>"></td>
				</tr>
				<%
					if(productSoldout.equals("Y")){
				%>
				<tr>
					<th>상품 매진여부</th>
					<td><input type="radio" name="productSoldout" value="<%=productSoldout %>" checked="checked"></td>
				</tr>
				<%
					}else{
				%>
				<tr>
					<th>상품 매진여부</th>
					<td><input type="radio" name="productSoldout" value="<%=productSoldout %>"></td>
				</tr>
				<%
					}
				%>
			</table>
			<a href="/mall-admin/product/productList.jsp" class="btn btn-secondary">뒤로가기</a>
			<button type="submit" class="btn btn-primary">수정</button>
		</form>
	</div>
	
</div>
</body>
</html>