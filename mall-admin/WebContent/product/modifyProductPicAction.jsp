<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "com.oreilly.servlet.MultipartRequest" %>
<%@ page import= "com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%
	// 1. 상품아이디와 이미지파일을 받는다
	// 2. 이미지파일을 서버 / images폴더에 새로운 이름으로 저장
	// 3. 저장된 이미지의 이름을 상품테이블에서 수정한다
	//String productId = request.getParameter("productId");
	//String productPic = request.getParameter("productPic");
	//System.out.println(productId+"<-- productId");
	//System.out.println(productPic+"<-- productPic");
	
	int size = 1024 * 1024 * 100;	//	100메가(M)
	
	DefaultFileRenamePolicy dfp = new DefaultFileRenamePolicy();
	String path = application.getRealPath("img");
	MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", dfp);
	
	int productId = Integer.parseInt(multi.getParameter("productId"));
	System.out.println(productId+"<-- productId");
	
	System.out.println(multi.getOriginalFileName("productPic")+(" <-- 파일원본"));
	

	String productPic = multi.getFilesystemName("productPic");
	System.out.println(multi.getFilesystemName("productPic")+(" <-- 새로생성된파일원본"));
	
	Product product = new Product();
	product.setProductId(productId);
	product.setProductPic(productPic);
	
	// update product set product_pic=? where product_id=?
	//ProductDao.updateProductPic();
%>