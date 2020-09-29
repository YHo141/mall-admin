<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");

	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	
	Notice notice = new Notice();
	notice.noticeTitle = noticeTitle;
	notice.noticeContent = noticeContent;
	
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.insertNotice(notice);
	response.sendRedirect(request.getContextPath()+"/notice/noticeList.jsp");
%>
