package kosta.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kosta.mvc.dto.CartDTO;
import kosta.mvc.util.DbUtil;

public class CartDAOImpl implements CartDAO {
	/**
	 * 장바구니에 등록하는 기능.
	 * */
	@Override
	public int insertCart(CartDTO cartDTO) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		String sql = "INSERT INTO CART VALUES(CART_SEQ.NEXTVAL, ?, ?, ?)";
		int result = 0;
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, cartDTO.getId());
			ps.setInt(2, cartDTO.getProductCode());
			ps.setInt(3, cartDTO.getCartQty());
			
			result = ps.executeUpdate();
			
		} finally {
			DbUtil.dbClose(ps, con);
		}
	
		return result;
	}

	/**
	 * cart테이블에 있는 모든 정보 가져오기
	 * */
	@Override
	public List<CartDTO> selectAllCart(String id) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<CartDTO> list = new ArrayList<>();
		
		String sql = "SELECT * FROM CART WHERE ID = ? ORDER BY CART_CODE";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			ps.setString(1, id);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				CartDTO cartDTO = new CartDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4));
			
				list.add(cartDTO);
			}
		
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return list;
	}

	/**
	 * 장바구니 상품 삭제
	 * */
	@Override
	public int deleteCart(int productCode) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		String sql ="DELETE FROM CART WHERE PRODUCT_CODE = ?";
		int result = 0;
		
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
