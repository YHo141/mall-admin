<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	int categoryId = Integer.parseInt(request.getParameter("categoryId"));
	String categoryName = request.getParameter("categoryName");
	Category category = new Category();	//	Category클래스에 있는 변수들을 category에 모두 넣는다
	category.categoryId = categoryId;
	category.categoryName = categoryName;
	
	CategoryDao categoryDao = new CategoryDao();
	categoryDao.updateCategory(category);
	response.sendRedirect("/mall-admin/category/categoryList.jsp");

%>