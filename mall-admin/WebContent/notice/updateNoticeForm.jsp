<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateNoticeForm.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div class="jumbotron">
			<h1>공지사항 수정</h1>
	</div>
	<%
		request.setCharacterEncoding("utf-8");
	
		int noticeId = Integer.parseInt(request.getParameter("noticeId"));
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		String noticeDate = request.getParameter("noticeDate");
		
		System.out.println(noticeId);
		System.out.println(noticeTitle);
		System.out.println(noticeContent);
		System.out.println(noticeDate);
	%>
	<div class="form-group">
		<form method="post" action="<%=request.getContextPath()%>/notice/updateNoticeAction.jsp">
			<table class="table table-info table-striped table-hover">
				<tr>
					<th>공지사항 번호</th>
					<td><input class="form-control" type="text" name="noticeId" value="<%=noticeId %>" readonly="readonly"></td>
				</tr>
				<tr>
					<th>공지사항 제목</th>
					<td><input class="form-control" type="text" name="noticeTitle" value="<%=noticeTitle %>"></td>
				</tr>
				<tr>
					<th>공지사항 내용</th>
					<td><input class="form-control" type="text" name="noticeContent" value="<%=noticeContent %>"></td>
				</tr>
				<tr>
					<th>공지사항 날짜</th>
					<td><input class="form-control" type="text" name="noticeDate" value="<%=noticeDate %>" readonly="readonly"></td>
				</tr>
			</table>
			<a href="<%=request.getContextPath()%>/notice/noticeList.jsp" class="btn btn-secondary">뒤로가기</a>
			<button type="submit" class="btn btn-primary">수정</button>
		</form>
	</div>
	
</div>

</body>
</html>