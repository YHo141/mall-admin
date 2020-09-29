package dao;
import java.util.ArrayList;

import commons.DBUtil;
import vo.Category;
import java.sql.*;

public class CategoryDao {
	//	카테고리를 추가하는 메서드
	public void insertCategory(Category category) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "insert into category(category_name) values(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.getCategoryName());
		stmt.executeLargeUpdate();
		
		conn.close();
	}
	
	//	카테고리 수정하는 메서드
	public void updateCategory(Category category) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "update category set category_name=? where category_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, category.getCategoryName());
		stmt.setInt(2, category.getCategoryId());
		stmt.executeLargeUpdate();
		
		conn.close();
	}
	
	//	카테고리 삭제하는 메서드
	public void deleteCategory(Category category) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "delete from category where category_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, category.getCategoryId());
		stmt.executeLargeUpdate();
		
		conn.close();
	}
	
	//	카테고리의 목록
	public ArrayList<Category> selectCategoryList() throws Exception{
		ArrayList<Category> list = new ArrayList<Category>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "select category_id, category_name from category";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Category category = new Category();
			category.setCategoryId(rs.getInt("category_id"));
			category.setCategoryName(rs.getString("category_name"));
			list.add(category);
		}
		conn.close();
		return list;
	}
}
