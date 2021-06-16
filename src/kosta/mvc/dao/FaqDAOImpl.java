package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.mvc.dto.FaqDTO;
import kosta.mvc.util.DbUtil;

public class FaqDAOImpl implements FaqDAO {
	
	/**
	 * FAQ에 있는 모든 게시물을 검색하는 기능
	 * */
	@Override
	public List<FaqDTO> selectAll() throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs =null;
		List<FaqDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM FAQ ORDER BY F_CATEGORY";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs= ps.executeQuery();
			
			while(rs.next()) {
				list.add(new FaqDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4)));
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

	/**
	 * FAQ를 CODE로 검색하는 방법
	 * */
	@Override
	public FaqDTO selectFaq(int fCode) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs =null;
		FaqDTO faqDTO = null;
		String sql = "SELECT * FROM FAQ WHERE F_CODE = ?";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, fCode);
			
			rs= ps.executeQuery();
			
			if(rs.next()) {
				faqDTO = new FaqDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4));
			}
			
		} finally {
			DbUtil.dbClose(ps, con);
		}
		
		return faqDTO;
	}

	/**
	 * FAQ에 게시물 등록하는 기능
	 * */
	@Override
	public int insertFaq(FaqDTO faqDTO) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result=0;
		String sql = "INSERT INTO FAQ VALUES(FAQ_SEQ.NEXTVAL,?,?,?)";
		
		try {
			
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, faqDTO.getfCategory());
			ps.setString(2, faqDTO.getfTitle());
			ps.setString(3, faqDTO.getfContent());
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}
	
	/**
	 * FAQ게시물 삭제하는 기능
	 * */
	@Override
	public int deleteFaq(int fCode) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		int result=0;
		String sql = "DELETE FROM FAQ WHERE F_CODE=?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, fCode);
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}
	
	/**
	 * FAQ에 있는 게시물 카테고리로 검색하는 기능.
	 * */
	@Override
	public List<FaqDTO> selectCategory(int category) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs =null;
		List<FaqDTO> list = new ArrayList<FaqDTO>();
		String sql = "SELECT * FROM FAQ WHERE F_CATEGORY = ?";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, category);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				list.add(new FaqDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4)));
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return list;
	}
	
	/**
	 * FAQ게시물 수정하는 기능
	 * */
	@Override
	public int updateFaq(FaqDTO faqDTO) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs =null;
		String sql = "UPDATE FAQ SET F_CATEGORY = ?, F_TITLE = ?, F_CONTENT = ? WHERE F_CODE = ?";
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, faqDTO.getfCategory());
			ps.setString(2, faqDTO.getfTitle());
			ps.setString(3, faqDTO.getfContent());
			ps.setInt(4, faqDTO.getfCode());
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}
	
	
	
}