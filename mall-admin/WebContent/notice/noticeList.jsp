<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
		<div class="jumbotron">
			<h1>공지사항 목록</h1>
		</div>
		<div>
			<a href="/mall-admin/notice/addNotice.jsp" class="btn btn-primary">공지사항 추가</a>
		</div>
		
		<%
			request.setCharacterEncoding("utf-8");
		
			NoticeDao noticeDao = new NoticeDao();
			ArrayList<Notice> list = noticeDao.selectNoticeList();
			
		%>
		<table class="table table-dark table-striped table-hover">
			<thead>
				<tr>
					<th>notice_id</th>
					<th>notice_title</th>
					<th>notice_date</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody class="text-success">
			<%
			
				for(Notice n : list){
			%>
				<tr>
					<td><%=n.noticeId %></td>
					<td><%=n.noticeTitle %></td>
					<td><%=n.noticeDate %></td>
					<td><a href="<%=request.getContextPath()%>/notice/updateNoticeForm.jsp?noticeId=<%=n.noticeId %>&noticeTitle=<%=n.noticeTitle %>&noticeContent=<%=n.noticeContent %>&noticeDate=<%=n.noticeDate %>" class="btn btn-primary">수정</a></td>
					<td><a href="<%=request.getContextPath()%>/notice/deleteNoticeAction.jsp" class="btn btn-danger">삭제</a></td>
				</tr>
			<%
				}
			%>
			</tbody>
		</table>
		
</div>
</body>
</html>