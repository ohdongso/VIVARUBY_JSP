package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.mvc.dto.WishDTO;
import kosta.mvc.util.DbUtil;

public class WishDAOImpl implements WishDAO {
	
	/**
	 * id에 해당하는 wish가 있는지 검색
	 * */
	@Override
	public WishDTO selectWish(String id, int productCode) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		WishDTO wishDTO = null;
		
		String sql = "SELECT * FROM WISH WHERE ID = ? AND PRODUCT_CODE = ?";
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, id);
			ps.setInt(2, productCode);
			
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				wishDTO = new WishDTO(rs.getInt(1), rs.getInt(2), rs.getString(3));
			}
			
		} catch (SQLException e) {	
			e.printStackTrace();
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return wishDTO;	
	}
	
	/**
	 * 관심상품 등록
	 * */
	@Override
	public int insertWish(int productCode, String id) {
		Connection con =null;
		PreparedStatement ps = null;
		String sql = "INSERT INTO WISH VALUES(WISH_SEQ.NEXTVAL, ?, ?)";
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, productCode);
			ps.setString(2, id);
			
			result = ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}
	
	/**
	 * 아이디에 해당하는 관심상품 전체 검색.
	 * */
	@Override
	public List<WishDTO> selectAllWish(String id) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<WishDTO> list = new ArrayList<>();
		
		String sql = "SELECT * FROM WISH WHERE ID = ? ORDER BY WISH_CODE";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				WishDTO wishDTO = new WishDTO(rs.getInt(1), rs.getInt(2), rs.getString(3));
				
				list.add(wishDTO);
			}
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return list;
	}
	
	/**
	 * 관심상품 삭제
	 * */
	@Override
	public int deleteWish(int productCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql ="DELETE FROM WISH WHERE PRODUCT_CODE = ?";
		int result=0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setInt(1, productCode);
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}
	
	
	
}
