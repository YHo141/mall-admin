<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="dao.*" %>
<%@ page import="vo.*" %>
<%@ page import="java.util.*" %>
<%
	if(session.getAttribute("loginAdminId") == null){
		response.sendRedirect("/mall-admin/login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>modifyOrdersState.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>
	<div class="jumbotron">
	<h1>주문 목록 수정</h1>
	</div>
	<%
		request.setCharacterEncoding("utf-8");
	
		int ordersId = Integer.parseInt(request.getParameter("ordersId"));
		
		String ordersState = "";
		if(request.getParameter("ordersState") != null){
			ordersState = request.getParameter("ordersState");
		}
		OrdersDao ordersDao = new OrdersDao();
		ArrayList<OrdersAndProduct> list = null;
		if(ordersState.equals("")){
			list = ordersDao.selectOrdersList();
		}
	%>
	<div class="form-group">
		<form method="post" action="/mall-admin/orders/updateOrdersStateAction.jsp">
			<table class="table table-info table-striped table-hover">
				<tr>
					<th>배송상태</th>
					<td>
						<select class="form-control" name="ordersState">
								<option value="">카테고리 선택</option>
								<option value="배송준비중">배송준비중</option>
								<option value="결재완료">결재완료</option>
								<option value="배송완료">배송완료</option>
								<option value="주문취소">주문취소</option>
						
						</select>
					</td>
				</tr>
				<tr>
					<th>상품번호</th>
					<td><input class="form-control" type="text" name="ordersId" value="<%=ordersId %>"></td>
				</tr>
			</table>
			<button type="submit">수정</button>
		</form>
	</div>
	
</div>
</body>
</html>