<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>

<%
	request.setCharacterEncoding("utf-8");
	
	String memberEmail = request.getParameter("memberEmail");
	
	Member member = new Member();
	member.memberEmail = memberEmail;
	
	MemberDao memberDao = new MemberDao();
	memberDao.deleteMember(member);
	
	response.sendRedirect(request.getContextPath()+"/member/memberList.jsp");

%>
