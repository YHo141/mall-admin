<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	int productId = Integer.parseInt(request.getParameter("productId"));
	String productName = request.getParameter("productName");
	int productPrice = Integer.parseInt(request.getParameter("productPrice"));
	String productContent = request.getParameter("productContent");
	String productSoldout = request.getParameter("productSoldout");
	
	Product product = new Product();	//	Product 클래스에 있는 변수들을 product에 모두 넣는다
	product.productName = productName;
	product.productPrice = productPrice;
	product.productId = productId;
	product.productContent = productContent;
	product.productSoldout = productSoldout;
	
	ProductDao productDao = new ProductDao();
	productDao.updateProduct(product);
	
	response.sendRedirect("/mall-admin/product/productList.jsp");
%>