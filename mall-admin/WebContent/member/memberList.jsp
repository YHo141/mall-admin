<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div class="jumbotron">
		<h1>회원정보 수정</h1>
	</div>
	<%
		MemberDao memberDao = new MemberDao();
		ArrayList<Member> list = memberDao.selectMemberList();
	%>
	
		<table class="table table-dark table-striped table-hover">
			<thead>
				<tr>
					<td>member_email</td>
					<td>member_name</td>
					<td>member_date</td>
					<td>수정</td>
					<td>탈퇴</td>
				</tr>
			</thead>
			<tbody class="text-success">
			<%
				for(Member m : list){
			%>
				<tr>
					<td><%=m.memberEmail %></td>
					<td><%=m.memberName %></td>
					<td><%=m.memberDate %></td>
					<td><a href="/mall-admin/member/memberUpdateForm.jsp?memberEmail=<%=m.memberEmail %>&memberPw=<%=m.memberPw %>&memberName=<%=m.memberName %>&memberDate=<%=m.memberDate %>" class="btn btn-primary">수정</a></td>
					<td><a href="" class="btn btn-danger">탈퇴</a></td>
				</tr>
			<%
				}
			%>
			</tbody>
		</table>
</div>
</body>
</html>