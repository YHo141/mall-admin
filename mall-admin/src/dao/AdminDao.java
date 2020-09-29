package dao;
import vo.*;
import java.sql.*;

import commons.DBUtil;

public class AdminDao {
	
	public Admin login(Admin admin) throws Exception{
		Admin returnAdmin = null;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "select admin_id from admin where admin_id = ? and admin_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, admin.getAdminId());
		stmt.setString(2, admin.getAdminPw());
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			returnAdmin = new Admin();
			returnAdmin.adminId = rs.getString("admin_id");
		}
		
		return returnAdmin;	//	null�϶� �α��� ����, null�� �ƴϸ� �α��� ����
	}
}
