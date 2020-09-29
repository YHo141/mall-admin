package dao;
import java.sql.*;
import vo.*;
import java.util.*;
import commons.DBUtil;

public class MemberDao {
	
	//	회원정보 출력
	public ArrayList<Member> selectMemberList() throws Exception{
		ArrayList<Member> list = new ArrayList<Member>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "select member_email, member_pw, member_name, member_date from member";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()) {
			Member member = new Member();
			member.setMemberEmail(rs.getString("member_email"));
			member.setMemberPw(rs.getString("member_pw"));
			member.setMemberName(rs.getString("member_name"));
			member.setMemberDate(rs.getString("member_date"));
			list.add(member);
		}
		conn.close();
		return list;
	}
	
	//	회원정보 수정
	public void updateMember(Member member) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "update member set member_pw=?, member_name=? where member_email=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberPw());
		stmt.setString(2, member.getMemberName());
		stmt.setString(3, member.getMemberEmail());
		stmt.executeUpdate();
		
		conn.close();
	}
	
	//	회원정보 삭제
	public void deleteMember(Member member) throws Exception{
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConection();
		String sql = "delete from member where member_email=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, member.getMemberEmail());
		stmt.executeUpdate();
		
		conn.close();
	}
}
