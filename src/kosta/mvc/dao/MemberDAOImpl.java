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
	
	
	
	
}
