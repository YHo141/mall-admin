package dao;
import vo.*;
import java.sql.*;
import java.util.*;
import commons.DBUtil;


public class NoticeDao {
	
	
	// 공지사항 목록 출력
	public ArrayList<Notice> selectNoticeList() throws Exception{
		
		ArrayList<Notice> list = new ArrayList<Notice>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "select notice_id, notice_title, notice_content, notice_date from notice";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Notice n = new Notice();
			
			n.setNoticeId(rs.getInt("notice_id"));
			n.setNoticeTitle(rs.getString("notice_title"));
			n.setNoticeContent(rs.getString("notice_content"));
			n.setNoticeDate(rs.getString("notice_date"));
			
			list.add(n);
		}
		conn.close();
		return list;
	}
	
	
	//	공지사항 추가
	public void insertNotice(Notice notice) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "insert into notice(notice_title, notice_content, notice_date) values(?,?,?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, notice.getNoticeTitle());
		stmt.setString(2, notice.getNoticeContent());
		stmt.setString(3, notice.getNoticeDate());
		stmt.executeUpdate();
		
		conn.close();
	}
	
	
	//	공지사항 수정
	public void updateNotice(Notice notice) throws Exception{
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "update notice set notice_title=?, notice_content=?, notice_date=? where notice_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, notice.getNoticeTitle());
		stmt.setString(2, notice.getNoticeContent());
		stmt.setString(3, notice.getNoticeDate());
		stmt.setInt(4, notice.getNoticeId());
		stmt.executeUpdate();
		
		conn.close();
		
	}
	
	
	//	공지사항 삭제
	public void deleteNotice(Notice notice) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "delete from notice where notice_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, notice.getNoticeId());
		stmt.executeUpdate();
		
		conn.close();
	}
	
	
	
	
}
