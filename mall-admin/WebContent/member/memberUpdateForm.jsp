<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
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
<title>memberUpdateForm</title>
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
		request.setCharacterEncoding("utf-8");
	
		String memberEmail = request.getParameter("memberEmail");
		String memberPw = request.getParameter("memberPw");
		String memberName = request.getParameter("memberName");
		String memberDate = request.getParameter("memberDate");
		
		System.out.println(memberEmail);
		System.out.println(memberPw);
		System.out.println(memberName);
		System.out.println(memberDate);
	%>
	<div class="form-group">
		<form method="post" action="<%=request.getContextPath()%>/member/memberUpdateAction.jsp">
			<table class="table table-info table-striped table-hover">
				<tr>
					<th>회원 이메일</th>
					<td><input class="form-control" type="text" name="memberEmail" value="<%=memberEmail %>" readonly="readonly"></td>
				</tr>
				<tr>
					<th>회원 비밀번호</th>
					<td><textarea class="form-control" name="memberPw"><%=memberPw %></textarea>
				</tr>
				<tr>
					<th>회원 이름</th>
					<td><textarea class="form-control"name="memberName"><%=memberName %></textarea>
				</tr>
				<tr>
					<th>회원가입 날짜</th>
					<td><input class="form-control" type="text" name="memberDate" value="<%=memberDate %>" readonly="readonly"></td>
				</tr>
			</table>
			<a href="/mall-admin/member/memberList.jsp" class="btn btn-secondary">뒤로가기</a>
			<button type="submit" class="btn btn-primary">수정</button>
		</form>
	</div>
	
</div>
</body>
</html>