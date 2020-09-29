<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	
	System.out.println(noticeTitle+" <-- title");
	System.out.println(noticeContent+" <-- content");
	
	Notice notice = new Notice();
	notice.noticeTitle = noticeTitle;
	notice.noticeContent = noticeContent;
	
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.updateNotice(notice);
	response.sendRedirect(request.getContextPath()+"/notice/noticeList.jsp");
	
%>
