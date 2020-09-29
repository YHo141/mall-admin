<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	if(session.getAttribute("loginAdminId") == null){
		response.sendRedirect("/mall-admin/login.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
	<%	
		request.setCharacterEncoding("utf-8");
	
		int categoryId = -1;
		if(request.getParameter("categoryId") != null){
			categoryId = Integer.parseInt(request.getParameter("categoryId"));
		}

		ProductDao productDao = new ProductDao();
		ArrayList<Product> productList = null;
		if(categoryId == -1){
			productList = productDao.selectProductList();
		}else{
			productList = productDao.selectProductListByCategoryId(categoryId);
		}
		
		CategoryDao categoryDao = new CategoryDao();
		ArrayList<Category> categoryList = categoryDao.selectCategoryList();
		
	%>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div class="jumbotron">
	<h1>상품 목록</h1>
	</div>
	
	<div class = "table table-success">
	<div class="btn-group btn-group-lg">
		<%
			for(Category c : categoryList){
		%>
				<a href="/mall-admin/product/productList.jsp?categoryId=<%=c.categoryId %>" class="btn btn-info">[<%=c.categoryName %>]</a>
		<%
			}
		%>
		<!-- 카테고리 별로 검색하고 전체리스트보기 -->
		<a href="/mall-admin/product/productList.jsp" class="btn btn-secondary">[전체목록]</a>
	</div>
	</div>
	
	<!-- 상품추가 -->
	<div>
		<a href="/mall-admin/product/addProduct.jsp" class="btn btn-primary">상품추가</a>
	</div>
	
	<table class="table table-dark table-striped table-hover">
		<thead>
			<tr>
				<td>product_id</td>
				<td>category_id</td>
				<td>product_name</td>
				<td>product_price</td>
				<td>product_soldout</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
		</thead>
		<tbody>
			<%
				for(Product p : productList){
					if(p.productSoldout.equals("Y")){
			%>
					<tr class="text-danger">
					<td><del><a href="/mall-admin/product/productOne.jsp?productId=<%=p.productId %>" class="btn btn-danger"><%=p.productId %></a></del></td>
					<td><del><%=p.categoryId %></del></td>
					<td><del><%=p.productName %></del></td>
					<td><del><%=p.productPrice %></del></td>
					<td>품절</td>
					<td><a href="/mall-admin/product/productUpdateForm.jsp?productId=<%=p.productId %>&productPrice=<%=p.productPrice%>&productName=<%=p.productName%>&productContent=<%=p.productContent%>&productSoldout=<%=p.productSoldout%>" class="btn btn-primary">수정</a></td>
					<td><a href="/mall-admin/product/productDeleteAction.jsp?productId=<%=p.productId %>&productPrice=<%=p.productPrice%>&productName=<%=p.productName%>&productContent=<%=p.productContent%>&productSoldout=<%=p.productSoldout%>" class="btn btn-danger">삭제</a></td>
					</tr>
			<%
					}else{
			%>
				<tr class="text-success">
					<td><a href="/mall-admin/product/productOne.jsp?productId=<%=p.productId %>" class="btn btn-primary"><%=p.productId %></a></td>
					<td><%=p.categoryId %></td>
					<td><%=p.productName %></td>
					<td><%=p.productPrice %></td>
					<td>판매중</td>
					<td><a href="/mall-admin/product/productUpdateForm.jsp?productId=<%=p.productId %>&productPrice=<%=p.productPrice%>&productName=<%=p.productName%>&productContent=<%=p.productContent%>&productSoldout=<%=p.productSoldout%>" class="btn btn-primary">수정</a></td>
					<td><a href="/mall-admin/product/productDeleteAction.jsp?productId=<%=p.productId %>&productPrice=<%=p.productPrice%>&productName=<%=p.productName%>&productContent=<%=p.productContent%>&productSoldout=<%=p.productSoldout%>" class="btn btn-danger">삭제</a></td>
				<tr>
			<%
					}
				}
			%>
		</tbody>
	</table>
</div>
</body>
</html>