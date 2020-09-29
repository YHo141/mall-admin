<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
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
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
<%
	int productId =Integer.parseInt(request.getParameter("productId"));
	System.out.println(productId+"<-- productId");
	Product product = new ProductDao().selectProductOne(productId);
	
%>
	<div class="jumbotron">
	<h1>상품 상세보기</h1>
	</div>
	<table class="table table-info table-striped">
		<tr>
			<td>product_pic</td>
			<td><img src="/mall-admin/img/<%=product.productPic %>">
			<a href="/mall-admin/product/modifyProductPic.jsp?productId=<%=productId%>">이미지수정</a>
			</td>
			
		</tr>
		<tr>
			<td>product_id</td>
			<td><%=product.productId %></td>
		</tr>
		<tr>
			<td>category_id</td>
			<td><%=product.categoryId %></td>
		</tr>
		<tr>
			<td>product_name</td>
			<td><%=product.productName %></td>
		</tr>
		<tr>
			<td>product_price</td>
			<td><%=product.productPrice %></td>
		</tr>
		<tr>
			<td>product_content</td>
			<td><%=product.productContent %></td>
		</tr>
		<tr>
			<td>product_soldout</td>
			<td>
				<%
					if(product.productSoldout.equals("Y")){
				%>
						<a href="/mall-admin/product/modifyProductSoldoutAction.jsp?productId=<%=product.productId %>&productSoldout=<%=product.productSoldout %>" class="btn btn-primary">[품절]</a>
				<%
					}else{
				%>
						<a href="/mall-admin/product/modifyProductSoldoutAction.jsp?productId=<%=product.productId %>&productSoldout=<%=product.productSoldout %>" class="btn btn-primary">[판매중]</a>
				<%
					}
				%>
			</td>
		</tr>
		<tr>
			<td><a href="/mall-admin/product/productUpdateForm.jsp?productId=<%=product.productId %>&productPrice=<%=product.productPrice%>&productName=<%=product.productName%>&productContent=<%=product.productContent%>&productSoldout=<%=product.productSoldout%>" class="btn btn-primary">[수정]</a></td>
			<td><a href="/mall-admin/product/productDeleteAction.jsp?productId=<%=product.productId %>&productPrice=<%=product.productPrice%>&productName=<%=product.productName%>&productContent=<%=product.productContent%>&productSoldout=<%=product.productSoldout%>" class="btn btn-danger">[삭제]</a></td>
		</tr>
			
	</table>
	<a href="/mall-admin/product/productList.jsp" class="btn btn-secondary">뒤로가기</a>
</div>
</body>
</html>