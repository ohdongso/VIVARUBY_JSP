package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kosta.mvc.dto.MemberDTO;
import kosta.mvc.util.DbUtil;

public class MemberDAOImpl implements MemberDAO {
	
	/**
	 * 회원가입
	 */
	@Override
	public int memberJoin(MemberDTO memberDTO) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		String sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,1,default)";
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, memberDTO.getId());
			ps.setString(2, memberDTO.getPw());
			ps.setString(3, memberDTO.getName());
			ps.setString(4, memberDTO.getAddr());
			ps.setString(5, memberDTO.getPhone());
			ps.setString(6, memberDTO.getEmail());
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}
	
	/**
	 * 아이디중복체크
	 * */
	@Override
	public boolean idCheck(String id) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT ID FROM MEMBER WHERE ID = ?";
		boolean result = false;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return result;
	}
	
	/**
	 * 로그인
	 */
	@Override
	public MemberDTO loginCheck(MemberDTO memberDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT ID, PW, NAME, STATE FROM MEMBER WHERE ID=? AND PW=?";
		MemberDTO member = null;
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, memberDTO.getId());
			ps.setString(2, memberDTO.getPw());
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				member = new MemberDTO(rs.getString(1), rs.getString(2), rs.getString(3));
				member.setState(rs.getInt(4));
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return member;
	}
	
	/**
	 * id에 해당하는 회원정보 검색
	 */
	@Override
	public MemberDTO myInform(String id) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		MemberDTO memberDTO = null;
		String sql = "SELECT * FROM MEMBER WHERE ID=?";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				memberDTO = new MemberDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getInt(7), rs.getString(8));
			}	
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return memberDTO;
	}
	
	/**
	 * 회원정보수정
	 */
	@Override
	public int updateMemberInfo(MemberDTO memberDTO) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		String sql = "UPDATE MEMBER SET PW = ?, ADDR = ?, PHONE = ?, EMAIL = ? WHERE ID = ?";
		int result = 0;
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, memberDTO.getPw());
			ps.setString(2, memberDTO.getAddr());
			ps.setString(3, memberDTO.getPhone());
			ps.setString(4, memberDTO.getEmail());
			ps.setString(5, memberDTO.getId());
			
			result = ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	/**
	 * 회원탈퇴
	 */
	@Override
	public int deleteMember(String id, String pw) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql ="DELETE FROM MEMBER WHERE ID = ? AND PW = ?";
		int result=0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, id);
			ps.setString(2, pw);
			
			result = ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;		
	}
	
	
	
	
}
