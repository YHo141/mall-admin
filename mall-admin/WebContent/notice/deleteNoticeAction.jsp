<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	request.setCharacterEncoding("utf-8");

	int noticeId = Integer.parseInt(request.getParameter("noticeId"));
	Notice notice = new Notice();
	notice.noticeId = noticeId;
	
	NoticeDao noticeDao = new NoticeDao();
	noticeDao.deleteNotice(notice);
	response.sendRedirect(request.getContextPath()+"/notice/noticeList.jsp");
%>
