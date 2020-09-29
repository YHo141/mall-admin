<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyProductPic</title>
</head>
<body>
<%
	int productId = Integer.parseInt(request.getParameter("productId"));
%>
	<h1>상품 이미지 수정</h1>
	<form action="" method="post" enctype="multipart/form-data">
		<div>
		<input type="file">
		</div>
		<div>
			<button type="submit">이미지 수정</button>
		</div>
	</form>
</body>
</html>