package dao;
import java.sql.*;
import vo.*;
import java.util.*;

import commons.DBUtil;

public class OrdersDao {
	
	public ArrayList<String> selectOrdersStateList() throws Exception{
		//	select distinct ordersState from orders
		ArrayList<String> list = new ArrayList<String>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "select distinct orders_state from orders";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			list.add(rs.getString("orders_state"));
		}
		
		conn.close();
		return list;
	}
	
	public ArrayList<OrdersAndProduct> selectOrdersList() throws Exception{
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "select o.orders_id, o.product_id, p.product_name, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date from orders o inner join product p on o.product_id = p.product_id";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			OrdersAndProduct oap = new OrdersAndProduct();
			oap.orders = new Orders();
			oap.product = new Product();
			
			oap.orders.ordersId = rs.getInt("o.orders_id");
			oap.orders.productId = rs.getInt("o.product_id");
			oap.product.productName = rs.getString("p.product_name");
			oap.orders.ordersAmount = rs.getInt("o.orders_amount");
			oap.orders.ordersPrice = rs.getInt("o.orders_price");
			oap.orders.memberEmail = rs.getString("o.member_email");
			oap.orders.ordersAddr = rs.getString("o.orders_addr");
			oap.orders.ordersState = rs.getString("o.orders_state");
			oap.orders.ordersDate = rs.getString("o.orders_date");
			list.add(oap);
		}
		conn.close();
		return list;
	}
	
	public ArrayList<OrdersAndProduct> selectOrdersListByState(String ordersState) throws Exception{
		ArrayList<OrdersAndProduct> list = new ArrayList<OrdersAndProduct>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "select o.orders_id, o.product_id, p.product_name, o.orders_amount, o.orders_price, o.member_email, o.orders_addr, o.orders_state, o.orders_date from orders o inner join product p on o.product_id = p.product_id where orders_state = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, ordersState);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			OrdersAndProduct oap = new OrdersAndProduct();
			oap.orders = new Orders();
			oap.product = new Product();
			
			oap.orders.ordersId = rs.getInt("o.orders_id");
			oap.orders.productId = rs.getInt("o.product_id");
			oap.product.productName = rs.getString("p.product_name");
			oap.orders.ordersAmount = rs.getInt("o.orders_amount");
			oap.orders.ordersPrice = rs.getInt("o.orders_price");
			oap.orders.memberEmail = rs.getString("o.member_email");
			oap.orders.ordersAddr = rs.getString("o.orders_addr");
			oap.orders.ordersState = rs.getString("o.orders_state");
			oap.orders.ordersDate = rs.getString("o.orders_date");
			list.add(oap);
		}
		conn.close();
		return list;
	}
	
	//	주문 수정
	public void updateOrdersStateById(Orders orders) throws Exception{	
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "update orders set orders_state = ? where orders_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, orders.ordersState);
		stmt.setInt(2, orders.ordersId);
		stmt.executeQuery();
		
		conn.close();
	}
	
	
	public Orders selectOrdersOne(int ordersId) throws Exception{
		
		Orders orders = null;
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "select orders_id, orders_state from orders where orders_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, ordersId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()){
			orders = new Orders();
			orders.ordersId = rs.getInt("orders_id");
			
		}
		return orders;
	}
}
