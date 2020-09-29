<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="vo.*" %>
<%@ page import="dao.*" %>
<%
	if(session.getAttribute("loginAdminId") == null){
		response.sendRedirect("/mall-admin/login.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>ordersList</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div>
		<jsp:include page="/inc/menu.jsp"></jsp:include>
	</div>

	
	<%
		request.setCharacterEncoding("utf-8");
	
		String ordersState = "";
		if(request.getParameter("ordersState") != null){
			ordersState = request.getParameter("ordersState");
		}
		
		OrdersDao ordersDao = new OrdersDao();
		ArrayList<OrdersAndProduct> list = null;
		
		if(ordersState.equals("")){
			list = ordersDao.selectOrdersList();
		}else{
			list = ordersDao.selectOrdersListByState(ordersState);
		}
		
		ArrayList<String> ordersStateList = ordersDao.selectOrdersStateList();
	%>
	<h1>주문 목록</h1>
	<form method = "post" action="/mall-admin/orders/ordersList.jsp">
		<select name="ordersState">
			<option value="">선택</option>
			<%
				for(String o : ordersStateList){
			%>
					<option value=<%=o %>><%=o %></option>
			<%
				}
			%>
		</select>
		<button type="submit">주문상태 보기</button>
		</form>
	<table class="table table-dark table-striped table-hover">
		<thead>
			<tr>
				<th>orders_id</th>
				<th>product_id</th>
				<th>product_name</th>
				<th>orders_amount</th>
				<th>orders_price</th>
				<th>member_email</th>
				<th>orders_addr</th>
				<th>orders_state</th>
				<th>orders_date</th>
				<th>orders_state 수정</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(OrdersAndProduct oap : list){
			%>
				<tr>
					<td><%=oap.orders.ordersId %></td>
					<td><%=oap.orders.productId %></td>
					<td><%=oap.product.productName %></td>
					<td><%=oap.orders.ordersAmount %></td>
					<td><%=oap.orders.ordersPrice %></td>
					<td><%=oap.orders.memberEmail %></td>
					<td><%=oap.orders.ordersAddr %></td>
					<td><%=oap.orders.ordersState %></td>
					<td><%=oap.orders.ordersDate %></td>
					<td><a href="/mall-admin/orders/modifyOrdersState.jsp?ordersId=<%=oap.orders.ordersId %>" >ordersState 수정</a></td>
				</tr>
			<%
				}
			%>
		</tbody>
	</table>
</div>
</body>
</html>