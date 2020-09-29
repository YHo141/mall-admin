<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>addNotice.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div class="jumbotron">
		<h1>공지사항 추가</h1>
	</div>
	<div class="form-group">
		<form method="post" action="<%=request.getContextPath()%>/notice/addNoticeAction.jsp">
		<table class="table table-info table-striped">
			<tr>
				<td>notice_title</td>
				<td><input class="form-control" type="text" name="noticeTitle"></td>
			</tr>
			<tr>
				<td>notice_content</td>
				<td><input class="form-control" type="text" name="noticeContent"></td>
			</tr>
		</table>
		<a href="<%=request.getContextPath()%>/notice/noticeList.jsp" class="btn btn-secondary">뒤로가기</a>
		<button type="submit" class="btn btn-primary">공지사항 추가</button>
		</form>
	</div>
</div>
</body>
</html>